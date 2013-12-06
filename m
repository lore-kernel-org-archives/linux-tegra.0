From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: add missing break to fuse initialization code
Date: Fri, 6 Dec 2013 22:09:57 +0100
Message-ID: <20131206210957.GC1685@mithrandir>
References: <1386362030-29187-1-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xo44VMWPx7vlQ2+2"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386362030-29187-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--xo44VMWPx7vlQ2+2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 06, 2013 at 01:33:50PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Add a missing break to the switch in tegra_init_fuse() which determines
> which SoC the code is running on. This prevents the Tegra30+ fuse
> handling code from running on Tegra20.
>=20
> Fixes: 3bd1ae57f7bb ("ARM: tegra: add fuses as device randomness")
> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> This is a fix for 3.13.
>=20
>  arch/arm/mach-tegra/fuse.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
> index 9a4e910c3796..13995b0be9d9 100644
> --- a/arch/arm/mach-tegra/fuse.c
> +++ b/arch/arm/mach-tegra/fuse.c
> @@ -198,6 +198,7 @@ void __init tegra_init_fuse(void)
>  	switch (tegra_chip_id) {
>  	case TEGRA20:
>  		tegra20_fuse_init_randomness();
> +		break;
>  	case TEGRA30:
>  	case TEGRA114:
>  	default:

The code that follows here also doesn't have a break. While not strictly
necessary it might be good to have one for consistency. Either way,
though:

Reviewed-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

--xo44VMWPx7vlQ2+2
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSoj0kAAoJEN0jrNd/PrOhQxMQAKJSwFiPOtgkrNCJCbQP9ixj
P4jW6+W0auqTp2sLsw4m6uABE14/bIC+ErQFv3+9aJOOtv+Yxb3P2RDKXChpKv48
L63B5RD9dumrYNbTI8qQ5N/+VFBErP/kNqQ24XcuyvWY4BLQoE3/Nc/fiKzSHBH6
K6hGH4w6FNjzQL3HRkcFfh0ijTATP0eqkSKTCqgjwjH3k38RWnzqLlmZ7hsrMufj
8OzSDucGktjvD8unUTF/QYPgR/wzdFRhou3nCOsF/W1VmxVoviQYfp/5E9aMl9jX
48XAs6PZOCXwMYMFnZcBiu/bESRATK+KulP4bgfH2VbDIqesr3YAyvGY2dQgKQV0
m7ZjjtT6DR512epQiJERzLbryqD+q6yqS4eEdP1R/KhYd9r0LH3acifFt6BmDSQf
4wk4jYrp9Xfeq0X974ja05XJNGsd3yx9wokAnrgw2knrQXMUIjrSSBRKnlfzRHv3
r5K5auV01uLz3hYVL1zyT7v2HlqKFtPBi1y8wu5xRiiuAa73TbrQqW/vKrzLS8dz
Sm6rQX402hqO88VGkI65H/8SZhTEoXtpEgJGI5xLETmH9rJ8AbmVue5DW3X/nSHU
aXWqr7bFhcW5kxBw/gmHQUlYPQ8BrJc+mex+1BpWmoTYHp5iTJf4f3UDp754WQvX
Rv7lv1V5WpcBf1xQJtaB
=imVc
-----END PGP SIGNATURE-----

--xo44VMWPx7vlQ2+2--
