From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v6 00/18] Consolidate and improve NVIDIA Tegra CPUIDLE
 driver(s)
Date: Wed, 16 Oct 2019 22:47:48 +0300
Message-ID: <72636eb3-5354-eea3-3a51-4975a04186b2@gmail.com>
References: <20191015170015.1135-1-digetx@gmail.com>
 <20191016192133.GB26038@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191016192133.GB26038@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.10.2019 22:21, Peter De Schrijver пишет:
> On Tue, Oct 15, 2019 at 07:59:57PM +0300, Dmitry Osipenko wrote:
>> Hello,
>>
>> This series does the following:
>>
>>   1. Unifies Tegra20/30/114 drivers into a single driver and moves it out
>>      into common drivers/cpuidle/ directory.
>>
>>   2. Enables CPU cluster power-down idling state on Tegra30.
>>
>> In the end there is a quite nice clean up of the Tegra CPUIDLE drivers
>> and of the Tegra's arch code in general. Please review, thanks!
>>
>> Changelog:
>>
>> v6: - Addressed request from Thierry Reding to change the way patches are
>>       organized by making changes in a more incremental manner.
>>
>>     - tegra_sleep_cpu() now checks for the secondary CPUs to be offline
>>       in the "Make outer_disable() open-coded" patch.
>>
>> v5: - Rebased on a recent linux-next, fixed one minor conflict in Kconfig.
>>
>>     - Improved commit's message of the "Support CPU cluster power-down state
>>       on Tegra30" patch.
>>
>>     - The "Support CPU cluster power-down state on Tegra30" patch is also
>>       got split and now there is additional "Make outer_disable() open-coded"
>>       patch.
>>
>>     - Made minor cosmetic changes to the "Introduce unified driver for
>>       NVIDIA Tegra SoCs" patch by improving error message and renaming
>>       one variable.
>>
>> v4: - Fixed compilation with !CONFIG_CACHE_L2X0 (and tested that it still
>>       works).
>>
>>     - Replaced ktime_compare() with ktime_before() in the new driver,
>>       for consistency.
>>
>> v3: - Addressed review comments that were made by Jon Hunter to v2 by
>>       splitting patches into smaller (and simpler) chunks, better
>>       documenting changes in the commit messages and using proper error
>>       codes in the code.
>>
>>       Warnings are replaced with a useful error messages in the code of
>>       "Introduce unified driver for NVIDIA Tegra SoCs" patch.
>>
>>       Secondary CPUs parking timeout increased to 100ms because I found
>>       that it actually may happen to take more than 1ms if CPU is running
>>       on a *very* low frequency.
>>
>>       Added diagnostic messages that are reporting Flow Controller state
>>       when CPU parking fails.
>>
>>       Further polished cpuidle driver's code.
>>
>>       The coupled state entering is now aborted if there is a pending SGI
>>       (Software Generated Interrupt) because it will be lost after GIC's
>>       power-cycling. Like it was done by the old Tegra20 CPUIDLE driver.
>>
>> v2: - Added patches to enable the new cpuidle driver in the defconfigs:
>>
>>         ARM: multi_v7_defconfig: Enable Tegra cpuidle driver
>>         ARM: tegra: Enable Tegra cpuidle driver in tegra_defconfig
>>
>>     - Dropped patches that removed CPUIDLE_FLAG_TIMER_STOP from the idling
>>       states because that flag actually doesn't have any negative effects,
>>       but still is correct for the case of a local CPU timer on older Tegra
>>       SoCs:
>>
>>         cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from Tegra114/124 idle-state
>>         cpuidle: tegra: Remove CPUIDLE_FLAG_TIMER_STOP from all states
>>
>>     - The "Add unified driver for NVIDIA Tegra SoCs" patch got more polish.
>>       Tegra30 and Terga114 states are now squashed into a single common C7
>>       state (following Parker TRM terminology, see 17.2.2.2 Power Management
>>       States), more comments added, etc minor changes.
> 
> It would be useful to switch the power state terminology to the one used
> for later chips:
> 
> LP0 becomes SC7
> LP1 becomes C1
> LP2 becomes CC7
> 
> Meaning of these states is as follows
> 
> C is a core state:
> 
> C1 clock gating
> C2 not defined
> C3 not defined
> C4 not defined
> C5 not defined
> C6 not defined for ARM cores
> C7 power-gating
> 
> CC is a CPU cluster C state:
> 
> CC1 cluster clock gated
> CC2 not defined
> CC3 fmax@Vmin: not used prior to Tegra186
> CC4: cluster retention: no longer supported
> CC5: not defined
> CC6: cluster power gating
> CC7: cluster rail gating
> 
> SC is a System C state:
> 
> SC1: not defined
> SC2: not defined
> SC3: not defined
> SC4: not defined
> SC5: not defined
> SC6: not defined
> SC7: VDD_SOC off

Hello Peter,

But new "drivers/cpuidle/cpuidle-tegra.c" uses exactly that terminology,
please see "cpuidle: Refactor and move NVIDIA Tegra20 driver into
drivers/cpuidle/" and further patches. Am I missing something? Or do you
want the renaming to be a separate patch?
