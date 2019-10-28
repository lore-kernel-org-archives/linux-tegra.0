From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v1 01/17] clk: tegra: Add custom CCLK implementation
Date: Tue, 29 Oct 2019 02:48:31 +0300
Message-ID: <2e35c210-8d76-c096-69b6-91b6ed577605@gmail.com>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-2-digetx@gmail.com>
 <20191028145706.GF27141@pdeschrijver-desktop.Nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20191028145706.GF27141@pdeschrijver-desktop.Nvidia.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Viresh Kumar <viresh.kumar@linaro.org>, Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter Geis <pgwipeout@gmail.com>, Nicolas Chauvet <kwizart@gmail.com>, Marcel Ziswiler <marcel.ziswiler@toradex.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.10.2019 17:57, Peter De Schrijver пишет:
> On Wed, Oct 16, 2019 at 12:16:02AM +0300, Dmitry Osipenko wrote:
>> CCLK stands for "CPU Clock", CPU core is running off CCLK. CCLK supports
>> multiple parents and it has internal clock divider which uses clock
>> skipping technique, meaning that CPU's voltage should correspond to the
>> parent clock rate and not CCLK. PLLX is the main CCLK parent that provides
>> clock rates above 1GHz and it has special property such that the CCLK's
>> internal divider is set into bypass mode when PLLX is set as a parent for
>> CCLK.
>>
>> This patch forks generic Super Clock into CCLK implementation which takes
>> into account all CCLK specifics. The proper CCLK implementation is needed
>> by the upcoming Tegra20 CPUFreq driver update that will allow to utilize
>> the generic cpufreq-dt driver by moving intermediate clock handling into
>> the clock driver. Note that technically this all could be squashed into
>> clk-super, but result will be messier.
>>
>> Note that currently all CCLKLP bits are left in the clk-super.c and only
>> CCLKG is supported by clk-tegra-super-cclk. It shouldn't be difficult
>> to move the CCLKLP bits, but CCLKLP is not used by anything in kernel
>> and thus better not to touch it for now.
> 
> ..
> 
>> +	super->reg = reg;
>> +	super->lock = lock;
>> +	super->width = 4;
>> +	super->flags = clk_super_flags;
>> +	super->frac_div.reg = reg + 4;
>> +	super->frac_div.shift = 16;
>> +	super->frac_div.width = 8;
>> +	super->frac_div.frac_width = 1;
>> +	super->frac_div.lock = lock;
>> +	super->frac_div.flags = TEGRA_DIVIDER_SUPER;
>> +	super->div_ops = &tegra_clk_frac_div_ops;
>> +
> 
> This is not right. The super clock divider is not a divider, it's a
> pulse skipper.

For the reference: on #tegra Peter explained to me in a more details
what was meant here. Turned out that T30+ has a real CCLK divider and we
won't use the pulse skipper for T20 nor for T30+, I'll update clk
patches accordingly in the next revision.
