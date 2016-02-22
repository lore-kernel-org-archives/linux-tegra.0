From: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Subject: Re: [PATCH 0/3] Fix headphone detection on Acer Chromebook 13
Date: Mon, 22 Feb 2016 18:46:18 +0900
Message-ID: <20160222094617.GW18327@sirena.org.uk>
References: <56C3977E.8050001@wwwdotorg.org>
 <1456122253-3039-1-git-send-email-sctincman@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="A7Y7Q+zxDFVJwB6H"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1456122253-3039-1-git-send-email-sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Tinkham <sctincman-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, lgirdwood-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--A7Y7Q+zxDFVJwB6H
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 21, 2016 at 11:24:10PM -0700, Jonathan Tinkham wrote:
> Add a new DT property to disable inversion of headphone detect GPIO.
> This fixes the headphone detection on the CB5-311.
>=20
> Jonathan Tinkham (3):
>   dt/bindings: Add 'nvidia,hd-no-invert' option
>   sound/soc/tegra: tegra_max98090: add 'nvidia,hd-no-invert' option
>   ARM: tegra: Do not invert nyan headphone detection signal

As I said in reply to your earlier series:

| Please try to use subject lines reflecting the style for the subsystem -
| this makes it easier for people to spot relevant content.

--A7Y7Q+zxDFVJwB6H
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWytjkAAoJECTWi3JdVIfQohcH/jBhPtSdZyF4J4OpOMDmh2X3
GMSS1lLDH2JC6ND1wEEt7W38phi3F54uojdCr94qFxyL5xogro/44mT1COvwrL2T
uf7JJh8MFSTT3oQXAyyBt31dnVXSyuYTw9bGHuF2WTKTo4HSyT63jwDjkizoWEuH
8sdPwHTSvg20usauK2Z0yLWg32z+bR7jxdfUAdz2sF0dsOlZU77kMRO8k3/VTZfA
VWzELldCX2xFYNqXzwktnsFuqWnqzVzTiRSVmM2ab8bIVJAAvi3+IT5O5AOBlM++
nTTamd6DAjzUcS6w5l+NsAB7NBs2K4OK9a354CJem0tHBwku1KsVbbG5hbbXExs=
=KLyk
-----END PGP SIGNATURE-----

--A7Y7Q+zxDFVJwB6H--
