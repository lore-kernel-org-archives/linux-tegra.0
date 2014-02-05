From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: cpuidle: use firmware call for power
 down
Date: Wed, 05 Feb 2014 09:28:18 -0700
Message-ID: <52F266A2.1030503@wwwdotorg.org>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com> <1390299016-14105-6-git-send-email-acourbot@nvidia.com> <52E02DCC.1000404@wwwdotorg.org> <CAAVeFuKLtC62+bujY4724hMV_6M8Ow0s=6zRn_M87VX4PHQgxA@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAAVeFuKLtC62+bujY4724hMV_6M8Ow0s=6zRn_M87VX4PHQgxA-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Linux Kernel Mailing List <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 01/23/2014 12:39 AM, Alexandre Courbot wrote:
> On Thu, Jan 23, 2014 at 5:45 AM, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org> wrote:
>> On 01/21/2014 03:10 AM, Alexandre Courbot wrote:
>>> Invoke the do_idle() firmware call before suspending a CPU so that the
>>> underlying firmware (if any) can take necessary action.
>>
>>> diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c
>>
>>> @@ -45,6 +46,8 @@ static int tegra114_idle_power_down(struct cpuidle_device *dev,
>>>
>>>       clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
>>>
>>> +     call_firmware_op(do_idle);
>>> +
>>>       cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
>>>
>>>       clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);
>>
>> Don't you need to have the kernel also *not* do something when entering
>> idle; doesn't the FW op replace some of the register writes that the
>> kernel would otherwise be doing?
> 
> It seems like the operation is actually to inform the firmware that we
> are going to suspend the CPU. Downstream kernel also uses it that way.
> But you are right in that we should expect do_idle() to actually
> perform the suspend operation. Maybe a prepare_idle() operation should
> be added to the firmware interface for this purpose?

That sounds like a reasonable change. Is it easy to plumb in?
