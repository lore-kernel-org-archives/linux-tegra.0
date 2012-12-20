From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH 2/7] ASoC: allow wolfson wm9712 codec to be instantiated
 using device tree
Date: Thu, 20 Dec 2012 09:32:14 +0000
Message-ID: <20121220093214.GZ4985@opensource.wolfsonmicro.com>
References: <1355959056-6009-1-git-send-email-dev@lynxeye.de>
 <1355959056-6009-2-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="lBR2yNlwcY132B3M"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1355959056-6009-2-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, patches-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--lBR2yNlwcY132B3M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 20, 2012 at 12:17:31AM +0100, Lucas Stach wrote:

>  static struct platform_driver wm9712_codec_driver = {
>  	.driver = {
>  		.name = "wm9712-codec",
>  		.owner = THIS_MODULE,
> +		.of_match_table = wm9712_of_match,
>  	},

No, this is really not a sane way of handling AC'97 at all.  They're not
platform devices, there is no sane reason why they should appear in the
device tree as such.  Really we ought to be just hotplugging them, AC'97
is perfectly enumerable.

--lBR2yNlwcY132B3M
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJQ0tsWAAoJELSic+t+oim9nMkQAJHeRB8CdTLbTJsYt51sbva4
ZvGyqmC8zpSx9cTYVGTsX5DWlMZjtxQkgIFJ2HA+6IRVaUyVfCioufgsgvZNw9GL
I2fcXnvzYCVX0z1voip3EG3y86x/ffcVeoNiIbV5xuUD02bXqNzO18kdcy18BAET
95uMFX+9FtSjsf1ILtOJLwrdAEjxmttTx30xi3rtcQorkYhMcFPxA8NsaGHtsTGm
FitLKX6XvECZM/7wOARgYlOUSHx0BpJ/YkzqtHOyfjrp6Ue1GaT/zFuy16GZEmP1
pGKb5PvkrXlnaY/YHGB2XVwm9EWSAfs7O9ZNKleZ2oQB6wSR3NK2B3EUqNf8QVlW
ATtt66Bef0xttkMhA3vEirlC1W0ji1ObktZf1mXgCqdvFRwby9LMRCHsDPCS4SBr
WyCldOa12vN3+RM+oxoRt8f6JfP3QC8pz935iJvtNd6sY2taWfYNOVVWQ0yWDxyN
dwJWU6f2uEeSEWRfsel94jwhceparmUlv5alCHhgkveS4O4juf3l/wzbwteA1fGp
pKIO34CJqYaBL8To9sag7id7ITRy9MMRPNlAn3n/uNFh3niBVk64CJBcqLUdFTxE
d7Ck+nRf6Wfqb7THEqeeH3sS0PP1TcJ6ndqgHs5zHiYEDgt+Xo4Kmj67GW9IoVpS
jCGl+xne1Ux0w0/9Xefh
=xNjf
-----END PGP SIGNATURE-----

--lBR2yNlwcY132B3M--
