From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V3 1/6] dt-bindings: PCI: tegra: Add sideband pins
 configuration entries
Date: Mon, 2 Sep 2019 13:38:18 +0200
Message-ID: <20190902113818.GD19263@ulmo>
References: <20190828172850.19871-1-vidyas@nvidia.com>
 <20190828172850.19871-2-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="LTeJQqWS0MN7I/qa"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190828172850.19871-2-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, digetx@gmail.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--LTeJQqWS0MN7I/qa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 28, 2019 at 10:58:45PM +0530, Vidya Sagar wrote:
> Add optional bindings "pinctrl-names" and "pinctrl-0" to describe pin
> configuration information of a particular PCIe controller.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> V3:
> * None
>=20
> V2:
> * None
>=20
>  .../devicetree/bindings/pci/nvidia,tegra194-pcie.txt      | 8 ++++++++
>  1 file changed, 8 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--LTeJQqWS0MN7I/qa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl1s/ycACgkQ3SOs138+
s6FLlQ//RFadCCy0+ywuyNwstWFl2JPShvqLv7sExZxKzKf4dNbyo0pVeTDUFWDX
Xs25hc51nQ3J6PSG/U8KFvEhhZjYizZNXlCr0kdFrsaM+NAOejcC2BQ+cArIDb2w
Gq3FBww/kgr1UCbfiDIThGlBgwalXABkZ32vk7pu9TKbDpMZLWyCHPEms6fFwo1g
RhSLQJlMkf7fm4sp1ZFUvzvUjm5lEkqqQreRAfMO7NgVKwziBsrpc2wkNNwHqj9w
XjeQ0hP2pSwKeB6IHGA4JFioQlb1eYhG8dqTAQem7qV0uOV9n2oIE86GgjiBXqea
F3LiggKv47SQFBbyx/0TofZW3UVHWgtPlbZm5dIb/qPreNBX4/CKyAIZhn2Nt073
pj4IZdllTRlPGchj0eW9a6W4PKOz/q/ZksK1kWjbw3yd9oKI7gpePqOoed416ALO
5sVkOi1siz7sIyj/VowG7rRfPC/QqRtoVGVEYHtrdox2cPqjvXb30uCp8hqB9PZ0
gXBVi/b0kWfAzl1S5Bwuh2WcXSkNEaUtSC4mnNLsbgiSA3P4qszsb9g4GZwrVN5T
TlrWTAk7Hsm8AefUMM1SxseUH/VrkHnWDBEuN/K9t620vz8lyWCLcyAj+UdAWzUZ
IXXXM7Jy2zYyR319UK74mkMxGokz1Pue5oJLciykKIyy+g9cDMQ=
=eTUT
-----END PGP SIGNATURE-----

--LTeJQqWS0MN7I/qa--
