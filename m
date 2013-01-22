From: Jason Gunthorpe <jgunthorpe-ePGOBjL8dl3ta4EC/59zMFaTQe2KTcn/@public.gmane.org>
Subject: Re: [PATCH 10/14] PCI: tegra: Move PCIe driver to drivers/pci/host
Date: Tue, 22 Jan 2013 12:29:01 -0700
Message-ID: <20130122192901.GE30647@obsidianresearch.com>
References: <1357764194-12677-1-git-send-email-thierry.reding@avionic-design.de>
 <20130115154038.GA11241@arm.com>
 <20130115211441.GA13139@avionic-0098.adnet.avionic-design.de>
 <201301161400.26587.arnd@arndb.de> <20130116161716.GA10630@arm.com>
 <20130116183101.GA28660@avionic-0098.adnet.avionic-design.de>
 <20130117154236.GA25943@arm.com>
 <20130117160501.GC2186@avionic-0098.adnet.avionic-design.de>
 <20130117162218.GA29016@arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20130117162218.GA29016-5wv7dgnIgG8@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss/>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
 <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: "devicetree-discuss"
 <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
To: Andrew Murray <andrew.murray-5wv7dgnIgG8@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-pci-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Bjorn Helgaas <bhelgaas-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Jan 17, 2013 at 04:22:18PM +0000, Andrew Murray wrote:

> > In either of those cases, does it make sense to use the MSI support
> > outside the scope of the PCI infrastructure? That is, would devices
> > other than PCI devices be able to generate an MSI?
> 
> I've come around to your way of thinking. Your approach sounds good for
> registration of MSI ops - let the RC host driver do it (it probably has its
> own), or use a helper for following a phandle to get ops that are not part
> of the driver. MSIs won't be used outside of PCI devices.

Here is a bit of additional info on some MSI stuff..

This can be pretty complex. For instance on hyper transport systems
the PCI to HT bridge has an MSI controller that maps between PCI and
HT MSI formats, that mapping is configurable, so technically each
brige could be considered a MSI controller. Typically the mapping
controllers are all setup the same so there is not much problem with
this. However *native* HT devices can (which are super rare) can use a
different MSI format than PCI devices. From a linux perspective HT is
just a variant of PCI.
 
On x86 the MSI is delivered to the CPU APIC complex which converts it
into a vectored interrupt - part of the value of MSI is that the MSI
data can vector the interrupt to a specific CPU, or group of CPUs or
whatever.

Presumably SMP ARMs will evolve similar MSI based interrupt vectoring
capabilities, and presumably on-chip, non-PCI peripherals will evolve
options to use MSI as well (ie multi-queue ethernet). So it might be
worth giving some thought to how things could migrate in that
direction someday.

I have a bit hacky MSI driver for Kirkwood, this work you have to
generalize the interface could let me actually upstream it :) The MSI
is built using the Host2CPU doorbell registers, so it is entirely
unrelated to the PCI-E RC driver.

However, my use of the MSI driver on kirkwood is to assign MSIs to a
PCI-E device via non-standard registers, more like an on chip
peripheral. This is because the Host2CPU doorbell doesn't fit 100%
perfectly with the standard PCI MSI stuff, and the hardware has funny
needs.. So an 'allocate a MSI interrupt' API would be snazzy too :)

Jason
