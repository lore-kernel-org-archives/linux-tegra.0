From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 20/24] PM / devfreq: tegra30: Optimize upper average
 watermark selection
Date: Fri, 19 Jul 2019 05:21:11 +0300
Message-ID: <20190719052111.6641285d@dimatab>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223619epcas4p333f556dcf5a477b5cad5c9362a6f9b97@epcas4p3.samsung.com>
        <20190707223303.6755-21-digetx@gmail.com>
        <e3358039-d1b3-a5a0-1a37-aeb8edd49d6b@samsung.com>
        <20190719045943.73b53e31@dimatab>
        <1cec80ae-c03e-98a7-1d9f-6b57690610c7@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1cec80ae-c03e-98a7-1d9f-6b57690610c7@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=D0=92 Fri, 19 Jul 2019 11:06:05 +0900
Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 19. 7. 19. =EC=98=A4=EC=A0=84 10:59, Dmitry Osipenko wrote:
> > =D0=92 Fri, 19 Jul 2019 10:36:30 +0900
> > Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> >  =20
> >> On 19. 7. 8. =EC=98=A4=EC=A0=84 7:32, Dmitry Osipenko wrote: =20
> >>> I noticed that CPU may be crossing the dependency threshold very
> >>> frequently for some workloads and this results in a lot of
> >>> interrupts which could be avoided if MCALL client is keeping
> >>> actual EMC frequency at a higher rate.
> >>>
> >>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> >>> ---
> >>>  drivers/devfreq/tegra30-devfreq.c | 23 ++++++++++++++++++-----
> >>>  1 file changed, 18 insertions(+), 5 deletions(-)
> >>>
> >>> diff --git a/drivers/devfreq/tegra30-devfreq.c
> >>> b/drivers/devfreq/tegra30-devfreq.c index
> >>> c3cf87231d25..4d582809acb6 100644 ---
> >>> a/drivers/devfreq/tegra30-devfreq.c +++
> >>> b/drivers/devfreq/tegra30-devfreq.c @@ -314,7 +314,8 @@ static
> >>> void tegra_actmon_get_lower_upper(struct tegra_devfreq *tegra, }
> >>> =20
> >>>  static void tegra_devfreq_update_avg_wmark(struct tegra_devfreq
> >>> *tegra,
> >>> -					   struct
> >>> tegra_devfreq_device *dev)
> >>> +					   struct
> >>> tegra_devfreq_device *dev,
> >>> +					   unsigned long freq)
> >>>  {
> >>>  	unsigned long avg_threshold, lower, upper;
> >>> =20
> >>> @@ -323,6 +324,15 @@ static void
> >>> tegra_devfreq_update_avg_wmark(struct tegra_devfreq *tegra,
> >>> avg_threshold =3D dev->config->avg_dependency_threshold;
> >>> avg_threshold =3D avg_threshold * ACTMON_SAMPLING_PERIOD;=20
> >>> +	/*
> >>> +	 * If cumulative EMC frequency selection is higher than
> >>> the
> >>> +	 * device's, then there is no need to set upper watermark
> >>> to
> >>> +	 * a lower value because it will result in unnecessary
> >>> upper
> >>> +	 * interrupts.
> >>> +	 */
> >>> +	if (freq * ACTMON_SAMPLING_PERIOD > upper)
> >>> +		upper =3D freq * ACTMON_SAMPLING_PERIOD;   =20
> >>
> >> Also, 'upper value is used on the patch5. You can combine this code
> >> to patch5 or if this patch depends on the cpu notifier, you can
> >> combine it to the patch of adding cpu notifier without separate
> >> patch. =20
> >=20
> > Well okay, I'll try to squash some of the patches in the next
> > revision. Usually I'm receiving comments in the other direction,
> > asking to separate patches into smaller changes ;) So that's more a
> > personal preference of each maintainer, I'd say.
> >  =20
>=20
> Right. We have to make the patch with atomic attribute.
> But, if there are patches which touch the same code
> in the same patchset. We can squash or do refactorig
> of this code.

The main benefit of having smaller logical changes is that when there is
a bug, it's easier to narrow down the offending change using bisection.
And it's just easier to review smaller patches, of course.

> And also, if possible, I'd like you to make the patch
> list according to the role of patch. For example,
> the patches related to the 'watermark' could be sequentially
> listed. But, it is not forced opinion. If just possible.

Okay, will take this into account.
