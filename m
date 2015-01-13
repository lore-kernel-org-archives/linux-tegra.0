From: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Subject: Re: [Linux-kernel] [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Tue, 13 Jan 2015 08:47:25 +0000
Message-ID: <54B4DB9D.2000807@codethink.co.uk>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com> <54B0017E.2060509@codethink.co.uk> <54B0028C.8050802@gmail.com> <54B00C58.3070303@codethink.co.uk> <54B40C99.4020907@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B40C99.4020907-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/01/15 18:04, Dmitry Osipenko wrote:
> 09.01.2015 20:14, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>> On 09/01/15 16:32, Dmitry Osipenko wrote:
>>> 09.01.2015 19:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>>> On 09/01/15 15:46, Dmitry Osipenko wrote:
>>>>> What about suspend/cpuidle? Won't it make sense to set BE mode in
>>>>> reset handler?
>>>>
>>>> I did try adding:
>>>>
>>>>      ARM_BE8(setend    be)
>>>>
>>>> to the entry point within reset-handler.S, but to no avail. There =
are
>>>> definitely problems with suspend, which currently I can work aroun=
d by
>>>> turning off ARCH_SUSPEND_POSSIBLE. More investigation is going to =
be
>>>> needed to get the sleep/suspend working.
>>>>
>>>
>>> Yeah, just noticed that it mentioned in cover letter.
>>
>> I had a look through the code and it was not easy to work out what
>> was going on so skipped over it. We decided to leave it out of the
>> initial submission as we can get a workable system without suspend.
>>
>> The suspend/resume code does make accesses to registers, and all
>> these will need to be found and have the correct endian conversion
>> done (stores will be in big-endian but the hardware registers stay
>> little endian)
>>
> I fixed cpuidle and suspend for tegra2, it involved fixing reset
> handler, sleep and l2 cache resume asm code. Also fixed tegra timer a=
nd
> i2c drivers in order to get booting. Unfortunately I don't have tegra=
3
> hw nor support for it in QEMU, however cpuidle should work I suppose.
> I'll post patches later.

Thank for this. I suggest submitting directly as there is no need
to make a coherent series of these.

--=20
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius
