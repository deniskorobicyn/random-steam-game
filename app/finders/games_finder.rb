class GamesFinder
  PER_PAGE_DEFAULT = 100

  def self.call(user:, page: 1, per_page: PER_PAGE_DEFAULT)
    new(user: user, page: page, per_page: per_page).call
  end

  def initialize(user:, page:, per_page:)
    @user = user
    @page = page
    @per_page = per_page
  end

  def call
    @user.games.order(:name).page(@page).per(@per_page)
  end
end
