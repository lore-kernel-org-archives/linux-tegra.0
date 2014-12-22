From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: Use PMC scratch register 40 for tegra_resume()
 location store
Date: Mon, 22 Dec 2014 20:27:55 +0300
Message-ID: <5498549B.8070101@gmail.com>
References: <1419202392-1159-1-git-send-email-digetx@gmail.com> <54984429.8040905@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <54984429.8040905-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: stable-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Haojian Zhuang <haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sekhar Nori <nsekhar-l0cyMroinI0@public.gmane.org>, Stefano Stabellini <stefano.stabellini-mvvWK6WmYclDPfheJLI6IQ@public.gmane.org>, Christoffer Dall <christoffer.dall-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Shawn Guo <shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

22.12.2014 19:17, Stephen Warren =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> On 12/21/2014 03:52 PM, Dmitry Osipenko wrote:
>> Commit 7232398abc6a ("ARM: tegra: Convert PMC to a driver") changed
>> tegra_resume()
>> location storing from late to early and as result broke suspend on t=
egra20.
>> PMC scratch register 41 was used by tegra lp1 suspend core code for =
storing
>> physical memory address of common resume function and in the same ti=
me used by
>> tegra20 cpuidle driver for storing cpu1 "resettable" status, so it i=
mplied
>> strict order of scratch register use. Fix it by using scratch 40 ins=
tead of 41
>> for tegra_resume() location store.
>=20
> You likely can't simply change the PMC scratch register usage arbitra=
rily;
> specific registers are designated for specific purposes, and code out=
side the
> Linux kernel (bootloaders, LP0 resume code, secure monitors, etc.) ma=
y depend on
> those specific values being in those registers. Without significant r=
esearch,
> I'd suggest not changing the PMC scratch register usage.

Sure, that's why I asked to verify if scratch register 40 is in use in =
the
comment after commit message. I've checked that u-boot doesn't use it (=
since
upstream kernel doesn't care about any other bootloader), but no idea a=
bout
secure monitor. It's definitely safer to avoid changing scratch regs us=
age, I
thought that proposed solution would be best from the pure code point o=
f view.
So, I'm considering your answer as a rejection of the patch (please, le=
t me know
if I'm wrong) and will prepare another one. Btw, it would be nice to ha=
ve
scratch registers usage publicly documented somewhere (on "Tegra Public
Application Notes" webpage for example), if it's possible, of course.

--=20
Dmitry
