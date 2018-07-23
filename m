From: Ben Dooks <ben.dooks@codethink.co.uk>
Subject: Re: [PATCH 6/8] clk: tegra30: add 2d and 3d idle clocks
Date: Mon, 23 Jul 2018 09:28:25 +0100
Message-ID: <ca29f065814a22f46b9b1683165548cb@codethink.co.uk>
References: <20180720134532.13148-1-ben.dooks@codethink.co.uk>
 <20180720134532.13148-7-ben.dooks@codethink.co.uk>
 <1721645.6LMGIEI4vR@dimapc>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1721645.6LMGIEI4vR@dimapc>
Sender: linux-kernel-owner@vger.kernel.org
To: Dmitry Osipenko <digetx@gmail.com>
Cc: pdeschrijver@nvidia.com, jonathanh@nvidia.co, thierry.reding@gmail.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, pgaikwad@nvidia.com, linux-kernel@lists.codethink.co.uk
List-Id: linux-tegra@vger.kernel.org



On 2018-07-22 12:55, Dmitry Osipenko wrote:
> On Friday, 20 July 2018 16:45:30 MSK Ben Dooks wrote:
>> The 2D and 3D clocks have an IDLE field in bits 15:8 so add these
>> clocks by making a 2D and 3D mux, and split the divider into the
>> standard 2D/3D ones and 2D/3D idle clocks.
>> 
>> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>

[snip]

> 
> According to TRM, Tegra20 and Tegra114 have these "idle-mode" clock 
> dividers
> as well. Why only T30 should have them?

I've got a separate series to sort t20 bits out, i've not used the 
tegra114

>> a/include/dt-bindings/clock/tegra30-car.h
>> b/include/dt-bindings/clock/tegra30-car.h index 
>> 3c90f1535551..eda4ca60351e
>> 100644
>> --- a/include/dt-bindings/clock/tegra30-car.h
>> +++ b/include/dt-bindings/clock/tegra30-car.h
>> @@ -269,6 +269,11 @@
>>  #define TEGRA30_CLK_AUDIO3_MUX 306
>>  #define TEGRA30_CLK_AUDIO4_MUX 307
>>  #define TEGRA30_CLK_SPDIF_MUX 308
>> -#define TEGRA30_CLK_CLK_MAX 309
>> +
>> +#define TEGRA30_CLK_GR2D_MUX	309
>> +#define TEGRA30_CLK_GR3D_MUX	310
>> +#define TEGRA30_CLK_GR2D_IDLE	311
>> +#define TEGRA30_CLK_GR3D_IDLE	312
>> +#define TEGRA30_CLK_CLK_MAX 313
>> 
>>  #endif	/* _DT_BINDINGS_CLOCK_TEGRA30_CAR_H */
> 
> IIUC, that "idle-mode" divisor is just some kind of power-safe feature, 
> is
> there any real use-case for these clocks? Why not to just pre-configure 
> the
> "idle-mode" bits during the clocks initialization?

It is is nice to have it available after to check, other than that we're 
not
using any drivers that currently dynamically change the values of this.
