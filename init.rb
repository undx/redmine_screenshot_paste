require 'redmine'

Redmine::Plugin.register :redmine_screenshot_paste do
  name 'Screenshot Paste'
  author 'Jean-Philippe Lang / Emmanuel GALLOIS (undx)'
  description 'Allow pasting a screenshot from the clipboard on the issue form.'
  version '2.1.0'
  url 'https://github.com/undx/redmine_screenshot_paste'
  author_url 'https://github.com/undx/'
end

ActionDispatch::Callbacks.to_prepare do
  require_dependency 'redmine_screenshot_paste'
  IssuesController.send    :include, RedmineScreenshotPaste::Patches::ControllerPatch
  Attachment.send          :include, RedmineScreenshotPaste::Patches::AttachmentPatch
  DocumentsController.send :include, RedmineScreenshotPaste::Patches::ControllerPatch
end

class RedmineScreenshotPasteHook < Redmine::Hook::ViewListener
  render_on :view_issues_form_details_bottom, :partial => 'issues/screenshot'
end
