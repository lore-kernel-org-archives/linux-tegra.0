From: SF Markus Elfring <elfring-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>
Subject: Re: [patch] drm/tegra: checking IS_ERR() instead of NULL
Date: Fri, 05 Dec 2014 13:07:27 +0100
Message-ID: <54819FFF.4000907@users.sourceforge.net>
References: <20141204110035.GC22643@mwanda> <20141204132349.GD7262@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20141204132349.GD7262-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Dan Carpenter <dan.carpenter-QHcLZuEGTsvQT0dZR+AlfA@public.gmane.org>
Cc: =?windows-1252?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

>> diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
>> index e549afe..fa16048 100644
>> --- a/drivers/gpu/drm/tegra/drm.c
>> +++ b/drivers/gpu/drm/tegra/drm.c
>> @@ -36,8 +36,8 @@ static int tegra_drm_load(struct drm_device *drm, unsigned long flags)
>>  
>>  	if (iommu_present(&platform_bus_type)) {
>>  		tegra->domain = iommu_domain_alloc(&platform_bus_type);
>> -		if (IS_ERR(tegra->domain)) {
>> -			err = PTR_ERR(tegra->domain);
>> +		if (!tegra->domain) {
>> +			err = -ENOMEM;
>>  			goto free;
>>  		}
> 
> Oh, good catch. Applied, thanks.

How do you think about to amend the commit title?

Is the following wording more appropriate?
drm/tegra: Checking for NULL pointer instead of IS_ERR() usage

Regards,
Markus
