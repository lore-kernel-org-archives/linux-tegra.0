From: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Subject: Re: [v3 2/2] ARM: tegra: Skip scu_enable(scu_base) if not Cortex A9
Date: Tue, 22 Jan 2013 09:04:46 -0800
Message-ID: <CAOesGMgtaCkiv285TU_vbAokN5M2MrANQ9piDcyXu5YMmbQq3A@mail.gmail.com>
References: <1358833924-24535-1-git-send-email-hdoyu@nvidia.com>
	<1358833924-24535-2-git-send-email-hdoyu@nvidia.com>
	<50FE2CA8.20100@ti.com>
	<50FEC503.2080602@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50FEC503.2080602-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, arnd-r2nGTMty4D4@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Tue, Jan 22, 2013 at 8:57 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
> On 01/21/2013 11:07 PM, Santosh Shilimkar wrote:
>> On Tuesday 22 January 2013 11:22 AM, Hiroshi Doyu wrote:
>>> Skip scu_enable(scu_base) if CPU is not Cortex A9 with SCU.
>>>
>>> Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>> ---
>> Looks fine. I will also update OMAP code with the new
>> interface. Thanks.
>
> OK, so patch 1/2 at least needs to get into a stable arm-soc branch
> then. Unless there are violent objections, I'll forward patch 1/2 to
> arm-soc and request it be added into a branch so that Tegra and OMAP can
> both merge it into their branches as a dependency. I guess patch 2/2
> could also be included; I don't think it has any complex dependencies
> that'd prevent that, and would help to show how patch 1/2 gets used.
>
> Hiroshi, is this series the only dependency you need for your Tegra114
> series? So, I could merge your Tegra114 series once this series is applied?

For something like this, it might make more sense for us to just apply
the patches for OMAP on top, i.e. we'll pull the short branch from
you, and then we can just apply patches (with maintainer acks) on top,
instead of doing a bunch of single-patch pulls.

Since Russell had comments on it earlier, I'd like him to give a nod
that he's happy with it too.


-Olof
