From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv8 21/21] ARM: dt: tegra124: add sdhci iommus bindings
Date: Fri, 30 May 2014 10:34:05 -0600
Message-ID: <5388B2FD.7040307@wwwdotorg.org>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com> <1401448834-32659-22-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-22-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/30/2014 05:20 AM, Hiroshi Doyu wrote:
> Add sdhci iommus bindings.

This isn't adding bindings, it's adding DT properties. A binding is the
documentation of the schema, not the actual data in the DT.

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi
> index 5b339ca8a1ab..011831ffd390 100644
> --- a/arch/arm/boot/dts/tegra124.dtsi
> +++ b/arch/arm/boot/dts/tegra124.dtsi
> @@ -472,6 +472,7 @@
>  		resets = <&tegra_car 14>;
>  		reset-names = "sdhci";
>  		status = "disabled";
> +		iommus=<&smmu TEGRA_SWGROUP_CELLS(SDMMC1A)>;

Is the "iommus" property documented anywhere? I suspect not, since
there's an active ongoing discussion about how IOMMU bindings should be
structured. I suspect this series needs to wait until that discussion
completes, and the "iommus" property is documented somewhere.

There should be spaces around the = i.e. iommus = <...>;
