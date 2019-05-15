CKEDITOR.dialog.add( 'wflightboxDialog', function( editor ) {
    return {
        title: 'WebFlow LightBox Properties',
        minWidth: 400,
        minHeight: 200,
        contents: [
            {
                id: 'tab-basic',
                label: 'Basic Settings',
                elements: [
                    {
                            id: "txtUrl",
                            type: "text",
                            label: "Picture Url",
                            validate: CKEDITOR.dialog.validate.notEmpty("Picture Url field can't be empty.")
                    },
                    {
                        type: 'button',
                        id: 'browse',
                        label: editor.lang.common.browseServer,
                        hidden: true,
                        filebrowser: {
                            action: 'Browse',
                            url: '/ckeditor/pictures',
                            onSelect: function(fileUrl, data){
                                var dialog = this.getDialog();
                                dialog.getContentElement( 'tab-basic', 'txtUrl' ).setValue(fileUrl);
                            }
                        }
                    },
                    {
                        type: 'text',
                        id: 'display_text',
                        label: 'Display Text',
                        validate: CKEDITOR.dialog.validate.notEmpty("Display_Text field can't be empty.")
                    },
                    {
                        type: 'text',
                        id: 'width',
                        label: 'Width',
                        onLoad: function(){
                            this.setValue(200);
                        },
                        validate: CKEDITOR.dialog.validate.notEmpty("Width field can't be empty.")
                    },
                    {
                        type: 'text',
                        id: 'height',
                        label: 'Height',
                        onLoad: function(){
                            this.setValue(225);
                        },
                        validate: CKEDITOR.dialog.validate.notEmpty("Height field can't be empty.")
                    }
                ]
            }
        ],
        onOk: function() {
            var dialog = this;

            var link = editor.document.createElement('a');
            link.setAttribute("class",  "w-inline-block w-lightbox");
            link.setAttribute("href",  "#");

            var script = editor.document.createElement('script');
            script.setAttribute("class",  "w-json");
            script.setAttribute("type",  "application/json");
            link.appendText(dialog.getValueOf('tab-basic', 'display_text'));

            var item = {};
            item["type"] = "image";
            item["width"] = dialog.getValueOf('tab-basic', 'width');
            item["height"] = dialog.getValueOf('tab-basic', 'height');
            item["html"] = "<iframe src='" + dialog.getValueOf('tab-basic', 'txtUrl') + "' width='" + item["width"] + "' height='" + item["height"] + "' scrolling='no' frameborder='0'></frame>";
            var script_json = {};
            script_json["group"] = "ControlGroup";
            script_json["items"] = [];
            script_json["items"].push(item);
            script.setHtml(JSON.stringify(script_json));

            link.append(script);
            editor.insertHtml(link.getOuterHtml());
        }
    };
});