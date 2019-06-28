From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH V5 02/18] pinctrl: tegra: Add suspend and resume support
Date: Fri, 28 Jun 2019 15:05:46 +0300
Message-ID: <ca8199af-43db-c878-a93f-66c275acf864@gmail.com>
References: <1561687972-19319-1-git-send-email-skomatineni@nvidia.com>
 <1561687972-19319-3-git-send-email-skomatineni@nvidia.com>
 <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <0409f478-e425-4e7f-5fff-8c3a94f47ee8@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Sowjanya Komatineni <skomatineni@nvidia.com>, thierry.reding@gmail.com, jonathanh@nvidia.com, tglx@linutronix.de, jason@lakedaemon.net, marc.zyngier@arm.com, linus.walleij@linaro.org, stefan@agner.ch, mark.rutland@arm.com
Cc: pdeschrijver@nvidia.com, pgaikwad@nvidia.com, sboyd@kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, jckuo@nvidia.com, josephl@nvidia.com, talho@nvidia.com, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, mperttunen@nvidia.com, spatra@nvidia.com, robh+dt@kernel.org, devicetree@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

28.06.2019 14:56, Dmitry Osipenko пишет:
> 28.06.2019 5:12, Sowjanya Komatineni пишет:
>> This patch adds support for Tegra pinctrl driver suspend and resume.
>>
>> During suspend, context of all pinctrl registers are stored and
>> on resume they are all restored to have all the pinmux and pad
>> configuration for normal operation.
>>
>> Acked-by: Thierry Reding <treding@nvidia.com>
>> Signed-off-by: Sowjanya Komatineni <skomatineni@nvidia.com>
>> ---

>>  int tegra_pinctrl_probe(struct platform_device *pdev,
>>  			const struct tegra_pinctrl_soc_data *soc_data);
>>  #endif
>> diff --git a/drivers/pinctrl/tegra/pinctrl-tegra210.c b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> index 0b56ad5c9c1c..edd3f4606cdb 100644
>> --- a/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> +++ b/drivers/pinctrl/tegra/pinctrl-tegra210.c
>> @@ -1571,6 +1571,7 @@ static struct platform_driver tegra210_pinctrl_driver = {
>>  	.driver = {
>>  		.name = "tegra210-pinctrl",
>>  		.of_match_table = tegra210_pinctrl_of_match,
>> +		.pm = &tegra_pinctrl_pm,
>>  	},
>>  	.probe = tegra210_pinctrl_probe,
>>  };
>>
> 
> Could you please address my comments in the next revision if there will be one?
> 

Also, what about adding ".pm' for other Tegras? I'm sure Jon could test them for you.
