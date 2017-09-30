From: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH v3 1/6] gpu: host1x: Enable Tegra186 syncpoint protection
Date: Sat, 30 Sep 2017 10:01:51 +0300
Message-ID: <7f1764a7-c41c-3c56-5c7f-5506e6a9fc01@kapsi.fi>
References: <20170928125044.32516-1-mperttunen@nvidia.com>
 <20170928125044.32516-2-mperttunen@nvidia.com>
 <8391dc88-36a1-0b3c-9ffa-42ce0238dc3f@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <8391dc88-36a1-0b3c-9ffa-42ce0238dc3f-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 09/30/2017 05:41 AM, Dmitry Osipenko wrote:
> On 28.09.2017 15:50, Mikko Perttunen wrote:
>> ..
>> diff --git a/drivers/gpu/host1x/hw/channel_hw.c b/drivers/gpu/host1x/hw/channel_hw.c
>> index 8447a56c41ca..b929d7f1e291 100644
>> --- a/drivers/gpu/host1x/hw/channel_hw.c
>> +++ b/drivers/gpu/host1x/hw/channel_hw.c
>> @@ -147,6 +147,9 @@ static int channel_submit(struct host1x_job *job)
>>   
>>   	syncval = host1x_syncpt_incr_max(sp, user_syncpt_incrs);
>>   
>> +	/* assign syncpoint to channel */
>> +	host1x_hw_syncpt_assign_to_channel(host, sp, ch);
>> +
> 
> Since you've preserved the comment, what about to extend it with a brief
> explanation of what actually the 'assignment' does? Like that CDMA will stop
> execution on touching any syncpoint other then the assigned one.

Whoops, I actually forgot to remove that :) I think the best would be to 
remove the comment here and have a more proper description of the 
feature somewhere else.

Mikko
