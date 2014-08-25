From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH v2 1/4] of: Add NVIDIA Tegra Legacy Interrupt Controller
 binding
Date: Mon, 25 Aug 2014 11:35:42 -0600
Message-ID: <53FB73EE.7000508@wwwdotorg.org>
References: <1403917351-13215-1-git-send-email-thierry.reding@gmail.com> <53B1C948.6050603@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <53B1C948.6050603-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 06/30/2014 02:32 PM, Stephen Warren wrote:
> On 06/27/2014 07:02 PM, Thierry Reding wrote:
>> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>>
>> The Legacy Interrupt Controller found on NVIDIA Tegra SoCs is used by
>> the AVP coprocessor and can also serve as a backup for the ARM Cortex
>> CPU's local interrupt controller (GIC).
>>
>> The LIC is subdivided into multiple identical units, each handling 32
>> possible interrupt sources.
>
> The series looks OK to me, although I guess there will be a V3 to
> address Mark's comments?

Thierry, do you still want this series applied? I'm not sure if it's 
required by or conflicts with any of your later patches to move code out 
of arch/arm/mach-tegra/?

If this series should still be applied, I guess I can fix up Mark's 
remaining comment (the bracketing of the multiple reg entries in the DT) 
when applying it, at least if you don't want to repost it yourself.
