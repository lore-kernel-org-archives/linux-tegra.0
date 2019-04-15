From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 07/16] dt-bindings: PCI: designware: Add binding for
 CDM register check
Date: Mon, 15 Apr 2019 16:54:02 +0200
Message-ID: <20190415145402.GF29254@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-8-git-send-email-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wtUqn8XWZYmnPFNh"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1554407683-31580-8-git-send-email-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--wtUqn8XWZYmnPFNh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 05, 2019 at 01:24:34AM +0530, Vidya Sagar wrote:
> Add support to enable CDM (Configuration Dependent Module) registers check
> for any data corruption. CDM registers include standard PCIe configuration
> space registers, Port Logic registers and iATU and DMA registers.
> Refer Section S.4 of Synopsys DesignWare Cores PCI Express Controller Dat=
abook
> Version 4.90a
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v1]:
> * This is a new patch in v2 series
>=20
>  Documentation/devicetree/bindings/pci/designware-pcie.txt | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/pci/designware-pcie.txt b/=
Documentation/devicetree/bindings/pci/designware-pcie.txt
> index c124f9bc11f3..728281b5bcd5 100644
> --- a/Documentation/devicetree/bindings/pci/designware-pcie.txt
> +++ b/Documentation/devicetree/bindings/pci/designware-pcie.txt
> @@ -31,6 +31,10 @@ Optional properties:
>  - clock-names: Must include the following entries:
>  	- "pcie"
>  	- "pcie_bus"
> +- cdm-check: This is a boolean property and if present enables automatic
> +   checking of CDM (Configuration Dependent Module) registers for data
> +   corruption. CDM registers include configuration space registers and i=
ATU
> +   (internal Address Translation Unit) registers.

By comparison the commit message also lists "Port Logic" and "DMA"
registers as being part of the CDM registers. Shouldn't they be part of
the bindings document as well?

Perhaps it'd also be a good idea to rename this property to something
more imperative, like "enable-cdm" or similar.

Thierry

>  RC mode:
>  - num-viewport: number of view ports configured in hardware. If a platfo=
rm
>    does not specify it, the driver assumes 2.
> --=20
> 2.7.4
>=20

--wtUqn8XWZYmnPFNh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0mwYACgkQ3SOs138+
s6FesxAApMVDuLHlIjYq7l6bKlBb4fa5bbXMIX7SnRy0GRIp585/YZ9j21gyDQhW
IrO2pEeVogNhiTndF/QjSJ4SA0nkPeirMr2gYXjiFwGWDXx3L2UXHlbULgY0jCQY
3mprsgNzpQvHQsr8nH+uqIOjXxW4xSQaaFZeVYwhK1FOqZY/VwBfBho1tCJynXNL
izZjuM1ijRBFzqcTmzjOTyk6v7wSPXokmQPFwxBe4sk9Q3JJqa8rMFH9tTv7XaVI
t9l2d0lsH6+zJGuolqj0zF42kyoWrdFp/H75pQ6oh5NxbZyarpbJM0labiC8Ja/K
6+AprGEEqtg/Eu6LxeuLHBIaYoEQ7POtYI1oAufrxaQAt2PWsXqHMpKoTvfW24Q8
iW+47ijSI2fJ3rygSW//MOXHR0Z+EjwUi1ZlluiO7tV35YNqUmBKGzNB13hlm6W7
IRt/o9xbYbR4G+MHHBfKNCMbej5bmXFOvu7RxAhRAR2Tx9Hbo1I7guFcIk42Uvc/
loRQHU5Xg3evxfsjj7Tz3ulKom5GQA6lo8gZgX7+60BZQSNnYBSpz1dY3DA/JIf6
Inawqfn8FV9Q+35F2pjaoFKyFtQEDvmrOcbA6PrPafgXnlunGbGK6dEYL6RaLA6C
TXWXOqbgoMuzqQXgObfEyWtEfJH7WkgJNlXK8yCyouItCvBWbco=
=EtML
-----END PGP SIGNATURE-----

--wtUqn8XWZYmnPFNh--
