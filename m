From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 1/2] ARM: tegra: fix missing pincontrol configuration
 for Venice2
Date: Thu, 19 Dec 2013 12:44:24 +0530
Message-ID: <52B29CD0.1000801@nvidia.com>
References: <1387371179-16725-1-git-send-email-ldewangan@nvidia.com> <52B20C0D.9030200@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <52B20C0D.9030200-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org" <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "mark.rutland-5wv7dgnIgG8@public.gmane.org" <mark.rutland-5wv7dgnIgG8@public.gmane.org>, "linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org" <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 19 December 2013 02:26 AM, Stephen Warren wrote:
> On 12/18/2013 05:52 AM, Laxman Dewangan wrote:
>> Compare the initial population of default pinmux configuration of Venice2
>> with the chrome branch and add/fix the missing configurations.
> Wow, that's a big chunk of changes. Are you sure this is correct? Why
> was the original patch (which added the pinctrl nodes) so incorrect?

The pinmux which got added is based on the venice2 pinmux spreadsheet 
where I covered only the SFIO pin groups.

https://wiki.nvidia.com/engwiki/index.php/Platform_Design_Center/Projects_Archive/PM371#pinmux


After comparing with the chrome, I also added the pinmux for all pins 
which are used as GPIO and hence the change is big.
This is complete pinmux based on chrome kernel-next.
I booted chrome with this pinmux and not observe any behavioral change.

> Thierry, I thought you had mentioned comparing the pinctrl setup in
> linux-next with the downstream kernel for Venice2 and only found a
> difference in the PWM settings, which you sent a patch for. However,
> this patch is much larger than that. Where's the disconnect?
