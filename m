From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 1/6] ARM: tegra: Remove cpuidle drivers
Date: Fri, 12 Jul 2019 19:23:45 +0300
Message-ID: <9d79ed3e-a37f-af9c-0696-31dc33bbdefd@gmail.com>
References: <20190711031312.10038-1-digetx@gmail.com>
 <20190711031312.10038-2-digetx@gmail.com>
 <c087a5cb-2ffa-1cf6-f0bf-631234759a22@nvidia.com>
 <a6e4b43e-369c-c501-6d2e-69d5b940ff9c@gmail.com>
 <73781434-d25a-b17b-aacb-95ace5ac5f95@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <73781434-d25a-b17b-aacb-95ace5ac5f95@nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Jon Hunter <jonathanh@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

12.07.2019 12:39, Jon Hunter пишет:
> 
> On 11/07/2019 18:03, Dmitry Osipenko wrote:
>> 11.07.2019 12:26, Jon Hunter пишет:
>>>
>>> On 11/07/2019 04:13, Dmitry Osipenko wrote:
>>>> Remove the old drivers to replace them cleanly with a new one later on.
>>>>
>>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>>> ---
>>>>  arch/arm/mach-tegra/Makefile           |  13 --
>>>>  arch/arm/mach-tegra/cpuidle-tegra114.c |  89 -----------
>>>>  arch/arm/mach-tegra/cpuidle-tegra20.c  | 212 -------------------------
>>>>  arch/arm/mach-tegra/cpuidle-tegra30.c  | 132 ---------------
>>>>  arch/arm/mach-tegra/cpuidle.c          |  50 ------
>>>>  arch/arm/mach-tegra/cpuidle.h          |  21 ---
>>>>  arch/arm/mach-tegra/irq.c              |  18 ---
>>>>  arch/arm/mach-tegra/irq.h              |  11 --
>>>>  arch/arm/mach-tegra/pm.c               |   7 -
>>>>  arch/arm/mach-tegra/pm.h               |   1 -
>>>>  arch/arm/mach-tegra/reset-handler.S    |  11 --
>>>>  arch/arm/mach-tegra/reset.h            |   9 +-
>>>>  arch/arm/mach-tegra/sleep-tegra20.S    | 190 +---------------------
>>>>  arch/arm/mach-tegra/sleep.h            |  12 --
>>>>  arch/arm/mach-tegra/tegra.c            |   3 -
>>>>  drivers/soc/tegra/Kconfig              |   1 -
>>>>  include/soc/tegra/cpuidle.h            |   4 -
>>>>  17 files changed, 5 insertions(+), 779 deletions(-)
>>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
>>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
>>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
>>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle.c
>>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle.h
>>>>  delete mode 100644 arch/arm/mach-tegra/irq.h
>>>
>>> By removing all the above, it is really hard to review the diff. Is
>>> there any way you could first consolidate the cpuidle drivers into say
>>> the existing arch/arm/mach-tegra/cpuidle-tegra20.c and then move to
>>> drivers/cpuidle?
>>
>> I'm afraid that it will make reviewing even more difficult because
>> everything that is removed here is not returned in the further patches.
>> The new driver is based on the older ones, but I wrote it from scratch
>> and it's not only looks different, but also works a bit different as you
>> may see.
>>
>> Could you please clarify what exactly makes it hard to review? The diff
>> looks pretty clean to me, while squashing everything into existing
>> driver should be quite a mess.
> 
> Ideally a patch should standalone and can be reviewed by itself.
> However, to review this, we need to review patches 1, 2 and 3 at the
> same time. So IMO it is not that convenient from a reviewers
> perspective. Furthermore, patches 1 and 3 are large and so easy to miss
> something.
> 
> Is there really no way to have a patch to combined the existing drivers,
> then a patch to convert them into the newer rewritten version you have
> implemented, then move the driver?

Probably I spent a bit too much time with that code, so now yours
suggestion looks to me like an unnecessary step. But I will try and see
how it goes, at least it should be possible to break down the patch 1 a
bit more, hopefully it will help to better understand what's going on in
the further patches if you're not familiar or don't remember how it all
works.
