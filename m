From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 05/10] ARM: tegra: Rewrite PCIe support as a driver
Date: Tue, 12 Jun 2012 06:59:37 +0200
Message-ID: <20120612045937.GA3669@avionic-0098.mockup.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-6-git-send-email-thierry.reding@avionic-design.de>
 <4FD6617C.4090805@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="45Z9DzgjV8m4Oswq"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FD6617C.4090805-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--45Z9DzgjV8m4Oswq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 06/11/2012 09:05 AM, Thierry Reding wrote:
> > This commit adds a platform device driver for the PCIe controller on
> > Tegra SOCs. Current users of the old code (TrimSlice and Harmony) are
> > converted and now initialize and register a corresponding platform
> > device.
>=20
> > -static int tegra_pcie_clocks_get(void)
> > +static int tegra_pcie_clocks_get(struct tegra_pcie_info *pcie)
> >  {
> >  	int err;
> > =20
> > -	tegra_pcie.pex_clk =3D clk_get(NULL, "pex");
> > -	if (IS_ERR(tegra_pcie.pex_clk))
> > -		return PTR_ERR(tegra_pcie.pex_clk);
> > +	pcie->pex_clk =3D clk_get(NULL, "pex");
> > +	if (IS_ERR(pcie->pex_clk))
> > +		return PTR_ERR(pcie->pex_clk);
>=20
> While we're changing this, can we convert this to devm_clk_get(), and ...

Will do.

> > -	tegra_pcie.regs =3D ioremap_nocache(TEGRA_PCIE_BASE, PCIE_IOMAP_SZ);
> > -	if (tegra_pcie.regs =3D=3D NULL) {
> > -		pr_err("PCIE: Failed to map PCI/AFI registers\n");
> > +	regs =3D request_mem_region(regs->start, resource_size(regs), "PCI/AF=
I");
> > +	if (regs =3D=3D NULL) {
> > +		dev_err(&pdev->dev, "failed to request PCI/AFI region: %d\n", err);
> > +		goto err_req_reg;
> > +	}
> > +
> > +	pcie->regs =3D ioremap_nocache(regs->start, resource_size(regs));
> > +	if (pcie->regs =3D=3D NULL) {
> > +		dev_err(&pdev->dev, "failed to map PCI/AFI registers\n");
> >  		err =3D -ENOMEM;
> >  		goto err_map_reg;
> >  	}
>=20
> ... that to devm_request_and_ioremap(). That would allow a bunch of the
> cleanup code to be deleted rather than just modified.

Yes, I'll fix that up as well.

Thierry

--45Z9DzgjV8m4Oswq
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/WzLkACgkQZ+BJyKLjJp9LsgCgkd2RUHoQ3x28GMcYJKhFCGW9
ULQAn119Zd8JXGN/WKk/ayq06qrwl3w3
=IU8W
-----END PGP SIGNATURE-----

--45Z9DzgjV8m4Oswq--
