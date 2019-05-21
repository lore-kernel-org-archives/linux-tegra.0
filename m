From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 10/15] dt-bindings: PHY: P2U: Add Tegra194 P2U block
Date: Tue, 21 May 2019 12:52:22 +0200
Message-ID: <20190521105222.GJ29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-11-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="yhze8HlyfmXt1APY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-11-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--yhze8HlyfmXt1APY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:41PM +0530, Vidya Sagar wrote:
> Add support for Tegra194 P2U (PIPE to UPHY) module block which is a glue
> module instantiated one for each PCIe lane between Synopsys DesignWare co=
re
> based PCIe IP and Universal PHY block.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * Added Sob
> * Changed node name from "p2u@xxxxxxxx" to "phy@xxxxxxxx"
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed node label to reflect new format that includes either 'hsio' or
>   'nvhs' in its name to reflect which UPHY brick they belong to
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  .../bindings/phy/phy-tegra194-p2u.txt         | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/phy-tegra194-p2=
u.txt

Acked-by: Thierry Reding <treding@nvidia.com>

--yhze8HlyfmXt1APY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj2GYACgkQ3SOs138+
s6GkRBAAsTNXxZRflg9TNJMUocJhYJyNf2p2I3MYeL/Es4lheCSur4dpFNxLS4d4
8ovi/gHEn583zazth7fZmKLKRA1uowxBAY3GIeOwHDUjUPUM4EoskrdGiIHqyb1Q
RwheHqBMllkYHAUoqNYKAMqW6HScTa2rp6cRs/MoK2KEGK1lK2gutkLSx81RwVcN
A4hDk+lJBT7cBgAiF+qbl/S/5K6JA/4ZAJWFIj5reM13zItYRg2X8ybijky1enbX
kGhxxq5IphzpFPEOQxEDjKu+0XtnKZkh9Uc9zgWZeniV+GNQWNu/KdznSrh88hgU
qiCF1Oneyu638SdA6sBGLqD4MC/Lkz80oJmtYlCAwdkHuUM4NmpLMn7MbXt1ztdG
v8FvlB9j98nL4fRSB5cUhryuFACwCRmO/oZ873PfHSmcaku6OHjTrYEGqO+wM3UK
ejpHA4w5kWmE9PSNvuBee3InEwvIRiBGCio5es1G0OH1NDUmoxCdv4uif+cHm+DB
sQdkoV/9/XKEk2qU9uYr7gPcO9pm0X/aqa5nRV5Nj8QO9yUMqI8AyWGgqUP922gm
CC7w7PYMch9sjOvNKdZZ5GjdRrUrTh6D7qpr8IfZ3ryxmzBE0o2Kqi1Rx6C5OBOr
5f1joAV9ke0zZ8c0923NrFnKAdo6FeB2epvM1qyTQUBM7V0QyNA=
=n2S2
-----END PGP SIGNATURE-----

--yhze8HlyfmXt1APY--
