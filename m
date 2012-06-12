From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 06/10] ARM: tegra: pcie: Add MSI support
Date: Tue, 12 Jun 2012 08:10:03 +0200
Message-ID: <20120612061003.GC4040@avionic-0098.adnet.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-7-git-send-email-thierry.reding@avionic-design.de>
 <4FD660F9.7030807@wwwdotorg.org>
 <20120612050713.GB3669@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="IpbVkmxF4tDyP/Kb"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20120612050713.GB3669-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--IpbVkmxF4tDyP/Kb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Thierry Reding wrote:
> * Stephen Warren wrote:
> > On 06/11/2012 09:05 AM, Thierry Reding wrote:
[...]
> > > +static int tegra_pcie_disable_msi(struct platform_device *pdev)
> >=20
> > Should this free pcie->msi->pages?
>=20
> Yes it should. I actually mention making that change in the changelog but
> in fact didn't.

This is really moot because the driver cannot be built as a module currently
because arch_setup_msi_irq() and arch_teardown_msi_irq() need to be built-in
so tegra_pcie_disable_msi() will be called only just before the machine is
shut down.

Perhaps this is something that should be addressed? Or is it just not worth
the effort?

Thierry

--IpbVkmxF4tDyP/Kb
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/W3TsACgkQZ+BJyKLjJp9/VgCfZm9qMDCV84zV85C/EAYGH8zu
M7EAnifJC7pp+0zesScrgYsH5wz+aVX9
=8cnZ
-----END PGP SIGNATURE-----

--IpbVkmxF4tDyP/Kb--
