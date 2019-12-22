From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v5 12/19] ASoC: tegra: Add initial parent configuration
 for audio mclk
Date: Mon, 23 Dec 2019 00:18:52 +0300
Message-ID: <1b79ab92-c163-3857-dd38-df35c509b823@gmail.com>
References: <1576880825-15010-1-git-send-email-skomatineni@nvidia.com>
 <1576880825-15010-13-git-send-email-skomatineni@nvidia.com>
 <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <a6567ff1-7bc2-3ca5-1200-92a63eb44ddb@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, broonie@kernel.org, lgirdwood@gmail.com, perex@perex.cz, tiwai@suse.com, mperttunen@nvidia.com, gregkh@linuxfoundation.org, sboyd@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, spujar@nvidia.com, josephl@nvidia.com, daniel.lezcano@linaro.org, mmaddireddy@nvidia.com, markz@nvidia.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

23.12.2019 00:14, Dmitry Osipenko пишет:
> 21.12.2019 01:26, Sowjanya Komatineni пишет:
>> Tegra PMC clock clk_out_1 is dedicated for audio mclk from Tegra30
>> through Tegra210 and currently Tegra clock driver does initial parent
>> configuration for audio mclk "clk_out_1" and enables them by default.
>>
>> With the move of Tera PMC clocks from clock driver to Tegra PMC
>> driver, initial parent configuration for audio clocks are through
>> the device tree using assigned-clock-parents property.
>>
>> Default clock parents can be specified in device tree using
>> assigned-clocks and assigned-clock-parents and there is no need
>> to have clock driver do parent configuration and enable audio related
>> clocks.
>>
>> This patch has implementation for initial parent configuration in
>> audio driver when default parent configuration is not specified in the
>> device tree using assigned-clock properties and enables audio clocks
>> during the clock rate change.
>>
>> This patch configures PLLA_OUT0 as parent to extern1 and extern1
>> as parent to clk_out_1 and uses clk_out_1 as cdev1 clock to allow
>> mclk control from this driver.
>>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---
>>  sound/soc/tegra/tegra_asoc_utils.c | 71 ++++++++++++++++++++++----------------
>>  1 file changed, 41 insertions(+), 30 deletions(-)
>>
>> diff --git a/sound/soc/tegra/tegra_asoc_utils.c b/sound/soc/tegra/tegra_asoc_utils.c
>> index 38535962029c..fc3135c08f43 100644
>> --- a/sound/soc/tegra/tegra_asoc_utils.c
>> +++ b/sound/soc/tegra/tegra_asoc_utils.c
>> @@ -7,6 +7,7 @@
>>   */
>>  
>>  #include <linux/clk.h>
>> +#include <linux/clk-provider.h>
> 
> This is illegal, it is not a clock provider.
> 
>>  #include <linux/device.h>
>>  #include <linux/err.h>
>>  #include <linux/kernel.h>
>> @@ -59,9 +60,8 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
>>  	data->set_baseclock = 0;
>>  	data->set_mclk = 0;
>>  
>> -	clk_disable_unprepare(data->clk_cdev1);
>> -	clk_disable_unprepare(data->clk_pll_a_out0);
>> -	clk_disable_unprepare(data->clk_pll_a);
>> +	if (__clk_is_enabled(data->clk_cdev1))
>> +		clk_disable_unprepare(data->clk_cdev1);
> 
> The root of the problem is that you removed clocks enabling from
> tegra_asoc_utils_init().
> 
> I'm not sure why clocks should be disabled during the rate-changing,
> probably this action is not really needed.
> 
> diff --git a/sound/soc/tegra/tegra_asoc_utils.c
> b/sound/soc/tegra/tegra_asoc_utils.c
> index 46ff70c16b74..789fd03e51a7 100644
> --- a/sound/soc/tegra/tegra_asoc_utils.c
> +++ b/sound/soc/tegra/tegra_asoc_utils.c
> @@ -7,7 +7,6 @@
>   */
> 
>  #include <linux/clk.h>
> -#include <linux/clk-provider.h>
>  #include <linux/device.h>
>  #include <linux/err.h>
>  #include <linux/kernel.h>
> @@ -60,9 +59,6 @@ int tegra_asoc_utils_set_rate(struct
> tegra_asoc_utils_data *data, int srate,
>  	data->set_baseclock = 0;
>  	data->set_mclk = 0;
> 
> -	if (__clk_is_enabled(data->clk_cdev1))
> -		clk_disable_unprepare(data->clk_cdev1);
> -
>  	err = clk_set_rate(data->clk_pll_a, new_baseclock);
>  	if (err) {
>  		dev_err(data->dev, "Can't set pll_a rate: %d\n", err);
> @@ -77,12 +73,6 @@ int tegra_asoc_utils_set_rate(struct
> tegra_asoc_utils_data *data, int srate,
> 
>  	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
> 
> -	err = clk_prepare_enable(data->clk_cdev1);
> -	if (err) {
> -		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
> -		return err;
> -	}
> -
>  	data->set_baseclock = new_baseclock;
>  	data->set_mclk = mclk;
> 
> @@ -96,9 +86,6 @@ int tegra_asoc_utils_set_ac97_rate(struct
> tegra_asoc_utils_data *data)
>  	const int ac97_rate = 24576000;
>  	int err;
> 
> -	if (__clk_is_enabled(data->clk_cdev1))
> -		clk_disable_unprepare(data->clk_cdev1);
> -
>  	/*
>  	 * AC97 rate is fixed at 24.576MHz and is used for both the host
>  	 * controller and the external codec
> @@ -117,12 +104,6 @@ int tegra_asoc_utils_set_ac97_rate(struct
> tegra_asoc_utils_data *data)
> 
>  	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
> 
> -	err = clk_prepare_enable(data->clk_cdev1);
> -	if (err) {
> -		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
> -		return err;
> -	}
> -
>  	data->set_baseclock = pll_rate;
>  	data->set_mclk = ac97_rate;
> 
> @@ -213,6 +194,12 @@ int tegra_asoc_utils_init(struct
> tegra_asoc_utils_data *data,
>  		data->clk_cdev1 = clk_out_1;
>  	}
> 
> +	ret = clk_prepare_enable(data->clk_cdev1);
> +	if (ret) {
> +		dev_err(data->dev, "Can't enable cdev1: %d\n", ret);
> +		return ret;
> +	}
> +
>  	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);
> 
>  	return ret;
> 
> 
>>  	err = clk_set_rate(data->clk_pll_a, new_baseclock);
>>  	if (err) {
>> @@ -77,18 +77,6 @@ int tegra_asoc_utils_set_rate(struct tegra_asoc_utils_data *data, int srate,
>>  
>>  	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
>>  
>> -	err = clk_prepare_enable(data->clk_pll_a);
>> -	if (err) {
>> -		dev_err(data->dev, "Can't enable pll_a: %d\n", err);
>> -		return err;
>> -	}
>> -
>> -	err = clk_prepare_enable(data->clk_pll_a_out0);
>> -	if (err) {
>> -		dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
>> -		return err;
>> -	}
>> -
>>  	err = clk_prepare_enable(data->clk_cdev1);
>>  	if (err) {
>>  		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>> @@ -108,9 +96,8 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
>>  	const int ac97_rate = 24576000;
>>  	int err;
>>  
>> -	clk_disable_unprepare(data->clk_cdev1);
>> -	clk_disable_unprepare(data->clk_pll_a_out0);
>> -	clk_disable_unprepare(data->clk_pll_a);
>> +	if (__clk_is_enabled(data->clk_cdev1))
>> +		clk_disable_unprepare(data->clk_cdev1);
>>  
>>  	/*
>>  	 * AC97 rate is fixed at 24.576MHz and is used for both the host
>> @@ -130,18 +117,6 @@ int tegra_asoc_utils_set_ac97_rate(struct tegra_asoc_utils_data *data)
>>  
>>  	/* Don't set cdev1/extern1 rate; it's locked to pll_a_out0 */
>>  
>> -	err = clk_prepare_enable(data->clk_pll_a);
>> -	if (err) {
>> -		dev_err(data->dev, "Can't enable pll_a: %d\n", err);
>> -		return err;
>> -	}
>> -
>> -	err = clk_prepare_enable(data->clk_pll_a_out0);
>> -	if (err) {
>> -		dev_err(data->dev, "Can't enable pll_a_out0: %d\n", err);
>> -		return err;
>> -	}
>> -
>>  	err = clk_prepare_enable(data->clk_cdev1);
>>  	if (err) {
>>  		dev_err(data->dev, "Can't enable cdev1: %d\n", err);
>> @@ -158,6 +133,7 @@ EXPORT_SYMBOL_GPL(tegra_asoc_utils_set_ac97_rate);
>>  int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>>  			  struct device *dev)
>>  {
>> +	struct clk *clk_out_1, *clk_extern1;
>>  	int ret;
>>  
>>  	data->dev = dev;
>> @@ -193,6 +169,41 @@ int tegra_asoc_utils_init(struct tegra_asoc_utils_data *data,
>>  		return PTR_ERR(data->clk_cdev1);
>>  	}
>>  
>> +	/*
>> +	 * If clock parents are not set in DT, configure here to use clk_out_1
>> +	 * as mclk and extern1 as parent for Tegra30 and higher.
>> +	 */
>> +	if (!of_find_property(dev->of_node, "assigned-clock-parents", NULL) &&
>> +	    data->soc > TEGRA_ASOC_UTILS_SOC_TEGRA20) {
> 
> Please add a message here about falling back to configuring clocks for a
> legacy device-tree, telling that device-tree needs to be updated.
> 
>> +		clk_extern1 = devm_clk_get(dev, "extern1");
>> +		if (IS_ERR(clk_extern1)) {
>> +			dev_err(data->dev, "Can't retrieve clk extern1\n");
>> +			return PTR_ERR(clk_extern1);
>> +		}
>> +
>> +		ret = clk_set_parent(clk_extern1, data->clk_pll_a_out0);
>> +		if (ret < 0) {
>> +			dev_err(data->dev,
>> +				"Set parent failed for clk extern1\n");
>> +			return ret;
>> +		}
>> +
>> +		clk_out_1 = devm_clk_get(dev, "clk_out_1");
>> +		if (IS_ERR(clk_out_1)) {
>> +			dev_err(data->dev, "Can't retrieve clk clk_out_1\n");
>> +			return PTR_ERR(clk_out_1);
>> +		}
>> +
>> +		ret = clk_set_parent(clk_out_1, clk_extern1);
>> +		if (ret < 0) {
>> +			dev_err(data->dev,
>> +				"Set parent failed for clk_out_1\n");
>> +			return ret;
>> +		}
>> +
>> +		data->clk_cdev1 = clk_out_1;
>> +	}
>> +
>>  	ret = tegra_asoc_utils_set_rate(data, 44100, 256 * 44100);

Actually, this tegra_asoc_utils_set_rate() should be removed because it
doesn't do anything useful since drivers configure the clock rate when
necessary.

>>  	return ret;
>>
> 
> I'd also add tegra_asoc_utils_deinit() to disable clock on drivers removal.
> 
