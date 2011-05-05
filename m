From: Colin Cross <ccross-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: Tegra gpio driver: Need to configure pins in gpio
 mode/nontristate with gpio-request
Date: Thu, 5 May 2011 09:49:24 -0700
Message-ID: <BANLkTikFgc2Oe5BrOpzYkjs7wnMdfNY4_w@mail.gmail.com>
References: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068-kdsAE/FnitNDw2glCA4ptUEOCMrvLtNR@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, May 5, 2011 at 3:16 AM, Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> wrote:
> Hi All,
> When working on gpio driver for tegra, I found that gpio_request() does not
> make the corresponding soc pins to gpio mode. It still keeps the pins in SFIO mode.
> So we need to call two extra function along with gpio_request():
> Tegra_gpio_enable() and function for setting the pins in no non-tristate.
>
> Sue to this, the gpio sysfs interface does not work properly from user space /sys/class/gpio/.
> To make the pin in gpio mode fom user space, need to have changes in kernel.
>
> I think the gpio_request() should make the pins to gpio mode and make ready for use.
> Similarly gpio_free() should again put the pin into sfio mode with tristate disable.
>
> Please comment if there is any better way..

From Documentation/gpio.txt:
Note that requesting a GPIO does NOT cause it to be configured in any
way; it just marks that GPIO as in use.  Separate code must handle any
pin setup (e.g. controlling which pin the GPIO uses, pullup/pulldown).
