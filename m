From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Fri, 11 Jan 2013 15:36:14 +0000
Message-ID: <201301111536.14799.arnd@arndb.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <50EF54B6.6010100@wwwdotorg.org> <20130111034015.GA28094@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130111034015.GA28094-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Friday 11 January 2013, Thierry Reding wrote:
> Right, it'll need #ifdefs around the arch_{setup,teardown}_msi_irq(). Or
> select PCI_MSI unconditionally. Once this is merged I was going to post
> a patch that enables PCI_MSI in tegra_defconfig anyway. But it might be
> better to keep it optional anyway since the remainder of the code copes
> with it properly.
> 
Actually, we need something better than that. You cannot define
arch_setup_msi_irq in a tegra specific pci host driver, because that
will seriously mess up other platforms in multiplatform configurations
by giving a link error when they also define this function, or with a
run-time error when they don't support it.

I think what we should do here is fix it the right way by adding
a pci host specific callback rather than an architecture specific
callback in drivers/pci/msi.c. There is already a default version
of arch_setup_msi_irqs (with s), and we can probably do the
same for arch_setup_msi_irq (without s) to fall back to the
arch version for most architectures.
Most architectures (at least powerpc, sparc, ia64 and x86) already
multiplex the msi handlers internally, but ARM does not because
there is only one implementation (iop33x) at the moment.

We can add a generix multiplex and then move architectures over to
use it.

	Arnd
