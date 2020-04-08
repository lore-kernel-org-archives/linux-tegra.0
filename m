From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Wed, 8 Apr 2020 11:23:01 +0530
Message-ID: <20200408055301.jhvu5bc2luu3b5qr@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20200326115023.xy3n5bl7uetuw7mx@vireshk-i7>
 <d233b26b-6b50-7d41-9f33-a5dc151e0e7d@nvidia.com>
 <20200406025549.qfwzlk3745y3r274@vireshk-i7>
 <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org>
Content-Disposition: inline
In-Reply-To: <3ab4136c-8cca-c2f9-d286-b82dac23e720@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane-mx.org@lists.infradead.org
To: sumitg <sumitg@nvidia.com>
Cc: bbasu@nvidia.com, linux-pm@vger.kernel.org, catalin.marinas@arm.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, mperttunen@nvidia.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

On 07-04-20, 23:48, sumitg wrote:
> On 06/04/20 8:25 AM, Viresh Kumar wrote:
> > On 05-04-20, 00:08, sumitg wrote:
> > > On 26/03/20 5:20 PM, Viresh Kumar wrote:
> > > > On 03-12-19, 23:02, Sumit Gupta wrote:
> > > > > diff --git a/drivers/cpufreq/tegra194-cpufreq.c b/drivers/cpufreq/tegra194-cpufreq.c
> > > > > +static unsigned int tegra194_get_speed_common(u32 cpu, u32 delay)
> > > > > +{
> > > > > +     struct read_counters_work read_counters_work;
> > > > > +     struct tegra_cpu_ctr c;
> > > > > +     u32 delta_refcnt;
> > > > > +     u32 delta_ccnt;
> > > > > +     u32 rate_mhz;
> > > > > +
> > > > > +     read_counters_work.c.cpu = cpu;
> > > > > +     read_counters_work.c.delay = delay;
> > > > > +     INIT_WORK_ONSTACK(&read_counters_work.work, tegra_read_counters);
> > > > > +     queue_work_on(cpu, read_counters_wq, &read_counters_work.work);
> > > > > +     flush_work(&read_counters_work.work);
> > > > 
> > > > Why can't this be done in current context ?
> > > > 
> > > We used work queue instead of smp_call_function_single() to have long delay.
> > 
> > Please explain completely, you have raised more questions than you
> > answered :)
> > 
> > Why do you want to have long delays ?
> > 
> Long delay value is used to have the observation window long enough for
> correctly reconstructing the CPU frequency considering noise.
> In next patch version, changed delay value to 500us which in our tests is
> considered reliable.

I understand that you need to put a udelay() while reading the freq from
hardware, that is fine, but why do you need a workqueue for that? Why can't you
just read the values directly from the same context ?

-- 
viresh
