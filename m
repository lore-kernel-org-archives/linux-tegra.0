From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 16/16] PM / devfreq: Introduce driver for NVIDIA
 Tegra20
Date: Tue, 4 Jun 2019 16:57:51 +0300
Message-ID: <ca0930ed-bf06-508b-31a4-82229bdb1e81@gmail.com>
References: <20190501233815.32643-1-digetx@gmail.com>
 <20190501233815.32643-17-digetx@gmail.com> <20190604112524.GP16519@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190604112524.GP16519@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.06.2019 14:25, Thierry Reding пишет:
> On Thu, May 02, 2019 at 02:38:15AM +0300, Dmitry Osipenko wrote:
>> Add devfreq driver for NVIDIA Tegra20 SoC's. The driver periodically
>> reads out Memory Controller counters and adjusts memory frequency based
>> on the memory clients activity.
>>
>> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  MAINTAINERS                       |   8 ++
>>  drivers/devfreq/Kconfig           |  10 ++
>>  drivers/devfreq/Makefile          |   1 +
>>  drivers/devfreq/tegra20-devfreq.c | 212 ++++++++++++++++++++++++++++++
>>  4 files changed, 231 insertions(+)
>>  create mode 100644 drivers/devfreq/tegra20-devfreq.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 98edc38bfd7b..e7e434f74038 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -10098,6 +10098,14 @@ F:	include/linux/memblock.h
>>  F:	mm/memblock.c
>>  F:	Documentation/core-api/boot-time-mm.rst
>>  
>> +MEMORY FREQUENCY SCALING DRIVER FOR NVIDIA TEGRA20
>> +M:	Dmitry Osipenko <digetx@gmail.com>
>> +L:	linux-pm@vger.kernel.org
>> +L:	linux-tegra@vger.kernel.org
>> +T:	git git://git.kernel.org/pub/scm/linux/kernel/git/mzx/devfreq.git
>> +S:	Maintained
>> +F:	drivers/devfreq/tegra20-devfreq.c
>> +
>>  MEMORY MANAGEMENT
>>  L:	linux-mm@kvack.org
>>  W:	http://www.linux-mm.org
>> diff --git a/drivers/devfreq/Kconfig b/drivers/devfreq/Kconfig
>> index a6bba6e1e7d9..1530dbefa31f 100644
>> --- a/drivers/devfreq/Kconfig
>> +++ b/drivers/devfreq/Kconfig
>> @@ -100,6 +100,16 @@ config ARM_TEGRA_DEVFREQ
>>  	  It reads ACTMON counters of memory controllers and adjusts the
>>  	  operating frequencies and voltages with OPP support.
>>  
>> +config ARM_TEGRA20_DEVFREQ
>> +	tristate "NVIDIA Tegra20 DEVFREQ Driver"
>> +	depends on (TEGRA_MC && TEGRA20_EMC) || COMPILE_TEST
>> +	select DEVFREQ_GOV_SIMPLE_ONDEMAND
>> +	select PM_OPP
> 
> Again, I'm not sure the COMPILE_TEST will work here unless you add a few
> more dependencies.

I have the same answer as I made in the comment to "Enable COMPILE_TEST
for the driver" patch. I think there is no real need to be overreactive
here as well, ACK?
