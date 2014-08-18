From: Andrew Bresticker <abrestic-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: Re: [PATCH v2] ARM: tegra: add Acer Chromebook 13 device tree
Date: Mon, 18 Aug 2014 16:05:15 -0700
Message-ID: <CAL1qeaFS6k+ZbX=viBOvt+5Ryqk2j_TxckbH_sOxSx8CiA43qg@mail.gmail.com>
References: <1407957267-3258-1-git-send-email-dgreid@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1407957267-3258-1-git-send-email-dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dylan Reid <dgreid-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

> WiFi does not work yet, it needs at least some PMIC changes to enable
> the 32k clock.

In addition to getting the PMIC to generate the 32k clock at 1.8V
(instead of the 5V it's operating at now), you'll also need...

> --- /dev/null
> +++ b/arch/arm/boot/dts/tegra124-nyan-big.dts

> +                       sdmmc1_clk_pz0 {
> +                               nvidia,pins = "sdmmc1_clk_pz0";
> +                               nvidia,function = "sdmmc1";
> +                               nvidia,enable-input = <TEGRA_PIN_DISABLE>;

... to turn on the input enable for the SD clock pin on the SDIO
interface.  Unfortunately that still isn't sufficient to get WiFi
working as SDIO commands are still timing out.  But the mwifiex card
is at least attempting to probe now.

> +                               nvidia,pull = <TEGRA_PIN_PULL_NONE>;
> +                               nvidia,tristate = <TEGRA_PIN_DISABLE>;
> +                       };
