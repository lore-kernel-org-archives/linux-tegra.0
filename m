From: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v1] arm64: tegra: Add reset-cells to mc
Date: Thu, 12 Mar 2020 18:23:50 -0700
Message-ID: <407b5d00-4a79-d063-31a2-74e3154625f6@nvidia.com>
References: <1583899366-1588-1-git-send-email-skomatineni@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1583899366-1588-1-git-send-email-skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, daniel.lezcano-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, mmaddireddy-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi All,

Sorry for inconvenience.

Please ignore this patch. This is needed before next updated patches for 
tegra video as they use mc reset on Tegra210.

So will include this patch as part of tegra-video patch series so 
dependencies are taken care.

Thanks

Sowjanya

On 3/10/20 9:02 PM, Sowjanya Komatineni wrote:
> External email: Use caution opening links or attachments
>
>
> Tegra210 device tree is missing reset-cells property for mc node.
>
> This patch fixes it.
>
> Signed-off-by: Sowjanya Komatineni <skomatineni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>   arch/arm64/boot/dts/nvidia/tegra210.dtsi | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> index 66dd1df..9241163 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -935,6 +935,7 @@
>                  interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>
>                  #iommu-cells = <1>;
> +               #reset-cells = <1>;
>          };
>
>          sata@70020000 {
> --
> 2.7.4
>
