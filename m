From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 05/15] PCI: dwc: Add ext config space capability
 search API
Date: Thu, 6 Jun 2019 17:32:16 +0200
Message-ID: <20190606153216.GA3338@ulmo>
References: <20190526043751.12729-1-vidyas@nvidia.com>
 <20190526043751.12729-6-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OgqxwSJOaUobr8KG"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190526043751.12729-6-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--OgqxwSJOaUobr8KG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2019 at 10:07:41AM +0530, Vidya Sagar wrote:
> Add extended configuration space capability search API using struct dw_pc=
ie *
> pointer
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> Acked-by: Gustavo Pimentel <gustavo.pimentel@synopsys.com>
> ---
> Changes since [v7]:
> * Changed data types of return and arguments to be inline with data being=
 returned
>   and passed.
>=20
> Changes since [v6]:
> * None
>=20
> Changes since [v5]:
> * None
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * None
>=20
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  drivers/pci/controller/dwc/pcie-designware.c | 41 ++++++++++++++++++++
>  drivers/pci/controller/dwc/pcie-designware.h |  1 +
>  2 files changed, 42 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--OgqxwSJOaUobr8KG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz5MfsACgkQ3SOs138+
s6GApw//TPvpvgBzP5P9ZA+voryvcGrZFDGOvZN3Ue1+gcsGJLKWkkyfdki8Xn4K
pkOboAWOYl3FVFstorO6OlL+sToBPM7KSW3d1y8Xf4lCJG6pl6Wguq01rQiL+lgC
SiHzhKaumTJ6cIiZICbExS0cnWwgNvglaMRV1enwe3SfAdqpiSBJYsJy/OFgUHMX
e8P0PX0CY6pK+lGGi610SRhzorXOne+ukTGgm+qrAU/9XsJWkF9uwyaJF7BprSfq
fjPGMQlZ+ezB9sZn+RAJT8qZpNsovOTLDWV6P4b+bR6hBbHNM3uOFlnpOUsKfiLL
YJIBU00ZlbIIOMMCK/78Xg2i9GsndiLKmAF8XYeNcGKfHOyivoABLViL4eL98yZl
VMEUTSMw97RhAoZ9DgD5M5ESFEAbD0qvy5GoGW7OcJ3JyvJam6hr2nFDIqyAuq5G
W5w/opznB6oYuiyvTWbH2BYTKdpZv1IMZTLRsq1o8yQHCRt/L7GemvXGWm+7UhNJ
hPIFoLR7bvYE/wHvnplHw72iXh55j3/Ku2oBCgs9Ikx8Q64XWDSJQBwqNXwT5pW4
2qcCVbs9kcdOmuhadUJNE+Aeyz32+7GC9JS5PIrtgvCrS9GlYWg6pjGDqMy4lzJ0
fVfLAxMTiKwPO9jr2SOY8TIfObb7fXzKGB31sBPvCV2tRUpK0OE=
=DlKq
-----END PGP SIGNATURE-----

--OgqxwSJOaUobr8KG--
