From: Arto Merilainen <amerilainen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 3/4] drm/tegra: Add VIC support
Date: Fri, 22 May 2015 13:12:05 +0300
Message-ID: <555F00F5.5060409@nvidia.com>
References: <1432214425-27137-1-git-send-email-amerilainen@nvidia.com> <1432214425-27137-4-git-send-email-amerilainen@nvidia.com> <555DEE5F.2060100@nvidia.com> <555DF576.7070307@nvidia.com> <555DFD48.4000609@kapsi.fi> <20150522100251.GC16507@ulmo>
Mime-Version: 1.0
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20150522100251.GC16507@ulmo>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, srasal-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, dnibade-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

On 05/22/2015 01:02 PM, Thierry Reding wrote:
> * PGP Signed by an unknown key
>
> On Thu, May 21, 2015 at 06:44:08PM +0300, Mikko Perttunen wrote:
>> On 05/21/2015 06:10 PM, Arto Merilainen wrote:
>>> ...
>>>>> +
>>>>> +    vic->rst = devm_reset_control_get(dev, "vic03");
>>>>
>>>> I might prefer just "vic" as the clock/reset name. The name is often
>>>> used as a sort of "role" for the clock/reset for the device, not
>>>> necessarily the raw name of the "correct" clock/reset.
>>>>
>>>
>>> I considered that - but I then noticed that
>>> drivers/clk/tegra/clk-tegra124.c was already using vic03 variant. I can
>>> write a patch for changing that too.
>>
>> Well, the two can be different; the clock-name in device tree kind of means
>> "string that i use to refer to a clock that powers the VIC unit". It's not
>> really a big deal though, both ways are used in DT bindings.
>
> I'll insist on calling this vic in the clock-names property. The 03 is
> as far as I can tell an encoding of the version number, so if you want
> to call this vic04 in some future version we'll have to needlessly
> patch the driver.

I agree, this is better without 03 postfix will fix this in the next 
version.

- Arto
