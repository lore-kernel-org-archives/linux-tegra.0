From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 05/27] drivers/gpu/host1x/drm: don't check resource with
 devm_ioremap_resource
Date: Thu, 1 Aug 2013 13:20:43 +0300
Message-ID: <51FA367B.7020805@nvidia.com>
References: <1374602524-3398-1-git-send-email-wsa@the-dreams.de> <1374602524-3398-6-git-send-email-wsa@the-dreams.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1374602524-3398-6-git-send-email-wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Wolfram Sang <wsa-z923LK4zBo2bacvFa/9K2g@public.gmane.org>
Cc: "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 23.07.2013 21:01, Wolfram Sang wrote:
> diff --git a/drivers/gpu/host1x/drm/hdmi.c b/drivers/gpu/host1x/drm/hdmi.c
> index 01097da..9ffece6 100644
> --- a/drivers/gpu/host1x/drm/hdmi.c
> +++ b/drivers/gpu/host1x/drm/hdmi.c
> @@ -1248,9 +1248,6 @@ static int tegra_hdmi_probe(struct platform_device *pdev)
>  		return err;
>  
>  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
> -	if (!regs)
> -		return -ENXIO;
> -
>  	hdmi->regs = devm_ioremap_resource(&pdev->dev, regs);
>  	if (IS_ERR(hdmi->regs))
>  		return PTR_ERR(hdmi->regs);
> 

Looks good to me.

Reviewed-By: Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Terje
