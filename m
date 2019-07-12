From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v2 1/6] ARM: tegra: Remove cpuidle drivers
Date: Fri, 12 Jul 2019 10:39:46 +0100
Message-ID: <73781434-d25a-b17b-aacb-95ace5ac5f95@nvidia.com>
References: <20190711031312.10038-1-digetx@gmail.com>
 <20190711031312.10038-2-digetx@gmail.com>
 <c087a5cb-2ffa-1cf6-f0bf-631234759a22@nvidia.com>
 <a6e4b43e-369c-c501-6d2e-69d5b940ff9c@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6e4b43e-369c-c501-6d2e-69d5b940ff9c@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/07/2019 18:03, Dmitry Osipenko wrote:
> 11.07.2019 12:26, Jon Hunter =D0=BF=D0=B8=D1=88=D0=B5=D1=82:
>>
>> On 11/07/2019 04:13, Dmitry Osipenko wrote:
>>> Remove the old drivers to replace them cleanly with a new one later on.
>>>
>>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>>> ---
>>>  arch/arm/mach-tegra/Makefile           |  13 --
>>>  arch/arm/mach-tegra/cpuidle-tegra114.c |  89 -----------
>>>  arch/arm/mach-tegra/cpuidle-tegra20.c  | 212 -------------------------
>>>  arch/arm/mach-tegra/cpuidle-tegra30.c  | 132 ---------------
>>>  arch/arm/mach-tegra/cpuidle.c          |  50 ------
>>>  arch/arm/mach-tegra/cpuidle.h          |  21 ---
>>>  arch/arm/mach-tegra/irq.c              |  18 ---
>>>  arch/arm/mach-tegra/irq.h              |  11 --
>>>  arch/arm/mach-tegra/pm.c               |   7 -
>>>  arch/arm/mach-tegra/pm.h               |   1 -
>>>  arch/arm/mach-tegra/reset-handler.S    |  11 --
>>>  arch/arm/mach-tegra/reset.h            |   9 +-
>>>  arch/arm/mach-tegra/sleep-tegra20.S    | 190 +---------------------
>>>  arch/arm/mach-tegra/sleep.h            |  12 --
>>>  arch/arm/mach-tegra/tegra.c            |   3 -
>>>  drivers/soc/tegra/Kconfig              |   1 -
>>>  include/soc/tegra/cpuidle.h            |   4 -
>>>  17 files changed, 5 insertions(+), 779 deletions(-)
>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra114.c
>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra20.c
>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle-tegra30.c
>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle.c
>>>  delete mode 100644 arch/arm/mach-tegra/cpuidle.h
>>>  delete mode 100644 arch/arm/mach-tegra/irq.h
>>
>> By removing all the above, it is really hard to review the diff. Is
>> there any way you could first consolidate the cpuidle drivers into say
>> the existing arch/arm/mach-tegra/cpuidle-tegra20.c and then move to
>> drivers/cpuidle?
>=20
> I'm afraid that it will make reviewing even more difficult because
> everything that is removed here is not returned in the further patches.
> The new driver is based on the older ones, but I wrote it from scratch
> and it's not only looks different, but also works a bit different as you
> may see.
>=20
> Could you please clarify what exactly makes it hard to review? The diff
> looks pretty clean to me, while squashing everything into existing
> driver should be quite a mess.

Ideally a patch should standalone and can be reviewed by itself.
However, to review this, we need to review patches 1, 2 and 3 at the
same time. So IMO it is not that convenient from a reviewers
perspective. Furthermore, patches 1 and 3 are large and so easy to miss
something.

Is there really no way to have a patch to combined the existing drivers,
then a patch to convert them into the newer rewritten version you have
implemented, then move the driver?

Jon

--=20
nvpublic
