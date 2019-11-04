From: Dmitry Osipenko <digetx@gmail.com>
Subject: Re: [PATCH v8 15/18] PM / devfreq: Add new interrupt_driven flag for
 governors
Date: Mon, 4 Nov 2019 17:15:26 +0300
Message-ID: <b5195266-8f92-f2b6-6dd1-9d706146e729@gmail.com>
References: <20191103204130.2172-1-digetx@gmail.com>
 <CGME20191103204257epcas1p4ce6f9ae729ed6cf6df1816237c80ee45@epcas1p4.samsung.com>
 <20191103204130.2172-16-digetx@gmail.com>
 <f86d35dc-1749-ad29-2023-7d69366bd0d1@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <f86d35dc-1749-ad29-2023-7d69366bd0d1@samsung.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Chanwoo Choi <cw00.choi@samsung.com>, Thierry Reding <thierry.reding@gmail.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, Jonathan Hunter <jonathanh@nvidia.com>, Tomeu Vizoso <tomeu.vizoso@collabora.com>, Peter Geis <pgwipeout@gmail.com>, =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc: linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

04.11.2019 05:48, Chanwoo Choi пишет:
> Hi Dmitry,
> 
> Sorry for the additional comment of this patch.
> I think that you better to change the 'interrupt_driven' checking
> style as following in order to keep the consistency of governor
> flag checking style.

Hello Chanwoo,

Okay, I'll update this patch.

> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
> index 27de8ddeaaa8..fe409fc1bcc4 100644
> --- a/drivers/devfreq/devfreq.c
> +++ b/drivers/devfreq/devfreq.c
> @@ -410,9 +410,11 @@ static void devfreq_monitor(struct work_struct *work)
>   */
>  void devfreq_monitor_start(struct devfreq *devfreq)
>  {
> +       if (devfreq->governor->interrupt_driven)
> +               return;
> +
>         INIT_DEFERRABLE_WORK(&devfreq->work, devfreq_monitor);
>         if (devfreq->profile->polling_ms &&
> -           !devfreq->governor->interrupt_driven)
>                 queue_delayed_work(devfreq_wq, &devfreq->work,
>                         msecs_to_jiffies(devfreq->profile->polling_ms));
>  }
> @@ -475,12 +477,15 @@ void devfreq_monitor_resume(struct devfreq *devfreq)
>         if (!devfreq->stop_polling)
>                 goto out;
>  
> +       if (devfreq->governor->interrupt_driven)
> +               goto out_update;
> +
>         if (!delayed_work_pending(&devfreq->work) &&
>                         devfreq->profile->polling_ms &&
> -                       !devfreq->governor->interrupt_driven)
>                 queue_delayed_work(devfreq_wq, &devfreq->work,
>                         msecs_to_jiffies(devfreq->profile->polling_ms));
>  
> +out_update:
>         devfreq->last_stat_updated = jiffies;
>         devfreq->stop_polling = false;
> 
> 
> If you edit it as following, feel free to add my reviewed-by tag:
> Reviewed-by: Chanwoo Choi <cw00.choi@samsung.com>
> 
> 
> On 19. 11. 4. 오전 5:41, Dmitry Osipenko wrote:
>> Currently interrupt-driven governors (like NVIDIA Tegra30 ACTMON governor)
>> are used to set polling_ms=0 in order to avoid periodic polling of device
>> status by devfreq core. This means that polling interval can't be changed
>> by userspace for such governors.
>>
>> The new governor flag allows interrupt-driven governors to convey that
>> devfreq core shouldn't perform polling of device status and thus generic
>> devfreq polling interval could be supported by these governors now.
>>
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
>> ---
>>  drivers/devfreq/devfreq.c  | 9 +++++++--
>>  drivers/devfreq/governor.h | 3 +++
>>  2 files changed, 10 insertions(+), 2 deletions(-)
>>
>> diff --git a/drivers/devfreq/devfreq.c b/drivers/devfreq/devfreq.c
>> index b905963cea7d..a711a76d386e 100644
>> --- a/drivers/devfreq/devfreq.c
>> +++ b/drivers/devfreq/devfreq.c
>> @@ -410,7 +410,8 @@ static void devfreq_monitor(struct work_struct *work)
>>  void devfreq_monitor_start(struct devfreq *devfreq)
>>  {
>>  	INIT_DEFERRABLE_WORK(&devfreq->work, devfreq_monitor);
>> -	if (devfreq->profile->polling_ms)
>> +	if (devfreq->profile->polling_ms &&
>> +	    !devfreq->governor->interrupt_driven)
>>  		queue_delayed_work(devfreq_wq, &devfreq->work,
>>  			msecs_to_jiffies(devfreq->profile->polling_ms));
>>  }
>> @@ -474,7 +475,8 @@ void devfreq_monitor_resume(struct devfreq *devfreq)
>>  		goto out;
>>  
>>  	if (!delayed_work_pending(&devfreq->work) &&
>> -			devfreq->profile->polling_ms)
>> +			devfreq->profile->polling_ms &&
>> +			!devfreq->governor->interrupt_driven)
>>  		queue_delayed_work(devfreq_wq, &devfreq->work,
>>  			msecs_to_jiffies(devfreq->profile->polling_ms));
>>  
>> @@ -509,6 +511,9 @@ void devfreq_interval_update(struct devfreq *devfreq, unsigned int *delay)
>>  	if (devfreq->stop_polling)
>>  		goto out;
>>  
>> +	if (devfreq->governor->interrupt_driven)
>> +		goto out;
>> +
>>  	/* if new delay is zero, stop polling */
>>  	if (!new_delay) {
>>  		mutex_unlock(&devfreq->lock);
>> diff --git a/drivers/devfreq/governor.h b/drivers/devfreq/governor.h
>> index bbe5ff9fcecf..dc7533ccc3db 100644
>> --- a/drivers/devfreq/governor.h
>> +++ b/drivers/devfreq/governor.h
>> @@ -31,6 +31,8 @@
>>   * @name:		Governor's name
>>   * @immutable:		Immutable flag for governor. If the value is 1,
>>   *			this govenror is never changeable to other governor.
>> + * @interrupt_driven:	Devfreq core won't schedule polling work for this
>> + *			governor if value is set to 1.
>>   * @get_target_freq:	Returns desired operating frequency for the device.
>>   *			Basically, get_target_freq will run
>>   *			devfreq_dev_profile.get_dev_status() to get the
>> @@ -49,6 +51,7 @@ struct devfreq_governor {
>>  
>>  	const char name[DEVFREQ_NAME_LEN];
>>  	const unsigned int immutable;
>> +	const unsigned int interrupt_driven;
>>  	int (*get_target_freq)(struct devfreq *this, unsigned long *freq);
>>  	int (*event_handler)(struct devfreq *devfreq,
>>  				unsigned int event, void *data);
>>
> 
> 
