From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 15/16] PM / devfreq: tegra: Rename tegra-devfreq.c to
 tegra30-devfreq.c
Date: Tue, 4 Jun 2019 17:35:31 +0300
Message-ID: <f96a88fd-5d99-12e8-abbd-82c32d60fab8@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-16-digetx@gmail.com> <20190604112323.GO16519@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604112323.GO16519@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 14:23, Thierry Reding пишет:
> On Thu, May 02, 2019 at 02:38:14AM +0300, Dmitry Osipenko wrote:
>> In order to reflect that driver serves NVIDIA Tegra30 and later SoC
>> generations, let's rename the driver's source file to "tegra30-devfreq.c".
>> This will make driver files to look more consistent after addition of a
>> driver for Tegra20.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/Makefile                               | 2 +-
>>  drivers/devfreq/{tegra-devfreq.c => tegra30-devfreq.c} | 0
>>  2 files changed, 1 insertion(+), 1 deletion(-)
>>  rename drivers/devfreq/{tegra-devfreq.c => tegra30-devfreq.c} (100%)
>>
>> diff --git a/drivers/devfreq/Makefile b/drivers/devfreq/Makefile
>> index 32b8d4d3f12c..47e5aeeebfd1 100644
>> --- a/drivers/devfreq/Makefile
>> +++ b/drivers/devfreq/Makefile
>> @@ -10,7 +10,7 @@ obj-$(CONFIG_DEVFREQ_GOV_PASSIVE)	+= governor_passive.o
>>  # DEVFREQ Drivers
>>  obj-$(CONFIG_ARM_EXYNOS_BUS_DEVFREQ)	+= exynos-bus.o
>>  obj-$(CONFIG_ARM_RK3399_DMC_DEVFREQ)	+= rk3399_dmc.o
>> -obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra-devfreq.o
>> +obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra30-devfreq.o
> 
> Technically this changes the name of the driver. Sometimes boot or other
> scripts rely on those names. Perhaps a better way of keeping backwards-
> compatibility would be to do:
> 
> 	obj-$(CONFIG_ARM_TEGRA_DEVFREQ)		+= tegra-devfreq.o
> 	tegra-devfreq-y				+= tegra30-devfreq.o
> 
> That way you can later on just add the tegra20-devfreq.o to that driver
> as well and have them both ship in one .ko.

Combining two drivers into a single kernel object certainly doesn't work
("multiple definition of `init_module'" error, etc).

Indeed, this changes the name of the driver. It should be fine as long
as it doesn't hurt anybody, so what about to keep this change as-is for
now and wait for complains? I promise to make a revert if this will
cause real problems for anyone. Let's be realistic, there should be a
very little chance that somebody will notice this change. ACK?
