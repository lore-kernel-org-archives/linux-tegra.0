From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 21/24] PM / devfreq: tegra30: Synchronize average
 count on target's update
Date: Fri, 19 Jul 2019 03:31:52 +0300
Message-ID: <20190719033152.1d4c3003@dimatab>
References: <20190707223303.6755-1-digetx@gmail.com>
        <CGME20190707223619epcas4p3dea48e3e09983cd2a76af39fbf7bf99b@epcas4p3.samsung.com>
        <20190707223303.6755-22-digetx@gmail.com>
        <f83fb873-9214-9649-9435-9f211c4cba9e@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f83fb873-9214-9649-9435-9f211c4cba9e@samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

=D0=92 Thu, 18 Jul 2019 19:15:54 +0900
Chanwoo Choi <cw00.choi@samsung.com> =D0=BF=D0=B8=D1=88=D0=B5=D1=82:

> On 19. 7. 8. =EC=98=A4=EC=A0=84 7:33, Dmitry Osipenko wrote:
> > The average count may get out of sync if interrupt was disabled /
> > avoided for a long time due to upper watermark optimization, hence
> > it should be re-synced on each target's update to ensure that
> > watermarks are set up correctly on EMC rate-change notification and
> > that a correct frequency is selected for device.
> >=20
> > Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> > ---
> >  drivers/devfreq/tegra30-devfreq.c | 30
> > ++++++++++++++++++++++++++++++ 1 file changed, 30 insertions(+)
> >=20
> > diff --git a/drivers/devfreq/tegra30-devfreq.c
> > b/drivers/devfreq/tegra30-devfreq.c index
> > 4d582809acb6..8a674fad26be 100644 ---
> > a/drivers/devfreq/tegra30-devfreq.c +++
> > b/drivers/devfreq/tegra30-devfreq.c @@ -466,11 +466,41 @@ static
> > void actmon_isr_device(struct tegra_devfreq *tegra,
> > dev->boost_freq, cpufreq_get(0)); }
> > =20
> > +static void tegra_devfreq_sync_avg_count(struct tegra_devfreq
> > *tegra,
> > +					 struct
> > tegra_devfreq_device *dev) +{
> > +	u32 avg_count, avg_freq, old_upper, new_upper;
> > +
> > +	avg_count =3D device_readl(dev, ACTMON_DEV_AVG_COUNT);
> > +	avg_freq =3D avg_count / ACTMON_SAMPLING_PERIOD;
> > +
> > +	old_upper =3D tegra_actmon_upper_freq(tegra, dev->avg_freq);
> > +	new_upper =3D tegra_actmon_upper_freq(tegra, avg_freq);
> > +
> > +	/* similar to ISR, see comments in actmon_isr_device() */
> > +	if (old_upper !=3D new_upper) {
> > +		dev->avg_freq =3D avg_freq;
> > +		dev->boost_freq =3D 0;
> > +	}
> > +}
> > +
> >  static unsigned long actmon_update_target(struct tegra_devfreq
> > *tegra, struct tegra_devfreq_device *dev)
> >  {
> >  	unsigned long target_freq;
> > =20
> > +	/*
> > +	 * The avg_count / avg_freq is getting snapshoted on
> > device's
> > +	 * interrupt, but there are cases where actual value need
> > to
> > +	 * be utilized on target's update, like CPUFreq boosting
> > and
> > +	 * overriding the min freq
> > via /sys/class/devfreq/devfreq0/min_freq
> > +	 * because we're optimizing the upper watermark based on
> > the
> > +	 * actual EMC frequency. This means that interrupt may be
> > +	 * inactive for a long time and thus making snapshoted
> > value
> > +	 * outdated.
> > +	 */
> > +	tegra_devfreq_sync_avg_count(tegra, dev); =20
>=20
> I think that you don't need to add the separate function to calculate
> the 'dev->avg_freq'. It is enough with your detailed comment to add
> this code in this function.

The separate function is indeed not mandatory here, but I'm finding that
it usually makes easier to read and follow the code when it is properly
split up into logical blocks. Don't you agree?

> > +
> >  	target_freq =3D min(dev->avg_freq + dev->boost_freq,
> > KHZ_MAX); target_freq =3D tegra_actmon_account_cpu_freq(tegra, dev,
> > target_freq);=20
> >  =20
>=20
> And also, is it impossible to squash this patch with patch19/patch20?
>=20

It should be possible to squash this patch with #20, but wouldn't
be better to keep changes in the chronological order? It's also better
to keep changes separate simply to aid bisection in case of a problem.
