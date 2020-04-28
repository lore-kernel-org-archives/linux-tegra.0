From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 3/8] phy: tegra: xusb: Add support for UTMI pad power
 control
Date: Tue, 28 Apr 2020 12:16:21 +0200
Message-ID: <20200428101621.GF3592148@ulmo>
References: <1586939108-10075-1-git-send-email-nkristam@nvidia.com>
 <1586939108-10075-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="juZjCTNxrMaZdGZC"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1586939108-10075-4-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--juZjCTNxrMaZdGZC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 15, 2020 at 01:55:03PM +0530, Nagarjuna Kristam wrote:
> Add support for UTMI pad power on and off API's via soc ops. These API
> can be used by operations like charger detect to power on and off UTMI
> pad if needed. Update powered_on flag in the pad power control API's.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V2:
>  - Patch re-based.
> ---
>  drivers/phy/tegra/xusb-tegra186.c | 51 ++++++++++++++++++---------------=
------
>  drivers/phy/tegra/xusb.h          |  2 ++
>  2 files changed, 26 insertions(+), 27 deletions(-)

Nevermind my prior comments, for some reason I thought this was adding a
custom API for driver interoperability, but I see now that this is just
a means of splitting out SoC-specific code, so:

Acked-by: Thierry Reding <treding@nvidia.com>

--juZjCTNxrMaZdGZC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl6oAnUACgkQ3SOs138+
s6GllhAAqj0KLe0kZLc4UCJ+esPO9vr0YEg1APWbfONIUbkNfgOkAwK2Zzwb2PAG
ieVffoOuvphSiOMWhuweuFea8TwaSdenBPQJjrB/kKLCWIBdOAuFPMiwtZA/eXGQ
YNg1MllVAQuUiniCXWGxCD785DgGeozdONGvDM5YuhZlvizQ4X2hGve/Hp9i9Jk3
9LR5ZI2uHAent7wzGpFTAAvI487Vik+fnacrtMddvU4u0qhdVrdGEIWUa8yRsJT+
MUVbOicbJD5Uw5EOZie+VuW+3FG6XJTPjc7efdm+z2CQWTEDSDWCd2HOyPqmUlHg
U4lN2TPVCTiEEzGmBRCqPmyzsKhWgfxrHAbkpIL88C+/grqUW9rpLv+TxbFY/2zj
3meHPMkePB+yKGZtqAkyYemx8QGWUs0vaqw8ptlBiNd+H5hVPINvnsg1cQJdb4P3
lqxr+BCpBHbA/1+QekcW2QnUcKbEyGwDq2e0rkWYusZPfbYwsEvoHBkN1SgirSjM
q/RtxiWUm03inP8IQWFIhbULJSS5n848MpBNryBu7IhVASEeICEJ9R3OLY4zc1Bv
l3P1UqrxAEfn+H7YnMN6xWP0T5TJB02Bj6GWPBTngXEgM/Oo2sgcvu29864ZipKt
xeRrSOjA9n/cEdeyXrh3etD3DZ2AgvFRa93w9TNPu535nAEv/88=
=h33Z
-----END PGP SIGNATURE-----

--juZjCTNxrMaZdGZC--
