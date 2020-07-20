From: Philipp Zabel <p.zabel-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Subject: Re: [Patch v1 2/4] dma: tegra: Adding Tegra GPC DMA controller
 driver
Date: Mon, 20 Jul 2020 11:37:51 +0200
Message-ID: <636380f452ff696ab4505ad09dcea951283be06b.camel@pengutronix.de>
References: <1595226856-19241-1-git-send-email-rgumasta@nvidia.com>
         <1595226856-19241-3-git-send-email-rgumasta@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1595226856-19241-3-git-send-email-rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Rajesh Gumasta <rgumasta-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, vkoul-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, dan.j.williams-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, dmaengine-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: kyarlagadda-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, Pavan Kunapuli <pkunapuli-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Rajesh,

On Mon, 2020-07-20 at 12:04 +0530, Rajesh Gumasta wrote:
> +
> +       tdma->rst = devm_reset_control_get(&pdev->dev, "gpcdma");

Please use devm_reset_control_get_exclusive() directly.

> +       if (IS_ERR(tdma->rst)) {
> +               dev_err(&pdev->dev, "Missing controller reset\n");

You might want to suppress this message if the error is EPROBE_DEFER.

> +               return PTR_ERR(tdma->rst);
> +       }
> +       reset_control_reset(tdma->rst);

regards
Philipp
