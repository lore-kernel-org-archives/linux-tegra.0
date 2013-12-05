From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 2/2] ASoC: tegra: add tegra+MAX98090 machine driver
Date: Thu, 5 Dec 2013 00:00:59 +0000
Message-ID: <20131205000059.GG29268@sirena.org.uk>
References: <1386195567-24124-1-git-send-email-swarren@wwwdotorg.org>
 <1386195567-24124-2-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Iv4H2WyLgK50POYH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1386195567-24124-2-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Liam Girdwood <lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--Iv4H2WyLgK50POYH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 04, 2013 at 03:19:27PM -0700, Stephen Warren wrote:
> From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> Initially, this binding and driver only describe/support playback to
> headphones and speakers, and capture from the external microphone, with
> GPIO-based jack detection for the headphone jack only.

Looks good.  I don't see patch 1, I take it that's the DT or something
and there's no dependency for merging and I can apply?  The DT binding
is a common pattern so I'm OK with that not getting separate review.

> +	switch (srate) {
> +	case 8000:
> +	case 16000:
> +	case 24000:
> +	case 32000:
> +	case 48000:
> +	case 64000:
> +	case 96000:
> +		mclk =3D 12288000;
> +		break;
> +	case 11025:
> +	case 22050:
> +	case 44100:
> +	case 88200:
> +		mclk =3D 11289600;
> +		break;
> +	default:
> +		mclk =3D 12000000;
> +		break;
> +	}

Not a problem here but this is a really common pattern in one form or
another, we should probably have a helper for it.  Might help with the
generic card work.

--Iv4H2WyLgK50POYH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSn8I4AAoJELSic+t+oim9//4P/jA5qOZnexoG4AnLrqKXtL3A
Jx3HdEkvu4xw83KJIEA+9vbN/a8uqf66L6w7AiEMcbThfqVH8A27YGkcCyTrkUSs
FzFSkGeEjy8/jw81DdFVXBpqlRSLZ5IvW4YkRGBw5dl0CNywQqyVULJW7pljaiQZ
IDAED/kEkAVfWoniLE/3ylcPrEfLE1lIHioKU6RJCtriiM6k9MtiJQuOxYkHeocl
1G1G5s+3DUI0QEA5ZAFahIK/bM3EHa40TXM7gsI4gfKIaGle5OOQkAANLTvRDaiT
wDF2pr02iu3MeuspN0FKsa1v1CrlKgtOrQqys+ZvDlQCuOc0MuQ38yGtHo3LL4C+
pT7BUXVysmAuJMxSDADtGnp67TmC299e+1kUyc0olfFC9NYdIEOSi4xn2HoUrDSU
YSu4IXtC7qxmP5hLPYsedEj7c82EUDBe5ssuVEADQVKLXCfQXziylRHA+/jlJeSI
81PzUUhUgcUwusH/dYZfFiisodO8Kozkx2NUWp1vSuzf8k9ZLczVzoRFjjdBuxay
O1DMb7J/PGoODtPtqO3xZHU9oULWlQB5QWoJmrzrboIdlys6N4qjI0unrrTGcjeX
tp7JFDIJwt6MtlQfx69XHyimb8AiZIHd219XroV+ugAPBH5jJShgzlMUxvJA2kLA
Gyt/MhWcNXriBidJGegZ
=Bexl
-----END PGP SIGNATURE-----

--Iv4H2WyLgK50POYH--
