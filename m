From: sumitg <sumitg@nvidia.com>
Subject: Re: [TEGRA194_CPUFREQ Patch 2/3] cpufreq: Add Tegra194 cpufreq driver
Date: Wed, 4 Dec 2019 16:25:57 +0530
Message-ID: <7347caa6-43a3-f761-de83-481b45f7b22a@nvidia.com>
References: <1575394348-17649-1-git-send-email-sumitg@nvidia.com>
 <1575394348-17649-2-git-send-email-sumitg@nvidia.com>
 <20191204054043.o4ff7pnqec3fwdgu@vireshk-i7>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <20191204054043.o4ff7pnqec3fwdgu@vireshk-i7>
Content-Language: en-US
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: bbasu@nvidia.com, linux-pm@vger.kernel.org, catalin.marinas@arm.com, rjw@rjwysocki.net, linux-kernel@vger.kernel.org, jonathanh@nvidia.com, talho@nvidia.com, thierry.reding@gmail.com, linux-tegra@vger.kernel.org, mperttunen@nvidia.com, will@kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Hi Viresh,

On 04/12/19 11:10 AM, Viresh Kumar wrote:
> Hi Sumit,
>
> On 03-12-19, 23:02, Sumit Gupta wrote:
>> Add support for CPU frequency scaling on Tegra194. The frequency
>> of each core can be adjusted by writing a clock divisor value to
>> an MSR on the core. The range of valid divisors is queried from
>> the BPMP.
>>
>> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
>> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
>> ---
>>   drivers/cpufreq/Kconfig.arm        |   6 +
>>   drivers/cpufreq/Makefile           |   1 +
>>   drivers/cpufreq/tegra194-cpufreq.c | 423 +++++++++++++++++++++++++++++++++++++
>>   3 files changed, 430 insertions(+)
>>   create mode 100644 drivers/cpufreq/tegra194-cpufreq.c
> Overall these are the things that you are doing here in the driver:
>
> - open coded clk_{get|set}_rate(), why can't you implement a clock
>    driver for the CPU and use the clk framework? You may not need the
>    (hacky) work-queue usage then probably.

In T194, CCPLEX doesn't have access to set clocks and the

clk_{get|set}_rate() functions set clocks by hook to BPMP R5.

CPU freq can be directly set by CCPLEX using MSR(NVFREQ_REQ_EL1).

As DVFS run's on BPMP, another MSR (NVFREQ_FEEDBACK_EL1) is

used to read the counters and calculate "actual" cpu freq at CCPLEX.

So, "cpuinfo_cur_freq" node gives the actual cpu frequency and not

given by node "scaling_cur_freq".

>
> - populating cpufreq table, you can probably add OPPs instead using
>    the same mechanism

We are reading available frequencies from BPMP to populate

cpufreq table and not using static opp table.

>
> - And then you can reuse the cpufreq-dt driver for your platform as
>    well, as is the case for few other tegra platforms.
>
