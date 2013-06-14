From: Mayuresh Kulkarni <mkulkarni-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH v2 3/4] gpu: host1x: add runtime pm support for dc
Date: Fri, 14 Jun 2013 20:18:26 +0530
Message-ID: <51BB2D3A.1050407@nvidia.com>
References: <1371117218-2326-1-git-send-email-mkulkarni@nvidia.com> <1371117218-2326-4-git-send-email-mkulkarni@nvidia.com> <20130613184938.GE32574@mithrandir> <51BA18EF.4090302@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <51BA18EF.4090302-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Terje Bergstrom <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org" <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org" <airlied-H+wXaHxf7aLQT0dZR+AlfA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Friday 14 June 2013 12:39 AM, Stephen Warren wrote:
> On 06/13/2013 12:49 PM, Thierry Reding wrote:
>> On Thu, Jun 13, 2013 at 03:23:37PM +0530, Mayuresh Kulkarni wrote:
>> [...]
>>> diff --git a/drivers/gpu/host1x/drm/dc.c
>>> b/drivers/gpu/host1x/drm/dc.c
>> [...]
>>> @@ -1128,9 +1129,7 @@ static int tegra_dc_probe(struct
>>> platform_device *pdev) return PTR_ERR(dc->clk); }
>>>
>>> -	err = clk_prepare_enable(dc->clk); -	if (err < 0) -		return
>>> err; +	platform_set_drvdata(pdev, dc);
>>
>> Why do you move the call to platform_set_drvdata() up here?
>
> Presumably the suspend/resume functions need to get the value out of
> the device they're passed, so it needs to be set up early?
>

Yes that is correct, Stephen. The run-time pm call-backs need 2 things: 
correct driver data pointer and correct clock pointer within it. Hence I 
had to move this line upper in sequence.

Same is applicable to gr2d and host1x patches as well.
