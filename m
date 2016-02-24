From: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH] regulator: core: fix error path of
 regulator_ena_gpio_free
Date: Wed, 24 Feb 2016 09:26:03 +0100
Message-ID: <20160224082602.GC19954@box2.japko.eu>
References: <56CC6979.3050305@nvidia.com>
 <1456238830-13733-1-git-send-email-krzysztof.adamski@tieto.com>
 <56CC7863.4080202@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <56CC7863.4080202-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Mark Brown <broonie-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 23, 2016 at 03:18:59PM +0000, Jon Hunter wrote:
>
>On 23/02/16 14:47, Krzysztof Adamski wrote:
>> Signed-off-by: Krzysztof Adamski <krzysztof.adamski-++hxYGjEMp0AvxtiuMwx3w@public.gmane.org>
>> Reported-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
>Nit ... I think that order of the above should be reversed.
>

Couldn't find any reference stating proper order of those tags and 
briefly looking at other commit messages shows this order as quite 
common.

>> ---
>>  drivers/regulator/core.c | 8 +++-----
>>  1 file changed, 3 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/regulator/core.c b/drivers/regulator/core.c
>> index 6ee9ba4..d1e7859 100644
>> --- a/drivers/regulator/core.c
>> +++ b/drivers/regulator/core.c
>> @@ -3919,7 +3919,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>>  		if (ret != 0) {
>>  			rdev_err(rdev, "Failed to request enable GPIO%d: %d\n",
>>  				 config->ena_gpio, ret);
>> -			goto wash;
>> +			goto clean;
>>  		}
>>  	}
>>
>> @@ -3942,7 +3942,7 @@ regulator_register(const struct regulator_desc *regulator_desc,
>>
>>  	ret = set_machine_constraints(rdev, constraints);
>>  	if (ret < 0)
>> -		goto scrub;
>> +		goto wash;
>>
>>  	if (init_data && init_data->supply_regulator)
>>  		rdev->supply_name = init_data->supply_regulator;
>> @@ -3972,10 +3972,8 @@ out:
>>  unset_supplies:
>>  	unset_regulator_supplies(rdev);
>>
>> -scrub:
>> -	regulator_ena_gpio_free(rdev);
>> -
>>  wash:
>> +	regulator_ena_gpio_free(rdev);
>>  	device_unregister(&rdev->dev);
>>  	/* device core frees rdev */
>>  	rdev = ERR_PTR(ret);
>
>What about the case where device_register() fails? I think you still
>call clean and so you will leak the gpio?
>
>Jon
>
True. I couldn't find anything more clever than calling 
regulator_ena_gpio_free() in two paths like in an upcomming v2. Putting 
it inside of regulator_dev_release() won't entirely fix the problem 
either as this won't be called in this particular case 
(device_register() fail). I personally still prefer calling 
regulator_ena_gpio_free() inside of regulator_register insted of 
deffering it to regulator_dev_release() as it seems to be clearer to me.

Best regards,
Krzysztof Adamski
