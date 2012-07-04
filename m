From: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Subject: Re: [PATCH] pwm-backlight: add regulator and GPIO support
Date: Wed, 4 Jul 2012 13:27:33 +0100
Message-ID: <20120704122733.GA30698@sirena.org.uk>
References: <1340976167-27298-1-git-send-email-acourbot@nvidia.com>
 <20120704104840.GJ24458@pengutronix.de>
 <4FF43692.2040805@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <4FF43692.2040805-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-fbdev-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 04, 2012 at 09:26:58PM +0900, Alex Courbot wrote:
> On 07/04/2012 07:48 PM, Sascha Hauer wrote:>> +

> > This looses several resources allocated earlier, like the enable gpio
> > and the pwm. This is really bad here since I have no regulator specified
> > and devm_regulator_get returns with -EPROBE_DEFER. Next time the core
> > tries to probe the driver the driver bails out because the gpio and the
> > pwm is already requested.

> That's very bad indeed. I assumed that the kernel would free
> devm-allocated resources after probe returned -EPROBE_DEFER, so that
> probe could reallocate them the next time it is called. Apparently
> that was wrong. Do you know what would the right approach be in this
> case? Does the kernel preserve the device structure and its
> associated data between the two calls to probe? If so, I could just
> check whether the private data has already been constructed to know
> which state we are in and continue from there.

I'd really expect the devm_ functions to behave as you expect - if they
don't currently we should probably fix them so that they do otherwise
we're going to be in for a lot of surprises and probe deferral becomes a
lot more cumbersome to use.
