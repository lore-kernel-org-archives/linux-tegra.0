From: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH -next] usb: gadget: xudc: Remove redundant
 platform_get_irq error message
Date: Fri, 17 Jan 2020 09:36:31 +0530
Message-ID: <0a693269-3727-bb71-414e-856eab485353@nvidia.com>
References: <20200116141433.57056-1-yuehaibing@huawei.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200116141433.57056-1-yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>, balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, felipe.balbi-VuQAYsv1563Yd54FQh9/CA@public.gmane.org
Cc: linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Reviewed-by: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

On 16-01-2020 19:44, YueHaibing wrote:
> External email: Use caution opening links or attachments
> 
> 
> platform_get_irq() will call dev_err() itself on failure,
> so there is no need for the driver to also do this.
> This is detected by coccinelle.
> 
> Signed-off-by: YueHaibing <yuehaibing-hv44wF8Li93QT0dZR+AlfA@public.gmane.org>
> ---
>   drivers/usb/gadget/udc/tegra-xudc.c | 5 +----
>   1 file changed, 1 insertion(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index 634c2c1..fc1eafc 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -3492,11 +3492,8 @@ static int tegra_xudc_probe(struct platform_device *pdev)
>          }
> 
>          xudc->irq = platform_get_irq(pdev, 0);
> -       if (xudc->irq < 0) {
> -               dev_err(xudc->dev, "failed to get IRQ: %d\n",
> -                               xudc->irq);
> +       if (xudc->irq < 0)
>                  return xudc->irq;
> -       }
> 
>          err = devm_request_irq(&pdev->dev, xudc->irq, tegra_xudc_irq, 0,
>                                 dev_name(&pdev->dev), xudc);
> --
> 2.7.4
> 
> 
