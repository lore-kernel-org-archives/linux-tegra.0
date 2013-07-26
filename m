From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 1/9] ARM: dts: add generic DMA DT binding for tegra apbdma
Date: Fri, 26 Jul 2013 13:21:20 -0600
Message-ID: <51F2CC30.5090200@wwwdotorg.org>
References: <1374639002-16753-1-git-send-email-rizhao@nvidia.com> <1374639002-16753-2-git-send-email-rizhao@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374639002-16753-2-git-send-email-rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Mark Rutland <Mark.Rutland-5wv7dgnIgG8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Ian Campbell <ian.campbell-Sxgqhf6Nn4DQT0dZR+AlfA@public.gmane.org>, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, vinod.koul-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, djbw-b10kYP2dOMg@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

(Stripping the Cc list a lot, but adding in the DT binding maintainers)

On 07/23/2013 10:09 PM, Richard Zhao wrote:
> All Tegra device drivers will soon move to generic DMA device tree bindings.
> Add the required properties to the Tegra DT files to support that. The legacy
> property nvidia,dma-request-selector will be removed after all drivers have
> been converted, in order to maintain bisectability.
> 
> Changes:
>  - Add '#dma-cells' for apbdma nodes
>  - And properties 'dmas' and 'dma-names' for apbdma client nodes
>  - update apbdma DT binding doc
> 
> Signed-off-by: Richard Zhao <rizhao-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  .../devicetree/bindings/dma/tegra20-apbdma.txt     |  1 +
>  arch/arm/boot/dts/tegra114.dtsi                    | 27 ++++++++++++++++++++++
>  arch/arm/boot/dts/tegra20.dtsi                     | 27 ++++++++++++++++++++++
>  arch/arm/boot/dts/tegra30.dtsi                     | 25 ++++++++++++++++++++

This patch should be split differently.

Patch 1 in the series should include the binding document change and the
associated DMA driver change, which will support both the old and new
bindings.

Patch 2 should contain the *.dtsi changes.
