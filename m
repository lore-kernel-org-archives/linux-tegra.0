From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 3/4] ARM: tegra: make tegra_resume can work with current
 and later chips
Date: Wed, 09 Oct 2013 10:04:28 -0600
Message-ID: <52557E8C.7080000@wwwdotorg.org>
References: <1381220587-29697-1-git-send-email-josephl@nvidia.com>	 <1381220587-29697-4-git-send-email-josephl@nvidia.com>	 <52543A24.3020108@wwwdotorg.org>	 <1381288295.10638.23.camel@jlo-ubuntu-64.nvidia.com> <1381307002.2200.3.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1381307002.2200.3.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/09/2013 02:23 AM, Joseph Lo wrote:
> On Wed, 2013-10-09 at 11:11 +0800, Joseph Lo wrote:
>> On Wed, 2013-10-09 at 01:00 +0800, Stephen Warren wrote:
>>> On 10/08/2013 02:23 AM, Joseph Lo wrote:
>>>> diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
>>>
>>>>  not_ca9:
>>>> +	mov32	r9, 0xc0f
>>>> +	cmp	r8, r9
>>>> +	bleq	tegra_init_l2_for_a15
>>>
>>> That's checking whether the CPU type is a Cortex-A15, isn't it? The only
>>> CPUs that exist NVIDIA SoCs are Cortex-A9 and Cortex-A15, so I don't see
>>> why we need to check whether the CPU is a Cortex-A15, given this label
>>> is jumped to only when the CPU isn't a Cortex-A9.
>>
>> Good catch. Will fix.
>>
> Ah! I just realize the Cortex-A9 will go through here as well. So I
> still need to code to make sure only Cortex-A15 execute the function.

In that case, there's a bug in the label name; A9 CPUs shouldn't execute
code that's "not_ca9"...
