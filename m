From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Fri, 11 Jan 2013 16:45:16 +0100
Message-ID: <20130111154516.GA25335@avionic-0098.adnet.avionic-design.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <50EF54B6.6010100@wwwdotorg.org>
 <20130111034015.GA28094@avionic-0098.adnet.avionic-design.de>
 <201301111536.14799.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="BOKacYhQ+x31HxR3"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <201301111536.14799.arnd-r2nGTMty4D4@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


--BOKacYhQ+x31HxR3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2013 at 03:36:14PM +0000, Arnd Bergmann wrote:
> On Friday 11 January 2013, Thierry Reding wrote:
> > Right, it'll need #ifdefs around the arch_{setup,teardown}_msi_irq(). Or
> > select PCI_MSI unconditionally. Once this is merged I was going to post
> > a patch that enables PCI_MSI in tegra_defconfig anyway. But it might be
> > better to keep it optional anyway since the remainder of the code copes
> > with it properly.
> >=20
> Actually, we need something better than that. You cannot define
> arch_setup_msi_irq in a tegra specific pci host driver, because that
> will seriously mess up other platforms in multiplatform configurations
> by giving a link error when they also define this function, or with a
> run-time error when they don't support it.
>=20
> I think what we should do here is fix it the right way by adding
> a pci host specific callback rather than an architecture specific
> callback in drivers/pci/msi.c. There is already a default version
> of arch_setup_msi_irqs (with s), and we can probably do the
> same for arch_setup_msi_irq (without s) to fall back to the
> arch version for most architectures.
> Most architectures (at least powerpc, sparc, ia64 and x86) already
> multiplex the msi handlers internally, but ARM does not because
> there is only one implementation (iop33x) at the moment.
>=20
> We can add a generix multiplex and then move architectures over to
> use it.

I already hinted at that in one of the other subthreads. Having such a
multiplex would also allow the driver to be built as a module. I had
already thought about this when I was working on an earlier version of
these patches. Basically these would be two ops attached to the host
bridge, and the generic arch_setup_msi_irq() could then look that up
given the struct pci_dev that is passed to it and call this new per-
host bridge .setup_msi_irq().

Thierry

--BOKacYhQ+x31HxR3
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.19 (GNU/Linux)

iQIcBAEBAgAGBQJQ8DOMAAoJEN0jrNd/PrOh29wP/R+H89h8vOojTR2fPd/RCViR
XvX1Rz4N+RqkITzkO/mMH9iHu+RJR33V2PZxZc+pQ/OA2CCavI8cW3/ZkBBEiQMk
d2iK7/KIdtIXfsShh89YmjYfBnqCGtLsovrlMP0rwXDEHRhvc5hO9nWCQq9OPqui
9QpVzrbJi//9/ENf2AFrD/y/A6a5D5hsnlfkOBgVZmgHMmlrfQrTCkyRL1EpJbiZ
vodMEBGQp0OPyz1d/qamam7EoAGlYeZcFlBupSTJlzrs4A4TiQe3TThDXG3E7t28
5xP5oT0oAZ64RflqPQJGq4tUIcHhCiXO91AFqepoXqfmGIA1FS8g4nkIiNbcmCgw
aH7MOei5x/3Jc6FbdiGu1iqd3Bexi6Bgl0viCk7AsnA5fEyxjmMhx6H0OFXkX49o
rfjtjgv4Fk9UgTNaQSJY0MWFCyr9j+czowWog00Kww3+Ldzr3PDd3cRD01bIPy3J
91IKMjRp5JhgjLVQivZHlByuhmbpsou664CLwyO6JOmg/JTXz3JkZGSHuwxIL+qu
Mk9MuuvWsw2c9Bh8lyIIeibUS1HXWuPkA+WK+rgqe43imulvd0H7uVOJAeQS+sMJ
xcipX2sslMSszTi9SZLIhCF6Rfq+QV5BMDkFTR+GkdlHkk1ApXAy2GFgW2Rv/Fjq
3/j/GLc4duL6Whnhx/1H
=5NLe
-----END PGP SIGNATURE-----

--BOKacYhQ+x31HxR3--
