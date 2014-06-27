From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [RFC 2/4] ARM: tegra: Add legacy interrupt controller nodes
Date: Fri, 27 Jun 2014 14:58:23 -0600
Message-ID: <53ADDAEF.2070805@wwwdotorg.org>
References: <1403888329-24755-1-git-send-email-thierry.reding@gmail.com> <1403888329-24755-2-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1403888329-24755-2-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/27/2014 10:58 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> Add device tree nodes for the legacy interrupt controller so that the
> driver can get the register ranges from device tree rather than hard-
> coding them.

> diff --git a/arch/arm/boot/dts/tegra20.dtsi b/arch/arm/boot/dts/tegra20.dtsi

> +	interrupt-controller@60004000 {
> +		compatible = "nvidia,tegra20-ictlr";
> +		reg = <0x60004000 0x40   /* primary controller */
> +		       0x60004100 0x40   /* secondary controller */
> +		       0x60004200 0x40   /* tertiary controller */
> +		       0x60004300 0x40   /* quaternary controller */
> +		       0x60004400 0x40>; /* quinary controller */
> +	};

The quinary controller doesn't exist on Tegra20.

> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi

> +	interrupt-controller@60004000 {
> +		compatible = "nvidia,tegra20-ictlr";

At the least, each SoC should have an SoC-specific compatible value in
addition to the base Tegra20 value in case we need to differentiate them
in the future.

I'd be tempted to only include the SoC-specific value and omit the
Tegra20-specific value so we don't have to care whether they're really
100% backwards-compatible, but it's probably safe to say they're all
Tegra20 compatible (or all Tegra30 compatible given the 4-vs-5
controllers difference).
