From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Wed, 9 Jan 2013 22:10:49 +0000
Message-ID: <201301092210.49452.arnd@arndb.de>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <201301092119.57067.arnd@arndb.de> <20130109215428.GA13648@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130109215428.GA13648-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wednesday 09 January 2013, Thierry Reding wrote:
> What happens on Tegra is that we need to map 256 MiB of physical memory
> to access all the PCIe extended configuration space. However, ioremap()
> on such a large region fails if not enough vmalloc() space is available.
> 
> This was observed when somebody tested this on CardHu which has a 1 GiB
> of RAM and therefore remapping the full 256 MiB fails.

Hmm, config space accesses are fairly rare and generally not expected
to be fast, and 256 MB is really a huge waste of virtual address space,
so I agree that just ioremapping the entire space is not a good
solution.

However, it's not clear that a cache is necessary. Have you measured
a significant performance benefit of this implementation over just
iorempping and unmapping a single page for every config space access?
Have you checked if the hardware supports an alternative config
space access mechanism that does not depend on a huge address range?
A lot of them provide an index/data register pair somewhere, as the
original PC implementation did.

Even if we actually want a cache, how about a private implementation
that just remembers a single page in LRU? I doubt that there are
more drivers that would benefit from a generalized version that you
provide.

	Arnd
