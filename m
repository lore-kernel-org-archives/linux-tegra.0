From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv3 1/4] ARM: tegra: Add AHB driver
Date: Fri, 27 Apr 2012 08:40:15 +0300
Message-ID: <20120427084015.cb7c8e00c7d9a4cd01faa5ae@nvidia.com>
References: <1335352072-4001-1-git-send-email-hdoyu@nvidia.com>
	<4F99A740.3080407@wwwdotorg.org>
	<20120426215903.GH24211@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120426215903.GH24211-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, 26 Apr 2012 23:59:03 +0200
Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org> wrote:

> On Thu, Apr 26, 2012 at 01:51:28PM -0600, Stephen Warren wrote:
> > On 04/25/2012 05:07 AM, Hiroshi DOYU wrote:
> > > The AHB Bus conforms to the AMBA Specification (Rev 2.0) Advanced
> > > High-performance Bus (AHB) architecture.
> > > 
> > > The AHB Arbiter controls AHB bus master arbitration. This effectively
> > > forms a second level of arbitration for access to the memory
> > > controller through the AHB Slave Memory device. The AHB pre-fetch
> > > logic can be configured to enhance performance for devices doing
> > > sequential access. Each AHB master is assigned to either the high or
> > > low priority bin. Both Tegra20/30 have this AHB bus.
> > > 
> > > Some of configuration param could be passed from DT too.
> > 
> > I think this code looks reasonable. I'd like to see an ack from Russell,
> > Arnd, and Olof on the final location of the files though.
> 
> Well, the big question which needs answering is whether this AHB software
> interface is something specific to Tegra or whether it really is something
> generic.  There's been some hints in the previous thread that it's
> specific to Tegra, so it may not after all make sense for it to be a
> generic driver.
> 
> However, we _have_ decided "no more drivers under arch/arm".  So I really
> don't want to see "struct xxx_driver" appearing in any code under that
> subdirectory or one of its decendents.  I don't have much more to say
> about location than that.

What about having this driver under "drivers/amba"?

If other similiar drivers are coming up, it's easy to find rather than
having this arch/arm/mach-*. There may be some possibility of
generalization later, then. Also it meets the requirement of no
"struct xxxx_driver" under arch/arm. Arnd?
