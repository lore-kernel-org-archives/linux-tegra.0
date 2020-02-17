From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [Patch V5 03/21] phy: tegra: xusb: Add usb-role-switch support
Date: Mon, 17 Feb 2020 09:39:19 +0100
Message-ID: <20200217083919.GF1339021@ulmo>
References: <1581322307-11140-1-git-send-email-nkristam@nvidia.com>
 <1581322307-11140-4-git-send-email-nkristam@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="sDKAb4OeUBrWWL6P"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1581322307-11140-4-git-send-email-nkristam@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Nagarjuna Kristam <nkristam@nvidia.com>
Cc: balbi@kernel.org, gregkh@linuxfoundation.org, jonathanh@nvidia.com, mark.rutland@arm.com, robh+dt@kernel.org, kishon@ti.com, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


--sDKAb4OeUBrWWL6P
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 10, 2020 at 01:41:29PM +0530, Nagarjuna Kristam wrote:
> If usb-role-switch property is present in USB 2 port, register
> usb-role-switch to receive usb role changes.
>=20
> Signed-off-by: Nagarjuna Kristam <nkristam@nvidia.com>
> ---
> V5
>  - No changes
> ---
> V4:
>  - Updated function name in debug messages as suggested by Thierry.
>  - Added owner info to port->dev during USB role switch registration.
> ---
> V3:
>  - Driver aborts if usb-role-switch is not added in dt forotg/peripheral
>    roles.
>  - Added role name strings instead of enum values in debug prints.
>  - Updated arguments and variable allignments as per Thierry inputs.
> ---
> V2:
>  - Removed dev_set_drvdata for port->dev.
>  - Added of_platform_depopulate during error handling and driver removal.
> ---
>  drivers/phy/tegra/Kconfig |  1 +
>  drivers/phy/tegra/xusb.c  | 67 +++++++++++++++++++++++++++++++++++++++++=
++++++
>  drivers/phy/tegra/xusb.h  |  3 +++
>  3 files changed, 71 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--sDKAb4OeUBrWWL6P
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5KUTcACgkQ3SOs138+
s6F3aA//VUmI29LB+vP9qNxFW3wdDt2nGlLmhkG5hic35GoOPaB0U+uYacvlSRUk
h5/OJsTN0BG9wW9jvQwQjXm4DvI0AZDYwYFTkcRuu7aPX4dEsTOtQKgnlMCQBa/E
NpZdFP3SRUzkKVzoUyZNE609qHKW0NnLQDSrdNny3JFZt30ECaBdcV3zd8pwi2M7
jB91dl/qly/FvCO23RDN2ngpj81bsvdNx4kMr89cvmFdLruikjtiF6Bts3FGcBh2
hy0CBDTHXEwE9npbodqLkZjlFGowuhNfIYZBTWDfS6BIEByGAw53neXzWcOzH3eh
qMeOswVpT+IadnejojaEDuUA4VwewPRbMqtJeGiBW0FOHzCYorix9N+wSS07fcOu
9l622lI1Hbq+IstTjQkpUi9/GlwPzhdg3R1pJBW8vA4CGLIOw4bxBlTwrWXN6zFR
WPI8W5iVHecVO+Y4xChoM9LviqdLa0qnOa1eNy/NkEjw0dtZnMtJQcHLyAiRkpS/
cDPW5cAMZXrxS+sJ4/8E/6wNUjbNRxewbltwPFZHorfRd+0YBTzYfMTidXb2Nxb6
Jf1YIaklsGKR6hbxht9g+QGj4t7V8poKdkbyePuOqZ5C42det4eMRgt6sfp4PABx
RmEmYGOyswayZqYYGxHJp/BZFWfp9S+j0tS34N3GptE0Ik4QNS0=
=Abay
-----END PGP SIGNATURE-----

--sDKAb4OeUBrWWL6P--
