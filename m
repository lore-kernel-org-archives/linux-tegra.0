From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 08/12] arm64: dts: tegra: Add Tegra186 support
Date: Mon, 22 Aug 2016 11:11:17 -0600
Message-ID: <c1e80c40-ccac-1424-6170-ab11a7845e83@wwwdotorg.org>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-9-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819173233.13260-9-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2016 11:32 AM, Thierry Reding wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> This adds the initial support of Tegra186 SoC. It provides enough to
> enable the serial console and boot from an initial ramdisk.

> diff --git a/arch/arm64/boot/dts/nvidia/tegra186.dtsi b/arch/arm64/boot/dts/nvidia/tegra186.dtsi

> +	uarta: serial@03100000 {
> +		compatible = "nvidia,tegra186-uart", "nvidia,tegra20-uart";
> +		reg = <0x0 0x03100000 0x0 0x40>;

At least in the unit address, I think we want to suppress leading zeroes 
(s/03100000/3100000/). I'd argue we should do the same in the reg values 
too, although that makes no difference to the DTB itself. Same comment 
for other nodes.

> +	sysram@30000000 {
> +		compatible = "nvidia,tegra186-sysram", "mmio-ram";
> +		reg = <0x0 0x30000000 0x0 0x4ffff>;
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0 0x0 0x0 0x30000000 0x0 0x4ffff>;

Shouldn't 0x4ffff be 0x50000 since it's length not max?
