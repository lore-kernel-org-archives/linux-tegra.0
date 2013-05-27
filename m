From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/6] gpu: host1x: Fix memory access in syncpt request
Date: Mon, 27 May 2013 09:56:30 +0300
Message-ID: <51A3039E.5090808@nvidia.com>
References: <1368791388-31441-1-git-send-email-amerilainen@nvidia.com> <1368791388-31441-4-git-send-email-amerilainen@nvidia.com> <20130526101551.GC1652@mithrandir>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130526101551.GC1652@mithrandir>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 05/26/2013 01:15 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Fri, May 17, 2013 at 02:49:45PM +0300, Arto Merilainen wrote:
>> This patch fixes a bad memory access in syncpoint request code. If
>> no syncpoints were available, the code accessed unreserved memory
>> area causing unexpected behaviour.
>>
>> Signed-off-by: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>> ---
>>   drivers/gpu/host1x/syncpt.c |    2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/host1x/syncpt.c b/drivers/gpu/host1x/syncpt.c
>> index 5bf5366..6b7ee88 100644
>> --- a/drivers/gpu/host1x/syncpt.c
>> +++ b/drivers/gpu/host1x/syncpt.c
>> @@ -40,7 +40,7 @@ static struct host1x_syncpt *_host1x_syncpt_alloc(struct host1x *host,
>>
>>   	for (i = 0; i < host->info->nb_pts && sp->name; i++, sp++)
>>   		;
>> -	if (sp->dev)
>> +	if (i >= host->info->nb_pts)
>>   		return NULL;
>
> While changing this, can you please add a blank line between the loop
> and the new 'if (...)'?
>

Yep. Will do.

- Arto
