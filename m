From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 05/10] memory: tegra20-emc: Replace clk_get_sys with
 devm_clk_get
Date: Mon, 17 Jun 2019 18:01:31 +0300
Message-ID: <204a38c2-90ff-3a44-d320-bdc031679ec3@gmail.com>
References: <20190616233551.6838-1-digetx@gmail.com>
 <20190616233551.6838-6-digetx@gmail.com> <20190617094602.GC508@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617094602.GC508@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Joseph Lo <josephl@nvidia.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 12:46, Thierry Reding пишет:
> On Mon, Jun 17, 2019 at 02:35:46AM +0300, Dmitry Osipenko wrote:
>> There is no problem for drivers to request pll_m and pll_p clocks for
>> the device, hence there is no need to use clk_get_sys() and it could be
>> replaced with devm_clk_get() for consistency.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/memory/tegra/tegra20-emc.c | 12 ++++--------
>>  1 file changed, 4 insertions(+), 8 deletions(-)
>>
>> diff --git a/drivers/memory/tegra/tegra20-emc.c b/drivers/memory/tegra/tegra20-emc.c
>> index 43aef3614b65..527aa4b90e95 100644
>> --- a/drivers/memory/tegra/tegra20-emc.c
>> +++ b/drivers/memory/tegra/tegra20-emc.c
>> @@ -527,33 +527,29 @@ static int tegra_emc_probe(struct platform_device *pdev)
>>  		goto unset_cb;
>>  	}
>>  
>> -	emc->pll_m = clk_get_sys(NULL, "pll_m");
>> +	emc->pll_m = devm_clk_get(&pdev->dev, "pll_m");
> 
> Interesting... I didn't know that clk_get() had a fallback path to
> return clk_get_sys() if the named clock wasn't found in DT. That's
> nice.
> 
> Looks good to me.

Yes, I didn't know either until recently. Thanks!
