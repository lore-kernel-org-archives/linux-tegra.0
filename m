From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 08/23] ASoC: soc-core: Fix component name_prefix
 parsing
Date: Tue, 30 Jun 2020 11:45:14 +0100
Message-ID: <20200630104514.GE5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-9-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="3XA6nns4nE4KvaS/"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1593233625-14961-9-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--3XA6nns4nE4KvaS/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sat, Jun 27, 2020 at 10:23:30AM +0530, Sameer Pujar wrote:
> The "prefix" can be defined in DAI link node or it can be specified as
> part of the component node itself. Currently "sound-name-prefix" defined
> in a component is not taking effect. Actually the property is not getting
> parsed. It can be fixed by parsing "sound-name-prefix" property whenever
> "prefix" is missing in DAI link Codec node.

Any fixes should go at the start of a series so they can be applied as
such without needing to pull in the rest of the series.

--3XA6nns4nE4KvaS/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77F7kACgkQJNaLcl1U
h9Ddygf7BrD+E2FcOp8W6S0EYnd7iYl0lFpKgh7ecrnG7StoGY3SPitqEAa0P2L3
2yl+I7bikIQtVPb0E0k55Fr8bnIo/b+7Gn5LGI+BnXRg6E8wU/nRIrmiu1Yg5Abo
QE5BLjDS98Bg3HmoR2qA3shJ6GM2bNOphemjtLP4gtd1ceCKoS143lR+XkkoSWoD
Vnw0bkyg86RJoLykmF1IwIjPdx0HtDygI9PhX/e0rOU9iDDCMmNGtAoFe0berc5d
/xUlYzSeVbpBbeCCT0g1Q/uZmAGUo0kydWp0pdPTqgjkzhTUNam6yY9L/25JBHsY
qf/OnFDPGSaSKEtgp8kltfZMcT1d4g==
=t15Z
-----END PGP SIGNATURE-----

--3XA6nns4nE4KvaS/--
