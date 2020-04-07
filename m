From: sumitg <sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [TEGRA194_CPUFREQ Patch v2 2/3] cpufreq: Add Tegra194 cpufreq
 driver
Date: Wed, 8 Apr 2020 00:25:38 +0530
Message-ID: <538ddcf4-b760-a342-eab6-5a61c9bd860a@nvidia.com>
References: <1586028547-14993-1-git-send-email-sumitg@nvidia.com>
 <1586028547-14993-3-git-send-email-sumitg@nvidia.com>
 <67f9feb1-ba51-f1ac-b6eb-4587924d0748@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <67f9feb1-ba51-f1ac-b6eb-4587924d0748-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, rjw-LthD3rsA81gm4RdzfppkhA@public.gmane.org, viresh.kumar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, catalin.marinas-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, talho-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-pm-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: bbasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, sumitg-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org



On 05/04/20 7:35 PM, Dmitry Osipenko wrote:
> External email: Use caution opening links or attachments
>=20
>=20
> 04.04.2020 22:29, Sumit Gupta =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
> ...
>> +static void tegra_read_counters(struct work_struct *work)
>> +{
>> +     struct read_counters_work *read_counters_work;
>> +     struct tegra_cpu_ctr *c;
>> +     u64 val;
>> +
>> +     /*
>> +      * ref_clk_counter(32 bit counter) runs on constant clk,
>> +      * pll_p(408MHz).
>> +      * It will take =3D 2 ^ 32 / 408 MHz to overflow ref clk counter
>> +      *              =3D 10526880 usec =3D 10.527 sec to overflow
>> +      *
>> +      * Like wise core_clk_counter(32 bit counter) runs on core clock.
>> +      * It's synchronized to crab_clk (cpu_crab_clk) which runs at
>> +      * freq of cluster. Assuming max cluster clock ~2000MHz,
>> +      * It will take =3D 2 ^ 32 / 2000 MHz to overflow core clk counter
>> +      *              =3D ~2.147 sec to overflow
>> +      */
>> +     read_counters_work =3D container_of(work, struct read_counters_wor=
k,
>> +                                       work);
>> +     c =3D &read_counters_work->c;
>> +
>> +     val =3D read_freq_feedback();
>> +     c->last_refclk_cnt =3D lower_32_bits(val);
>> +     c->last_coreclk_cnt =3D upper_32_bits(val);
>> +     udelay(c->delay);
>> +     val =3D read_freq_feedback();
>> +     c->refclk_cnt =3D lower_32_bits(val);
>> +     c->coreclk_cnt =3D upper_32_bits(val);
>> +}
>> +
>> +/*
>> + * Return instantaneous cpu speed
>> + * Instantaneous freq is calculated as -
>> + * -Takes sample on every query of getting the freq.
>> + *   - Read core and ref clock counters;
>> + *   - Delay for X us
>> + *   - Read above cycle counters again
>> + *   - Calculates freq by subtracting current and previous counters
>> + *     divided by the delay time or eqv. of ref_clk_counter in delta ti=
me
>> + *   - Return Kcycles/second, freq in KHz
>> + *
>> + *   delta time period =3D x sec
>> + *                     =3D delta ref_clk_counter / (408 * 10^6) sec
>> + *   freq in Hz =3D cycles/sec
>> + *              =3D (delta cycles / x sec
>> + *              =3D (delta cycles * 408 * 10^6) / delta ref_clk_counter
>> + *   in KHz     =3D (delta cycles * 408 * 10^3) / delta ref_clk_counter
>> + *
>> + * @cpu - logical cpu whose freq to be updated
>=20
>=20
>> + * Returns freq in KHz on success, 0 if cpu is offline
>=20
> I don't see any checks in the code about whether CPU is offline.
>=20
> Googling for "queue_work_on offline cpu" suggests that this function
> should hang.
>=20
Tried this and didn't get crash or hang.
show_cpuinfo_cur_freq() returns "<unknown>" value on reading frequency=20
from a cluster having both it's cores offline.
If only one cpu is offline, then frequency of other online cpu which is=20
managing the policy of that cluster is returned.
Have still added below check as guard in get|set() freq calls.
	if (!cpu_online(cpu))
		return -EINVAL;
Thankyou for the input.

>> + */
>> +static unsigned int tegra194_get_speed_common(u32 cpu, u32 delay)
>> +{
>> +     struct read_counters_work read_counters_work;
>> +     struct tegra_cpu_ctr c;
>> +     u32 delta_refcnt;
>> +     u32 delta_ccnt;
>> +     u32 rate_mhz;
>> +
>> +     read_counters_work.c.cpu =3D cpu;
>> +     read_counters_work.c.delay =3D delay;
>> +     INIT_WORK_ONSTACK(&read_counters_work.work, tegra_read_counters);
>> +     queue_work_on(cpu, read_counters_wq, &read_counters_work.work);
>> +     flush_work(&read_counters_work.work);
>> +     c =3D read_counters_work.c;
>> +
>> +     if (c.coreclk_cnt < c.last_coreclk_cnt)
>> +             delta_ccnt =3D c.coreclk_cnt + (MAX_CNT - c.last_coreclk_c=
nt);
>> +     else
>> +             delta_ccnt =3D c.coreclk_cnt - c.last_coreclk_cnt;
>> +     if (!delta_ccnt)
>> +             return 0;
>> +
>> +     /* ref clock is 32 bits */
>> +     if (c.refclk_cnt < c.last_refclk_cnt)
>> +             delta_refcnt =3D c.refclk_cnt + (MAX_CNT - c.last_refclk_c=
nt);
>> +     else
>> +             delta_refcnt =3D c.refclk_cnt - c.last_refclk_cnt;
>> +     if (!delta_refcnt) {
>> +             pr_debug("cpufreq: %d is idle, delta_refcnt: 0\n", cpu);
>> +             return 0;
>> +     }
>> +     rate_mhz =3D ((unsigned long)(delta_ccnt * REF_CLK_MHZ)) / delta_r=
efcnt;
>> +
>> +     return (rate_mhz * KHZ); /* in KHz */
>> +}
>=20
