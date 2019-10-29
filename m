From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 00/17] NVIDIA Tegra20 CPUFreq driver major update
Date: Tue, 29 Oct 2019 17:41:22 +0300
Message-ID: <374c3916-7c25-d684-0506-4c3992fa5241@gmail.com>
References: <20191024221416.14197-1-digetx@gmail.com>
 <20191029140959.GL508460@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191029140959.GL508460@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

29.10.2019 17:09, Thierry Reding пишет:
> On Fri, Oct 25, 2019 at 01:13:59AM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series moves intermediate-clk handling from tegra20-cpufreq into
>> tegra-clk driver, this allows us to switch to generic cpufreq-dt driver
>> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
>> of the box. All boards need to adopt CPU OPPs in their device-trees in
>> order to get cpufreq support. This series adds OPPs only to selective
>> boards because there is assumption in a current device-trees that CPU
>> voltage is set for 1GHz freq and this won't work for those CPUs that
>> can go over 1GHz and thus require voltage regulators to be set up for
>> voltage scaling support (CC'ed Marcel for Toradex boards). We could
>> probably add delete-node for OPPs over 1GHz if there are not actively
>> maintained boards.
>>
>> NOTE(!): the voltage scaling functionality depends on a reviewed and yet
>> unapplied series [0], thus [0] needs to be applied first.
>>
>> [0] https://lkml.org/lkml/2019/7/25/892
>>
>> Changelog:
>>
>> v2: - Kept modularity of the tegra20-cpufreq as was requested by Viresh Kumar
>>       in a review comment to v1.
>>
>>     - Added acks from Viresh Kumar.
>>
>>     - Added tested-by from Nicolas Chauvet to the "trimslice" patch.
>>       Nicolas told me on IRC that it works fine.
>>
>>     - Fixed compilation of the "Add custom CCLK implementation" patch. The
>>       error happened because v1 was based on top of yet unreviewed/unapplied
>>       patch "clk: tegra: divider: Support enable-bit for Super clocks". Thanks
>>       to Peter Geis for reporting the problem.
>>
>>     - Replaced Tegra30 "beaver" board with "cardhu-a04" because turned out
>>       that's what NVIDIA uses in the testing farm.
>>
>> Dmitry Osipenko (17):
>>   clk: tegra: Add custom CCLK implementation
>>   clk: tegra: pll: Add pre/post rate-change hooks
>>   clk: tegra: cclk: Add helpers for handling PLLX rate changes
>>   clk: tegra20: Support custom CCLK implementation
>>   clk: tegra30: Support custom CCLK implementation
>>   dt-bindings: cpufreq: Add binding for NVIDIA Tegra20/30
>>   cpufreq: tegra20: Use generic cpufreq-dt driver (Tegra30 supported
>>     now)
>>   ARM: tegra: Create tegra20-cpufreq platform device on Tegra30
>>   ARM: dts: tegra20: Add CPU clock
>>   ARM: dts: tegra30: Add CPU clock
>>   ARM: dts: tegra20: Add CPU Operating Performance Points
>>   ARM: dts: tegra30: Add CPU Operating Performance Points
>>   ARM: dts: tegra20: paz00: Set up voltage regulators for DVFS
>>   ARM: dts: tegra20: paz00: Add CPU Operating Performance Points
>>   ARM: dts: tegra20: trimslice: Add CPU Operating Performance Points
>>   ARM: dts: tegra30: cardhu-a04: Set up voltage regulators for DVFS
>>   ARM: dts: tegra30: cardhu-a04: Add CPU Operating Performance Points
> 
> I've applied patches 9-17 (the DT bits) to for-5.5/arm/dt. I'll hold
> back on applying the others until Peter is happy with them.

Thanks, I'll update the patches and re-add OPPs for the Beaver board
since you have it.
