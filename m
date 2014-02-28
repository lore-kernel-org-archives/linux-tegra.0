From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: tegra: Add Tegra124 USB support
Date: Fri, 28 Feb 2014 17:46:04 +0100
Message-ID: <20140228164603.GB15140@ulmo.nvidia.com>
References: <1393431629-7040-1-git-send-email-thierry.reding@gmail.com>
 <1393431629-7040-6-git-send-email-thierry.reding@gmail.com>
 <530FB707.3050503@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <530FB707.3050503-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2014 at 03:07:03PM -0700, Stephen Warren wrote:
> On 02/26/2014 09:20 AM, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > The USB controllers on Tegra124 are backwards-compatible with those
> > found on Tegra30.
>=20
> > diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra1=
24.dtsi
>=20
> > +	usb@7d000000 {
> > +		compatible =3D "nvidia,tegra30-ehci", "usb-ehci";
>=20
> These properties still all need the Tegra124 value in there too, just in
> case there's a need to differentiate in the future. I can fix that up
> when applying.

I've added those in v3 that I just sent out. I added Tegra124 values for
both the USB EHCI controllers as well as the PHY nodes.

Thierry

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJTEL1LAAoJEN0jrNd/PrOhl/0P/ioLXD72giyquiL+IkY6dYWt
FI+l3DO/qR6u22wyUVu+IsQDlkBjrsXgoZGR966ezNyBin3FOOZ2BouR7CdK8LG4
EB+bOw8/gLWblT6qsDeotRT8RKH1Hs4qeMiVcUGhulHWnNKwuA3kwR/L7qJX3t99
PVMeXun6eaHekiQ0MsPI8LJA/oumNmn8bzyZ6lylr6vpL2zXGQPw+lVN3LdhafAi
DN6hySeiUccCb5rWnjgnFmzcdTHgz0NCJHef6EiYUOA3slUM/uxtein6TC4IU7Mo
PRjakAbSqA3HNCA3FxSOOn0tN3vXH+1KMApqrKDl/JBwxNjeHoHLrpVvoXJ8cziz
ttaRObJBdQlfsndfOMTJq3N8boEhfmCkSqvVo3jE9NN9NOKB6+gXPjPnynkfDUzu
PooTcdndNexpkKojgp9EkYg4xXpAN6zYLNatFEjmeyE5/n0o+Y3GZulAc5DQu81p
duJEnl32M90+HadkYt1YwjaA7opjLW5OPqQLiPWFRog9LtkUQvOsxfdfY7t1T0UD
kDTQNqZ7suQfDqce4MR/fw9bK3B2ukBq3Jv0Xe1dezwHsh3WqxEeZF4IejlFKr4l
GtJ5+sSbrHgcP2lZOgoSeLyGRVw4y4oBS8YJbLg5XrBCBVNXgS8oK2JncJGXV3Sr
ljh7iDMBtOmZq0uLXHIf
=6Ssr
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
