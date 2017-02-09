module SiteTitlePatch
  def build(*args)
    super
    self.aa_data[:title] = {
      text: "#{title_text}",
      image: "#{title_image}"
    }
  end
end

module ActiveAdmin
  module Views
    class SiteTitle
      prepend SiteTitlePatch
    end
  end
end
