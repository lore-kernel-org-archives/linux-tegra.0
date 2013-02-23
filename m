From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/4] ARM: tegra: pmc: add power on function for secondary
 CPUs
Date: Sat, 23 Feb 2013 16:59:25 -0700
Message-ID: <512957DD.8040406@wwwdotorg.org>
References: <1361515491-16199-1-git-send-email-josephl@nvidia.com>  <1361515491-16199-3-git-send-email-josephl@nvidia.com>  <5127BAD2.8030904@wwwdotorg.org> <1361604480.1804.59.camel@jlo-ubuntu-64.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361604480.1804.59.camel-yx3yKKdKkHfc7b1ADBJPm0n48jw8i0AO@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02/23/2013 12:28 AM, Joseph Lo wrote:
> On Sat, 2013-02-23 at 02:37 +0800, Stephen Warren wrote:
>> On 02/21/2013 11:44 PM, Joseph Lo wrote:
>>> Adding the power on function for secondary CPUs in PMC driver, this can
>>> help us to remove legacy powergate driver and add generic power domain
>>> support later.
>>
>>> diff --git a/arch/arm/mach-tegra/pmc.c b/arch/arm/mach-tegra/pmc.c
>>> +static int tegra_pmc_get_cpu_powerdomain_id(int cpuid)
>>> +{
>>> +	if (cpuid <= 0 || cpuid > num_possible_cpus())
>>
>> cpuid >= num_possible_cpus()?
>>
> Yes.
> 
>>> +static int tegra_pmc_powergate_set(int id, bool new_state)
>>> +{
>>> +	bool status;
>>> +	unsigned long flags;
>>> +
>>> +	spin_lock_irqsave(&tegra_powergate_lock, flags);
>>> +
>>> +	status = tegra_pmc_readl(PMC_PWRGATE_STATUS) & (1 << id);
>>
>> I would perform the read and the logical operations separately. Same for
>> the write below.
>>
>> Don't you want to and with ~BIT(id) not BIT(id)?
>>
> This is what I want.
> WARN_ON(!(!!(status & BIT(id)) ^ new_state));

Oh sorry, I guess this isn't a standard read-modify-write cycle, but
something else.

So yes, the & in the register read is probably fine as you have it, but
yes there is an issue in the current WARN_ON comparison, as you say.

The WARN_ON you gave above is rather complex. Simplest might be:

u32 reg = tegra_pmc_readl(PMC_PWRGATE_STATUS);
bool old_state = (reg >> id) & 1;
WARN_ON(new_state == old_state);
