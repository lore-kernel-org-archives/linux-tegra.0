From: Laxman Dewangan <ldewangan@nvidia.com>
Subject: Re: [PATCH 3/5] rtc: tegra: use module_platform_driver_probe for
 module init/exit
Date: Tue, 12 Mar 2013 00:59:41 +0530
Message-ID: <513E30A5.8020104@nvidia.com>
References: <1362852588-13362-1-git-send-email-ldewangan@nvidia.com> <1362852588-13362-4-git-send-email-ldewangan@nvidia.com> <513E1153.20207@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <513E1153.20207@wwwdotorg.org>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: "akpm@linux-foundation.org" <akpm@linux-foundation.org>, "a.zummo@towertech.it" <a.zummo@towertech.it>, "rtc-linux@googlegroups.com" <rtc-linux@googlegroups.com>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
List-Id: linux-tegra@vger.kernel.org

On Monday 11 March 2013 10:46 PM, Stephen Warren wrote:
> On 03/09/2013 11:09 AM, Laxman Dewangan wrote:
>> Use macro module_platform_driver_probe() to reduce some of the
>> boilerplate code in the driver.
>>
>> Signed-off-by: Laxman Dewangan <ldewangan@nvidia.com>
>> ---
>>   drivers/rtc/rtc-tegra.c |   12 +-----------
>>   1 files changed, 1 insertions(+), 11 deletions(-)
>>
>> diff --git a/drivers/rtc/rtc-tegra.c b/drivers/rtc/rtc-tegra.c
>> index f7718de..4cba10d 100644
>> --- a/drivers/rtc/rtc-tegra.c
>> +++ b/drivers/rtc/rtc-tegra.c
>> @@ -451,17 +451,7 @@ static struct platform_driver tegra_rtc_driver = {
>>   	},
>>   };
>>   
>> -static int __init tegra_rtc_init(void)
>> -{
>> -	return platform_driver_probe(&tegra_rtc_driver, tegra_rtc_probe);
>> -}
>> -module_init(tegra_rtc_init);
>> -
>> -static void __exit tegra_rtc_exit(void)
>> -{
>> -	platform_driver_unregister(&tegra_rtc_driver);
>> -}
>> -module_exit(tegra_rtc_exit);
>> +module_platform_driver_probe(tegra_rtc_driver, tegra_rtc_probe);
> Out of curiosity here, why not just module_platform_driver(); can't the
> instantiation of the RTC device be driven by the presence of the DT
> node, and hence the creation of the platform device object, just like
> any other driver/device?

Theoretically it should work but I will work with John (original author) 
about using the platform_driver_probe().
If he agrees then  I will send patch to convert it to 
module_platform_driver().
