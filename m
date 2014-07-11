From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v5 3/4] ARM: tegra: tegra124: Add XUSB pad controller
Date: Fri, 11 Jul 2014 14:59:04 +0200
Message-ID: <20140711125903.GC10744@ulmo>
References: <1403177830-28595-1-git-send-email-thierry.reding@gmail.com>
 <1403177830-28595-3-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7qSK/uQB79J36Y4o"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1403177830-28595-3-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--7qSK/uQB79J36Y4o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 19, 2014 at 01:37:09PM +0200, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>=20
> The device tree node in the SoC file contains only the resources (such
> as registers, resets, ...) but none of the lane assignment information
> since that's board specific and belongs in the board file.
>=20
> Tested-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
> Changes in v2:
> - include dt-bindings/pinctrl/pinctrl-tegra-xusb.h so that board files
>   don't have to include it explicitly
> - remove unneeded #address-cells/#size-cells =3D <0>
> - add padctl label for XUSB pad controller node
>=20
>  arch/arm/boot/dts/tegra124.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)

Patches 3 and 4 applied to the for-3.17/dt branch and rebased the branch
on for-3.17/xusb-padctl because of the dependency on the dt-bindings
header.

Thierry

--7qSK/uQB79J36Y4o
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBAgAGBQJTv9+XAAoJEN0jrNd/PrOhcEUP/j/GLBvdgdXnFTchmbAtDhop
wHGcLJJncPbfpoubsXnRDwyqABBSN7hkOAR+z2vz68XE/meDrqiq8Se07GwTaAVr
0ZiIzBD1kmWlrq4001tGy9q5IUoypKXBIa+g8A2ub21/8kayb7lhNa3v1bR+4cn/
EQClLF2fEMF8VbUOMJ2jWnxgdpoaSauBdqUT05xLnhN8lMUNOeJQUkVWIcyuMkI7
HDuNtCgBMjDtThyhPmBAaVZykA+W5BEVnbTMJJrB4fPqsD6MpGWYDjM42TAQiqu5
0wOKZ29wP5qxRE7FPKcZ6fOo3lIzzq2q3MRHcye/1TmVQnjOYtEyA2YdwOOzK2KR
pbYlJoNBpUfgsfKmjsSsj6MBAHLsCQq6WR4qRG4eBTOg11YoXcEV61rnTXIknI4Y
FAqR3kfMuJOKEEfql9dEQ0g2Z2lfcgI36xTo23DbaZUtK2is7MhYNa0WEJMMSOWA
TvSzF9K+/qmNcOyEIDoNcGkkmR6lfvQsiLCSOQsN97VtoP0m1I5yJKtppG4+crgA
0KeU3EYvgZvvHtk1hsbRfR2C+CLWO09ekmUp0IVMF8feRQcD3K7QDL0hR1d4Ykeb
gVjyXutAnNiAOCZcwmVZRPCh2Pt867wOLggzewRp7Svsw6uooaY1hMRpz9DXwrTC
jo5eBMQOpiO52RgjVWcy
=3Xya
-----END PGP SIGNATURE-----

--7qSK/uQB79J36Y4o--
