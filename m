From: Dong Aisheng <aisheng.dong-KZfg59tc24xl57MIdRCFDg@public.gmane.org>
Subject: Re: [PATCH V2 5/6] dt: Document Tegra20/30 pinctrl binding
Date: Wed, 21 Mar 2012 17:19:20 +0800
Message-ID: <20120321091919.GA18592@shlinux2.ap.freescale.net>
References: <1332265479-1260-1-git-send-email-swarren@wwwdotorg.org>
 <1332265479-1260-5-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1332265479-1260-5-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org" <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, "rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org" <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, "linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org" <linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org>, Dong Aisheng-B29396 <B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org>, "s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org" <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, "dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org" <thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org" <tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org>, "sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org" <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Mar 21, 2012 at 01:44:38AM +0800, Stephen Warren wrote:
> Define a new binding for the Tegra pin controller, which is capable of
> defining all aspects of desired pin multiplexing and pin configuration.
> This is all based on the new common pinctrl bindings.
> 
> Add Tegra30 binding based on Tegra20 binding.
> 
> Add some basic stuff that was missing before:
> * How many and what reg property entries must be provided.
> * An example.
> 
> Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
> ---
........
> +Example board file extract:
> +
> +	pinctrl@70000000 {
> +		sdio4_default {
> +			atb {
> +				nvidia,pins = "atb", "gma", "gme";
> +				nvidia,function = "sdio4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +		};
> +	};
> +
> +	sdhci@c8000600 {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdio4_default>;
A typo error? sdio4_default is not a phandle.

> +Example board file extract:
> +
> +	pinctrl@70000000 {
> +		sdmmc4_default: pinmux {
> +			sdmmc4_clk_pcc4 {
> +				nvidia,pins =	"sdmmc4_clk_pcc4",
> +						"sdmmc4_rst_n_pcc3";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <0>;
> +				nvidia,tristate = <0>;
> +			};
> +			sdmmc4_dat0_paa0 {
> +				nvidia,pins =	"sdmmc4_dat0_paa0",
> +						"sdmmc4_dat1_paa1",
> +						"sdmmc4_dat2_paa2",
> +						"sdmmc4_dat3_paa3",
> +						"sdmmc4_dat4_paa4",
> +						"sdmmc4_dat5_paa5",
> +						"sdmmc4_dat6_paa6",
> +						"sdmmc4_dat7_paa7";
> +				nvidia,function = "sdmmc4";
> +				nvidia,pull = <2>;
> +				nvidia,tristate = <0>;
It seems it does not support per pin config for tegra30 and we have to
separate them in different nodes with same group config value, right?

Regards
Dong Aisheng
