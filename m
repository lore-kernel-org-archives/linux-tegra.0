From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra gpio driver: Need to configure pins in gpio
 mode/nontristate with gpio-request
Date: Thu, 5 May 2011 11:21:21 -0700
Message-ID: <BANLkTin1Q4+WBRvsJ1bs_zx8fuExBaLw4g@mail.gmail.com>
References: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068@BGMAIL01.nvidia.com>
	<BANLkTikFgc2Oe5BrOpzYkjs7wnMdfNY4_w@mail.gmail.com>
	<96C9D994977DD0439FB6D3FE3B13DD906B1331B0BD@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD906B1331B0BD-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 5, 2011 at 11:18 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Then from user space using /sys/class/gpio sysfs interface, I can not make the pin to be
> gpio until I change the kernel code?

Yes, but that's normal.  We don't generally allow userspace to
override the kernel on things that could easily damage the board if it
does something wrong.
