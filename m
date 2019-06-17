From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 01/10] clk: tegra20/30: Add custom EMC clock
 implementation
Date: Mon, 17 Jun 2019 18:00:42 +0300
Message-ID: <596703d3-ce13-ff69-e685-7eb8cf7eb0d4@gmail.com>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-2-digetx@gmail.com> <20190617093555.GB508@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617093555.GB508@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 12:35, Thierry Reding пишет:
> On Mon, Jun 17, 2019 at 02:35:42AM +0300, Dmitry Osipenko wrote:
>> A proper External Memory Controller clock rounding and parent selection
>> functionality is required by the EMC drivers. It is not available using
>> the generic clock implementation, hence add a custom one. The clock rate
>> rounding shall be done by the EMC drivers because they have information
>> about available memory timings, so the drivers will have to register a
>> callback that will round the requested rate. EMC clock users won't be able
>> to request EMC clock by getting -EPROBE_DEFER until EMC driver is probed
>> and the callback is set up. The functionality is somewhat similar to the
>> clk-emc.c which serves Tegra124+ SoC's, the later HW generations support
>> more parent clock sources and the HW configuration and integration with
>> the EMC drivers differs a tad from the older gens, hence it's not really
>> worth to try to squash everything into a single source file.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clk/tegra/Makefile          |   2 +
>>  drivers/clk/tegra/clk-tegra20-emc.c | 305 ++++++++++++++++++++++++++++
>>  drivers/clk/tegra/clk-tegra20.c     |  55 ++---
>>  drivers/clk/tegra/clk-tegra30.c     |  38 +++-
>>  drivers/clk/tegra/clk.h             |   6 +
>>  include/linux/clk/tegra.h           |  14 ++
>>  6 files changed, 368 insertions(+), 52 deletions(-)
>>  create mode 100644 drivers/clk/tegra/clk-tegra20-emc.c
>>
>> diff --git a/drivers/clk/tegra/Makefile b/drivers/clk/tegra/Makefile
>> index 4812e45c2214..df966ca06788 100644
>> --- a/drivers/clk/tegra/Makefile
>> +++ b/drivers/clk/tegra/Makefile
>> @@ -17,7 +17,9 @@ obj-y					+= clk-tegra-fixed.o
>>  obj-y					+= clk-tegra-super-gen4.o
>>  obj-$(CONFIG_TEGRA_CLK_EMC)		+= clk-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += clk-tegra20.o
>> +obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= clk-tegra20-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_3x_SOC)         += clk-tegra30.o
>> +obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= clk-tegra20-emc.o
>>  obj-$(CONFIG_ARCH_TEGRA_114_SOC)	+= clk-tegra114.o
>>  obj-$(CONFIG_ARCH_TEGRA_124_SOC)	+= clk-tegra124.o
>>  obj-$(CONFIG_TEGRA_CLK_DFLL)		+= clk-tegra124-dfll-fcpu.o
>> diff --git a/drivers/clk/tegra/clk-tegra20-emc.c b/drivers/clk/tegra/clk-tegra20-emc.c
>> new file mode 100644
>> index 000000000000..b7f64ad5c04c
>> --- /dev/null
>> +++ b/drivers/clk/tegra/clk-tegra20-emc.c
>> @@ -0,0 +1,305 @@
>> +// SPDX-License-Identifier: GPL-2.0
> 
> Perhaps you want to add copyright information here? Part of this is
> copied from other drivers, so keep that copyright intact. But there's
> also quite a bit of new code here, so also make sure to add yourself.

Okay! And it's true that I initially used clk-emc as a template.

[snip]

>> +void tegra30_clk_set_emc_round_callback(tegra30_clk_emc_round_cb *round_cb,
>> +					void *cb_arg)
>> +{
>> +	tegra20_clk_set_emc_round_callback(round_cb, cb_arg);
>> +}
>> +
>> +bool tegra30_clk_emc_driver_available(struct clk_hw *emc_hw)
>> +{
>> +	return tegra20_clk_emc_driver_available(emc_hw);
>> +}
> 
> Do we really need to make this distinction? Do you have any work in
> progress patches that would need to override these Tegra30 specific bits
> by code that's not the same as the Tegra20 variant? I don't see why you
> would want to duplicate this if there's no use to it. Or perhaps I'm
> missing something?

There are no other patches planned for this code. The primary reason for the
distinction is that I don't like to have T20 functions mixed with T30 because this
leads to inconsistency and confusion.

[snip]

> Again, I don't see any advantage in quirky things like this. It seems to
> me like the only reason why this exists is so that Tegra30 code doesn't
> have to call functions that start with a tegra20_ prefix. However, we
> already have code that does similar things elsewhere, so I think this
> can be considered "common" practice. No need for this duplication.

Oh, well. But this is not a very good practice in my opinion. I'll adhere to yours
comment in v5.

> Again, if I'm missing something please let me know. Might be worth
> noting why this is done in a code comment or the commit message.

You got everything right.
