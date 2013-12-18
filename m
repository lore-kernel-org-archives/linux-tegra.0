From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: modify Tegra30 USB2 default phy_type
 to UTMI
Date: Wed, 18 Dec 2013 14:15:37 -0700
Message-ID: <52B21079.6030201@wwwdotorg.org>
References: <1387331565-3994-1-git-send-email-ebrower@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387331565-3994-1-git-send-email-ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Eric Brower <ebrower-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/17/2013 06:52 PM, Eric Brower wrote:
> Modify Tegra30 default USB2 phy_type to UTMI; this matches
> power-on-reset defaults and is expected to be the common case.
> 
> The current implementation is likely an incorrect
> carry-over from Tegra20, where USB2 does default to ULPI.

> diff --git a/arch/arm/boot/dts/tegra30.dtsi b/arch/arm/boot/dts/tegra30.dtsi

>  	phy2: usb-phy@7d004000 {
>  		compatible = "nvidia,tegra30-usb-phy";
> -		reg = <0x7d004000 0x4000>;
> -		phy_type = "ulpi";
> +		reg = <0x7d004000 0x4000 0x7d004000 0x4000>;

Are you sure the second entry in the reg property is correct here? In
Tegra20, the UTMI pad registers are in the USB1 (USBD) register space
for both USB controllers, and I would guess the same applies for all 3
controllers on Tegra30, since both USB1 and USB3 on Tegra30 already
point this reg entry at USBD's reg space, plus you've listed USBD as the
clock entry for utmi-pads, rather than USB2, which would be consistent
with the reg value.

Still, this patch does seem to work for me...
