From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH] irqchip: gic: call gic_cpu_init() as well in CPU_STARTING_FROZEN case
Date: Thu, 20 Jun 2013 14:52:33 +0200
Message-ID: <201306201452.33884.arnd@arndb.de>
References: <1371036627-13529-1-git-send-email-shawn.guo@linaro.org> <20130619070253.GA3405@S2101-09.ap.freescale.net> <1371694169.2155.12.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1371694169.2155.12.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, "arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org" <arm-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Catalin Marinas <catalin.marinas-5wv7dgnIgG8@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Thursday 20 June 2013, Joseph Lo wrote:
> > > 
> > > Can you please send the fix for 3.10?  Or are you fine with that I ask
> > > arm-soc folks to send it?
> > 
> > Arnd, Olof,
> > 
> > Can you help send the fix for 3.10?
> > 
> Shawn's patch fix the suspend/resume regression for Tegra also.
> 
> Tested-by: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Applied to fixes branch.

	Arnd
