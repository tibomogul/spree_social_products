module Spree
  BaseHelper.module_eval do
    def pin_it_button(product)
      return if product.images.empty?

      if spree_current_user && !spree_current_user.sales_network_slug.blank?
        url = escape spree.product_url(product, :sponsor => spree_current_user.sales_network_slug)
      else
        url = escape spree.product_url(product)
      end
      media = absolute_product_image(product.images.first)
      description = escape product.name

      link_to('Pin It',
              "http://pinterest.com/pin/create/button/?url=#{url}&media=#{media}&description=#{description}",
              class: 'pin-it-button',
              'count-layout' => 'none').html_safe
    end

    def absolute_product_image(image)
      escape absolute_image_url(image.attachment.url)
    end

    def absolute_image_url(url)
      return url if url.starts_with? 'http'
      request.protocol + request.host + url
    end

    private

    def escape(string)
      URI.escape string, /[^#{URI::PATTERN::UNRESERVED}]/
    end
  end
end
