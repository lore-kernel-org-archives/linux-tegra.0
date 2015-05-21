From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Thu, 21 May 2015 18:44:08 +0300
Message-ID: <555DFD48.4000609@kapsi.fi>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com> <1432214425-27137-4-git-send-email-amerilainen@nvidia.com> <555DEE5F.2060100@nvidia.com> <555DF576.7070307@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <555DF576.7070307-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 05/21/2015 06:10 PM, Arto Merilainen wrote:
> ...
>>> +
>>> +    vic->rst = devm_reset_control_get(dev, "vic03");
>>
>> I might prefer just "vic" as the clock/reset name. The name is often
>> used as a sort of "role" for the clock/reset for the device, not
>> necessarily the raw name of the "correct" clock/reset.
>>
>
> I considered that - but I then noticed that
> drivers/clk/tegra/clk-tegra124.c was already using vic03 variant. I can
> write a patch for changing that too.

Well, the two can be different; the clock-name in device tree kind of 
means "string that i use to refer to a clock that powers the VIC unit". 
It's not really a big deal though, both ways are used in DT bindings.

Mikko
