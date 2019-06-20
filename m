From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v3 7/8] clocksource/drivers/tegra: Cycles can't be 0
Date: Fri, 21 Jun 2019 00:59:23 +0300
Message-ID: <97c75bd3-3448-de52-46c2-3e302a6907d5@gmail.com>
References: <20190618140358.13148-1-digetx@gmail.com>
 <20190618140358.13148-8-digetx@gmail.com> <20190619081907.GH3187@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190619081907.GH3187@ulmo>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

19.06.2019 11:19, Thierry Reding пишет:
> On Tue, Jun 18, 2019 at 05:03:57PM +0300, Dmitry Osipenko wrote:
>> Tegra's timer uses n+1 scheme for the counter, i.e. timer will fire after
>> one tick if 0 is loaded. The minimum and maximum numbers of oneshot ticks
>> are defined by clockevents_config_and_register(min, max) invocation and
>> the min value is set to 1 tick. Hence "cycles" value can't ever be 0,
>> unless it's a bug in clocksource core.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/clocksource/timer-tegra.c | 13 ++++++++++---
>>  1 file changed, 10 insertions(+), 3 deletions(-)
> 
> Acked-by: Thierry Reding <treding@nvidia.com>
> 

Thanks!
