From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V7 04/15] PCI: dwc: Move config space capability search
 API
Date: Tue, 21 May 2019 12:29:59 +0200
Message-ID: <20190521102959.GD29166@ulmo>
References: <20190517123846.3708-1-vidyas@nvidia.com>
 <20190517123846.3708-5-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5p8PegU4iirBW1oA"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190517123846.3708-5-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--5p8PegU4iirBW1oA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 17, 2019 at 06:08:35PM +0530, Vidya Sagar wrote:
> Move PCIe config space capability search API to common DesignWare file
> as this can be used by both host and ep mode codes.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Changes since [v6]:
> * Exported dw_pcie_find_capability() API
>=20
> Changes since [v5]:
> * None
>=20
> Changes since [v4]:
> * Removed redundant APIs in pcie-designware-ep.c file after moving them
>   to pcie-designware.c file based on Bjorn's comments.
>=20
> Changes since [v3]:
> * Rebased to linux-next top of the tree
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * Removed dw_pcie_find_next_ext_capability() API from here and made a
>   separate patch for that
>=20
>  .../pci/controller/dwc/pcie-designware-ep.c   | 37 +----------------
>  drivers/pci/controller/dwc/pcie-designware.c  | 40 +++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h  |  2 +
>  3 files changed, 44 insertions(+), 35 deletions(-)

Reviewed-by: Thierry Reding <treding@nvidia.com>

--5p8PegU4iirBW1oA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzj0ycACgkQ3SOs138+
s6Et4BAAkzOyahrHoqB04OU7kbCFa+2VAYqoXjgDQvu1RjouQbsh+UdAzNrLWTeX
ChYzsu6i3jeymB0oD/WAOCtHx9SbLP/4YEwlBQ5Y9U5SoHy16bSiC1fJ2+IrTKoj
2G50K3ILtwZHuDFBL9D/NRtwdrGxu4txjtB6ch6sJDKRvr8UbtXvLO1Rija3oaut
31nP2HoCqZ8ZW+Ku7D15BPxdcLYidJJqWELWw251PitQkixGV2JEjv/MYoKBMIhD
jCIo+b5o1yS36PUf5I0Piuz4vbDmiJOUjKsjMbkKniN+l9bBtNwPepBdSxxYl+CN
QbYbDw1mPUBLP/mlhEsMgBGDUp+auR+vMrCsXaK+BQIoLHQeslhKpWwIsGOBZDka
5iNo8zxXK2FC8yHNjgz7sIWI9dfA4dX+8YJEnEVRjuhcQG+aE5B5NXDrqtTMYN1Z
Hoe+q16UNDLmsq2siAD6r7ENyzUVzaCdjg/q/P8v3H7PZWFgPO49v+xZdDq37cqi
j/Z5/gTH0v07hu5dtXQLfQ5+8KszcexKRfkGlYCBYG8BFVTdMmF3sR7XIY4tE2lt
muOCI7ajeYAq/bDP9vibl1O7o7Myry716uTwfGGAB8w9/g+Fm7BKpa+Wj9MuZWtW
CYi8auqMTnAh11SDNQeakXNHranXpLvBhMKpfIBfNYaUDFbjdd8=
=LWc3
-----END PGP SIGNATURE-----

--5p8PegU4iirBW1oA--
