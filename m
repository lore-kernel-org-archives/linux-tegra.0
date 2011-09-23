From: Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: Re: cpu clock change latency
Date: Fri, 23 Sep 2011 09:49:53 -0700
Message-ID: <CAMbhsRTiqLZ2bSefh-DnmDY0RB4JGkSmumh8Tt_7217BsHsa7Q@mail.gmail.com>
References: <201109231639.33651.marvin24@gmx.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <201109231639.33651.marvin24-Mmb7MZpHnFY@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Fri, Sep 23, 2011 at 7:39 AM, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org> wrote:
> Hi,
>
> arch/arm/mach-tegra/cpu-tegra.c (as from nv-tegra.nvidia.com) contain=
s a some
> strange comment:
>
> =A0493 =A0 =A0 =A0 =A0 /* FIXME: what's the actual transition time? *=
/
> =A0494 =A0 =A0 =A0 =A0 policy->cpuinfo.transition_latency =3D 300 * 1=
000;
>
> The trees on chromeos.org (both, kernel and kernel-next) have:
>
> =A0392 =A0 =A0 =A0 =A0 /* cpu clock change latency: ~400us */
> =A0393 =A0 =A0 =A0 =A0 policy->cpuinfo.transition_latency =3D 400;
>
> because according to
>
> http://git.chromium.org/gitweb/?p=3Dchromiumos/third_party/kernel.git=
;a=3Dcommitdiff;h=3D6a4debe346f5946f4fab14b413885896b7cde324
>
> this improves latency of the GUI. Note that the comment said "us", wh=
ile the cpu
> transition latency is measured in "ns", so 400 * 1000 would be right.
>
> So either the comment is wrong (should be 400ns) or the patch is wron=
g (which is
> unlikely, because it improved latency in the testcase).
>
> Can someone comment on this?

cpu-tegra.c says latency is 300 uS because relocking the CPU pll has a
udelay(300).  400 nS would just make the ondemand governor sample more
often than it means to.  I doubt changing it to 400 uS makes any
difference.

> Thanks
>
> Marc
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra=
" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at =A0http://vger.kernel.org/majordomo-info.html
>
