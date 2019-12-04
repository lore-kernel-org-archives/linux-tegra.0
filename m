From: Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Wed, 4 Dec 2019 16:57:49 +0530
Message-ID: <20191204112749.jkwlyteal4hfvnhb@vireshk-i7>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20191204054043.o4ff7pnqec3fwdgu@vireshk-i7>
 <7347caa6-43a3-f761-de83-481b45f7b22a@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <7347caa6-43a3-f761-de83-481b45f7b22a@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: sumitg <sumitg@nvidia.com>
Cc: rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

On 04-12-19, 16:25, sumitg wrote:
> In T194, CCPLEX doesn't have access to set clocks and the
> 
> clk_{get|set}_rate() functions set clocks by hook to BPMP R5.
> 
> CPU freq can be directly set by CCPLEX using MSR(NVFREQ_REQ_EL1).
> 
> As DVFS run's on BPMP, another MSR (NVFREQ_FEEDBACK_EL1) is
> 
> used to read the counters and calculate "actual" cpu freq at CCPLEX.
> 
> So, "cpuinfo_cur_freq" node gives the actual cpu frequency and not
> 
> given by node "scaling_cur_freq".

Right, but why can't this be hidden in the CPU's clk driver instead,
so cpufreq driver can just do clk_get_rate() and clk_set_rate() ?

> > 
> > - populating cpufreq table, you can probably add OPPs instead using
> >    the same mechanism
> 
> We are reading available frequencies from BPMP to populate
> 
> cpufreq table and not using static opp table.

Right and lot of other platforms read it from firmware (I believe BBMP
is a firmware here), and create OPPs at runtime. Look at this for
example:

drivers/cpufreq/qcom-cpufreq-hw.c

and search for dev_pm_opp_add().

-- 
viresh
