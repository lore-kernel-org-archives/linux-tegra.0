From: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: cpu clock change latency
Date: Tue, 27 Sep 2011 21:31:46 +0200
Message-ID: <201109272131.46738.marvin24@gmx.de>
References: <201109231639.33651.marvin24@gmx.de> <CAMbhsRTiqLZ2bSefh-DnmDY0RB4JGkSmumh8Tt_7217BsHsa7Q@mail.gmail.com> <20110927153021.GA16150@sirena.org.uk>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20110927153021.GA16150-GFdadSzt00ze9xe1eoZjHA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tuesday 27 September 2011 17:30:22 Mark Brown wrote:
> On Fri, Sep 23, 2011 at 09:49:53AM -0700, Colin Cross wrote:
> > cpu-tegra.c says latency is 300 uS because relocking the CPU pll ha=
s a
> > udelay(300).  400 nS would just make the ondemand governor sample m=
ore
> > often than it means to.  I doubt changing it to 400 uS makes any
> > difference.
>=20
> The interactive effect of a higher transition latency with ondemand c=
an
> be rather visible.

True, given the 400 =B5s latency and the multiplier of 1000 we end up h=
aving=20
a sample_rate of the ondemand scheduler of 0.4 seconds, which is very=20
"feelable". My AMD desktop announces a 1 =B5s latency so the default sa=
mpling=20
rate is only 10 ms.=20

A transition latency of 400 ns will set the sampling_rate to 10 ms (the=
=20
minimum value allowed, so 10 =B5s would have the same effect).=20

So doing an "echo 40000 >=20
/sys/devices/system/cpu/cpufreq/ondemand/sampling_rate" is the best we =
can=20
do now and almost produces the same result as 10000.=20

We additionaly found that setting io_is_busy=3D1 improves the transfer =
rate=20
of the mmc by 50%.=20

> It's probably also worth mentioning that if there's regulators used f=
or
> voltage scaling the system really ought to be including latency for t=
hem
> in the estimate, for voltage increases the regulator needs to be upda=
ted
> prior to the SoC side starting off.

which would make things even worse :-(

Marc
