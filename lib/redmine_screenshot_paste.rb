require_dependency 'uploaded_screenshot'

module RedmineScreenshotPaste
  module Patches
    module IssuesControllerPatch
      def self.included(base)
        base.send(:include, InstanceMethods)
        base.class_eval do
          unloadable
          before_filter :params_attachments_with_screenshot
        end
      end
    end
    module InstanceMethods
      def params_attachments_with_screenshot
        attachments = params[:attachments]
        if attachments.is_a?(Hash)
          screenshot = attachments['screenshot']
          if screenshot.is_a?(Hash)
            file = UploadedScreenshot.new(screenshot.delete('content'),
                                          screenshot.delete('name'))
            screenshot['file'] = file
          end
        end
      end
    end
  end
end