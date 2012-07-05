From: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH] pwm-backlight: add regulator and GPIO support
Date: Thu, 5 Jul 2012 15:25:44 +0900
Message-ID: <4FF53368.6090805@nvidia.com>
References: <1340976167-27298-1-git-send-email-acourbot@nvidia.com> <20120704104840.GJ24458@pengutronix.de> <4FF43692.2040805@nvidia.com> <20120704130056.GC30009@pengutronix.de> <4FF45DDF.9000306@nvidia.com> <20120704152451.GA7333@sirena.org.uk> <4FF4FDC0.8020405@nvidia.com> <20120705062011.GI30009@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120705062011.GI30009-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>
Cc: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 07/05/2012 03:20 PM, Sascha Hauer wrote:
>> Oh, that is a mistake of mine then. Driver probe should continue if
>> no regulator is declared (but should fail if some other error
>> occured). I want to maintain backward compatibility with current
>> users of the driver, so regulator/gpio specification should be
>> optional.
>
> I think the only way doing this is to add a flag to platform_data. I
> don't know if that's accepted though.

I thought about just checking if devm_get_regulator returned -ENODEV and 
happily continue if that was the case, assuming no regulator was declared.

But anyway with the power sequences specification this problem becomes 
null, since regulators will have to be explicitly declared anyway. I 
might be flamed for putting a parser and interpreter into a backlight 
driver, but I'll take my chances. :)

Alex.
