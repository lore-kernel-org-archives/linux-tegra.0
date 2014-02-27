From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 6/7] ARM: tegra: Add Tegra124 USB support
Date: Thu, 27 Feb 2014 15:07:03 -0700
Message-ID: <530FB707.3050503@wwwdotorg.org>
References: <1393431629-7040-1-git-send-email-thierry.reding@gmail.com> <1393431629-7040-6-git-send-email-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1393431629-7040-6-git-send-email-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/26/2014 09:20 AM, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> The USB controllers on Tegra124 are backwards-compatible with those
> found on Tegra30.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +	usb@7d000000 {
> +		compatible = "nvidia,tegra30-ehci", "usb-ehci";

These properties still all need the Tegra124 value in there too, just in
case there's a need to differentiate in the future. I can fix that up
when applying.
