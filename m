From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [RFC] binding for nvec mfd device
Date: Wed, 31 Jul 2013 16:33:22 +0100
Message-ID: <20130731153322.GQ29859@e106331-lin.cambridge.arm.com>
References: <1416005.VvfEeGuSWa@ax5200p>
 <51F6E5BE.3080400@wwwdotorg.org>
 <20130731141314.GO29859@e106331-lin.cambridge.arm.com>
 <6071437.eL7j9JF89s@fb07-iapwap2.physik.uni-giessen.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <6071437.eL7j9JF89s-D3pzGp0ZKuDWZbiwp4sFPyrtisivX6KghOMvlBiLbJSELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Andrey Danin <danindrey-JGs/UdohzUI@public.gmane.org>, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 31, 2013 at 03:57:13PM +0100, Marc Dietrich wrote:
> Am Mittwoch, 31. Juli 2013, 15:13:14 schrieb Mark Rutland:
> > On Mon, Jul 29, 2013 at 10:59:26PM +0100, Stephen Warren wrote:
> > > (Also Cc'ing the DT binding maintainers and hence quoting this in full)
> > 
> > Cheers.
> > 
> > > On 07/27/2013 07:23 AM, Marc Dietrich wrote:
> > > > Hi,
> > > > 
> > > > this is an RFC for an mfd device introduced here [1]. I didn't got much
> > > > response, except from Stephen, but that bothered me enough already ;-)
> > > > 
> > > > I'm going describe the hw again shortly, for a more complete
> > > > description, see [1]. What we have here is an EC which communicates to
> > > > the host cpu (NVIDIA Tegra) via I2C. The unusual part is that the EC is
> > > > I2C master while the host cpu is the slave. The EC has several ports to
> > > > connect peripherals like keyboard, mouse, ... and also to control some
> > > > system states (suspend, low bat, power key, ...). Ok, so much for the
> > > > hardware description, now the binding. I think I integrated all
> > > > comments made by Stephen in [2].
> > > > 
> > > > i2c-slave@7000c500 {
> > > > 
> > > > 	compatible = "nvidia,tegra20-i2c-slave", "simple-bus";
> > > 
> > > Thinking more about this, I don't think simple-bus is appropriate here,
> > > for the same reasons that i2c-master bindings don't specify simple-bus
> > > here.
> > > 
> > > "simple-bus" is usually used in a case where the node in question is
> > > pretty much just a simple aggregation of some child nodes, and the child
> > > nodes are the same "type" of node as the node that is the simple-bus.
> > > For example, when grouping a variety of memory-mapped peripherals
> > > together to provide some structure to a larger memory-mapped bus,
> > > perhaps with a "ranges" property etc. to do some remapping. In this
> > > case, the child nodes are basically independent of the simple-bus node,
> > > just relying on it for a bit of DT parsing, but not at run-time.
> > 
> > I'd expect any simple-bus node to be completely ignorable - if it
> > *requires* any configuration to child nodes to be usable, or child node
> > require any information from the bus (other than some addresss
> > translation via the ranges property), then the node is clearly not
> > compatible with the simple-bus concept.
> > 
> > If you need to instantiate child nodes as Linux platform devices, this
> > should be done in the driver for the bus. Relying on simple-bus to do
> > this is a hack.
> 
> ok, I'll rip this off from both nodes. I guess I should use 
> of_platform_populate instead and keeping the compatible node in the childs - 
> right?

I believe that would be a correct way of handling this.

Thanks,
Mark.
