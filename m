From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH v2 06/10] ARM: tegra: pcie: Add MSI support
Date: Tue, 12 Jun 2012 07:41:31 +0200
Message-ID: <20120612054131.GA4040@avionic-0098.adnet.avionic-design.de>
References: <1339427118-32263-1-git-send-email-thierry.reding@avionic-design.de>
 <1339427118-32263-7-git-send-email-thierry.reding@avionic-design.de>
 <4FD660F9.7030807@wwwdotorg.org>
 <20120612050713.GB3669@avionic-0098.mockup.avionic-design.de>
 <4FD6D4C6.2080201@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7JfCtLOvnd9MIVvH"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FD6D4C6.2080201-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jesse Barnes <jbarnes-Y1mF5jBUw70BENJcbMCuUQ@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org


--7JfCtLOvnd9MIVvH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

* Stephen Warren wrote:
> On 06/11/2012 11:07 PM, Thierry Reding wrote:
> > * Stephen Warren wrote:
> >> On 06/11/2012 09:05 AM, Thierry Reding wrote:
> >>> This commit adds support for message signaled interrupts to the
> >>> Tegra PCIe controller. Based on code by Krishna Kishore
> >>> <kthota-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>.
> ...
> >> Why allocate pcie->msi separately; why not include the fields
> >> directly into struct tegra_pcie_info *pcie?
> ...
> > Second, and more importantly, this will keep the size of struct=20
> > tegra_pcie_info smaller if PCI_MSI is not selected because there is
> > just one unused pointer instead of five unused fields.
>=20
> Well, you can always ifdef out the structure fields too, right?

Not if you use the IS_ENABLED() macro. It's supposed to increase compile
coverage for a trade-off in memory usage because like in this case some
fields may be unused.

I find this very convenient because it prevents situations where build
errors don't show up until somebody uses the code in an unusual
configuration. For developers this makes it really easy because they don't
have to test every possible permutation of configuration options.

Thierry

--7JfCtLOvnd9MIVvH
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iEYEARECAAYFAk/W1osACgkQZ+BJyKLjJp+fMQCeKraIbJ59jPXjIRfBrQRzJUaH
EDwAn1b4QFBcDFBZQNTaDokBi6/S2N+L
=ohNf
-----END PGP SIGNATURE-----

--7JfCtLOvnd9MIVvH--
