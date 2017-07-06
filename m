From: Peter Chen <hzpeterchen-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v1 3/9] usb: chipidea: Add support for Tegra20/30/114/124
Date: Thu, 6 Jul 2017 09:23:10 +0800
Message-ID: <20170706012310.GC24420@b29397-desktop>
References: <cover.1499273075.git.digetx@gmail.com>
 <9e0127ea9b580e1af334c4c3bcb8b3c0705614ea.1499273075.git.digetx@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <9e0127ea9b580e1af334c4c3bcb8b3c0705614ea.1499273075.git.digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Peter Chen <Peter.Chen-3arQi8VN3Tc@public.gmane.org>, Jonathan Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Nicolas Chauvet <kwizart-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 05, 2017 at 08:19:52PM +0300, Dmitry Osipenko wrote:
> +	/* setup and register ChipIdea HDRC device */
> +	udc->data.name = "tegra-udc";
> +	udc->data.capoffset = DEF_CAPOFFSET;
> +	udc->data.flags = 0;
> +	udc->data.usb_phy = udc->phy;
> +
> +	/* setup device specific quirks */
> +	soc = id->data;
> +
> +	if (!soc->supports_unaligned_dma)
> +		udc->data.flags |= CI_HDRC_REQUIRES_ALIGNED_DMA;
> +
> +	/* power on UDC controller */
> +	usb_phy_set_suspend(udc->phy, 0);

Why above is needed? The chipidea core will do usb_phy_init for power
on.

> +
> +	udc->dev = ci_hdrc_add_device(&pdev->dev, pdev->resource,
> +				      pdev->num_resources, &udc->data);
> +	if (IS_ERR(udc->dev)) {
> +		err = PTR_ERR(udc->dev);
> +		dev_err(&pdev->dev, "failed to add HDRC device: %d\n", err);
> +		goto power_off;
> +	}
> +
> +	platform_set_drvdata(pdev, udc);
> +
> +	return 0;
> +
> +power_off:
> +	usb_phy_set_suspend(udc->phy, 1);

[...]

> +static int tegra_udc_remove(struct platform_device *pdev)
> +{
> +	struct tegra_udc *udc = platform_get_drvdata(pdev);
> +
> +	usb_phy_set_suspend(udc->phy, 1);

[...]

-- 

Best Regards,
Peter Chen
