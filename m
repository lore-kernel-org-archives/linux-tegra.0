From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH V2 3/3] gpio: tegra: Add support for gpio debounce
Date: Tue, 19 Apr 2016 18:15:43 +0530
Message-ID: <57162877.3010508@nvidia.com>
References: <1461059020-25373-1-git-send-email-ldewangan@nvidia.com> <1461059020-25373-3-git-send-email-ldewangan@nvidia.com> <20160419123754.GE8284@ulmo.ba.sec>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20160419123754.GE8284@ulmo.ba.sec>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linus.walleij@linaro.org, gnurou@gmail.com, swarren@wwwdotorg.org, linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org


On Tuesday 19 April 2016 06:07 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Tue, Apr 19, 2016 at 03:13:40PM +0530, Laxman Dewangan wrote:
> [...]
>> @@ -570,7 +612,14 @@ static struct tegra_gpio_soc_config tegra30_gpio_config = {
>>   	.upper_offset = 0x80,
>>   };
>>   
>> +static struct tegra_gpio_soc_config tegra210_gpio_config = {
>> +	.bank_stride = 0x100,
>> +	.upper_offset = 0x80,
>> +	.debounce_supported = true,
>> +};
>> +
>>   static const struct of_device_id tegra_gpio_of_match[] = {
>> +	{ .compatible = "nvidia,tegra210-gpio", .data = &tegra210_gpio_config },
>>   	{ .compatible = "nvidia,tegra30-gpio", .data = &tegra30_gpio_config },
>>   	{ .compatible = "nvidia,tegra20-gpio", .data = &tegra20_gpio_config },
>>   	{ },
> I think I'd split this hunk off into a separate patch. Oh, and perhaps
> follow up with a patch that makes the SoC configuration data const?
>

OK, then I will do that on follow-on patch:
- Get rid of all global variables.
- Convert the soc config to the constant.
