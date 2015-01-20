From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [Ct173-kernel-internal] [PATCH 0/4] ARM: tegra: Support for big-endian
 (version 3)
Date: Tue, 20 Jan 2015 16:18:17 +0300
Message-ID: <54BE5599.9060100@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <54BE2E77.9050909@codethink.co.uk> <54BE3DD2.1060204@gmail.com> <54BE3FC1.5010107@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8;
	format=flowed
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54BE3FC1.5010107-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Ben Dooks <ben.dooks-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, ct173-kernel-internal-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

20.01.2015 14:45, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 20/01/15 11:36, Dmitry Osipenko wrote:
>> 20.01.2015 13:31, Ben Dooks =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>> On 09/01/15 15:27, Bob Mottram wrote:
>>>> During testing of big-endian on a Jetson TK1 with baserock, the
>>>> following
>>>> issues were found and fixed. Note that to get the system running w=
ith
>>>> big-endian you will need to disable ARCH_SUSPEND_POSSIBLE within
>>>> arch/arm/Kconfig.
>>>>
>>>> Bob Mottram (4):
>>>>     ARM: tegra: Add a separate big-endian configuration
>>>>     ARM: gpio: tegra: Maintain endianness
>>>>     ARM: tegra: enable big-endian support
>>>>     ARM: tegra: fix big-endian issue with irq code
>>>
>>> Is it possible to get the tegra core patches applied? These seem to=
 work
>>> enough to get a system running and once the PM fixes are in there s=
hould
>>> be no problems running big-endian tegra?
>>>
>> I don't think it's enough. Upstream kernel doesn't accept half worki=
ng
>> solutions. It's not only PM that needs fixing, but i2c, timer, reset
>> handler and possibly more. You are enabling big-endian across all te=
gra
>> generations, but tegra2 won't boot at all for example. Patches must =
be
>> tested on all hw before applying. And nit: big-endian should be enab=
led
>> after all dependencies resolved.
>
> Ok, we hadn't found any issue with the reset. I thought we had the
> timer fix in this series. Most of the other drivers didn't use
> any __raw code so we're reasonably confident they will work.
>
> I didn't see any issues with the i2c from visual inspection, what's
> wrong with it in big endian?
>
I've sent patch.

--=20
Dmitry
