From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V5 04/16] PCI: dwc: Perform dbi regs write lock towards
 the end
Date: Fri, 3 May 2019 13:13:03 +0200
Message-ID: <20190503111303.GD32400@ulmo>
References: <20190424052004.6270-1-vidyas@nvidia.com>
 <20190424052004.6270-5-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="xB0nW4MQa6jZONgY"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190424052004.6270-5-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--xB0nW4MQa6jZONgY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 24, 2019 at 10:49:52AM +0530, Vidya Sagar wrote:
> Remove multiple write enable and disable sequences of dbi registers as
> Tegra194 implements writes to BAR-0 register (offset: 0x10) controlled by
> DBI write-lock enable bit thereby not allowing any further writes to BAR-0
> register in config space to take place. Hence disabling write permission
> only towards the end.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
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
> * None
>=20
>  drivers/pci/controller/dwc/pcie-designware-host.c | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/drivers/pci/controller/dwc/pcie-designware-host.c b/drivers/=
pci/controller/dwc/pcie-designware-host.c
> index 36fd3f5b48f6..e5e3571dd2fe 100644
> --- a/drivers/pci/controller/dwc/pcie-designware-host.c
> +++ b/drivers/pci/controller/dwc/pcie-designware-host.c
> @@ -654,7 +654,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
>  	val &=3D 0xffff00ff;
>  	val |=3D 0x00000100;
>  	dw_pcie_writel_dbi(pci, PCI_INTERRUPT_LINE, val);
> -	dw_pcie_dbi_ro_wr_dis(pci);
> =20
>  	/* Setup bus numbers */
>  	val =3D dw_pcie_readl_dbi(pci, PCI_PRIMARY_BUS);
> @@ -686,8 +685,6 @@ void dw_pcie_setup_rc(struct pcie_port *pp)
> =20
>  	dw_pcie_wr_own_conf(pp, PCI_BASE_ADDRESS_0, 4, 0);
> =20
> -	/* Enable write permission for the DBI read-only register */
> -	dw_pcie_dbi_ro_wr_en(pci);
>  	/* Program correct class for RC */
>  	dw_pcie_wr_own_conf(pp, PCI_CLASS_DEVICE, 2, PCI_CLASS_BRIDGE_PCI);
>  	/* Better disable write permission right after the update */

Perhaps make this explicit by moving the write enable call to the
beginning of the function and the write disable call to the end?

Currently it's pretty difficult to see where it's being disabled. Also,
that would make it more resilient against instantiations that require a
different register to be programmed with writes enabled.

Thierry

--xB0nW4MQa6jZONgY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlzMIj8ACgkQ3SOs138+
s6FFuRAAmiTyrtz2NxKwCwdtyyP/+itBnYe7MfDjSdUTPlZtSa1dFyCI+XHymBsB
X2sVKTo2/OgUkGwsMWvLqW/Na5Z5XHetXaP0+5zJqswFAfAS5JKZtwnU/7th3H9e
dlScRp776ngjkaAeAc8E1v36v7fYgfSn0fZu9Sk/i7pm/UZ0TkkSYSLaro44tQlW
+UzxntgV0w94wbfmQb6LzJbf2No1isVa9hz+NGEJGur0vPLso12PPe6kvtyO3eH4
hQTHqbQChqUAk0ic/s+SRsdiYNOGceoteCy2ysAf5vzvSqZULEFfVODLVo9xrAhe
DburhK/NF+w1wcTmTgOzJRTmtTlhiYYrMBlvipP2lYC8Ksyedo+Ku8FMbrfvOpRE
XU6NUL4VPAvl8ZKPOVc4Y6+rOB4VYjlYkgnpTEuJaSpplqaZ2GwD1fA1JjBX4J2o
jvQTocuTrx+N5J1OL43pBT9KnxGZa5UCvxrha1DD9C0KStb4z6qCKPQhWEnnAbXE
YfmoSwhHMu5zHCQmp7W/qm+wWwFnWbxw7s0CfGyoeGwz/oFNTFMCwA++tZp51B06
HOP1iEE/Z4jzxOQYiArz/bRUxQ1Nm7lrlalcoGwCgLhhD9Exp5to9JZkMKIwGllD
jOp84vWCp+stTczX8lt5NPbmChSpMWarJQn+c+c/tjhfq5Aa0To=
=EmOl
-----END PGP SIGNATURE-----

--xB0nW4MQa6jZONgY--
