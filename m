From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 13/13] WIP: ARM: tegra: Add Tegra114 powergate support
Date: Wed, 16 Oct 2013 10:47:46 -0600
Message-ID: <525EC332.1010205@wwwdotorg.org>
References: <1381850883-12722-1-git-send-email-treding@nvidia.com> <1381850883-12722-14-git-send-email-treding@nvidia.com> <525DB8B2.2050203@wwwdotorg.org> <20131016104848.GE21963@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131016104848.GE21963-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/16/2013 04:48 AM, Thierry Reding wrote:
> On Tue, Oct 15, 2013 at 03:50:42PM -0600, Stephen Warren wrote:
>> On 10/15/2013 09:28 AM, Thierry Reding wrote:
>>> Extend the list of power gates found on Tegra114. Note that
>>> there are now holes in the list, so perhaps a simple array is
>>> no longer the best data structure to represent it. But perhaps
>>> this is good enough for now and can be cleaned up in a follow
>>> up patch?
>> 
>> Peter should probably comment on this, since I think he's touched
>> the powergate driver the most recently.
>> 
>> One idea might be to have the powergate IDs be "virtual", with a 
>> virtual->HW ID mapping table per SoC. The virtual IDs need not
>> have any gaps. I'm not sure that having gaps is really much of a
>> problem though, except for the debugfs code in powergate.c...
> 
> That sounds like a good idea. I'll see what I can come up with.
> 
>>> diff --git a/include/linux/tegra-powergate.h
>>> b/include/linux/tegra-powergate.h
>> 
>>> +#define TEGRA_POWERGATE_DISA	18 +#define TEGRA_POWERGATE_DISB
>>> 19
>> 
>> s/DIS/DSI/ perhaps?
> 
> No, these are actually powergates for display A and display B.

Ah, OK. Those entries aren't called DCA, DCB then, DC==Display Controller?

>>> -#define TEGRA_POWERGATE_CPU0	TEGRA_POWERGATE_CPU
>> 
>> I expect that was added deliberately. Perhaps Peter or Joseph
>> can comment? Admittedly, it's not used right now.
>> 
>> BTW, while you're fiddling with powergate.c, I note that 
>> mach-tegra/pmc.c #defines some TEGRA_POWERGATE_xxx rather than
>> including tegra-powergate.h. Can you fix that?
> 
> There's more: quite a bit of the powergate functionality seems to
> be implemented in both powergate.c and pmc.c. I should probably
> unify both while at it. Not sure if I can make it before the
> deadline on Thursday though, so I'll focus on the refactoring of
> the power domain stuff first because that's actually needed for
> Tegra114 support.

I think it'd be better to just drop the gr3d support, which is all
that requires the powergate rework, so we can plan this out a little
better.
