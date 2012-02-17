From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH V1] regmap: Bypassing cache when initializing cache
Date: Fri, 17 Feb 2012 09:21:24 -0800
Message-ID: <20120217172124.GE10146@opensource.wolfsonmicro.com>
References: <1329485246-14226-1-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="XuV1QlJbYrcVoo+x"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1329485246-14226-1-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--XuV1QlJbYrcVoo+x
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Feb 17, 2012 at 06:57:26PM +0530, Laxman Dewangan wrote:
> During regcache_init, if client has not passed the
> default data of cached register then it is directly
> read from the hw to initialize cache. This hw register
> read happens before cache ops are initialized and hence
> avoiding register read to check for the data available
> on cache or not by enabling flag of cache_bypass.

Applied, thanks.  This only affects the code after the addition of cache
integration for bulk I/O so I've added it to that branch.

--XuV1QlJbYrcVoo+x
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQIcBAEBAgAGBQJPPoyFAAoJEBus8iNuMP3dmnEP/1xVGG4CDbCMkjPgAvC3l317
UJZTFtIIF7Bj+kQg4HT3vgDHvxLsEW8pxJfvcRvn5lXkdbp8ILJfD4K3U4ETiFYT
J8ln59s1nJuruf9V4poEHpmbLwPBhkWruouQ97geMosLDMEzUOBB69XiCUMzCOdr
TFlZ4daw4L9kKOfZAEeoemrij9+/guWyjO6W4Skg6Sr1FA3HsDIplOs2oRI7+C3p
uKV2frihEhhhAhQ9LMM10cJmapOrKpOYqBQJkxGxts4kjEyY01J/WZCPFA682JIC
lyKMovLVPPzVk3FTPk1XPWuYavcJtNvCRjvw3tMelZ4EWyY6MfGtQ8fpI0b14rn7
UhHxhvw8F2S8I6MRiMhz1C497OCIx+B1LWg9qurk/eHbUmsX8W5uIyDvssxWkhtX
O2Xq80N1UMyCWr8i3d7PzER5iYahpHMM3HcRhtpXMbBqh7vChlHswea9ugNeK0x7
M0kZrZUuEplmX4J6HFLM0WfG+p+hGVVY1VQNlP5e4eZfcY0XBMx3b8pla19pSGnl
SI/N6yOFL8W76rUEBHK7J59/LoFODynRZwuEjmo+6nlspGB6qLM4+X4odD94r4vA
HgIH7IMIKcSp7/F7xWMo2D/azG4O4ataW48Igi/p2fA3FB2yHsDxKY1UdUKwtFL6
eMZy/eCtyaAeTwgE+g7k
=IDIm
-----END PGP SIGNATURE-----

--XuV1QlJbYrcVoo+x--
