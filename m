From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [RFC] DPCM for Tegra
Date: Mon, 4 May 2020 18:55:55 +0100
Message-ID: <20200504175555.GG5491@sirena.org.uk>
References: <1588250483-10014-1-git-send-email-spujar@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ahP6B03r4gLOj5uD"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1588250483-10014-1-git-send-email-spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sameer Pujar <spujar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: perex-/Fr2/VpizcU@public.gmane.org, tiwai-IBi9RG/b67k@public.gmane.org, kuninori.morimoto.gx-zM6kxYcvzFBBDgjK7y7TUQ@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, sharadg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mkumard-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, viswanathl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, rlokhande-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dramesh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, atalambedu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nwartikar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nicoleotsuka-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--ahP6B03r4gLOj5uD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2020 at 06:11:23PM +0530, Sameer Pujar wrote:

>  a) Can I use a DAPM Mux control to activate a BE path? This in turn can
>     program required switch in XBAR.

If it works then sure, that seems sensible.

>  b) I have modelled SFC and MIXER as backends. Is this allowed?
>=20
>     This was done to include SFC or MIXER HW components as part of the
>     sound card and use like below in one of the audio use cases.
> =20
>     ADMAIF1(FE) --> SFC(BE1) --> I2S(BE2) ... OR
>     ADMAIF2(FE) --> SFC(BE1) --> I2S(BE2) ...

This is the sort of setup that'd be a lot happier using a component
model.

>     I used following workaround to connect multiple BE components.
>     With this I can see PCM callbacks happen for all BE DAIs along the DA=
PM
>     path. The obective was to connect multiple components together and (a)
>     was used to connect one component to another. Each "-->" here connects
>     two components and it is a switch in XBAR.=20

This doesn't strike me as something that's likely to be robust but given
that that applies to DPCM in general so long as it doesn't break anyone
else's existing stuff I guess it should be viable, it's not like there
are actually good options that you could use currently.  It's really
hard to get enthusiastic about it though.

>  c) Hostless mode did NOT work:
>      - Following audio path was intended to be tested:
>        I2S1 --> SFC --> I2S2

>      - [3] offers two options:
>          * CODEC<->CODEC: If I were to use a separate DAI link for each B=
E to BE
>            connection, then it will result in a similar design what we ha=
ve
>            currently.

This is more in line with components so will probably be easier going
forwards.

>          * Hostless: I did not come across references for this.
>            (Any references in this regard will be helpful)

Not sure anyone has ever done this with DPCM, could be wrong though.

> May be the current Tegra ASoC design is more suitable for component model=
 as you
> had previously mentioned. I wanted to understand if above, especially (a)=
 and (b),
> are acceptable in this regard or if there are better options to interconn=
ect
> multiple ASoC components.

In general most systems would be happier with components but yeah, I
think that's particularly the case for something as powerful and
flexible as your hardware seems to be.

--ahP6B03r4gLOj5uD
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl6wVyoACgkQJNaLcl1U
h9BsCQf+NDpQnXUKOhrp8OMCAs73chnv7fTrNscXnf0V+rnrqqSC7b6d0Q2tz3QL
8HYzl1AiMtRaAmybm98BhWpdUWXMGTKdYMBM7uKX2r+uVkm6oWhhK+EST6fOMv3k
ZvgRM35+2mIXUrSR5b62uPIi8O3mtbLuFkPb3oWkw/hT0jQm4MPKl/c6h3f9e2qb
FY8yrgExhRQkp+NAKMSNKV4gEZbViEJG5M9w879aEjQdWWhJ4tqo2s2QQXZmg5p2
x/uNk6mgWU+edW21BN78iaOB8urYcnac5ItgRCiVVCrhRjNeP8qhs0irsRF5l03X
656KL7U44mgySYNW2tlLHsXV/jmJXg==
=W0ip
-----END PGP SIGNATURE-----

--ahP6B03r4gLOj5uD--
