From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 09/24] PM / devfreq: tegra30: Reset boosting on startup
Date: Tue, 16 Jul 2019 16:19:21 +0300
Message-ID: <d86c8b97-40b7-ba63-e0a0-736862fa786c@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223639epcas4p392300747244905ec06f580394d579eb4@epcas4p3.samsung.com>
 <20190707223303.6755-10-digetx@gmail.com>
 <caed4a78-ad8a-5bee-adc4-4a342e2898c3@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <caed4a78-ad8a-5bee-adc4-4a342e2898c3@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.07.2019 15:13, Chanwoo Choi пишет:
> On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
>> Governor could be stopped while boosting is active. We have assumption
>> that everything is reset on governor's restart, including the boosting
>> value, which was missed.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index d5d04c25023b..32fe95458ee7 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -536,6 +536,9 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>>  {
>>  	u32 val = 0, target_freq;
>>  
>> +	/* we don't want boosting on restart */
> 
> nitpick.
> I think that following comment is proper in my case.
> In my case, I think 'we' expression is not good
> 
> 	/* Reset the boost frequency on restart */

Okay, I'll change the wording.

>> +	dev->boost_freq = 0;
>> +
>>  	target_freq = clk_get_rate(tegra->emc_clock) / KHZ;
>>  	dev->avg_count = target_freq * ACTMON_SAMPLING_PERIOD;
>>  	device_writel(dev, dev->avg_count, ACTMON_DEV_INIT_AVG);
>>
> 
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> 
