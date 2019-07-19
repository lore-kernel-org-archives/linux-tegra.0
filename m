From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 17/24] PM / devfreq: tegra30: Use tracepoints for
 debugging
Date: Fri, 19 Jul 2019 04:50:30 +0300
Message-ID: <20190719045030.30b2fe67@dimatab>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223623epcas4p13d01a60ae2b88dde4c4f7fdba04da170@epcas4p1.samsung.com>
        <20190707223303.6755-18-digetx@gmail.com>
        <209220ec-b677-3500-0e55-6cad57e97f88@samsung.com>
        <20190719034938.6382f989@dimatab>
        <ffa24275-4499-c27a-8c60-a5f4d738913c@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <ffa24275-4499-c27a-8c60-a5f4d738913c@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=D0=92 Fri, 19 Jul 2019 10:01:55 +0900
Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 19. 7. 19. =EC=98=A4=EC=A0=84 9:49, Dmitry Osipenko wrote:
> > =D0=92 Thu, 18 Jul 2019 18:47:09 +0900
> > Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> On 19. 7. 8. =EC=98=A4=EC=A0=84 7:32, Dmitry Osipenko wrote: =20
> >>> Debug messages create too much CPU and memory activity by
> >>> themselves, so it's difficult to debug lower rates and catch
> >>> unwanted interrupts that happen rarely. Tracepoints are ideal in
> >>> that regards because they do not contribute to the sampled date at
> >>> all. This allowed me to catch few problems which are fixed by the
> >>> followup patches, without tracepoints it would be much harder to
> >>> do.
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>  drivers/devfreq/tegra30-devfreq.c      |  43 +++-------
> >>>  include/trace/events/tegra30_devfreq.h | 105
> >>> +++++++++++++++++++++++++ 2 files changed, 117 insertions(+), 31
> >>> deletions(-) create mode 100644
> >>> include/trace/events/tegra30_devfreq.h   =20
> >>
> >> As I knew, 'include/trace/events' don't include the header file
> >> for only one device driver. Usually, the trace event is provided
> >> by framework instead of each devic driver. =20
> >=20
> > There are at least trace headers there for the tegra-apbdma,
> > tegra-host1x, intel-sst and intel-ish devices. I don't think that
> > there is a strict rule for the trace headers placement. =20
>=20
> OK.
>=20
> But, As I already replied on patch4, if you want to show the register
> dump, you better to add the debugfs feature to devfreq framework for
> showing the register dump instead of printing the register dump with
> debug level and this trace event.=20
>=20
> As I said, just register dump is not useful for all developers.
> Almost developer cannot understand the meaning of debug log for
> register dump.

I think there is some disconnect here. I'm finding that the raw
register values are essential for debugging of this driver. The
registers tracing is very trivial and self-explanatory, just can't see
any better variant.

The registers documentation is available for everyone, you can go to
NVIDIA website and download it (after registration).

We have registers tracing in other Tegra drivers, please see for the
quick example:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/staging/media/tegra-vde/trace.h
https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tree/dr=
ivers/gpu/drm/tegra/trace.h

It's the first time I'm seeing complains about debug tracing and
currently having hard time trying to understand yours point.

> Also, it is not proper way that front patch adds the some code
> and then later patch removes the additional code in the same series.
> Before sending the patches, you can renew them.

Okay.
