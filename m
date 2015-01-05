From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH tegra-pinmux-scripts 1/2] fix kernel dt generation for
 Tegra 3
Date: Mon, 05 Jan 2015 15:07:55 -0700
Message-ID: <54AB0B3B.3@wwwdotorg.org>
References: <1420494447-18510-1-git-send-email-dev@lynxeye.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1420494447-18510-1-git-send-email-dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/05/2015 02:47 PM, Lucas Stach wrote:
> There is no attribute rcv_sel on Tegra 3.

> diff --git a/board-to-kernel-dt.py b/board-to-kernel-dt.py

> -    if pincfg.gpio_pin.rcv_sel:
> +    if hasattr(pincfg.gpio_pin, 'rcv_sel') and pincfg.gpio_pin.rcv_sel:

It might be slightly simpler to do:

if pincfg.gpio_pin.get('rcv_sel', false):

?
