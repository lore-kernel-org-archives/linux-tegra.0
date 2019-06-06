From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V8 14/15] PCI: tegra: Add Tegra194 PCIe support
Date: Thu, 6 Jun 2019 17:36:55 +0200
Message-ID: <20190606153655.GC3338@ulmo>
References: <20190526043751.12729-1-vidyas@nvidia.com>
 <20190526043751.12729-15-vidyas@nvidia.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="bAmEntskrkuBymla"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190526043751.12729-15-vidyas@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: lorenzo.pieralisi@arm.com, bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--bAmEntskrkuBymla
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 26, 2019 at 10:07:50AM +0530, Vidya Sagar wrote:
> Add support for Synopsys DesignWare core IP based PCIe host controller
> present in Tegra194 SoC.
>=20
> Signed-off-by: Vidya Sagar <vidyas@nvidia.com>
> ---
> Changes since [v7]:
> * Addressed review comments from Thierry
>=20
> Changes since [v6]:
> * Removed code around "nvidia,disable-aspm-states" DT property
> * Refactored code to remove code duplication
>=20
> Changes since [v5]:
> * Addressed review comments from Thierry
>=20
> Changes since [v4]:
> * None
>=20
> Changes since [v3]:
> * None
>=20
> Changes since [v2]:
> * Changed 'nvidia,init-speed' to 'nvidia,init-link-speed'
> * Changed 'nvidia,pex-wake' to 'nvidia,wake-gpios'
> * Removed .runtime_suspend() & .runtime_resume() implementations
>=20
> Changes since [v1]:
> * Made CONFIG_PCIE_TEGRA194 as 'm' by default from its previous 'y' state
> * Modified code as per changes made to DT documentation
> * Refactored code to address Bjorn & Thierry's review comments
> * Added goto to avoid recursion in tegra_pcie_dw_host_init() API
> * Merged .scan_bus() of dw_pcie_host_ops implementation to tegra_pcie_dw_=
host_init() API
>=20
>  drivers/pci/controller/dwc/Kconfig         |   10 +
>  drivers/pci/controller/dwc/Makefile        |    1 +
>  drivers/pci/controller/dwc/pcie-tegra194.c | 1621 ++++++++++++++++++++
>  3 files changed, 1632 insertions(+)
>  create mode 100644 drivers/pci/controller/dwc/pcie-tegra194.c

Acked-by: Thierry Reding <treding@nvidia.com>

--bAmEntskrkuBymla
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAlz5MxcACgkQ3SOs138+
s6G/ZhAAjpmV/vx2RYEnxlLLhgYrDv+eJ4c99U63vbP5N/OjnWh9s51GJWF26MbS
y2mW0FgYxsUXm+M3WFBBs7l38iCwYp8bTAahH7i3kEyw+Eb0nv/UMq0DF2t6ESOR
zxA76mLckgzZ0rn7wXGqYVLPU7M0eTw1SGJhz5YTPmR3ghTfE837R1vkfXKV3bYo
zr8V8p6ZsZ5AgaYg781zLnxIhc84iuXMGSpt0n4Bw9T0IX9TBoZvnOKa9kPujQdk
R53voGhAVATSx/c/MuA6TLc3SdKedKdaP8V2POGWZbffTbYT74wa7TxC+p5SlYQu
KcmedzYUsiqAqjG/uIiIG2X2zOqGBgp4Z1zmizaEC6mzaJWEPfZBWz2MXZqNPhq8
l4P2JgOfB8TwF7Qtw18IaIYa26L1Uaxt/604YnSpJJeQxHpXJVgHQ4K+cgENneLI
EWc4RYCr5O0M4q6P6IIyZypKXBtzMd4eCVM0pDlPz6HRInNGNzgFa6DPENWMExc1
V15xEZXmXGwhVwhuqoMmXN7Rd0p+5wSWQFWxKETXf1NETlN5L89s3hoEZ+O9eDBU
tHb1eaY9+wuq56jwySzGst3np9/8VGx+p9u5xE0coTDHSlQbb7XpSe8cfhDSXp0n
3k5kNWWMNn6SGUe3H8P7mquhingQDwZ30PCGTCpfvwnxM7q9o68=
=8lND
-----END PGP SIGNATURE-----

--bAmEntskrkuBymla--
