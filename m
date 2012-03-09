From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 09/11] ARM: tegra: Rewrite PCIe support as a driver
Date: Fri, 9 Mar 2012 07:37:40 +0100
Message-ID: <20120309063739.GC25208@avionic-0098.mockup.avionic-design.de>
References: <1331218291-16119-1-git-send-email-thierry.reding@avionic-design.de>
 <1331218291-16119-10-git-send-email-thierry.reding@avionic-design.de>
 <4F5911E0.6060802@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="uh9ZiVrAOUUm9fzH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F5911E0.6060802-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--uh9ZiVrAOUUm9fzH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 03/08/2012 07:51 AM, Thierry Reding wrote:
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
>=20
> Patch description?

I actually sat in front of the editor for a couple of minutes and I just
couldn't think of anything. I'll try harder for the next version.

> > diff --git a/arch/arm/mach-tegra/board-harmony-pcie.c b/arch/arm/mach-t=
egra/board-harmony-pcie.c
> ...
> > -static int __init harmony_pcie_init(void)
> > +static int tegra_pcie_init(struct platform_device *pdev)
>=20
> That name should probably still be called harmony_something() since it's
> still board-specific.

Okay, I'll rename it to harmony_pcie_init().

> I wonder how having a per-board callback will integrate with device
> tree. I guess I'll find out when I review patch 11:-)
>=20
> > diff --git a/arch/arm/mach-tegra/board-trimslice.c b/arch/arm/mach-tegr=
a/board-trimslice.c
>=20
> > +static int __init trimslice_pci_init(void)
> >  {
> >  	if (!machine_is_trimslice())
> >  		return 0;
>=20
> You can remove that test now.

Okay.

> > diff --git a/arch/arm/mach-tegra/board.h b/arch/arm/mach-tegra/board.h
>=20
> > +#define TEGRA_PCIE_MAX_PORTS 2
> > +
> > +struct tegra_pcie_pdata {
> > +	int (*init)(struct platform_device *pdev);
> > +	int (*exit)(struct platform_device *pdev);
> > +	bool enable_ports[TEGRA_PCIE_MAX_PORTS];
> > +};
>=20
> That's a somewhat odd place to put the header; a dedicated
> mach-tegra/include/mach/tegra_pcie_pdata.h or
> include/linux/platform_data/tegra_pcie.h might make more sense.

mach-tegra/include/mach/pcie.h perhaps? That would be less redundant.

Thierry

--uh9ZiVrAOUUm9fzH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iEYEARECAAYFAk9ZpTMACgkQZ+BJyKLjJp/pSwCfdVVc3xBYZSgaFzcanO8KldvB
K1oAoI0BXl/hmtAwRf8YgxPKSxKK+Gf9
=F9LR
-----END PGP SIGNATURE-----

--uh9ZiVrAOUUm9fzH--
