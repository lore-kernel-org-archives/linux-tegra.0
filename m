From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [Resend] SHIELD (tegra114-roth) Serial Console UART
Date: Sat, 14 Feb 2015 00:14:51 +0200
Message-ID: <54DE775B.4020409@kapsi.fi>
References: <ABAE5648-C477-451F-ACF6-6314C8B198DB@ziswiler.com> <61E1CB06-407A-4F7E-B5D9-BCFA8B2CCE99@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <61E1CB06-407A-4F7E-B5D9-BCFA8B2CCE99-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marcel Ziswiler <marcel-mitwqZ+T+m9Wk0Htik3J/w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 02/14/2015 12:04 AM, Marcel Ziswiler wrote:
>
>
> Hi there
>
> Does by any chance anybody know how one can get a serial console UART on SHIELD (tegra114-roth)? I know there is some kind of a debug connector inside [1] similar to e.g. the one found on Cardhu albeit not assembled of course but is that pinout standardized?
>
> [1] https://d3nevzfk7ii3be.cloudfront.net/igi/TTSTtfTvwlwWfbhR.huge
>
> Cheers
>
> Marcel

I remember the actual debug pads being on the bottom side of the board 
on the right side of the SoC (i.e., right of the green rectangle on your 
picture). If you go that way, someone @nvidia.com can probably look up 
the UART pads for you. However, another way (that I used briefly) is to 
grab one of these:
http://store.r0ck.me/products/usd-breakout-board
and with some pinmux editing get a 3V3 serial port out of the microSD slot.

Cheers,
Mikko
