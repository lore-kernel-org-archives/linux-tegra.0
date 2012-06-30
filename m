From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pwm-backlight: add regulator and GPIO support
Date: Sat, 30 Jun 2012 12:54:04 +0900
Message-ID: <4FEE785C.306@nvidia.com>
References: <1340976167-27298-1-git-send-email-acourbot@nvidia.com> <4FEDD222.7050905@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4FEDD222.7050905-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 06/30/2012 01:04 AM, Stephen Warren wrote:
 >> -	dev_dbg(&pdev->dev, "got pwm for backlight\n");
 >> -
 >
 > That seems like an unrelated change?

Dammit, I hoped that would have gone unnoticed. ;)

 >> +	pb->enable_gpio = -EINVAL;
 >> +	if (data->use_enable_gpio) {
 >> +		ret = devm_gpio_request_one(&pdev->dev, data->enable_gpio,
 >> +				GPIOF_OUT_INIT_HIGH, "backlight_enable");
 >> +		if (ret)
 >> +			dev_warn(&pdev->dev,
 >> +				"error %d requesting control gpio\n", ret);
 >
 > Shouldn't that be a hard error? If the user specified that some GPIO be
 > used, and the GPIO could not be requested, shouldn't the driver fail to
 > initialize?

Yes, you are right.

Thanks,
Alex.
