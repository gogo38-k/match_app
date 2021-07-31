module ApplicationHelper
	def default_meta_tags
    {
      site: '球っちんぐ',
      title: 'プロ野球ファンをつなぐマッチングアプリ',
      reverse: true,
      charset: 'utf-8',
      description: '好きな球団のファンや選手同士、一緒に応援できる仲間を探すプロ野球ファン専用のマッチングアプリです。',
      keywords: 'プロ野球,出会い,マッチングアプリ',
      canonical: request.original_url,
      separator: '|',
      icon: [
        { href: image_url('favicon (1).ico') },
        { href: image_url('IMG_6774.PNG'), rel: 'apple-touch-icon', sizes: '180x180', type: 'image/jpg' },
      ],
      og: {
        site_name: '球っちんぐ', 
        title: 'プロ野球ファンをつなぐマッチングアプリ', 
        description: '好きな球団のファンや選手同士、一緒に応援できる仲間を探すプロ野球ファン専用のマッチングアプリです。', 
        type: 'website',
        url: request.original_url,
        image: image_url('IMG_6774.PNG'),
        locale: 'ja_JP',
      },
      twitter: {
        card: 'summary',
        site: '@iQzQXfR9SYLc5yP',
      }
    }
  end
end
