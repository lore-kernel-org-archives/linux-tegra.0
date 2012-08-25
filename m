From: Hin-Tak Leung <htl10@users.sourceforge.net>
Subject: Re: [v3 1/1] driver-core: Shut up dev_dbg_reatelimited() without DEBUG
Date: Sat, 25 Aug 2012 08:12:23 +0100 (BST)
Message-ID: <1345878743.62338.YahooMailClassic@web29404.mail.ird.yahoo.com>
References: <20120824.073535.1710298672594744200.hdoyu@nvidia.com>
Reply-To: htl10@users.sourceforge.net
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-media-owner@vger.kernel.org>
In-Reply-To: <20120824.073535.1710298672594744200.hdoyu@nvidia.com>
Sender: linux-media-owner@vger.kernel.org
To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, "1345726463.82057.YahooMailClassic@web29403.mail.ird.yahoo.com" <1345726463.82057.YahooMailClassic@web29403.mail.ird.yahoo.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, "joe@perches.com" <joe@perches.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "crope@iki.fi" <crope@iki.fi>
List-Id: linux-tegra@vger.kernel.org

--- On Fri, 24/8/12, Hiroshi Doyu <hdoyu@nvidia.com> wrote:

> From: Hiroshi Doyu <hdoyu@nvidia.com>
> Subject: [v3 1/1] driver-core: Shut up dev_dbg_reatelimited() without=
 DEBUG
> To: "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
> Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "h=
tl10@users.sourceforge.net" <htl10@users.sourceforge.net>, "linux-media=
@vger.kernel.org" <linux-media@vger.kernel.org>, "joe@perches.com" <joe=
@perches.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.o=
rg>, "crope@iki.fi" <crope@iki.fi>
> Date: Friday, 24 August, 2012, 5:35
> dev_dbg_reatelimited() without DEBUG
> printed "217078 callbacks
> suppressed". This shouldn't print anything without DEBUG.
>=20
> With CONFIG_DYNAMIC_DEBUG, the print should be configured as
> expected.
>=20
> Signed-off-by: Hiroshi Doyu <hdoyu@nvidia.com>
> Reported-by: Hin-Tak Leung <htl10@users.sourceforge.net>
> Tested-by: Antti Palosaari <crope@iki.fi>
> Acked-by: Hin-Tak Leung <htl10@users.sourceforge.net>

Tested-by: Hin-Tak Leung <htl10@users.sourceforge.net>

Went ahead and patched my 2.5.x distro kernel-devel package header, and=
 it works as expected. Apologies about the red-herring with media_build=
 (for those who are not familar with it, =3D "back-port" wrapper packag=
e for building new DVB modules against older kernels).=20

The distro kernel-devel headers is per installed distro kernel so will =
be replaced in a week or two... no permanent demage done :-).  =20

> ---
>  include/linux/device.h |=A0=A0=A062
> +++++++++++++++++++++++++++++------------------
>  1 files changed, 38 insertions(+), 24 deletions(-)
>=20
> diff --git a/include/linux/device.h
> b/include/linux/device.h
> index 9648331..bb6ffcb 100644
> --- a/include/linux/device.h
> +++ b/include/linux/device.h
> @@ -932,6 +932,32 @@ int _dev_info(const struct device *dev,
> const char *fmt, ...)
> =20
>  #endif
> =20
> +/*
> + * Stupid hackaround for existing uses of non-printk uses
> dev_info
> + *
> + * Note that the definition of dev_info below is actually
> _dev_info
> + * and a macro is used to avoid redefining dev_info
> + */
> +
> +#define dev_info(dev, fmt, arg...) _dev_info(dev, fmt,
> ##arg)
> +
> +#if defined(CONFIG_DYNAMIC_DEBUG)
> +#define dev_dbg(dev, format, ...)=A0=A0=A0
> =A0=A0=A0 =A0 =A0=A0=A0\
> +do {=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0 =A0=A0=A0\
> +=A0=A0=A0 dynamic_dev_dbg(dev, format,
> ##__VA_ARGS__); \
> +} while (0)
> +#elif defined(DEBUG)
> +#define dev_dbg(dev, format, arg...)=A0=A0=A0
> =A0=A0=A0 \
> +=A0=A0=A0 dev_printk(KERN_DEBUG, dev, format,
> ##arg)
> +#else
> +#define dev_dbg(dev, format, arg...)=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> +({=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
> +=A0=A0=A0 if (0)=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> +=A0=A0=A0 =A0=A0=A0
> dev_printk(KERN_DEBUG, dev, format,
> ##arg);=A0=A0=A0 \
> +=A0=A0=A0 0;=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
> +})
> +#endif
> +
>  #define dev_level_ratelimited(dev_level, dev, fmt,
> ...)=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> \
>  do {=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
>  =A0=A0=A0 static
> DEFINE_RATELIMIT_STATE(_rs,=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> @@ -955,33 +981,21 @@ do {=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
>  =A0=A0=A0 dev_level_ratelimited(dev_notice, dev,
> fmt, ##__VA_ARGS__)
>  #define dev_info_ratelimited(dev, fmt,
> ...)=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
>  =A0=A0=A0 dev_level_ratelimited(dev_info, dev,
> fmt, ##__VA_ARGS__)
> +#if defined(CONFIG_DYNAMIC_DEBUG) || defined(DEBUG)
>  #define dev_dbg_ratelimited(dev, fmt,
> ...)=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
> -=A0=A0=A0 dev_level_ratelimited(dev_dbg, dev, fmt,
> ##__VA_ARGS__)
> -
> -/*
> - * Stupid hackaround for existing uses of non-printk uses
> dev_info
> - *
> - * Note that the definition of dev_info below is actually
> _dev_info
> - * and a macro is used to avoid redefining dev_info
> - */
> -
> -#define dev_info(dev, fmt, arg...) _dev_info(dev, fmt,
> ##arg)
> -
> -#if defined(CONFIG_DYNAMIC_DEBUG)
> -#define dev_dbg(dev, format, ...)=A0=A0=A0
> =A0=A0=A0 =A0 =A0=A0=A0\
> -do {=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0 =A0=A0=A0\
> -=A0=A0=A0 dynamic_dev_dbg(dev, format,
> ##__VA_ARGS__); \
> +do {=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
> +=A0=A0=A0 static
> DEFINE_RATELIMIT_STATE(_rs,=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0 =A0 =A0
> DEFAULT_RATELIMIT_INTERVAL,=A0=A0=A0 \
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0 =A0 =A0
> DEFAULT_RATELIMIT_BURST);=A0=A0=A0
> =A0=A0=A0 \
> +=A0=A0=A0
> DEFINE_DYNAMIC_DEBUG_METADATA(descriptor,
> fmt);=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
> +=A0=A0=A0 if (unlikely(descriptor.flags &
> _DPRINTK_FLAGS_PRINT) &&=A0=A0=A0 \
> +=A0=A0=A0 =A0 =A0
> __ratelimit(&_rs))=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 \
> +=A0=A0=A0 =A0=A0=A0
> __dynamic_pr_debug(&descriptor,
> pr_fmt(fmt),=A0=A0=A0 =A0=A0=A0 \
> +=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0
> =A0=A0=A0##__VA_ARGS__);=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
>  } while (0)
> -#elif defined(DEBUG)
> -#define dev_dbg(dev, format, arg...)=A0=A0=A0
> =A0=A0=A0 \
> -=A0=A0=A0 dev_printk(KERN_DEBUG, dev, format,
> ##arg)
>  #else
> -#define dev_dbg(dev, format, arg...)=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> -({=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
> -=A0=A0=A0 if (0)=A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0 \
> -=A0=A0=A0 =A0=A0=A0
> dev_printk(KERN_DEBUG, dev, format,
> ##arg);=A0=A0=A0 \
> -=A0=A0=A0 0;=A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> =A0=A0=A0 =A0=A0=A0 \
> -})
> +#define dev_dbg_ratelimited(dev, fmt,
> ...)=A0=A0=A0 =A0=A0=A0 =A0=A0=A0
> \
> +=A0=A0=A0 no_printk(KERN_DEBUG pr_fmt(fmt),
> ##__VA_ARGS__)
>  #endif
> =20
>  #ifdef VERBOSE_DEBUG
> --=20
> 1.7.5.4
>=20
