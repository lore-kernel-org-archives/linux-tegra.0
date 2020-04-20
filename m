From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] usb: gadget: tegra-xudc: Fix idle suspend/resume
Date: Mon, 20 Apr 2020 15:32:41 +0100
Message-ID: <60250b1f-f721-0631-59bf-513576473f44@nvidia.com>
References: <20200417170537.2540914-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200417170537.2540914-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Felipe Balbi <balbi-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>
Cc: Nagarjuna Kristam <nkristam-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On 17/04/2020 18:05, Thierry Reding wrote:
> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> When the XUDC device is idle (i.e. powergated), care must be taken not
> to access any registers because that would lead to a crash.
> 
> Move the call to tegra_xudc_device_mode_off() into the same conditional
> as the tegra_xudc_powergate() call to make sure we only force device
> mode off if the XUDC is actually powered up.
> 
> Fixes: 49db427232fe ("usb: gadget: Add UDC driver for tegra XUSB device mode controller")
> Signed-off-by: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> ---
>  drivers/usb/gadget/udc/tegra-xudc.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
> index 52a6add961f4..dfabc54cdc27 100644
> --- a/drivers/usb/gadget/udc/tegra-xudc.c
> +++ b/drivers/usb/gadget/udc/tegra-xudc.c
> @@ -3840,11 +3840,11 @@ static int __maybe_unused tegra_xudc_suspend(struct device *dev)
>  
>  	flush_work(&xudc->usb_role_sw_work);
>  
> -	/* Forcibly disconnect before powergating. */
> -	tegra_xudc_device_mode_off(xudc);
> -
> -	if (!pm_runtime_status_suspended(dev))
> +	if (!pm_runtime_status_suspended(dev)) {
> +		/* Forcibly disconnect before powergating. */
> +		tegra_xudc_device_mode_off(xudc);
>  		tegra_xudc_powergate(xudc);
> +	}
>  
>  	pm_runtime_disable(dev);


Acked-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Tested-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Cheers
Jon

-- 
nvpublic
