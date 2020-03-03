From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V4 2/5] dt-bindings: PCI: tegra: Add DT support for PCIe
 EP nodes in Tegra194
Date: Tue, 3 Mar 2020 14:39:27 +0100
Message-ID: <20200303133927.GB2854899@ulmo>
References: <20200303105418.2840-1-vidyas@nvidia.com>
 <20200303105418.2840-3-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="s2ZSL+KKDSLx8OML"
Return-path: <linux-pci-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20200303105418.2840-3-vidyas@nvidia.com>
Sender: linux-pci-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, jonathanh@nvidia.com, andrew.murray@arm.com, kishon@ti.com, gustavo.pimentel@synopsys.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--s2ZSL+KKDSLx8OML
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 03, 2020 at 04:24:15PM +0530, Vidya Sagar wrote:
> Add support for PCIe controllers that can operate in endpoint mode
> in Tegra194.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> ---
> V4:
> * None
>=20
> V3:
> * Added Reviewed-by: Rob Herring <robh@kernel.org>
>=20
> V2:
> * Addressed Thierry's review comments
> * Merged EP specific information from tegra194-pcie-ep.txt to tegra194-pc=
ie.txt itself
> * Started using the standard 'reset-gpios' for PERST GPIO
> * Added 'nvidia,refclk-select-gpios' to enable REFCLK signals
>=20
>  .../bindings/pci/nvidia,tegra194-pcie.txt     | 125 ++++++++++++++----
>  1 file changed, 99 insertions(+), 26 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--s2ZSL+KKDSLx8OML
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl5eXg8ACgkQ3SOs138+
s6EM9A/8DAyhoERGWyWFLzxgSdVvezOO0qahisCaxcwAdXVDTshl55YSf2n8j1fq
s03XQ1gqN27mUy1TrBNjlhQt3ghcCr+s3KJZuRjgrlxq8wgUFdBdkGtHoc42sUm5
I4NYbmWEiDaiYeUSPbw1O8mgl4kzFixGoBACEvWV1C/CI7DHUJFZ+c8YWaEvwARu
pOjH1IjmBbXPzrF9474jMIYzdNA38Vq2AmhPKqWEflNspTAPg9Tag33N8AUoBGSg
x5H/tWnggOIO9uzgyffIW1jbjy+6NiibjtmC1lAaFo/UNb41bwZgRd5wSvcg78ku
VRMtb4Vet7czoXs2u6EMXgfIX3+30Oad8l9BVz0kYmLlIN0fRrqxQYAv1NNCAAd0
ETqPNWgH1UQsMCl8kNOoESwKNwe+GYzcYDjEawYscvz2qvDuHDrgMvgC9CcI09sM
Uqak29cyLLhBxJ/7Tu0sOe458kybGMoDbvIM1VMC+kQEfowo76GqHeURlHJ2Uq9m
DKO0HlgV0lavxI4byOQcZ+lNF7u/CSKXbBjbZ7/WKAqTtLpehfcV1XAhXVdR93Tf
pKx7GXBF+UOJhF++E4ykFn116wbcYjtTf6lGnEhGnOIKz7CpxB4OmAxk/P0EQWDH
/VTNpkD/7dz77uH+ZFPxD447zAyK20qoeeRtgBSQwC1rgL2k+yY=
=A2Ef
-----END PGP SIGNATURE-----

--s2ZSL+KKDSLx8OML--
