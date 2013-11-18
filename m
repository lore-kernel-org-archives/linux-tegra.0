From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/3] ASOC: tegra: fix AC97 clock handling
Date: Mon, 18 Nov 2013 16:02:15 +0100
Message-ID: <20131118150215.GH26046@ulmo.nvidia.com>
References: <1384370243-17178-1-git-send-email-dev@lynxeye.de>
 <1384370243-17178-3-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ewQ5hdP4CtoTt3oD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1384370243-17178-3-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ewQ5hdP4CtoTt3oD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 13, 2013 at 08:17:23PM +0100, Lucas Stach wrote:
[...]
> diff --git a/sound/soc/tegra/tegra20_ac97.c b/sound/soc/tegra/tegra20_ac9=
7.c
[...]
> @@ -387,24 +386,18 @@ static int tegra20_ac97_platform_probe(struct platf=
orm_device *pdev)
>  	ac97->playback_dma_data.maxburst =3D 4;
>  	ac97->playback_dma_data.slave_id =3D of_dma[1];
> =20
> -	ret =3D tegra_asoc_utils_init(&ac97->util_data, &pdev->dev);
> -	if (ret)
> -		goto err_clk_put;
> -
> -	ret =3D tegra_asoc_utils_set_ac97_rate(&ac97->util_data);
> -	if (ret)
> -		goto err_asoc_utils_fini;
> +	ret =3D clk_set_rate(ac97->clk_ac97, 24576000);

I think this needs error checking. Just in case.

Thierry

--ewQ5hdP4CtoTt3oD
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSiiv2AAoJEN0jrNd/PrOh30QQAKGCwSsvXTnf20D7QmHcdb8k
yyDCx58G/PbTlxD8GHEyYuLavB6jHFyuylfrgOyrEjwQjGiyQa30L8nVRNf/CMee
h2CV8QeQ06GSVBwy4CkdcNuJfdoJP2uetEoFTVIQzb6w5WSo4O1hf5Mzk0K3KcKo
JdplGto1+bjvotf8xNZoHdTOXhws6//COBxOb47yRjgHKMGj+UIf5OxQSHIU/7WA
eV3qGPSE2aH4nppG5g4J0ftauoDDEH+nYVmnRxDx/bg2geMXeGQYmqw+f0FNLibr
dgrUPXGOtjdmk084XWNCs+bPI9iN6bgEaUs/Tupb0N3A3TkWRNfQmILHcoOk0fUC
FcRU/YkI1hj6+87OR9mbrYve9p13OPsdAjQhZa2XRCuMQFShhtq0iH+jl+Rh1mbh
k4mVRHsd0tIB5VvubRqT8zE0RIdTiOuvxvLDxD+6iXJL4ufi422lb56vSp92PXaB
840exawaFSDrqXjEmJIiLDath+3fCwmSkbmUsnX9fJX9SLW3vlzCtwbwfqmzJmE/
lOJ6cuTF7ivJOj8p/yMyHYADXkwJkiUI0R3gzQ831DHzwcEJW5bdgZ10+qTffz90
tuRYf1KV9L0v9DW7KapaqFkSYCEtPX9Dp1/eXkEV2u6qSIb/kI63n8qbNd9Qvd+q
aCfJMNhj04jMxa+sMNmI
=QOuP
-----END PGP SIGNATURE-----

--ewQ5hdP4CtoTt3oD--
