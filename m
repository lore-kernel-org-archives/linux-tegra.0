From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: add connection name for uart clock table
Date: Tue, 18 Dec 2012 12:35:25 +0530
Message-ID: <50D015B5.8050805@nvidia.com>
References: <1355746101-15291-1-git-send-email-ldewangan@nvidia.com> <1355746101-15291-3-git-send-email-ldewangan@nvidia.com> <50CF9233.3010506@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50CF9233.3010506-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 18 December 2012 03:14 AM, Stephen Warren wrote:
> On 12/17/2012 05:08 AM, Laxman Dewangan wrote:
>> Add connection name "uart-clk" for the uart clock information.
> Does the UART receive more than one clock, so that it actually cares
> what the clock connection name is? If not, can we just drop this patch?

I like to have this patch because:
- In future, I want to also get the name of the clock source and set 
parent of uart clock properly.
- I want to switch the parent clock source dynamically between CLKM and 
PLLP to achieve more power optimization i.e. use CLKM wherever possible..
