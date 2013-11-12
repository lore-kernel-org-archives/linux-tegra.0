From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Correct the length of AHB register space
Date: Tue, 12 Nov 2013 12:05:20 -0700
Message-ID: <52827BF0.5070706@wwwdotorg.org>
References: <1383802327-11908-1-git-send-email-markz@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1383802327-11908-1-git-send-email-markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 11/06/2013 10:32 PM, Mark Zhang wrote:
> On Tegra114 it should be 0x12c.

> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi

>  	ahb: ahb {
>  		compatible = "nvidia,tegra114-ahb", "nvidia,tegra30-ahb";
> -		reg = <0x6000c004 0x14c>;
> +		reg = <0x6000c004 0x12c>;
>  	};

I don't think this is correct.

0x12c /is/ the address of the last defined register that exists.
However, the system memory map table in the TRM indicates that 336 bytes
of address space are allocated for this module, so the value should be
0x150 (minus 4 due to the base address offset of 4, so 0x14c) for all of
Tegra30/114/124. That matches what's already in DT.

For Tegra20, the TRM says that 268 bytes of address space are allocated
(which already takes account of the 4-byte base address offset) yielding
a size of 0x10c, which matches what's already in the DT.
