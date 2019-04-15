From: Thierry Reding <thierry.reding@gmail.com>
Subject: Re: [PATCH V2 14/16] phy: tegra: Add PCIe PIPE2UPHY support
Date: Mon, 15 Apr 2019 17:33:19 +0200
Message-ID: <20190415153319.GK29254@ulmo>
References: <1554407683-31580-1-git-send-email-vidyas@nvidia.com>
 <1554407683-31580-15-git-send-email-vidyas@nvidia.com>
 <20190415153148.GJ29254@ulmo>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="NrP+m7YXMSGlHqXH"
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <20190415153148.GJ29254@ulmo>
Sender: linux-kernel-owner@vger.kernel.org
To: Vidya Sagar <vidyas@nvidia.com>
Cc: bhelgaas@google.com, robh+dt@kernel.org, mark.rutland@arm.com, jonathanh@nvidia.com, kishon@ti.com, catalin.marinas@arm.com, will.deacon@arm.com, lorenzo.pieralisi@arm.com, jingoohan1@gmail.com, gustavo.pimentel@synopsys.com, mperttunen@nvidia.com, linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kthota@nvidia.com, mmaddireddy@nvidia.com, sagar.tv@gmail.com
List-Id: linux-tegra@vger.kernel.org


--NrP+m7YXMSGlHqXH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 15, 2019 at 05:31:48PM +0200, Thierry Reding wrote:
> On Fri, Apr 05, 2019 at 01:24:41AM +0530, Vidya Sagar wrote:
[...]
> > diff --git a/drivers/phy/tegra/pcie-p2u-tegra194.c b/drivers/phy/tegra/=
pcie-p2u-tegra194.c
> > new file mode 100644
> > index 000000000000..d4df8bfa9979
> > --- /dev/null
> > +++ b/drivers/phy/tegra/pcie-p2u-tegra194.c
[...]
> > +MODULE_AUTHOR("Vidya Sagar <vidyas@nvidia.com>");
> > +MODULE_DESCRIPTION("NVIDIA Tegra PIPE_To_UPHY phy driver");
>=20
> The driver description is somewhat odd here. Perhaps something like:
>=20
> 	"NVIDIA Tegra PIPE to UPHY PHY driver"
>=20
> ?

Or perhaps just

	"NVIDIA Tegra PIPE2UPHY PHY driver"

which is what you already use in the commit subject.

Thierry

--NrP+m7YXMSGlHqXH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAly0pD8ACgkQ3SOs138+
s6GGORAAo698Yjy8BynRD0sRJ0x8Z7blftz6y1Ui3Ho3DyCHkFW8XsKWWLluQehE
b4AiRWWB/skZ2JyYmPcQzZz45GlrSoBe042LQKy6GWkJo+k9nnQxrpQhzflWY8uk
NJlWSvUbhtgVEhRNKeHqeOQRuupssqMRdUr5Nplzn2I+oe1U0w6o28IW4TzbEe0e
kWbPPMZmDArmo5evjNZF2lnqIaXq2YLcOJLBJZ8GAzS3Utve6eXBpSITn2hqJfTC
MjEBZoHpR6cjFdOBtNW9wvnMSSgoR8TYCy8qhMolKyE7D1K3/m/8Y71KBNOpjtxC
O/iSl4JLVRtsQ5RwibiNAarNrblbX8XMseMb8SnYWeCe8YkXYWjURXSXetwCOph1
uNRYVHvU9k2ko6/3k79YjP9tRo6glwIN/psCM7mAdNpUPEqxlxpkseKB9qZQdNui
PXvp9I+GL6Tjl8hybQxZXamhaCsE73mgXsjmpbnp/27icvzfkrPrW/Ui85aWcesC
zUidFhIURvPy2drp9A33TAeRoTwrRVBIICepCAVOC2ptbXSfdcpfoB3mdQxYNVSR
u4lW/Dab/cuQhrJSRB4bvCKmaHDvkeIfr+smOeY+OFI+0x1vQZI3KxxCQsEPH7VL
hOob4+jJuyEmCYQQNaKHNCM2KMiPXWLYw4wKa3Eb/Kezkx1ewSE=
=TygX
-----END PGP SIGNATURE-----

--NrP+m7YXMSGlHqXH--
