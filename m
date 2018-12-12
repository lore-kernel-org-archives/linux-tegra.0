From: Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH] clk: tegra: fix SMP build
Date: Wed, 12 Dec 2018 11:47:32 +0000
Message-ID: <20c5f3a9-fd82-5634-6a1e-6384c0facece@nvidia.com>
References: <20181211143528.2024488-1-arnd@arndb.de>
 <154454887151.17204.5632248748272979028@swboyd.mtv.corp.google.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <154454887151.17204.5632248748272979028@swboyd.mtv.corp.google.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, Aapo Vienamo <avienamo@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On 11/12/2018 17:21, Stephen Boyd wrote:
> Quoting Arnd Bergmann (2018-12-11 06:35:07)
>> When CONFIG_SMP is disabled, the tegra clk driver now fails to build:
>>
>> drivers/clk/tegra/clk-tegra30.c: In function 'tegra30_cpu_rail_off_ready':
>> drivers/clk/tegra/clk-tegra30.c:1151:19: error: implicit declaration of function 'tegra_pmc_cpu_is_powered'; did you mean 'tegra_powergate_is_powered'? [-Werror=implicit-function-declaration]
>>   cpu_pwr_status = tegra_pmc_cpu_is_powered(1) ||
>>
>> I don't know if tegra works without CONFIG_SMP, but we can get it to
>> build by making the calls conditional, and removing the pointless
>> ifdef around the declaration. The assumption now is that in a
>> non-SMP system, the secondary CPUs are always disabled.
>>
>> Fixes: 61866523ed6e ("clk: tegra30: Use Tegra CPU powergate helper function")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> ---
>> Not sure if this is the best solution. If you think it's not, please
>> submit a different fix.
> 
> Hmm.. Is there any reason why the implementation of
> tegra_pmc_cpu_is_powered() is under an ifdef CONFIG_SMP? I'd rather not
> have to think about SMP or not in this clk code and have the
> tegra_pmc_cpu_is_powered() function do the UP vs SMP code optimization.

Not that I know of. I just think that the function should/would not be
used for non-SMP.

I was actually thinking that we could just leave the clk code as it is
and simply drop the CONFIG_SMP from pmc.h. That would be fine with me.

Cheers
Jon

-- 
nvpublic
