From: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCHv7 10/10] drm: tegra: Add gr2d device
Date: Tue, 19 Mar 2013 18:37:13 +0200
Message-ID: <51489439.7080901@nvidia.com>
References: <1363178186-2017-1-git-send-email-tbergstrom@nvidia.com> <1363178186-2017-11-git-send-email-tbergstrom@nvidia.com> <20130315121332.GA3374@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130315121332.GA3374-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "airlied-cv59FeDIM0c@public.gmane.org" <airlied-cv59FeDIM0c@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 15.03.2013 14:13, Thierry Reding wrote:
> Also you now create a lookup table (or bitfield actually) as we
> discussed but you still pass around a function to check the lookup table
> against. What I originally intended was to not pass a function around at
> all but directly use the lookup table/bitfield. However I think we can
> leave this as-is for now and change it later if required.

Yeah, I think it's better if we leave this as is now. We should actually
have one table for host1x and one for 2D. The host1x one should be
shared between the drivers, but the table for client unit should be
local to the driver.

Let's take this up again when we have another driver.

> 
>> +static int gr2d_probe(struct platform_device *pdev)
>> +{
>> +     struct device *dev = &pdev->dev;
>> +     struct host1x_drm *host1x = host1x_get_drm_data(dev->parent);
>> +     int err;
>> +     struct gr2d *gr2d = NULL;
>> +     struct host1x_syncpt **syncpts;
> 
> I don't think there's a need for this temporary variable. You could just
> use gr2d->client.syncpts directly.

I actually ended up with pretty long lines when I tried this, so I hope
it's ok to leave as is.

> 
>> +     gr2d = devm_kzalloc(dev, sizeof(*gr2d), GFP_KERNEL);
>> +     if (!gr2d)
>> +             return -ENOMEM;
>> +
>> +     syncpts = devm_kzalloc(dev, sizeof(*syncpts), GFP_KERNEL);

F.ex. this line would split two two lines.

Otherwise the changes should be now pretty much ok. You sent a bunch of
changes (thanks) that I merged to my tree. I'll just need to do some
testing and re-split the patches and send v8.

Terje
