From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH V2 3/3] ARM: tegra: document use of standard DMA DT bindings
Date: Mon, 25 Nov 2013 23:07:55 +0100
Message-ID: <11843948.6MmkNU7Gku@wuerfel>
References: <1385417161-5542-1-git-send-email-swarren@wwwdotorg.org> <1385417161-5542-4-git-send-email-swarren@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1385417161-5542-4-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Pawel Moll <pawel.moll-5wv7dgnIgG8@public.gmane.org>, Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>, Ian Campbell <ijc+devicetree-KcIKpvwj1kUDXYZnReoRVg@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Monday 25 November 2013 15:06:01 Stephen Warren wrote:
>    See ../reset/reset.txt for details.
>  - reset-names : Must include the following entries:
>    - dma
> +- #iommu-cells : Must be <1>. This dictates the length of DMA specifiers in
> +  client nodes' dmas properties. The specifier represents the DMA request
> +  select value for the peripheral. For more details, consult the Tegra TRM's
> +  documentation of the APB DMA channel control register REQ_SEL field.
>  
>  Examples:
>  
> @@ -36,4 +40,5 @@ apbdma: dma@6000a000 {
>         clocks = <&tegra_car 34>;
>         resets = <&tegra_car 34>;
>         reset-names = "dma";
> +       #iommu-cells = <1>;

s/iommu-cells/dma-cells/

	Arnd
