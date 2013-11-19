From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] ARM: tegra: properly use FUSE clock
Date: Tue, 19 Nov 2013 10:09:36 -0700
Message-ID: <528B9B50.7020504@wwwdotorg.org>
References: <1384771247-16547-1-git-send-email-acourbot@nvidia.com> <20131118114330.GD8646@ulmo.nvidia.com> <528AA750.3080201@wwwdotorg.org> <528AEEB6.4070107@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <528AEEB6.4070107-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alex Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Prashant Gaikwad <pgaikwad-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Mike Turquette <mturquette-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 11/18/2013 09:53 PM, Alex Courbot wrote:
> On 11/19/2013 08:48 AM, Stephen Warren wrote:
>> On 11/18/2013 04:43 AM, Thierry Reding wrote:
>>> On Mon, Nov 18, 2013 at 07:40:47PM +0900, Alexandre Courbot wrote:
>>>> FUSE clock is enabled by most bootloaders, but we cannot expect
>>>> it to be on in all contexts (e.g. kexec).
>>>>
>>>> This patch adds a FUSE clkdev to all Tegra platforms and makes
>>>> sure it is enabled before touching FUSE registers.
>>>> tegra_init_fuse() is invoked during very early boot and thus
>>>> cannot rely on the clock framework ; therefore the FUSE clock is
>>>> forcibly enabled using a register write in that function, and
>>>> remains that way until the clock framework can be used.
>>>>
>>>> Signed-off-by: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org> ---
>>>> arch/arm/mach-tegra/fuse.c       | 41
>>>> +++++++++++++++++++++++++++++++++++++++-
>>>> drivers/clk/tegra/clk-tegra114.c |  1 +
>>>> drivers/clk/tegra/clk-tegra124.c |  1 +
>>>> drivers/clk/tegra/clk-tegra20.c  |  1 +
>>>
>>> Isn't this missing the clock driver changes for Tegra30? Ah...
>>> Tegra30 already has this clock defined. I wonder why only Tegra30
>>> has it. grep says that fuse-tegra isn't used by any drivers, which
>>> also indicates that perhaps we don't need the .dev_id in the first
>>> place. We should be able to get by with just the .con_id = "fuse".
>>>
>>> Also are there any reasons to keep this in one single patch? Since
>>> none of the fuse clocks are used yet, I think the clock changes
>>> could be a separate patch that can go in through the clock tree.
>>> And there isn't even a hard runtime dependency, since if the Tegra
>>> changes were to go in without the clock changes, then the fallback
>>> code in this patch should still turn the clock on properly. It just
>>> might not be turned off again, but isn't that something we can live
>>> with for a short period of time? I think perhaps that could even be
>>> improved, see further below.
>>>
>>> I've added Mike on Cc, he'll need to either take the patch in
>>> through his tree or Ack this one, so he needs to see it
>>> eventually.
>>>
>>>> 4 files changed, 43 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/arch/arm/mach-tegra/fuse.c
>>>> b/arch/arm/mach-tegra/fuse.c index 9a4e910c3796..3b9191b930b5
>>>> 100644 --- a/arch/arm/mach-tegra/fuse.c +++
>>>> b/arch/arm/mach-tegra/fuse.c @@ -22,6 +22,7 @@ #include
>>>> <linux/io.h> #include <linux/export.h> #include <linux/random.h>
>>>> +#include <linux/clk.h> #include <linux/tegra-soc.h>
>>>>
>>>> #include "fuse.h" @@ -54,6 +55,7 @@ int tegra_cpu_speedo_id;        /*
>>>> only exist in Tegra30 and later */ int tegra_soc_speedo_id; enum
>>>> tegra_revision tegra_revision;
>>>>
>>>> +static struct clk *fuse_clk; static int tegra_fuse_spare_bit;
>>>> static void (*tegra_init_speedo_data)(void);
>>>>
>>>> @@ -77,6 +79,22 @@ static const char
>>>> *tegra_revision_name[TEGRA_REVISION_MAX] = { [TEGRA_REVISION_A04]
>>>> = "A04", };
>>>>
>>>> +static void tegra_fuse_enable_clk(void) +{ +    if
>>>> (IS_ERR(fuse_clk)) +        fuse_clk = clk_get_sys("fuse-tegra",
>>>> "fuse"); +    if (IS_ERR(fuse_clk)) +        return;
>>>
>>> Perhaps instead of just returning here, this should actually be
>>> where the code to enable the clock should go.
>>>
>>>> +    clk_prepare_enable(fuse_clk); +} + +static void
>>>> tegra_fuse_disable_clk(void) +{ +    if (IS_ERR(fuse_clk)) +
>>>> return;
>>>
>>> And this is where we could disable it again. That way we should
>>> get equal functionality in both cases.
>>
>> That would need a shared lock with the clock code; at some point, the
>> clock will be registered, and the clock subsystem in control of the
>> enable bit. I think having a very early tegra_init_fuse() come along
>> and force the clock on, and then having the rest of the fuse code use
>> the clock object as soon as it's available, is the safest approach.
>>
>> Of course, I suppose there's still a window where the following might
>> happen:
>>
>> cpu 0:
>> - tegra_fuse_enable_clk entered
>> - fails to clk_get
>>                 cpu 1
>>                 - tegra clk driver is registered
>>                 - clk subsystem initcall disables all
>>                   unused clocks
>> - access a fuse register
>>
>> -> badness
> 
> It seems to me that both solutions require a shared lock with the clock
> code in order to be theoretically safe. The situation you described
> requires a lock to be addressed ; and unless I missed something,
> anything that could break with Thierry's proposal could also only do so
> if we "hold" the clock when the tegra clk driver is registered.
> 
> However we can consider ourselves safe for both cases if we know for
> sure that there is no fuse function in use when this happens. Since
> of_clk_init() is called very early during boot with SMP and preemption
> disabled, isn't that always the case?

Yes, that's true. So, I think it's safe, in practice, without the lock.
