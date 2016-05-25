From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] arm64: tegra: Fix CPU compatible string for Tegra132
Date: Wed, 25 May 2016 10:11:51 +0800
Message-ID: <574509E7.4030208@nvidia.com>
References: <20160523074221.7135-1-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20160523074221.7135-1-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Kumar Gala <galak-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/23/2016 03:42 PM, Joseph Lo wrote:
> As per commit f634da375fc96 ("Documentation: DT bindings: add nvidia,
> tegra132-denver compatible string"), fixing the CPU compatible string for
> Tegra132 to match the binding document currently.
>
> Signed-off-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm64/boot/dts/nvidia/tegra132.dtsi | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra132.dtsi b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> index 2013f8916084..7b1cdc029de3 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra132.dtsi
> @@ -964,13 +964,13 @@
>
>   		cpu@0 {
>   			device_type = "cpu";
> -			compatible = "nvidia,denver", "arm,armv8";
> +			compatible = "nvidia,tegra132-denver", "arm,armv8";

Hi Stephen, Thierry,

Should we fix this or fix the compatible string in the binding document 
as just "nvidia,denver" to represent all the Devner CPU revisions just 
like some other CPUs did? e.g. arm,cortex-a57, which represents all the 
A57 revisions.

Thanks,
-Joseph

>   			reg = <0>;
>   		};
>
>   		cpu@1 {
>   			device_type = "cpu";
> -			compatible = "nvidia,denver", "arm,armv8";
> +			compatible = "nvidia,tegra132-denver", "arm,armv8";
>   			reg = <1>;
>   		};
>   	};
>
