From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/2] ARM: tegra: add ams AS3722 device to Venice2 DT
Date: Wed, 18 Dec 2013 13:55:16 -0700
Message-ID: <52B20BB4.50506@wwwdotorg.org>
References: <1387371179-16725-1-git-send-email-ldewangan@nvidia.com> <1387371179-16725-2-git-send-email-ldewangan@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1387371179-16725-2-git-send-email-ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/18/2013 05:52 AM, Laxman Dewangan wrote:
> Add ams AS3722 entry for gpio/pincontrol and regulators
> to venice2 DT.

This patch still causes:

> [    0.726545] as3722-pinctrl as3722-pinctrl: pin gpio0 already requested by as3722-pinctrl; cannot claim for as3722-regulator
> [    0.737681] as3722-pinctrl as3722-pinctrl: pin-0 (as3722-regulator) status -22
> [    0.744895] as3722-pinctrl as3722-pinctrl: could not request pin 0 (gpio0) from group gpio0  on device as3722-pinctrl
> [    0.755500] as3722-regulator as3722-regulator: Error applying setting, reverse things back
