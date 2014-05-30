From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCHv8 20/21] ARM: dt: tegra124: add tegra,smmu entry
Date: Fri, 30 May 2014 10:30:03 -0600
Message-ID: <5388B20B.6050507@wwwdotorg.org>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com> <1401448834-32659-21-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-21-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/30/2014 05:20 AM, Hiroshi Doyu wrote:
> Add Tegra SMMU DT entry.
> 

> diff --git a/arch/arm/boot/dts/tegra124.dtsi b/arch/arm/boot/dts/tegra124.dtsi

> +       smmu: iommu {
> +               compatible = "nvidia,tegra124-smmu";
> +               reg = <0x0 0x70019010 0x0 0x34
> +                      0x0 0x700191f0 0x0 0x10
> +                      0x0 0x70019228 0x0 0x58
> +                      0x0 0x70019600 0x0 0x4
> +                      0x0 0x700199b8 0x0 0x4
> +                      0x0 0x700199e0 0x0 0x18
> +                      0x0 0x70019a88 0x0 0x24>;
> +               nvidia,#asids = <128>;
> +               dma-window = <0x0 0x0 0x0 0x40000000>;
> +	       iommu-cells = <2>;
> +       };

The indentation is inconsistent here; mix of TABs/spaces perhaps?
