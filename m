From: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Subject: Re: [PATCH 1/3] staging:iio:magnetometer:ak8975 Don't use irq_to_gpio()
Date: Thu, 01 Sep 2011 10:24:11 +0100
Message-ID: <4E5F4F3B.7000607@cam.ac.uk>
References: <1314819657-828-1-git-send-email-swarren@nvidia.com> <4E5F4B4E.5060801@cam.ac.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <4E5F4B4E.5060801-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Sender: linux-iio-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
Cc: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, linux-iio-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devel-gWbeCf7V1WCQmaza687I9mD2FQJk+8+b@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/01/11 10:07, Jonathan Cameron wrote:
> On 08/31/11 20:40, Stephen Warren wrote:
>> Tegra doesn't have irq_to_gpio() any more, and ak8975 is included in
>> tegra_defconfig. This causes a build failure. Solve this with a heavy-handed
>> method for now.
>>
>> I suspect the long-term solution is to pass both the IRQ and GPIO IDs
>> to the driver; the GPIO ID coming from either platform data, or perhaps
>> enhancing struct i2c_client to add a gpio field alongside irq.
> Definitely on the platform data front. We need some means of doing this now
> hence my patch putting most trivial form of that in.

Actually taking the time to look at the code...

Can someone explain to me (I have a feeling I may just have forgotten this)
why we aren't using an interrupt here?  It looks like a bus transaction triggered
read.  So why not do a enable_irq followed by triggering the read and use a
waitqueue to wait for an interrupt handler to signal it is done?

Having found the datahsheeting lying around on the net I can't see why this
won't work and be somewhat cleaner than current polling approach.

Jonathan
>> Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Acked-by: Jonathan Cameron <jic23-KWPb1pKIrIJaa/9Udqfwiw@public.gmane.org>
>> ---
>> Russell, now that irq_to_gpio() is going away, can you comment on how
>> you'd like to fix drivers that do this kind of thing? Thanks.
>>
>>  drivers/staging/iio/magnetometer/ak8975.c |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/drivers/staging/iio/magnetometer/ak8975.c b/drivers/staging/iio/magnetometer/ak8975.c
>> index a17fa9f..bd40e32 100644
>> --- a/drivers/staging/iio/magnetometer/ak8975.c
>> +++ b/drivers/staging/iio/magnetometer/ak8975.c
>> @@ -477,7 +477,7 @@ static int ak8975_probe(struct i2c_client *client,
>>  	int err;
>>  
>>  	/* Grab and set up the supplied GPIO. */
>> -	eoc_gpio = irq_to_gpio(client->irq);
>> +	eoc_gpio = -1; /* FIXME: irq_to_gpio(client->irq) */
>>  
>>  	/* We may not have a GPIO based IRQ to scan, that is fine, we will
>>  	   poll if so */
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-iio" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
