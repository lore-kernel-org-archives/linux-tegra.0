From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH V2 1/2] pinctrl: tegra: Add devicetree binding document
 for Tegra124
Date: Mon, 9 Dec 2013 17:48:59 +0000
Message-ID: <20131209174859.GC1809@e106331-lin.cambridge.arm.com>
References: <1386585140-1137-1-git-send-email-ldewangan@nvidia.com>
 <20131209105155.GC29303@e106331-lin.cambridge.arm.com>
 <52A6005E.3060506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <52A6005E.3060506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: devicetree-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Dec 09, 2013 at 05:39:42PM +0000, Stephen Warren wrote:
> On 12/09/2013 03:51 AM, Mark Rutland wrote:
> > On Mon, Dec 09, 2013 at 10:32:19AM +0000, Laxman Dewangan wrote:
> >> This device tree binding document describes the Tegra124 pincontrol
> >> DT bindings. This document lists all valid properties, names, mux
> >> options of Tegra124 pins.
> >>
> >> Signed-off-by: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> >> ---
> >> Changes from V1:
> >> - Referred the dt-binding header file on describing the nodes.
> >>
> >>  .../bindings/pinctrl/nvidia,tegra124-pinmux.txt    |  147 ++++++++++++++++++++
> >>  1 files changed, 147 insertions(+), 0 deletions(-)
> >>  create mode 100644 Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> >> new file mode 100644
> >> index 0000000..12ef772
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinmux.txt
> >> @@ -0,0 +1,147 @@
> >> +NVIDIA Tegra124 pinmux controller
> >> +
> >> +The Tegra124 pinctrl binding is very similar to the Tegra20 and Tegra30
> >> +pinctrl binding, as described in nvidia,tegra20-pinmux.txt and
> >> +nvidia,tegra30-pinmux.txt. In fact, this document assumes that binding as
> >> +a baseline, and only documents the differences between the two bindings.
> >> +
> >> +Required properties:
> >> +- compatible: "nvidia,tegra124-pinmux"
> >> +- reg: Should contain the register physical address and length for each of
> >> +  the pad control and mux registers. The first bank of address must be the
> >> +  driver strength pad control register address and second bank address must
> >> +  be pinmux register address.
> > 
> > The wording here could be improved. The first sentence implies an entry
> > for each individual register but I assume these are actually banks of
> > registers (the sizes in the exanple imply this). The second sentence is
> > more sepcific.
> > 
> > How about something like:
> > 
> > reg: Should contain a list of base address and size pairs for:
> >  * first entry - the driver strength and pad control registers
> 
> If this patch gets revised, please s/driver/drive/ here.

Whoops. I'm too used to typing the former.

> 
> >  * second entry - the pinmux registers
> > 
> > Are these banks well defined? Where do they end?
> 
> Yes, the SoC includes specific banks of registers for those two types of
> configuration. The banks end at whatever address contains the last
> define register of that type.
> 
> > Is there likely to be anything built as an extension of this? Does it
> > possibly make sense to use reg-names?
> 
> Any new SoC would get a new binding, since all the other configuration
> parameters (lists of valid pins, groups, functions) would be different,
> so there's no need for future compatibility here.
> 

Ok, thanks for the info.

Mark.
--
To unsubscribe from this list: send the line "unsubscribe devicetree" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
