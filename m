From: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] PCI: tegra: Print -EPROBE_DEFER error message at debug
 level
Date: Mon, 23 Mar 2020 14:34:56 +0100
Message-ID: <20200323133456.GG3883508@ulmo>
References: <20200319131230.3216305-1-thierry.reding@gmail.com>
 <20200319180529.GB7433@e121166-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="VACxsDaSTfeluoxK"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20200319180529.GB7433-LhTu/34fCX3ZROr8t4l/smS4ubULX0JqMm0uRHvK7Nw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>
Cc: Andrew Murray <amurray-tUaQ5FxYRYX4aQPF92CzsNBc4/FLrbF6@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Vidya Sagar <vidyas-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--VACxsDaSTfeluoxK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 19, 2020 at 06:05:30PM +0000, Lorenzo Pieralisi wrote:
> On Thu, Mar 19, 2020 at 02:12:30PM +0100, Thierry Reding wrote:
> > From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >=20
> > Probe deferral is an expected error condition that will usually be
> > recovered from. Print such error messages at debug level to make them
> > available for diagnostic purposes when building with debugging enabled
> > and hide them otherwise to not spam the kernel log with them.
> >=20
> > Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> >  drivers/pci/controller/dwc/pcie-tegra194.c | 42 ++++++++++++++++++----
> >  1 file changed, 35 insertions(+), 7 deletions(-)
>=20
> Hi Thierry,
>=20
> what tree/branch is it based on ? I assume it may depend on some
> patches queued in one of my branches so please let me know and
> I will apply accordingly.

Hi Lorenzo,

This should apply on top of commit 5b645b7fade9 ("PCI: tegra: Add
support for PCIe endpoint mode in Tegra194") which is currently in
linux-next.

Looking at your "pci" tree, that commit seems to be in a branch
called pci/endpoint, though the equivalent commit there has a slightly
different SHA:

    f4746b0ccef9 ("PCI: tegra: Add support for PCIe endpoint mode in Tegra1=
94")

git range-diff shows that the only difference is that in the patch in
linux-next there are a couple of additional exported symbols that are
not in your pci/endpoint branch. That shouldn't be relevant, though,
since this patch touches another area of the code, so applying this to
your pci/endpoint branch should work.

Thierry

> > diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/c=
ontroller/dwc/pcie-tegra194.c
> > index 97d3f3db1020..e4870fa6ce9c 100644
> > --- a/drivers/pci/controller/dwc/pcie-tegra194.c
> > +++ b/drivers/pci/controller/dwc/pcie-tegra194.c
> > @@ -1159,17 +1159,31 @@ static int tegra_pcie_dw_parse_dt(struct tegra_=
pcie_dw *pcie)
> >  	/* Endpoint mode specific DT entries */
> >  	pcie->pex_rst_gpiod =3D devm_gpiod_get(pcie->dev, "reset", GPIOD_IN);
> >  	if (IS_ERR(pcie->pex_rst_gpiod)) {
> > -		dev_err(pcie->dev, "Failed to get PERST GPIO: %ld\n",
> > -			PTR_ERR(pcie->pex_rst_gpiod));
> > -		return PTR_ERR(pcie->pex_rst_gpiod);
> > +		int err =3D PTR_ERR(pcie->pex_rst_gpiod);
> > +		const char *level =3D KERN_ERR;
> > +
> > +		if (err =3D=3D -EPROBE_DEFER)
> > +			level =3D KERN_DEBUG;
> > +
> > +		dev_printk(level, pcie->dev,
> > +			   dev_fmt("Failed to get PERST GPIO: %d\n"),
> > +			   err);
> > +		return err;
> >  	}
> > =20
> >  	pcie->pex_refclk_sel_gpiod =3D devm_gpiod_get(pcie->dev,
> >  						    "nvidia,refclk-select",
> >  						    GPIOD_OUT_HIGH);
> >  	if (IS_ERR(pcie->pex_refclk_sel_gpiod)) {
> > -		dev_info(pcie->dev, "Failed to get REFCLK select GPIOs: %ld\n",
> > -			 PTR_ERR(pcie->pex_refclk_sel_gpiod));
> > +		int err =3D PTR_ERR(pcie->pex_refclk_sel_gpiod);
> > +		const char *level =3D KERN_ERR;
> > +
> > +		if (err =3D=3D -EPROBE_DEFER)
> > +			level =3D KERN_DEBUG;
> > +
> > +		dev_printk(level, pcie->dev,
> > +			   dev_fmt("Failed to get REFCLK select GPIOs: %d\n"),
> > +			   err);
> >  		pcie->pex_refclk_sel_gpiod =3D NULL;
> >  	}
> > =20
> > @@ -2058,13 +2072,27 @@ static int tegra_pcie_dw_probe(struct platform_=
device *pdev)
> > =20
> >  	ret =3D tegra_pcie_dw_parse_dt(pcie);
> >  	if (ret < 0) {
> > -		dev_err(dev, "Failed to parse device tree: %d\n", ret);
> > +		const char *level =3D KERN_ERR;
> > +
> > +		if (ret =3D=3D -EPROBE_DEFER)
> > +			level =3D KERN_DEBUG;
> > +
> > +		dev_printk(level, dev,
> > +			   dev_fmt("Failed to parse device tree: %d\n"),
> > +			   ret);
> >  		return ret;
> >  	}
> > =20
> >  	ret =3D tegra_pcie_get_slot_regulators(pcie);
> >  	if (ret < 0) {
> > -		dev_err(dev, "Failed to get slot regulators: %d\n", ret);
> > +		const char *level =3D KERN_ERR;
> > +
> > +		if (ret =3D=3D -EPROBE_DEFER)
> > +			level =3D KERN_DEBUG;
> > +
> > +		dev_printk(level, dev,
> > +			   dev_fmt("Failed to get slot regulators: %d\n"),
> > +			   ret);
> >  		return ret;
> >  	}
> > =20
> > --=20
> > 2.24.1
> >=20

--VACxsDaSTfeluoxK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl54uvwACgkQ3SOs138+
s6FfuBAAlW4UiwzsUPmv3tieVAqkE491ZYfPFMfSyCGf9YiLGnPegKAJE+cCmCqF
uKxCzLE7DfvWMCrelvaGJu4h5nxwg8IpKWNLvTQd23QHrn1iNmBgbEsbkg70IhiA
B+loO7Msrcyx11BUhfPQQq6g1Ggxa3y61WHM81tYkTBdV2eZn3qtaHJer21fRv95
C/v04JJg3MWIy+8mooPIbDC3P3OQLmmmy8CT/TD5q0/bRJ5Nw+SxqV35vZODjB5v
TUTjlywZqeNzjVxwQz1CURU7Fi56G/N/hNry9SeynH0gTkBjxfuBHSUESORabavu
7wwMpnfccpdR6fcUlF3eEg6NVBHmrathxGVRXH1XROjhY9SO4S2WQVR5b47ydCIY
0pRY51UDIHs0necw+8SCPPxBcWlscxRM4BnIltQ5OkBSyngO+c0Bua4QTbp+aB6o
JGYK0lkiJwtzGef+7hdF6dLDUTZ8CUinJNfaexxeshDdS9AQDpmAvNoEBWYeR1l0
NHR5IBa5ucCKT05iA5w1ZecjzdqlD4NfzrFjeu5O7LnjrRBIEogeDAAbaVFPoS6A
N6VKg5+UJ/warGxZ9SOFp/2zz9dVPpzPXsRDzNBlMcXuvujXkfWAIiHFJB5MpGmS
PV/TbqaZAcPdU0N8E4RlwL+EIKOVxARtDGjmsxdv4UMNlA0/AOY=
=ite/
-----END PGP SIGNATURE-----

--VACxsDaSTfeluoxK--
