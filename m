From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH V2 2/6] ARM: tegra20: cpuidle: add powered-down state
 for secondary CPU
Date: Thu, 06 Dec 2012 11:56:19 -0700
Message-ID: <50C0EA53.6010504@wwwdotorg.org>
References: <1354701715-24150-1-git-send-email-josephl@nvidia.com>  <1354701715-24150-3-git-send-email-josephl@nvidia.com>  <20121205105010.GA12999@e102568-lin.cambridge.arm.com> <1354782322.13857.78.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1354782322.13857.78.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lorenzo Pieralisi <lorenzo.pieralisi-5wv7dgnIgG8@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/06/2012 01:25 AM, Joseph Lo wrote:
> On Wed, 2012-12-05 at 18:50 +0800, Lorenzo Pieralisi wrote:
>> On Wed, Dec 05, 2012 at 10:01:49AM +0000, Joseph Lo wrote:
>>>  static struct cpuidle_driver tegra_idle_driver = {
>>>         .name = "tegra_idle",
>>>         .owner = THIS_MODULE,
>>>         .en_core_tk_irqen = 1,
>>> +#ifdef CONFIG_PM_SLEEP
>>> +       .state_count = 2,
>>> +#else
>>>         .state_count = 1,
>>> +#endif
>>
>> These hardcoded values are not nice.
>>
> OK. I will change it to runtime detection when idle driver registration.

Personally, I find doing this at compile-time much better; the
conditional definition of state_count is right next to the conditional
setup of the array whose size it defines. Assigning state_count at
run-time ense up moving the two pieces of logic apart, which seems
likely to cause more issues...

>>>         .states = {
>>>                 [0] = ARM_CPUIDLE_WFI_STATE_PWR(600),
>>> +#ifdef CONFIG_PM_SLEEP
>>> +               [1] = {
>>> +                       .enter                  = tegra20_idle_lp2,
>>> +                       .exit_latency           = 5000,
>>> +                       .target_residency       = 10000,
>>> +                       .power_usage            = 0,
>>> +                       .flags                  = CPUIDLE_FLAG_TIME_VALID,
>>> +                       .name                   = "powered-down",
>>> +                       .desc                   = "CPU power gated",
>>> +               },
>>> +#endif
>>>         },
>>>  };
