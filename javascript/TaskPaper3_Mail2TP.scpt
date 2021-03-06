JsOsaDAS1.001.00bplist00�Vscript_>/*!/usr/bin/env osascript -l JavaScript
 **********************************************************************
 * File     : TaskPaper3_Mail2TP.js
 * Author(s): complexpoint
 * Source   : http://support.hogbaysoftware.com/t/mail-to-tp3-script/1520/8
 **********************************************************************
 * SEND EMAILS SELECTED IN APPLE MAIL OR MS OUTLOOK 2016
 * TO INBOX: PROJECT OF FRONT TASKPAPER DOCUMENT
 *
 * NB to use with Outlook 2016, edit option at end of script
 *
 * Ver 0.4 Allows for MS Outlook as well as Apple Mail
 * Ver 0.31  Keeps whole inbox sorted when new material arrrives,
 *          fixes issue when only 1 email was selected
 *          checks that new Inbox is created and used if none found
 * Ver 0.2  Sorts incoming mail by sender A-Z and datetime received New-Old
 */

(function (dctOptions) {
    'use strict';

    // TASKPAPER CONTEXT

    function TaskPaperContext(editor, options) {

        // FIND OR MAKE A PROJECT TO HOLD INCOMING MAIL
        // String -> String -> {project: tpItem, new: Bool}
        function projectAtPath(strProjectPath, strDefaultName) {
            var strDefault = strDefaultName || 'UnNamed project:',
                outline = editor.outline,
                lstMatch = outline.evaluateItemPath(strProjectPath),
                blnFound = lstMatch.length > 0;

            return {
                project: blnFound ? lstMatch[0] : (function () {
                    var defaultProject = outline.createItem(
                        strDefault
                    );

                    return (
                        outline.groupUndoAndChanges(function () {
                            outline.root.appendChildren(
                                defaultProject
                            );
                        }),
                        defaultProject
                    );

                })(),
                new: !blnFound
            };
        }

        // tpItem -> (tpiItem -> tpItem -> (-1|0|1)) -> tpItem
        function sortChildren(item, fnSort) {
            var lstSort = item.children.sort(fnSort);

            return (
                item.removeChildren(item.children),
                item.insertChildrenBefore(
                    lstSort
                ),
                true
            );
        }
        // FIND OR CREATE AN INBOX

        var outline = editor.outline,
            mInbox = projectAtPath(options.inboxPath, 'Inbox:'),
            itemInbox = mInbox.project;

        // Doesn't seem to be undoable 
        // Perhaps only mutations of existing material undo ?
        outline.groupUndoAndChanges(function () {
            options.messages
                .forEach(function (msg) {
                    var item = outline.createItem(
                        '- ' + [msg.sender, msg.subject]
                        .join(' ') +
                        ' @received(' + msg.received + ')'
                    );

                    itemInbox.appendChildren(item);
                    item.appendChildren(
                        outline.createItem(msg.link)
                    );
                });

        });


        if (!mInbox.new && itemInbox.hasChildren) {
            return sortChildren(itemInbox, function (a, b) {
                var strRA = a.getAttribute('trailingMatch') || '', // date
                    strRB = a.getAttribute('trailingMatch') || '',

                    strTA = a.bodyString, // all
                    strTB = b.bodyString,

                    iFromA = strTA.charAt(2) === '"' ? 3 : 2,
                    iFromB = strTB.charAt(2) === '"' ? 3 : 2,

                    // Lowercase content, ignoring "- " +  any opening doubleQuote
                    strCA = strTA.slice(
                        iFromA, iFromA - strRA.length
                    )
                    .toLowerCase(),
                    strCB = strTB.slice(
                        iFromB, iFromB - strRB.length
                    )
                    .toLowerCase();

                // By A-Z sender and New to Old date
                return strCA === strCB ? (
                    strRA < strRB ? 1 : (strRA > strRB ? -1 : 0)
                ) : (strCA < strCB ? -1 : 1);
            });
        }
    }


    // JAVASCRIPT FOR AUTOMATION CONTEXT

    // Date -> String
    function fmtTP(dte) {
        var s = dte.toISOString(),
            d = s.substring(0, 10);

        return dte.getMinutes() ? d + ' ' + s.substring(11, 16) : d;
    }

    // String -> String
    function mailURL(strMessageID) {
        return "message://%3C" + strMessageID + "%3E";
    }

    // concatMap :: (a -> [b]) -> [a] -> [b]
    function concatMap(f, xs) {
        return [].concat.apply([], xs.map(f));
    }


    // READ MAIL or OUTLOOK SELECTIONS

    // Key message fields  
    if (dctOptions.mailApp.toLowerCase()
        .indexOf('outlook') === -1) {

        // APPLE MAIL
        var m = Application("Mail"),
            lstSeln = m.selection();

        dctOptions.messages = lstSeln.length > 0 ? lstSeln
            .map(function (msg) {
                return {
                    'sender': msg.sender(),
                    'subject': msg.subject(),
                    'received': fmtTP(msg.dateReceived()),
                    'link': mailURL(msg.messageId()),
                };
            }) : [];
    } else {
    
        // MS OUTLOOK 2016
        var ol = Application("com.microsoft.Outlook"),
            lstSeln = ol.selectedObjects();

        dctOptions.messages = concatMap(function (x) {
            var strClass = x.class();

            if (strClass
                .endsWith('Message')) {
                var dctSender = x.sender();

                return [{
                    'sender': dctSender.name + ' ' +
                        dctSender.address,
                    'subject': x.subject(),
                    'received': strClass.indexOf('incoming') ===
                        0 ? fmtTP(x.timeReceived()) : '',
                    'link': 'outlook://' + x.id()
                }]
            } else return [];

        }, lstSeln);
    }

    //return dctOptions.messages

    var ds = Application("com.hogbaysoftware.TaskPaper3")
        .documents,
        d = (ds.length ? ds[0] : undefined);

    if (d) {
        if (d.file()) {
            return d.evaluate({
                script: TaskPaperContext.toString(),
                withOptions: dctOptions
            });
        } else {
            var a = Application.currentApplication(),
                sa = (a.includeStandardAdditions = true, a),
                strMsg =
                "Script: (Email to TaskPaper)\n\nFirst save TaskPaper file ...",
                strAppFolder = sa.pathTo("applications folder", {
                    from: 'user domain'
                })
                .toString();

            sa.displayDialog(strMsg, {
                withTitle: "TaskPaper file not saved"
            });
        }
    }
})({
    inboxPath: '//Inbox and @type=project[-1]',
    mailApp: 'com.apple.mail' // or edit to 'com.microsoft.Outlook'
});

/* vim: ts=2:sw=2:sts=4:tw=120:fileformat=unix
 * vim: comments& comments+=b\:* formatoptions& formatoptions+=or
 */

                              Tjscr  ��ޭ