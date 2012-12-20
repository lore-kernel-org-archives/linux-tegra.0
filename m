From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH] kexec: disable non-boot CPUs
Date: Thu, 20 Dec 2012 10:59:48 -0700
Message-ID: <50D35214.4090008@wwwdotorg.org>
References: <1355960681-32015-1-git-send-email-swarren@wwwdotorg.org> <20121220104945.GC16887@mudshark.cambridge.arm.com> <50D34934.9070106@wwwdotorg.org> <20121220173611.GC5387@mudshark.cambridge.arm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121220173611.GC5387-MRww78TxoiP5vMa5CHWGZ34zcgK1vI+I0E9HWUfgJXw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 12/20/2012 10:36 AM, Will Deacon wrote:
> On Thu, Dec 20, 2012 at 05:21:56PM +0000, Stephen Warren wrote:
>> On 12/20/2012 03:49 AM, Will Deacon wrote:
>>> If you do manage to get this merged, please can you follow up with a patch
>>> to remove the smp_kill_cpus bits from arch/arm/kernel/smp.c please? It only
>>> exists as a hook to do exactly this and currently nobody is using it afaict.
>>
>> I originally implemented this in
>> arch/arm/kernel/process.c:machine_shutdown(), which currently is:
>>
>> void machine_shutdown(void)
>> {
>> #ifdef CONFIG_SMP
>> 	smp_send_stop();
>> #endif
>> }
>>
>> and I changed it to something like:
>>
>> void machine_shutdown(void)
>> {
>> #ifdef CONFIG_HOTPLUG_CPU
>>  	disable_nonboot_cpus();
>> #elifdef CONFIG_SMP
>> 	smp_send_stop();
>> #endif
>> }
>>
>> ... but then figured that moving it up into the core kexec code would be
>> better, so that everything always worked the same way.
> 
> Hmmm, isn't this racy: requiring the secondaries to hit idle and notice
> they're offline and call cpu_die before the primary has replace the kernel
> image?

Isn't disable_nonboot_cpus() synchronous? If not, I imagine my original
patch wasn't any better in this respect, except that the hotunplug
happened earlier, and hence reduced the likelihood of actually seeing
any such issues.

>> Anyway, the change above addresses Eric's concern about isolating the
>> change to ARM. Does that seem like a reasonable thing for the ARM code
>> to do?
> 
> I think you're better off using what we currently have and hanging your code
> off platform_cpu_kill.

OK, I'll look into that. Joseph Lo just posted patches to implement
cpu_kill() on Tegra, which was needed to fix some issues in our hotplug
code anyway. Perhaps that will remove the need for any other changes...
