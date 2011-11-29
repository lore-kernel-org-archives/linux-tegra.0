From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH] ASoC: Tegra I2S: Add device tree binding
Date: Mon, 28 Nov 2011 16:21:00 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174FDAF9B3@HQMAIL01.nvidia.com>
References: <1322514470-25599-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1322514470-25599-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Liam Girdwood <lrg-l0cyMroinI0@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org" <alsa-devel-K7yf7f+aM1XWsZ/bQMPhNw@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Stephen Warren wrote at Monday, November 28, 2011 2:08 PM:
...
>  	dmareq = platform_get_resource(pdev, IORESOURCE_DMA, 0);
>  	if (!dmareq) {
> -		dev_err(&pdev->dev, "No DMA resource\n");
> -		ret = -ENODEV;
> -		goto err_clk_put;
> +		if (of_property_read_u32_array(pdev->dev.of_node,
> +					"nvidia,dma-request-selector",
> +					&of_dma, 2) < 0) {

That should be "of_dma" not "&of_dma". I think that's just a compile
warning. I'll wait for any other comments before a respin.

-- 
nvpublic
