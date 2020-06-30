From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH v4 12/23] ASoC: simple-card: Support DPCM DAI link with
 multiple Codecs
Date: Tue, 30 Jun 2020 12:01:00 +0100
Message-ID: <20200630110100.GH5272@sirena.org.uk>
References: <1593233625-14961-1-git-send-email-spujar@nvidia.com>
 <1593233625-14961-13-git-send-email-spujar@nvidia.com>
 <874kqu1x70.wl-kuninori.morimoto.gx@renesas.com>
 <1e0cf6d1-bf4e-8808-5390-c8a3b7c7fe7e@nvidia.com>
 <87mu4lz6pt.wl-kuninori.morimoto.gx@renesas.com>
 <1d7888c7-a8cc-e891-01aa-016e31cc9113@nvidia.com>
 <87ftadyrec.wl-kuninori.morimoto.gx@renesas.com>
 <492079e9-4518-78ba-a227-859d31594369@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="82evfD9Ogz2JrdWZ"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <492079e9-4518-78ba-a227-859d31594369-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org>, perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--82evfD9Ogz2JrdWZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jun 30, 2020 at 01:22:29PM +0530, Sameer Pujar wrote:

> Yes there are complex use cases, but if we look at the amount of changes
> required in simple-card driver that is not too much. Existing binding for
> simple-card driver would still work fine for our cases. Yes there are some
> deviations and we don't want to break existing users, that is why a *new*
> compatible was introduced and specific items can be pushed under it.
> Majority of the simple-card driver is getting re-used here. We just need to
> make sure it does not affect anyone else.

Why simple-card and not audio-graph-card?

> > Using fe/be instead of cpu/codec is easy to understand.

> I guess you are referring to DT binding part. The parsing code specifically
> looks for "codec" sub node and thus present conventions had to be used.

Remember that this stuff gets fixed into the ABI so we'd have to live
with this for ever.

--82evfD9Ogz2JrdWZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl77G2sACgkQJNaLcl1U
h9DLaQf8CxFbnQfdwGWMqWzwX2nlKaR7uERgOdrildCUvaMKInQJ3nSQzOwEqxkq
NMi/PKvwmR+2xteMNBYYMvXO739dNZj9Y9vvVHOmAUtPwVMEebs45t4Km2qwLx25
t5d/6KK4UUC8RghBJr0Ls1Ywhqbp6CSieyt9ogqvrb0PrVGITmV2fpklh26gw75d
/yzh/obJaTotGhYRuCFMvB7mTNOiitRXr08p8kRJSbEWZKw7+ebUQKhiuu6Ximk6
1Uso6kJgROaHZhl896uSlbnW4odrn1t/JSHxJ9yRNedpvwV+E+8ZGHo75K6SEwRx
4NOG2mHbKSXZ3Ta+h/R4+Q4B2STg3w==
=eDum
-----END PGP SIGNATURE-----

--82evfD9Ogz2JrdWZ--
