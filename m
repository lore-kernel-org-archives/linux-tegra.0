From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 05/14] lib: Add I/O map cache implementation
Date: Wed, 9 Jan 2013 21:28:47 +0000
Message-ID: <20130109212847.GT3931@n2100.arm.linux.org.uk>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <1357764194-12677-6-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1357764194-12677-6-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jan 09, 2013 at 09:43:05PM +0100, Thierry Reding wrote:
> The I/O map cache is used to map large regions of physical memory in
> smaller chunks to avoid running out of vmalloc()/ioremap() space.
> 
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

We already have a means where we record the mappings which ioremap()
creates.  If you look at /proc/vmallocinfo, you'll notice lines such
as:

0xf7b72000-0xf7b74000    8192 e1000_probe+0x291/0xa68 [e1000e] phys=fc025000 ioremap

which gives you the virtual address range, physical address and type
of the mapping.  Why do we need a duplicated data structure?

Moreover, you seem to suggest that you want to break up a large
ioremap() mapping into several smaller mappings.  Why?  The idea
behind ioremap() is that this relationship holds true:

	ptr = ioremap(cookie + n, size);

For any 'n' in the range 0 .. size, the location shall be accessible
via ptr + n when using the IO space accessors.  If you're going to
break up a mapping into several smaller ones, this no longer holds
true.

If the problem is that you're ioremapping huge address ranges because
you're passing larger-than-required resources to devices, then that's
part of the problem too.
