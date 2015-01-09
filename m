From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: enable big-endian support
Date: Fri, 09 Jan 2015 19:32:12 +0300
Message-ID: <54B0028C.8050802@gmail.com>
References: <1420817231-8346-1-git-send-email-bob.mottram@codethink.co.uk> <1420817231-8346-4-git-send-email-bob.mottram@codethink.co.uk> <54AFF7E6.9030308@gmail.com> <54B0017E.2060509@codethink.co.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54B0017E.2060509-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bob Mottram <bob.mottram-4yDnlxn2s6sWdaTGBSpHTA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-kernel-81qHHgoATdFT9dQujB1mzip2UmYkHbXO@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

09.01.2015 19:27, Bob Mottram =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 09/01/15 15:46, Dmitry Osipenko wrote:
>> What about suspend/cpuidle? Won't it make sense to set BE mode in re=
set handler?
>=20
> I did try adding:
>=20
>     ARM_BE8(setend    be)
>=20
> to the entry point within reset-handler.S, but to no avail. There are
> definitely problems with suspend, which currently I can work around b=
y
> turning off ARCH_SUSPEND_POSSIBLE. More investigation is going to be
> needed to get the sleep/suspend working.
>=20

Yeah, just noticed that it mentioned in cover letter.

--=20
Dmitry
