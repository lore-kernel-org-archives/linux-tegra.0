From: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Tue, 15 Jan 2013 15:40:38 +0000
Message-ID: <20130115154038.GA11241@arm.com>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130114095706.GA23467@arm.com>
 <20130115120855.GA5637@avionic-0098.adnet.avionic-design.de>
 <201301151244.12767.arnd@arndb.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201301151244.12767.arnd-r2nGTMty4D4@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 15, 2013 at 12:44:12PM +0000, Arnd Bergmann wrote:
> On Tuesday 15 January 2013, Thierry Reding wrote:
> > I'm not sure I follow you're reasoning here. Is it possible to use MSIs
> > without PCI? If not then I think there's little sense in keeping the
> > implementations separate.
> 
> Conceptually, you can use MSI for any device, but the Linux interfaces
> for MSI are tied to PCI. If you use an MSI controller for a non-PCI
> device, it would probably just appear as a regular interrupt controller.
> 
> > Furthermore, if MSI controller and PCI host bridge are separate entities
> > how do you look up the MSI controller given a PCI device?
> 
> The host bridge can contain a pointer ot the MSI controller. You can
> have multiple host bridges sharing a single MSI controller or you
> can have separate ones for each host.

Yes and I hoped this relationship would be described by a device tree phandle
as is done for relating devices to their interrupt-parent (where device trees
are used). This would provide (arguably unnecessarily) greater flexibility,
e.g. if you have two PCI/MSI controller pairs, the MSIs only offer limited MSIs
and you only use one PCI fabric - you could service different parts of the
fabric by different MSI controllers (assuming you relate MSI controllers to
part of the fabric and that you'd want to). Perhaps there would be benefits for
virtualisation as well?

Andrew Murray
