class Page < Post

  default_scope { where(type: 'Page') }

end
