From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] ARM: dts: tegra114: dalmore: fix the irq trigger type
 of Palmas MFD device
Date: Tue, 23 Jul 2013 20:13:23 +0530
Message-ID: <51EE968B.1050103@nvidia.com>
References: <1374574191-24396-1-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374574191-24396-1-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 23 July 2013 03:39 PM, Joseph Lo wrote:
> The IRQ trigger type of Palmas MFD device (tps65913) is low-level
> sensitive. The wrong configuration would cause an interrupt storm
> when booting the system. Fixing it in DT with appropriate interrupt
> type.
>
> Cc: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm/boot/dts/tegra114-dalmore.dts | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm/boot/dts/tegra114-dalmore.dts b/arch/arm/boot/dts/tegra114-dalmore.dts
> index 76529e4..70b9d0c 100644
> --- a/arch/arm/boot/dts/tegra114-dalmore.dts
> +++ b/arch/arm/boot/dts/tegra114-dalmore.dts
> @@ -840,7 +840,7 @@
>   		palmas: tps65913 {
>   			compatible = "ti,palmas";
>   			reg = <0x58>;
> -			interrupts = <0 86 0x4>;
> +			interrupts = <0 86 0x8>;
>   

This fails as GIC does not support the interrupt flag of 8.

[   13.007755] genirq: Setting trigger mode 8 for irq 118 failed 
(gic_set_type+0x0/0xf0)
[   13.009152] palmas 1-0058: Irq flag is 0x00000000


I did not get the interrupt storm and even interrupt is not working on tot.
Two ways to resolve this:
- Change the interrupt flag to 0 from 4. Or
- Remove the nvidia,invert-interrupt; for PMC node.
