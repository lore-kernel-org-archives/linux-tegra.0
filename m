From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Tegra gpio driver: Need to configure pins in gpio mode/nontristate
 with  gpio-request
Date: Thu, 5 May 2011 15:46:45 +0530
Message-ID: <96C9D994977DD0439FB6D3FE3B13DD906B1331B068@BGMAIL01.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi All,
When working on gpio driver for tegra, I found that gpio_request() does not
make the corresponding soc pins to gpio mode. It still keeps the pins in SFIO mode.
So we need to call two extra function along with gpio_request():
Tegra_gpio_enable() and function for setting the pins in no non-tristate.

Sue to this, the gpio sysfs interface does not work properly from user space /sys/class/gpio/.
To make the pin in gpio mode fom user space, need to have changes in kernel.

I think the gpio_request() should make the pins to gpio mode and make ready for use.
Similarly gpio_free() should again put the pin into sfio mode with tristate disable.

Please comment if there is any better way..


Thanks,
Laxman
