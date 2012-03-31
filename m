From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 12/17] ASoC: tegra: utils: add support for Tegra30 devices
Date: Sat, 31 Mar 2012 21:20:15 +0100
Message-ID: <20120331202015.GN5012@opensource.wolfsonmicro.com>
References: <1333148852-17806-1-git-send-email-swarren@wwwdotorg.org>
 <1333148852-17806-13-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TN8pJM9vJMHHFgJc"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1333148852-17806-13-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--TN8pJM9vJMHHFgJc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Mar 30, 2012 at 05:07:27PM -0600, Stephen Warren wrote:

> -	ret = tegra_asoc_utils_init(&alc5632->util_data, &pdev->dev);
> +	ret = tegra_asoc_utils_init(&alc5632->util_data,
> +				    TEGRA_ASOC_UTILS_SOC_TEGRA20, &pdev->dev);

Would it not be more sensible to do cpu_is_() calls in the utils code
rather than have the board say?  It'd possibly also end up looking nicer
in the code and may mean the compiler can figure out not to include
cases that can't be taken in the current build.

--TN8pJM9vJMHHFgJc
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPd2b4AAoJEBus8iNuMP3dA8oP/jrQf6mc15/hYdnursiNwWFI
a4StLMPa4SnZCl2PLwANXB28dAvNYqmhImEDujzpt6IcF8ELdK8TMhpne1BB20Kp
Z/ynkMs7jtNDkO9IeiuFBnW6wTnL6Ykg27/Fq+ky62mMhlQ4TeP0kzEeKI8MGIRP
iKYMyLa/k3PuoL5bhhVineKZ6VpgdNmyaYCxs7FfHzq5LT3HZy6QNKmJgeT3LkNw
EvaB5WPEyH5sXD9vn72u39XTMcqHcJ7VTB4rha/xRkJhfBzwz+GK2UW0ICj36DEd
Q1Kf0N8UktLXctrNTSYMw8FH/GxYcCnuUPSp6sPUUuV3mnkbHKg4Kz+QknZB6EDA
5OBT5YccFN0ODWgKEhBeHdV/+sYAN6XdDet5pCCKLv3G3l2YH3DqqFIv317e7b2j
HMpCc1QjhXGQ+Lz8Kj2ph+RSIDQx6gT2XGGvDlBbi+sJydtP5YI6Nlvw+g9zLfsr
L/jO0qU1S0xk20ipiX6xnAYBYeZTIrSNEO37P/agOEOWUmJLBidvvyN19Z2d1hm6
klMm+IeTwq0tZGiSeMdsEHuBpUDINg6fzsBd7J1FQxS8qieS1eaSbHqwGHzyKefF
CbPz3I6xC+AYfyrrzkCwhe05Rc7lhOma14KMoypT5E/Z051ykYHY6FI35Ygf9DyM
pvOi+6JtijAnxgw1ZppS
=+wSB
-----END PGP SIGNATURE-----

--TN8pJM9vJMHHFgJc--
