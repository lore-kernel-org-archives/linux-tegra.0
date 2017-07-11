From: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Register host1x node with iommu binding on
 tegra124
Date: Tue, 11 Jul 2017 11:50:09 +0300
Message-ID: <1499763009.1340.11.camel@paulk.fr>
References: <20170709163614.6746-1-contact@paulk.fr>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170709163614.6746-1-contact-W9ppeneeCTY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Sun, 2017-07-09 at 19:36 +0300, Paul Kocialkowski wrote:
> This registers the host1x node with the SMMU (as HC swgroup) to allow
> the host1x code to attach to it. It avoid failing the probe sequence,
> which resulted in the tegra drm driver not probing and thus nothing
> being displayed on-screen.

Fixes: 404bfb78daf3 ("gpu: host1x: Add IOMMU support")

> Signed-off-by: Paul Kocialkowski <contact-W9ppeneeCTY@public.gmane.org>
> ---
>  arch/arm/boot/dts/tegra124.dtsi | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/tegra124.dtsi
> b/arch/arm/boot/dts/tegra124.dtsi
> index 187a36c6d0fc..b3b89befffeb 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -85,6 +85,7 @@
>  		clocks = <&tegra_car TEGRA124_CLK_HOST1X>;
>  		resets = <&tegra_car 28>;
>  		reset-names = "host1x";
> +		iommus = <&mc TEGRA_SWGROUP_HC>;
>  
>  		#address-cells = <2>;
>  		#size-cells = <2>;
-- 
Paul Kocialkowski,

developer of free digital technology and hardware support

Website: https://www.paulk.fr/
Coding blog: https://code.paulk.fr/
Git repositories: https://git.paulk.fr/ https://git.code.paulk.fr/
