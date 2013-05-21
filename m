From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [v2 2/6] ARM: tegra20: convert device tree files to use CLK defines
Date: Tue, 21 May 2013 10:13:31 -0600
Message-ID: <519B9D2B.5010101@wwwdotorg.org>
References: <1369127450-15203-1-git-send-email-hdoyu@nvidia.com> <1369127450-15203-3-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1369127450-15203-3-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2013 03:10 AM, Hiroshi Doyu wrote:
> Use the Tegra20 CAR binding header (tegra20-car.h) to replace magic
> numbers in the device tree. For example,
> 
> -               clocks = <&tegra_car 28>;
> +               clocks = <&tegra_car CLK_HOST1X>;

> diff --git a/arch/arm/boot/dts/tegra20-paz00.dts b/arch/arm/boot/dts/tegra20-paz00.dts

> -		clocks = <&tegra_car 112>, <&tegra_car 113>, <&tegra_car 94>;
> +		clocks = <&tegra_car TEGRA20_CLK_PLL_A>, <&tegra_car TEGRA20_CLK_PLL_A_OUT0>, <&tegra_car TEGRA20_CLK_CDEV1>;

That's well over 80 columns. Can you wrap it and make sure there aren't
any other instances of this? I guess checkpatch doesn't actually impose
this rule on *.dts files, since it didn't complain about this.
