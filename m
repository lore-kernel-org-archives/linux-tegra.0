From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v2 2/8] regulator: core: Parse max-spread value per
 regulator couple
Date: Tue, 18 Jun 2019 19:27:09 +0300
Message-ID: <a3917cf4-6090-2c47-f8f6-c25db52662e0@gmail.com>
References: <20190603235904.19097-1-digetx@gmail.com>
 <20190603235904.19097-3-digetx@gmail.com>
 <20190617152514.GY5316@sirena.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190617152514.GY5316@sirena.org.uk>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Mark Brown <broonie@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

17.06.2019 18:25, Mark Brown пишет:
> On Tue, Jun 04, 2019 at 02:58:58AM +0300, Dmitry Osipenko wrote:
> 
>> +#include <linux/regulator/driver.h>
>>  #include <linux/regulator/consumer.h>
>>  #include <linux/suspend.h>
>>  
>> @@ -156,7 +157,7 @@ struct regulation_constraints {
>>  	int system_load;
>>  
>>  	/* used for coupled regulators */
>> -	int max_spread;
>> +	int max_spread[MAX_COUPLED];
> 
> I'd rather move MAX_COUPLED into a separate header than include driver.h
> so we've got a bit more compile time sepration.
> 

I'll address this in the next revision.
