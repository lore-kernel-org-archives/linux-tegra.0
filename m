From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Mon, 12 Jan 2015 21:04:09 +0300
Message-ID: <54B40C99.4020907@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com> <54B0017E.2060509@codethink.co.uk> <54B0028C.8050802@gmail.com> <54B00C58.3070303@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B00C58.3070303-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.01.2015 20:14, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 09/01/15 16:32, Dmitry Osipenko wrote:
>> 09.01.2015 19:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 09/01/15 15:46, Dmitry Osipenko wrote:
>>>> What about suspend/cpuidle? Won't it make sense to set BE mode in =
reset handler?
>>>
>>> I did try adding:
>>>
>>>      ARM_BE8(setend    be)
>>>
>>> to the entry point within reset-handler.S, but to no avail. There a=
re
>>> definitely problems with suspend, which currently I can work around=
 by
>>> turning off ARCH_SUSPEND_POSSIBLE. More investigation is going to b=
e
>>> needed to get the sleep/suspend working.
>>>
>>
>> Yeah, just noticed that it mentioned in cover letter.
>
> I had a look through the code and it was not easy to work out what
> was going on so skipped over it. We decided to leave it out of the
> initial submission as we can get a workable system without suspend.
>
> The suspend/resume code does make accesses to registers, and all
> these will need to be found and have the correct endian conversion
> done (stores will be in big-endian but the hardware registers stay
> little endian)
>
I fixed cpuidle and suspend for tegra2, it involved fixing reset handle=
r, sleep=20
and l2 cache resume asm code. Also fixed tegra timer and i2c drivers in=
 order to=20
get booting. Unfortunately I don't have tegra3 hw nor support for it in=
 QEMU,=20
however cpuidle should work I suppose. I'll post patches later.

https://dl.dropboxusercontent.com/u/3913472/IMG_20150112_202034.jpg


--=20
Dmitry
