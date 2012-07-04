From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pwm-backlight: add regulator and GPIO support
Date: Wed, 4 Jul 2012 21:26:58 +0900
Message-ID: <4FF43692.2040805@nvidia.com>
References: <1340976167-27298-1-git-send-email-acourbot@nvidia.com> <20120704104840.GJ24458@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120704104840.GJ24458-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Sascha,

On 07/04/2012 07:48 PM, Sascha Hauer wrote:>> +
 >> +	pb->power_reg = devm_regulator_get(&pdev->dev, "power");
 >> +	if (IS_ERR(pb->power_reg))
 >> +		return PTR_ERR(pb->power_reg);
 >
 > This looses several resources allocated earlier, like the enable gpio
 > and the pwm. This is really bad here since I have no regulator specified
 > and devm_regulator_get returns with -EPROBE_DEFER. Next time the core
 > tries to probe the driver the driver bails out because the gpio and the
 > pwm is already requested.

That's very bad indeed. I assumed that the kernel would free 
devm-allocated resources after probe returned -EPROBE_DEFER, so that 
probe could reallocate them the next time it is called. Apparently that 
was wrong. Do you know what would the right approach be in this case? 
Does the kernel preserve the device structure and its associated data 
between the two calls to probe? If so, I could just check whether the 
private data has already been constructed to know which state we are in 
and continue from there.

Thanks,
Alex.
