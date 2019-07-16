From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v4 10/24] PM / devfreq: tegra30: Don't enable
 consecutive-down interrupt on startup
Date: Tue, 16 Jul 2019 18:17:18 +0300
Message-ID: <54ad7bb8-1ffe-50bc-9003-acc02b1b6f9d@gmail.com>
References: <20190707223303.6755-1-digetx@gmail.com>
 <CGME20190707223642epcas4p1fbfbcf5181e9a25fbbaad9ef95c56f8f@epcas4p1.samsung.com>
 <20190707223303.6755-11-digetx@gmail.com>
 <933b99a1-ac45-25fb-e8d5-0641ec0cab18@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <933b99a1-ac45-25fb-e8d5-0641ec0cab18@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

16.07.2019 15:17, Chanwoo Choi пишет:
> Hi Dmitry,
> 
> On 19. 7. 8. 오전 7:32, Dmitry Osipenko wrote:
>> The consecutive-down event tells that we should perform frequency
>> de-boosting, but boosting is in a reset state on start and hence the
>> event won't do anything useful for us and it will be just a dummy
>> interrupt request.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/tegra30-devfreq.c | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/drivers/devfreq/tegra30-devfreq.c b/drivers/devfreq/tegra30-devfreq.c
>> index 32fe95458ee7..878c9396bb8c 100644
>> --- a/drivers/devfreq/tegra30-devfreq.c
>> +++ b/drivers/devfreq/tegra30-devfreq.c
>> @@ -558,7 +558,6 @@ static void tegra_actmon_configure_device(struct tegra_devfreq *tegra,
>>  		<< ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_NUM_SHIFT;
>>  	val |= ACTMON_DEV_CTRL_AVG_ABOVE_WMARK_EN;
>>  	val |= ACTMON_DEV_CTRL_AVG_BELOW_WMARK_EN;
>> -	val |= ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN;
>>  	val |= ACTMON_DEV_CTRL_CONSECUTIVE_ABOVE_WMARK_EN;
>>  	val |= ACTMON_DEV_CTRL_ENB;
>>  
>>
> 
> Maybe, I think that better to review it by Thierry.
> I'm not sure it is right or not because it depend on h/w.
> 

The CONSECUTIVE_LOWER interrupts are generated if
ACTMON_DEV_CTRL_CONSECUTIVE_BELOW_WMARK_EN is enabled and ISR enables
the BELOW_WMARK_EN bit once CONSECUTIVE_UPPER event is received. The
CONSECUTIVE events are used in for the frequency boosting logic and
there is no boosting on start, hence the CONSECUTIVE_LOWER event isn't
needed on start as well. Hope this helps.
