From: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Subject: Re: [PATCH 06/14] ARM: pci: Keep pci_common_init() around after
	init
Date: Wed, 6 Feb 2013 16:30:41 +0000
Message-ID: <20130206163041.GG17833@n2100.arm.linux.org.uk>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de> <1357764194-12677-7-git-send-email-thierry.reding@avionic-design.de> <20130205204147.GA29726@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130205204147.GA29726-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 05, 2013 at 09:41:48PM +0100, Thierry Reding wrote:
> On Wed, Jan 09, 2013 at 09:43:06PM +0100, Thierry Reding wrote:
> > When using deferred driver probing, PCI host controller drivers may
> > actually require this function after the init stage.
> > 
> > Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
> > ---
> >  arch/arm/kernel/bios32.c | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> Russell,
> 
> Can this patch and patch 7 (ARM: pci: Allow passing per-controller
> private data) of this series be applied for 3.9? Thomas uses them in his
> Marvell PCIe series as well and it would allow to reduce the complexity
> of the dependencies.

It'll need to go into the patch system in that case...
