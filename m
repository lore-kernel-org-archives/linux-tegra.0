From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 5/6] dt: Document Tegra20/30 pinctrl binding
Date: Fri, 23 Mar 2012 12:51:41 +0800
Message-ID: <20120323045140.GA23962@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-5-git-send-email-swarren@wwwdotorg.org>
 <20120321091919.GA18592@shlinux2.ap.freescale.net>
 <4F69FA5A.9020504@wwwdotorg.org>
 <20120322040024.GB840@shlinux2.ap.freescale.net>
 <4F6B491B.8040506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4F6B491B.8040506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Mar 22, 2012 at 11:45:31PM +0800, Stephen Warren wrote:
> On 03/21/2012 10:00 PM, Dong Aisheng wrote:
> > On Wed, Mar 21, 2012 at 11:57:14PM +0800, Stephen Warren wrote:
> >> On 03/21/2012 03:19 AM, Dong Aisheng wrote:
> >>> On Wed, Mar 21, 2012 at 01:44:38AM +0800, Stephen Warren wrote:
> >>>> Define a new binding for the Tegra pin controller, which is capable of
> >>>> defining all aspects of desired pin multiplexing and pin configuration.
> >>>> This is all based on the new common pinctrl bindings.
> >>>>
> >>>> Add Tegra30 binding based on Tegra20 binding.
> ...
> >>>> +Example board file extract:
> >>>> +
> >>>> +	pinctrl@70000000 {
> >>>> +		sdmmc4_default: pinmux {
> >>>> +			sdmmc4_clk_pcc4 {
> >>>> +				nvidia,pins =	"sdmmc4_clk_pcc4",
> >>>> +						"sdmmc4_rst_n_pcc3";
> >>>> +				nvidia,function = "sdmmc4";
> >>>> +				nvidia,pull = <0>;
> >>>> +				nvidia,tristate = <0>;
> >>>> +			};
> >>>> +			sdmmc4_dat0_paa0 {
> >>>> +				nvidia,pins =	"sdmmc4_dat0_paa0",
> >>>> +						"sdmmc4_dat1_paa1",
> >>>> +						"sdmmc4_dat2_paa2",
> >>>> +						"sdmmc4_dat3_paa3",
> >>>> +						"sdmmc4_dat4_paa4",
> >>>> +						"sdmmc4_dat5_paa5",
> >>>> +						"sdmmc4_dat6_paa6",
> >>>> +						"sdmmc4_dat7_paa7";
> >>>> +				nvidia,function = "sdmmc4";
> >>>> +				nvidia,pull = <2>;
> >>>> +				nvidia,tristate = <0>;
> >>>
> >>> It seems it does not support per pin config for tegra30 and we have to
> >>> separate them in different nodes with same group config value, right?
> >>
> >> Sorry, I don't understand the question.
> >
> > I meant for tegra, the config(not mux) in one pinctrl node functions
> > on all entities in nvidia,pins, IOW, all pin or group must have the
> > same config.
> > So we can not set them differently in one node.
> > 
> > For example, considering if  sdmmc4_dat0_paa0 is nvidia,pull <0>
> > while sdmmc4_dat1_paa1 is nvidia,pull <1>.
> > Then we need to separate them in different pinctrl nodes, right?
> 
> Yes, that's true.
> 
> However, note that you can have more than one node affecting a
> particular pin or group if you want. For example, you could have one set
> of nodes that sets the mux, another set of nodes that sets
> pullup/down/none, another set that sets tristate/driven. That way,
> within each set of nodes, you get to group together all pins with
> similar properties. This is all because we take the list of affected
> pins/groups from the nvidia,pins property, rather than e.g. the node
> name, so it's possible to list the same pin/group in multiple nodes. An
> example from the Tegra Harmony board file:
> 
> There's one node for each mux function that's used, specifying which
> pins/groups it's used on:
> 
>     ata {
>             pins = "ata";
>             function = "ide";
>     };
>     atb {
>             nvidia,pins = "atb", "gma", "gme";
>             nvidia,function = "sdio4";
>     };
>     ... many other nodes for other functions
> 
> There's also one node for each combination of pull and tristate that's
> used, specifying which pins/groups it's used on:
> 
>     conf_ata {
>             nvidia,pins = "ata", "atb", "atc", "atd", "ate",
>                     "cdev1", "dap1", "dtb", "gma", "gmb",
>                     "gmc", "gmd", "gme", "gpu7", "gpv",
>                     "i2cp", "pta", "rm", "slxa", "slxk",
>                     "spia", "spib";
>             nvidia,pull = <0>;
>             nvidia,tristate = <0>;
>     };
>     ... many other nodes for other pull/tristate combinations
> 
> I ran a script to group the various pins into nodes in different ways,
> and this particular combination seemed to generate the smallest device
> tree source file for Harmony.
> 

Hmm, either is ok to me. this way may save some properties and nodes.
But i still prefer to do pin mux and config at the same place as you did
in the binding doc like:
sdmmc4_clk_pcc4 {
	nvidia,pins =	"sdmmc4_clk_pcc4",
			"sdmmc4_rst_n_pcc3";
	nvidia,function = "sdmmc4";
	nvidia,pull = <0>;
	nvidia,tristate = <0>;
};
It's very easy to read and control.
Anyway, this is question how to write dts rather than the patch itself.
This patch is ok to me.

Regards
Dong Aisheng
