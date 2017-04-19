module Pages
  class IplayerPage < Pages::BasePage

    set_url ('/iplayer')

    element :iplayer_logo, '.ipNav__logo__link'
    element :pg_content, 'https://is.gd/ajoheh'

    section :bbc_licence, 'div.modal.modal--tvlicence' do
      element :have_licence, '.btn.btn--dark.modal__button.typo.typo--skylark.grid__item.one-whole.js-licence-accept'
      element :no_licence, '.btn.btn--dark.modal__button.typo.typo--skylark.grid__item.one-whole.js-licence-reject'
    end

  end
end