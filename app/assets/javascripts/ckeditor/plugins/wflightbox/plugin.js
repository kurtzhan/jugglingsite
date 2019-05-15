CKEDITOR.plugins.add( 'wflightbox', {
    icons: 'wflightbox',
    init: function( editor ) {
        editor.addCommand( 'insertLightbox', new CKEDITOR.dialogCommand( 'wflightboxDialog' ));
        editor.ui.addButton( 'wflightbox', {
            label: 'Insert Lightbox',
            command: 'insertLightbox',
            toolbar: 'insert'
        });

        CKEDITOR.dialog.add( 'wflightboxDialog', this.path + 'dialogs/wflightbox.js' );
    }
});