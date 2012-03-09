From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 10/11] ARM: tegra: pcie: Add MSI support
Date: Fri, 9 Mar 2012 07:50:04 +0100
Message-ID: <20120309065004.GD25208@avionic-0098.mockup.avionic-design.de>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-11-git-send-email-thierry.reding@avionic-design.de>
 <4F59213F.6070107@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0210151985186363509=="
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <4F59213F.6070107-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--===============0210151985186363509==
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="tEFtbjk+mNEviIIX"
Content-Disposition: inline


--tEFtbjk+mNEviIIX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 03/08/2012 07:51 AM, Thierry Reding wrote:
> > This commit adds support for message signaled interrupts to the Tegra
> > PCIe controller.
> >=20
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> > This code is taken from the NVIDIA Vibrante kernel and therefore has no
> > appropriate Signed-off-by from the original author. Maybe someone at
> > NVIDIA can find out who wrote this code and maybe provide a proper
> > Signed-off-by that I can add?
>=20
> I think if you look in:
> git://nv-tegra.nvidia.com/linux-2.6.git android-tegra-2.6.36
>=20
> the following commits are what you're after:
>=20
> de7fd8768b32da66eaf4eaf58473c65f7a76808d
> arm: tegra: pcie: enabling MSI support for pcie
>=20
> ac1f8310811c64a084511d2afc27f66334b31a81
> ARM: tegra: pcie: fix return value from MSI irq routine
>=20
> Although the patch below only partially resembles those patches, I guess
> because you've rewritten the code a lot to conform to the current kernel
> APIs, clean stuff up, etc. Perhaps just saying "based on code by Krishna
> Kishore <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>" is enough...

Yes, it is indeed a major rewrite because the original code had some
peculiarities and FIXME that I thought wouldn't make it through the review
anyway so I fixed them up.

I'll add some comment about the original authorship. There is no official
Signed-off-by in the original commit. Do I still need one or is it enough to
mention the original authors in the commit message and add keep my own
Signed-off-by?

Thierry

>=20
> > diff --git a/arch/arm/mach-tegra/pcie.c b/arch/arm/mach-tegra/pcie.c
>=20
> > +static int tegra_pcie_enable_msi(struct platform_device *pdev)
> > +{
> > +	struct tegra_pcie_info *pcie =3D platform_get_drvdata(pdev);
> > +	volatile void *pages;
> > +	unsigned long base;
> > +	unsigned int msi;
> > +	int msi_base;
> > +	int err;
> > +	u32 reg;
> > +
> > +	mutex_init(&pcie->msi_lock);
> > +
> > +	msi_base =3D irq_alloc_descs(-1, 0, INT_PCI_MSI_NR, 0);
> > +	if (msi_base < 0) {
> > +		dev_err(&pdev->dev, "failed to allocate IRQs\n");
> > +		return msi_base;
> > +	}
> > +
> > +	pcie->msi_domain =3D irq_domain_add_legacy(pcie->dev->of_node,
> > +						 INT_PCI_MSI_NR, msi_base,
> > +						 0, &irq_domain_simple_ops,
> > +						 NULL);
> > +	if (!pcie->msi_domain) {
> > +		dev_err(&pdev->dev, "failed to create IRQ domain\n");
>=20
> Free the IRQ descriptors in the error paths?

Yes, that would make sense.

> > +		return -ENOMEM;
> > +	}
> > +
> > +	pcie->msi_chip.name =3D "PCIe-MSI";
> > +	pcie->msi_chip.irq_enable =3D unmask_msi_irq;
> > +	pcie->msi_chip.irq_disable =3D mask_msi_irq;
> > +	pcie->msi_chip.irq_mask =3D mask_msi_irq;
> > +	pcie->msi_chip.irq_unmask =3D unmask_msi_irq;
> > +
> > +	for (msi =3D 0; msi < INT_PCI_MSI_NR; msi++) {
> > +		unsigned int irq =3D irq_find_mapping(pcie->msi_domain, msi);
> > +
> > +		irq_set_chip_data(irq, pcie);
> > +		irq_set_chip_and_handler(irq, &pcie->msi_chip,
> > +					 handle_simple_irq);
> > +		set_irq_flags(irq, IRQF_VALID);
> > +	}
> > +
> > +	err =3D platform_get_irq(pdev, 1);
> > +	if (err < 0) {
> > +		dev_err(&pdev->dev, "failed to get IRQ: %d\n", err);
>=20
> Same here, and undo setting IRQF_VALID?

Right. I assume it would be best to also free the struct irq_domain and set
the chip data and handler back to NULL? AFAICT there is no canonical way to
teardown an irq_domain.

> > +		return err;
> > +	}
> ...
>=20
> > +static int tegra_pcie_disable_msi(struct platform_device *pdev)
> > +{
> > +	return 0;
> > +}
>=20
> This is empty in both the ifdef(CONFIG_PCI_MSI) case and otherwise. It
> should probably clean everything up here right?

Yes, initially this contained a call to free_irq(), which I removed when I
switched to using a chained handler. I can probably put all of the cleanup
code from your comments above in here and perhaps even call that in the err=
or
paths of tegra_pcie_enable_msi().

Thierry

--tEFtbjk+mNEviIIX
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9ZqBwACgkQZ+BJyKLjJp/ZpwCeNAJ/dD84LzakiCrMID7j8QL8
PBYAmgLAWIaxNcMPXqR7cHGsUoZoC/KX
=Mq/s
-----END PGP SIGNATURE-----

--tEFtbjk+mNEviIIX--

--===============0210151985186363509==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
devicetree-discuss mailing list
devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
https://lists.ozlabs.org/listinfo/devicetree-discuss

--===============0210151985186363509==--
