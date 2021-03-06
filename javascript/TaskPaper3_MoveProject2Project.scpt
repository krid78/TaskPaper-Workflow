JsOsaDAS1.001.00bplist00�Vscript_�/*!/usr/bin/env osascript -l JavaScript
 **********************************************************************
 * File     : TaskPaper3_MoveProject2Project.js
 * Author(s): complexpoint
 * Source   : http://support.hogbaysoftware.com/t/mail-to-tp3-script/1520/8
 **********************************************************************
 * Select item(s) in TaskPaper 3 (Build 170+)
 * and run this script to:
 *  1. Choose a target project from a user menu which pops up
 *  2. Move the selected item(s) (with any children) to the start of
 *     the chosen project
 *  3. See a notification of destination and number moved
 *
 * TO TEST: Paste into Script Editor
 *
 *ver 0.41 Ignore request to move tasks to themselves
 *ver 0.4 activate TaskPaper 3 after move
 *ver 0.4 fixed visibility of moved items (clearing hoisting + filters)
 *ver 0.31 updated item-moving code
 *         selects moved items in their new position
 *ver 0.3  (tweaked notification text)
 */

(function () {
  'use strict';

  // TASKPAPER CONTEXT FUNCTIONS

  // PROJECTS IN ACTIVE DOCUMENT
  function tpProjectList(editor, options) {

    return (editor.selection.selectedItems.length > 0) ?
      editor.outline.evaluateItemPath(
        '//@type=project')
        .map(function (p) {
          var strName = p.bodyString;

          return {
            id: p.id,
            name: strName.slice(
              0, strName.indexOf(':')
            )
          }
        }) : [];
  }

  // MOVEMENT OF SELECTED ITEMS TO START OF CHOSEN PROJECT
  function tpMoveSelected(editor, options) {

    var outline = editor.outline,
      lstSelns = editor.selection.selectedItems,
      lngSelns = lstSelns.length;

    if (lngSelns > 0) {
      var oFirst = lstSelns[0],
        oLast = lngSelns > 1 ? lstSelns[lngSelns - 1] : oFirst,

        oProject = outline.getItemForID(
          options.projectID
      ),
      oFirstChild = oProject.firstChild || (function () {
        outline.groupUndoAndChanges(function () {
          oProject.appendChildren(outline.createItem());
        });
        return oProject.firstChild;
      })();

      // If we have a non-circular destination, make the move ...
      if (oFirstChild && (lstSelns.indexOf(oFirstChild) === -1)) {
        outline.groupUndoAndChanges(function () {
          outline.insertItemsBefore(
            lstSelns,
            oFirstChild
          );
        });

        // make sure that source and target are both visible
        editor.hoistedItem = null;
        editor.itemPathFilter = '';

        // Select the newly moved items, for more visibility
        editor.moveSelectionToItems(
          oFirst, 0,
          oLast, oLast.bodyString.length
        );

        return lstSelns.length;
      } else return 0
    } else return 0;
  }


  // JAVASCRIPT FOR AUTOMATION CONTEXT

  // PROJECTS IN ACTIVE DOCUMENT ?
  var tp3 = Application("com.hogbaysoftware.TaskPaper3"),
    ds = tp3.documents,
    d = ds.length ? ds[0] : undefined,
    lstProjects = d ? d.evaluate({
    script: tpProjectList.toString(),
  }) : [];

  // USER CHOICE OF TARGET PROJECT ?
  if (lstProjects.length > 0) {
    var a = Application.currentApplication(),
      sa = (a.includeStandardAdditions = true, a),
      e = Application("SystemUIServer"),
      se = (e.includeStandardAdditions = true, e);

    var lstMenu = lstProjects.map(function (x) {
      return x.name;
    }),

    varChoice = (se.activate(),
                 se.chooseFromList(lstMenu, {
      withTitle: "Move items to Project",
      withPrompt: 'Choose:',
      defaultItems: lstMenu[0],
      okButtonName: 'OK',
      cancelButtonName: 'Cancel',
      multipleSelectionsAllowed: false,
      emptySelectionAllowed: true
    })),

    lstChoice = varChoice ? varChoice : [];

    if (lstChoice.length > 0) {
      // MAKE THE MOVE IN TASKPAPER 3
      var dctChoice = lstProjects[lstMenu.indexOf(lstChoice[0])],
        lngMoved = d.evaluate({
        script: tpMoveSelected.toString(),
        withOptions: {
          projectID: dctChoice.id
        }
      });

      // AND REPORT ON ANY RESULT
      if (lngMoved > 0) {
        sa.displayNotification('in TaskPaper 3 Preview', {
          withTitle: lngMoved + ' selected item' + (
            lngMoved > 1 ? 's' : ''
          ) + ' moved',
          subtitle: "to start of '" + dctChoice.name +
            "'",
          sound: 'glass'
        })
      }
      tp3.activate();
      return lngMoved;
    }
  }
})();

/* vim: ts=2:sw=2:tw=120:fileformat=unix
 * vim: comments& comments+=b\:* formatoptions& formatoptions+=or
 */                              � jscr  ��ޭ