From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: tegra124-jetson-tk1: sata doesnt work since 5.2
Date: Wed, 3 Jun 2020 01:49:57 +0300
Message-ID: <56700c1d-ffb0-e44e-ea8e-48a848ccf3bf@gmail.com>
References: <20200319074401.GA4116@Red> <20200531193111.GA15331@Red>
 <ff9923ca-1d02-ab5e-c335-83ee2e993061@gmail.com> <20200602081958.GA21773@Red>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200602081958.GA21773@Red>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: LABBE Corentin <clabbe-rdvid1DuHRBWk0Htik3J/w@public.gmane.org>
Cc: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, mturquette-rdvid1DuHRBWk0Htik3J/w@public.gmane.org, sboyd-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, axboe-tSWWG44O7X1aa/9Udqfwiw@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-clk-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-ide-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

02.06.2020 11:19, LABBE Corentin пишет:
...
>> Sounds like PLLE needs to be enabled for SATA, but ahci-tegra driver
>> doesn't do that.
>>
>> Could you please try this change:
>>
>> --- >8 ---
>> diff --git a/drivers/clk/tegra/clk-tegra124.c
>> b/drivers/clk/tegra/clk-tegra124.c
>> index e931319dcc9d..7dbc14652830 100644
>> --- a/drivers/clk/tegra/clk-tegra124.c
>> +++ b/drivers/clk/tegra/clk-tegra124.c
>> @@ -1330,6 +1330,7 @@ static struct tegra_clk_init_table
>> common_init_table[] __initdata = {
>>  	{ TEGRA124_CLK_I2S3_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
>>  	{ TEGRA124_CLK_I2S4_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
>>  	{ TEGRA124_CLK_VIMCLK_SYNC, TEGRA124_CLK_CLK_MAX, 24576000, 0 },
>> +	{ TEGRA124_CLK_PLL_E, TEGRA124_CLK_CLK_MAX, 0, 1 },
>>  	/* must be the last entry */
>>  	{ TEGRA124_CLK_CLK_MAX, TEGRA124_CLK_CLK_MAX, 0, 0 },
>>  };
>> --- >8 ---
> 
> This patch alone does not fix the issue.

I'd try to enable all the clocks and voltage regulators that are enabled
by the USB driver. Also won't hurt to check the clock rate
configurations with the enabled / disabled USB, try to replicate the
working configuration.
