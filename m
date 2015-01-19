From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra20: Store CPU "resettable" status in IRAM
Date: Mon, 19 Jan 2015 21:26:10 +0300
Message-ID: <54BD4C42.6090407@gmail.com>
References: <1421319545-23920-1-git-send-email-digetx@gmail.com> <1421319545-23920-2-git-send-email-digetx@gmail.com> <20150119141224.GF23778@ulmo.nvidia.com> <54BD3E3E.2040801@wwwdotorg.org> <54BD41D3.7030703@gmail.com> <54BD42D0.3020107@wwwdotorg.org> <54BD4626.70902@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BD4626.70902-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

19.01.2015 21:00, Dmitry Osipenko =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> 19.01.2015 20:45, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 01/19/2015 10:41 AM, Dmitry Osipenko wrote:
>>> 19.01.2015 20:26, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> Hopefully this works out. I suppose it's unlikely anyone will be
>>>> running code on
>>>> the AVP upstrem, so any potential conflict with AVP's usage of IRA=
M
>>>> isn't likely
>>>> to occur.
>>>>
>>> I don't see how it can conflict with AVP code. First KB of IRAM is
>>> reserved for reset handler. Am I missing something?
>>>
>>>  From reset.h:
>>>
>>> /* The first 1K of IRAM is permanently reserved for the CPU reset
>>> handler */
>>
>> I believe "CPU" in that context means AVP CPU. Still, I may not be c=
orrect, and
>> to be honest it's likely not too well defined even if that comment s=
eems
>> clear-cut.
>>
> Hmm... Suddenly I recalled that LP2 was always disabled in downstream=
 kernel. I
> remember that I tried it once (couple years ago) and it didn't work, =
however I
> presume it was just broken. Now I don't feel good with it.
>
Can't generic RAM be used for "resettable" status? Or it will be too sl=
ow?...

CPU1 always come up after CPU0, so RAM is already init'ed. Given that C=
PU0 can't=20
be halted with running CPU1, I suppose CPU1 can't be booted first, righ=
t? Anyway=20
it's not the case for linux.

--=20
Dmitry
