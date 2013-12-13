From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 2/3] ARM: tegra: Enable Venice2 keyboard
Date: Fri, 13 Dec 2013 20:57:09 +0100
Message-ID: <20131213195707.GD7924@ulmo.nvidia.com>
References: <1386951847-6490-1-git-send-email-treding@nvidia.com>
 <1386951847-6490-2-git-send-email-treding@nvidia.com>
 <52AB3DEB.5020507@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="hxkXGo8AKqTJ+9QI"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52AB3DEB.5020507-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--hxkXGo8AKqTJ+9QI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 13, 2013 at 10:03:39AM -0700, Stephen Warren wrote:
> On 12/13/2013 09:24 AM, Thierry Reding wrote:
>=20
> > diff --git a/arch/arm/boot/dts/tegra124-venice2.dts b/arch/arm/boot/dts=
/tegra124-venice2.dts
>=20
> > +				linux,keymap =3D <0x0001007d	/* L_META */
> > +						0x0002003b	/* F1 */
>=20
> I don't suppose you could rework these using the MATRIX_KEY() macro, and
> associated header file that provides named keycode constants?

Yes of course. I totally forgot that we have a header with symbolic
constants now.

Thierry

--hxkXGo8AKqTJ+9QI
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iQIcBAEBAgAGBQJSq2aTAAoJEN0jrNd/PrOh2lYQAKvpzj6xxjY0RUXRd1NwY4DR
sqQbgOxmy31QqyBtiTv9XJNMx2EpuvYV7qMrBMiW3rXlXrGIBfraugh0q/Yus591
vzK9PnPbIkG+s/w1WYVoMxtO212ZUSOsCaEwliUo1HW82VGf2HnbYdL4aLGBKJLv
iCiW7VHvLTueZsKUyVw1QOCxKP2qJytwnban9ZQ4XPE4xGpZsTjgFpqtvcd+xsyE
TEAClt+lZTH83dWkXFI0itgjplz5ApOd01AHnSZltFq83agW1qUrsffILeLDmcC6
DZXj++9ebOmoP2AoxGyifoPK9NFWW2hNALgecUPpPac0sPmhbqR8GR3ujjxcVCcp
efLb9q5+aF8x03vrOUJryJLjxRUQMhCmvl4ujxMJONiQjm0pGMIPELoKpRh12tmU
MDJcF26uSEgU8M1+mynF8P10wTzRxybUwKnPhmnzBfWKv/2R7XoU+9tVp1JqJv6D
krAO3CGxVzF/r3T+8C9govec31jgXBN9REWccS8NpHGN8jBDDAQdD50V4zjLB8pk
jku+cpzae8+TdoO+n+HO5z4VFVBrvLl/WP6HLa5nOBFNOOUHSV+pNenUsEUm8pu3
iQrhmNF8vlVgp7TvuRRnX55AlMfyIG5KGIUM1cSzJSM/7iBOxpDos6cdoyw4lpW6
D6TLZufT4pOLfLy6teZH
=aeX+
-----END PGP SIGNATURE-----

--hxkXGo8AKqTJ+9QI--
