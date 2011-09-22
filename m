From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] i2c/tegra: I2C driver uses the suspend_noirq/resume_noirq
Date: Thu, 22 Sep 2011 17:28:08 +0200
Message-ID: <201109221728.09063.arnd@arndb.de>
References: <1312586102-27907-1-git-send-email-swarren@nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF04B3279D4F@HQMAIL01.nvidia.com> <74CDBE0F657A3D45AFBB94109FB122FF04B73215C9@HQMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <74CDBE0F657A3D45AFBB94109FB122FF04B73215C9-C7FfzLzN0UxDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-i2c-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Ben Dooks <ben-linux-elnMNo+KYs3YtjvyW6yDsg@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Dilan Lee <dilee-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-i2c-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 20 September 2011, Stephen Warren wrote:
> Stephen Warren wrote at Tuesday, August 30, 2011 10:25 AM:
> > Ben, Arnd,
> > 
> > Could you please ack/nack the patch at the start of this thread for Colin;
> > see below.
> 
> Ben, can you please comment on the acceptability of this patch?
> 
> Or Arnd, did Mark's most recent explanation of the situation provide enough
> context for you to ack/nak it?
> 

After looking through the discussion again, my feeling is that it's ok
and I think that Mark's word should count more than mine anyway on this
issue.

If you think it helps, you can add my Acked-by, but this is really
something for Ben to decide. Just resubmit the patch to Ben with an
an updated changelog that summarises the discussion, in case
Ben got bored already and put this mail thread into the ignore
folder...

	Arnd
