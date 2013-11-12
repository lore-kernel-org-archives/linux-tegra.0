From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] pinctrl: tegra124: add pinctrl driver for NVIDIA's
 Tegra124 SoC
Date: Tue, 12 Nov 2013 09:19:23 +0000
Message-ID: <20131112091923.GB2976@e106331-lin.cambridge.arm.com>
References: <1384191718-16817-1-git-send-email-aghuge@nvidia.com>
 <20131111180124.GA27735@e106331-lin.cambridge.arm.com>
 <528120EF.1030000@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <528120EF.1030000-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Ashwini Ghuge <aghuge-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <Pawel.Moll-5wv7dgnIgG8@public.gmane.org>, "ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org" <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, "rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org" <rob-VoJi6FS/r0vR7s880joybQ@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-doc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 11, 2013 at 06:24:47PM +0000, Stephen Warren wrote:
> On 11/11/2013 11:01 AM, Mark Rutland wrote:
> > On Mon, Nov 11, 2013 at 05:41:58PM +0000, Ashwini Ghuge wrote:
> >> The driver uses the common Tegra pinctrl driver utility functions to
> >> implement the majority of the driver. It is based on the similar Tegra114
> >> pinctrl
> 
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/nvidia,tegra124-pinctrl.txt
> 
> >> @@ -0,0 +1,120 @@
> >> +NVIDIA Tegra124 pinmux controller
> >> +
> >> +The Tegra124 pinctrl binding is very similar to the Tegra114
> >> +pinctrl binding, as described in nvidia,tegra114-pinmux.txt. In fact, this
> >> +document assumes that binding as a baseline, and only documents the
> >> +differences between the two bindings.
> >> +
> >> +Required properties:
> >> +- compatible: "nvidia,tegra124-pinmux"
> >> +- reg: Should contain the register physical address and length for each of
> >> +  the pad control and mux registers. The first bank of address must be the
> >> +  driver strength pad control register address and second bank address must
> >> +  be pinmux register address.
> > 
> > It might be worth using reg-names here, in case a future hardware
> > variant builds atop of this.
> 
> This binding is essentially identical to the existing Tegra20/30/114
> bindings, it'd just that the HW has different sets of valid values for
> pin/group/function names. I'd rather keep it consistent with the other
> bindings.
> 
> It's quite unlikely some future binding will build on top of this; if
> the HW changes at all, we'll almost certainly have a completely new
> binding definition to cater for the differing pin/group/function names.

Ok.

> 
> >> +Tegra124 has the following optional properties for pin configuration subnodes:
> >> +- nvidia,enable-input: Integer. Enable the pin's input path. 0: no, 1: yes.
> > 
> > Why are the properties representing boolean values not empty / boolean
> > properties (as can be handled in the kernel with of_property_read_bool)?
> 
> They aren't Boolean, they're tri-state: Set off, set on, don't change
> the setting. The "pinctrl state" nodes each list a set of changes to
> make to the HW to enter/set-up that state, and those sets of changes may
> not need to alter all values, hence it's important to be able to
> differentiate between not changing a value, and the value to change it to.

Sorry, I had missed that.

> 
> >> +- nvidia,open-drain: Integer. Enable open drain mode. 0: no, 1: yes.
> >> +- nvidia,lock: Integer. Lock the pin configuration against further changes
> >> +    until reset. 0: no, 1: yes.
> >> +- nvidia,io-reset: Integer. Reset the IO path. 0: no, 1: yes.
> >> +- nvidia,rcv-sel: Integer. Select VIL/VIH receivers. 0: normal, 1: high.
> > 
> > Why not just have nvidia,rcv-high as a boolean property, and default to
> > normal?
> 
> Same argument.
> 
> >> +- nvidia,drive-type: Integer. Valid range 0...3.
> > 
> > What do these values mean?
> 
> They're the raw HW values. We probably should add something like, "See
> the TRM's definition of field XXX for further details".

That would be helpful :)

> 
> >> +As with Tegra114, see the Tegra TRM for complete details regarding which
> >> +groups support which functionality.
> > 
> > Where can I find this TRM?
> 
> The TRM for earlier Tegras is available at e.g.:
> https://developer.nvidia.com/tegra-3-technical-reference-manual
> 
> We probably haven't published the Tegra124 TRM yet:-( However, the
> overall structure of the Tegra124 pinmux is the same as for the Tegra30
> pinmux documented at that link. The difference is the set of
> pins/groups/functions.

Ok.

> 
> > [...]
> > 
> >> +Example:
> >> +
> >> +       pinmux: pinmux {
> >> +               compatible = "nvidia,tegra124-pinmux";
> >> +               reg = <0x70000868 0x148         /* Pad control registers */
> >> +                       0x70003000 0x40c>;      /* PinMux registers */
> > 
> > For consistency, please bracket entries in lists individually:
> > 
> > reg = <0x70000868 0x148>,      /* Pad control registers */
> >       <0x70003000 0x40c>;      /* PinMux registers */
> 
> I had pointed this out to Ashwini in internal review, along with a few
> other minor formatting/wording issues elsewhere. Hopefully that'll all
> be rolled into v2...
> 

Sounds good.

Cheers,
Mark.
