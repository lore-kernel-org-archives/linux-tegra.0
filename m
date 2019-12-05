From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Thu, 5 Dec 2019 15:55:45 +0300
Message-ID: <c26ed467-0e30-900b-4e69-762ee83e8377@gmail.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20191204054043.o4ff7pnqec3fwdgu@vireshk-i7>
 <7347caa6-43a3-f761-de83-481b45f7b22a@nvidia.com>
 <20191204112749.jkwlyteal4hfvnhb@vireshk-i7>
 <0b634341-ea2b-e9cd-4986-dc9a01c839bb@gmail.com>
 <20191205025125.imxnao2qwyons5zl@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191205025125.imxnao2qwyons5zl@vireshk-i7>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: sumitg <sumitg@nvidia.com>, rjw@rjwysocki.net, catalin.marinas@arm.com, will@kernel.org, thierry.reding@gmail.com, jonathanh@nvidia.com, talho@nvidia.com, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, bbasu@nvidia.com, mperttunen@nvidia.com
List-Id: linux-tegra@vger.kernel.org

05.12.2019 05:51, Viresh Kumar пишет:
> On 04-12-19, 16:57, Dmitry Osipenko wrote:
>> 04.12.2019 14:27, Viresh Kumar пишет:
>>> On 04-12-19, 16:25, sumitg wrote:
>>>> In T194, CCPLEX doesn't have access to set clocks and the
>>>>
>>>> clk_{get|set}_rate() functions set clocks by hook to BPMP R5.
>>>>
>>>> CPU freq can be directly set by CCPLEX using MSR(NVFREQ_REQ_EL1).
>>>>
>>>> As DVFS run's on BPMP, another MSR (NVFREQ_FEEDBACK_EL1) is
>>>>
>>>> used to read the counters and calculate "actual" cpu freq at CCPLEX.
>>>>
>>>> So, "cpuinfo_cur_freq" node gives the actual cpu frequency and not
>>>>
>>>> given by node "scaling_cur_freq".
>>>
>>> Right, but why can't this be hidden in the CPU's clk driver instead,
>>> so cpufreq driver can just do clk_get_rate() and clk_set_rate() ?
>>
>> What about to make use of dev_pm_opp_register_set_opp_helper()?
> 
> It has a different purpose where we have to play with different
> regulators. And that won't help with clk_get_rate() anyway.

Indeed that won't help with the clk.
