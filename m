From: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Subject: Re: [PATCH 2/6] i2c: tegra: Remove non device-tree support
Date: Thu, 25 Aug 2016 21:33:14 +0200
Message-ID: <20160825193314.GB1614@katana>
References: <1470910620-9898-1-git-send-email-jonathanh@nvidia.com>
 <1470910620-9898-3-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="yEPQxsgoJgBvi8ip"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1470910620-9898-3-git-send-email-jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--yEPQxsgoJgBvi8ip
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 11, 2016 at 11:16:56AM +0100, Jon Hunter wrote:
> Tegra has only supported device-tree for platform/board configuration
> for quite some time now and so simplify the Tegra I2C driver by dropping
> code for non device-tree platforms/boards.
>=20
> Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

cppcheck rightfully says:

drivers/i2c/busses/i2c-tegra.c:854: style: Variable 'i2c_dev.hw' is reassig=
ned a value before the old one has been used.

Dropping the patches...


--yEPQxsgoJgBvi8ip
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJXv0f6AAoJEBQN5MwUoCm2xpQP/R8pRerRGe4VM+wqAYP+iapa
tGPtJme5RfAIe9iVcJ3oqU15hAAR5L4o4veJUL1R+BzwprOxL8okacCMvV4luRMr
RZ37C6HKTs0SNiO1BNnuJAZvnlhPrFy13BG+u8wYJNJCPTYDBlkZ8ZPxJHOC0aD2
hL4fYraZZNgYuY74eUT7yPBdpDRUQ2qvReV9WIVoU1sKpsjpOr6fBxd4dBBbdl1T
RJHiJlSTH8Uq180JOFSTlxhZobMHilpanLXXhvSSjp09lpNMwqVeGbAZQ5b/59qu
1l0p21mGhvF2pBxCXJUMKcig820wCL/AOD9EFOAHLr/Gtn6ejdmLtMbbgvDJKwXi
h8Yfyp0PnVOqrIn830RFeHJ3dxd9sFgk8nvZC2uH02YEkZuW4LgaigJEaY5ycU6P
SBS84s6DAKw//sDXaa7yPUA9LOqNS+gPZW+0omEcaViiD9hHCz1oX4+7Xn0UuxEq
p/n9YR2J2RG8J5iTuEXm5TVtvwPVdpTj+GmRSIwdo7OduFL4SMJlfzuKPRI6Sm9S
OQIyjGUVU867m/Yz1pd0azAkVMVesh70J5n/YjVngCmVimohJBUKesU1UnLJwFvR
aci+dmntAaKj+3NF55GYcBpTetMcvXM/XY9CeDmBEqMPxIzqhcOvjoFA6Pg4XfMH
CSXfiMNQ9A4xQ2YY/b3d
=xVMf
-----END PGP SIGNATURE-----

--yEPQxsgoJgBvi8ip--
