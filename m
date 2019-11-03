From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v7 17/19] PM / devfreq: tegra30: Support variable polling
 interval
Date: Sun, 3 Nov 2019 18:25:19 +0300
Message-ID: <71a16d74-5908-ea97-ae98-4b7d0e99a765@gmail.com>
References: <20191029220019.26773-1-digetx@gmail.com>
 <20191029220019.26773-18-digetx@gmail.com>
 <20191101215816.GB8724@qmqm.qmqm.pl>
 <590f47a4-c75a-e8c9-88b8-b3cd98578969@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <590f47a4-c75a-e8c9-88b8-b3cd98578969@gmail.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

02.11.2019 01:23, Dmitry Osipenko пишет:
> 02.11.2019 00:58, Michał Mirosław пишет:
>> On Wed, Oct 30, 2019 at 01:00:17AM +0300, Dmitry Osipenko wrote:
>>> The ACTMON governor is interrupt-driven and currently hardware's polling
>>> interval is fixed to 16ms in the driver. Devfreq supports variable polling
>>> interval by the generic governors, let's re-use the generic interface for
>>> changing of the polling interval. Now the polling interval can be changed
>>> dynamically via /sys/class/devfreq/devfreq0/polling_interval.
>> [...]
>>> @@ -308,7 +308,7 @@ static unsigned long actmon_device_target_freq(struct tegra_devfreq *tegra,
>>>  	unsigned int avg_sustain_coef;
>>>  	unsigned long target_freq;
>>>  
>>> -	target_freq = dev->avg_count / ACTMON_SAMPLING_PERIOD;
>>> +	target_freq = dev->avg_count / tegra->devfreq->profile->polling_ms;
>>>  	avg_sustain_coef = 100 * 100 / dev->config->boost_up_threshold;
>>>  	target_freq = do_percent(target_freq, avg_sustain_coef);
>>>  	target_freq += dev->boost_freq;
>>
>> Noting a comment in patch 13, if this is hot path you could try reciprocal_divide().
> 
> Hello Michał,
> 
> This not really a hot path, I just wanted to optimize that case to keep
> things a bit nicer.
> 
> Please take a look at the arch/arm/boot/compressed/lib1funcs.S, firstly
> it checks whether divisor is a power of 2 value and then takes optimized
> code path that uses a single shift. Hence the patch 13 still applies here.

On the other hand, there is now only a single case of the division by
polling_ms in the driver which won't bring much benefit, so it indeed
makes sense to skip the patch 13 for now.
