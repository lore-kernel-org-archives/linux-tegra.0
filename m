From: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Subject: Re: [PATCH v2 2/3] Documentation: devicetree: phy-tegra-usb: Add
 vbus-supply property for host mode PHYs
Date: Tue, 30 Jul 2013 00:19:32 +0300
Message-ID: <20130729211932.GA6901@radagast>
References: <1372422796-23524-1-git-send-email-mperttunen@nvidia.com>
 <1372422796-23524-3-git-send-email-mperttunen@nvidia.com>
 <51F6893E.6070604@wwwdotorg.org>
Reply-To: <balbi-l0cyMroinI0@public.gmane.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <51F6893E.6070604-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, balbi-l0cyMroinI0@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 29, 2013 at 09:24:46AM -0600, Stephen Warren wrote:
> On 06/28/2013 06:33 AM, Mikko Perttunen wrote:
> > Add vbus-supply as an optional property for host mode phy-tegra-usb PHY=
s.
>=20
> Felipe, I see that you didn't merge this one patch from this series. Was
> there a reason for that? At this stage, I would consider it reasonable
> for DT binding documentation changes to go through the same tree as
> driver changes.

no reason, just missed it. Will apply now.

--=20
balbi

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBAgAGBQJR9txkAAoJEIaOsuA1yqRE5owP/0W+SgBwEk3JJnkt2/texnzz
9ni1UUtNtHyK8hbwcPeaYUewhJwkWJxbX/tGbJSR6eEWp0JI4UtwQ/zVOsg9HDdB
bciSTBupKQa/Q6eax4b5EQyKlPDwlGzx7ouDuD7F6opZOJCtonTdRFwPHbImbxki
zzV2pL5w8Tle+aXfvZeTBis+kjS/qq/dUdCg8tI0ePHiPI6p7K2RR9c1c2fcf6LT
k9COVNOqyYMYAryHmXBPlMK+QFxy5f/WsDNLyViPvWSKgg9sOyrpeNVCbxNXrpL1
I3cZbIgnadER7R1r8GDvXxUr84M8pIp5R6lID7tMWkAAGQsQ0d2vanx1RuQYpC26
540kJ7t48MxBDaj8wjAObii0INroBMu7pcQCKYerPmMUAmkz/enxBudPMMjhlGEU
cOVIMPl8e7wHsvJVsATV70RNrzn54uuO5cx8Rb6XGjXLQwOBsCukHMfHmy63xbgv
FnzEAJrZMIm6AP7rwAmcJolxQG4flcT1g4juvEt+TIktZyJVUIgTYI+x15aV5L0d
L3mjWhMt2RNH7gOKpMT5IwcaL0f8GpVM0MIAQq5nwjerGeXIM+sHBhk/e6xkQ7W8
H2X+a/zIvjbqnCLG2VVOxbDHKaPzLmJW9PQ40/uR39VXvv9DlLtEWNGSBlCnO3XV
faKYSiI7NXDFIkPi1p2p
=vD7x
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
