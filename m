From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 4/7] ARM: tegra: Add initial device tree for Tegra124
Date: Mon, 07 Oct 2013 11:18:55 -0600
Message-ID: <5252ECFF.404@wwwdotorg.org>
References: <1381131085-26116-1-git-send-email-josephl@nvidia.com> <1381131085-26116-5-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381131085-26116-5-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 10/07/2013 01:31 AM, Joseph Lo wrote:
> Initial support for Tegra 124 SoC. This is expected to be included in
> the board DTS files.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	rtc {
> +		compatible = "nvidia,tegra124-rtc", "nvidia,tegra20-rtc";
> +		reg = <0x7000e000 0x100>;

We recently decided that all nodes that have a reg property must have a
matching unit address in the node name. Hence, the node should be named
"rtc@7000e000" not just "rtc". We haven't decided how to clean this up
for existing DTs, but I'd like to enforce the new rule for all new DTs.

The pmc node should also be fixed.

> +	pmc {
> +		compatible = "nvidia,tegra124-pmc", "nvidia,tegra114-pmc";
> +		reg = <0x7000e400 0x400>;
> +	};

Is the Tegra124 PMC really identical to the Tegra114 PMC in hardware?
That would be a departure from history, where the PMC has changed
significantly and incompatibly for each chip. Can you please investigate
the details of the PMC changes; I suspect this should simply be:

		compatible = "nvidia,tegra124-pmc";
