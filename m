From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V2 2/2] pinctrl: tegra: Add driver to configure voltage
 and power of io pads
Date: Tue, 22 Nov 2016 13:45:21 +0530
Message-ID: <5833FE99.2020004@nvidia.com>
References: <1478696782-11657-1-git-send-email-ldewangan@nvidia.com> <1478696782-11657-3-git-send-email-ldewangan@nvidia.com> <29e19381-9250-3059-b083-49e8ab56ea7f@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <29e19381-9250-3059-b083-49e8ab56ea7f-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, mark.rutland-5wv7dgnIgG8@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, yamada.masahiro-uWyLwvC0a2jby3iVrkZq2A@public.gmane.org, linux-gpio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 22 November 2016 02:31 AM, Jon Hunter wrote:
> On 09/11/16 13:06, Laxman Dewangan wrote:
> +	_entry_(32, "uart", UART, true, "vddio-uart"),		\
> +	_entry_(33, "usb0", USB0, true, NULL),			\
> +	_entry_(34, "usb1", USB1, true, NULL),			\
> +	_entry_(35, "usb2", USB2, true, NULL),			\
> +	_entry_(36, "usb3", USB3, true, NULL),			\
> +	_entry_(37, "usb-bias", USB_BIAS, true, NULL)
> Can you also fix these checkpatch errors ...
>
> ERROR: Macros with complex values should be enclosed in parentheses
> #424: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:350:
>
> ERROR: Macros with complex values should be enclosed in parentheses
> #456: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:382:

I can fix this but will still have the error as:

CHECK: Macro argument reuse '_entry_' - possible side-effects?
#425: FILE: drivers/pinctrl/tegra/pinctrl-tegra-io-pad.c:425:


And there is no better way to fix this.
