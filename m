From: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH V1] mfd: tps65910: Initialize irq platform data properly
Date: Sun, 19 Feb 2012 13:04:07 +0530
Message-ID: <4F40A5EF.4080909@nvidia.com>
References: <1326898156-11293-1-git-send-email-ldewangan@nvidia.com> <4F2A95F2.9000006@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4F2A95F2.9000006-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Laxman Dewangan <ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org" <sameo-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Linus Walleij <linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Samuel,
Can you please review this patch? Without this change, the device is 
corrupting other irq registration because it tries to register  wrong irqs.

Thanks,
Laxman

On Thursday 02 February 2012 07:26 PM, Laxman Dewangan wrote:
> On Wednesday 18 January 2012 08:19 PM, Laxman Dewangan wrote:
>> irq_base of the tps65910 irq platform data should be
>> initialized with the board provided irq_base data.
>>
>> Signed-off-by: Laxman Dewangan<ldewangan-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>    drivers/mfd/tps65910.c |    2 +-
>>    1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/mfd/tps65910.c b/drivers/mfd/tps65910.c
>> index c1da84b..8517481 100644
>> --- a/drivers/mfd/tps65910.c
>> +++ b/drivers/mfd/tps65910.c
>> @@ -168,7 +168,7 @@ static int tps65910_i2c_probe(struct i2c_client *i2c,
>>    		goto err;
>>
>>    	init_data->irq = pmic_plat_data->irq;
>> -	init_data->irq_base = pmic_plat_data->irq;
>> +	init_data->irq_base = pmic_plat_data->irq_base;
>>
>>    	tps65910_gpio_init(tps65910, pmic_plat_data->gpio_base);
>>
> Hi Samuel,
> Any feedback on this patch?
>
> Thanks,
> Laxman
>
>
