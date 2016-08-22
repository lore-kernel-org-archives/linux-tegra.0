From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v3 10/12] arm64: dts: tegra: Add NVIDIA P2771 board
 support
Date: Mon, 22 Aug 2016 13:11:27 -0600
Message-ID: <67ca2714-8f12-d289-2b67-b31d6fb37fa8@wwwdotorg.org>
References: <20160819173233.13260-1-thierry.reding@gmail.com>
 <20160819173233.13260-11-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160819173233.13260-11-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Timo Alho <talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Sivaram Nair <sivaramn-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 08/19/2016 11:32 AM, Thierry Reding wrote:
> From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> Add NVIDIA P2771 is composed of a P3310 processor module that connects
> to the P2597 I/O board. It comes with a 1200x1920 MIPI DSI panel
> connected via the P2597's display connector and has several connectors
> such as HDMI, USB 3.0, PCIe and ethernet.

>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts | 8 ++++++++

The DT will be different for the different HW versions. So far, there 
are at least 3 different versions with 3 combinations of 2 different HW 
changes (PCIe lane layout, and SD card GPIO assignments). I suspect 
we'll want this file to be tegra186-p2771-0000-NNN.dts where NNN is the 
version number from the EEPROM (which is 000 for the first version, 300 
for the version that introduces the first change, and 500 for the 
version that introduces the second change).

> diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts b/arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dts

> +#include "tegra186-p3310.dtsi"
> +
> +/ {
> +	model = "NVIDIA Tegra186 P2771-0000 Board";
> +	compatible = "nvidia,p2771-0000", "nvidia,tegra186";

Do we need to propagate the "nvidia,p3310" entry from the included CVM 
DT? It'd be nice if we could write:

/prepend/ compatible = "nvidia,p2771-0000";

... and have that happen automatically.
