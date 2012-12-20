From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 2/2] ARM: tegra: moving the clock gating procedure to
 tegra_cpu_kill
Date: Thu, 20 Dec 2012 10:01:27 -0700
Message-ID: <50D34467.9000006@wwwdotorg.org>
References: <1355970519-28200-1-git-send-email-josephl@nvidia.com> <1355970519-28200-2-git-send-email-josephl@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1355970519-28200-2-git-send-email-josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 12/19/2012 07:28 PM, Joseph Lo wrote:
> The tegra_cpu_die was be executed by the CPU itslf. So the clock gating
> procedure won't be executed after the CPU hardware shutdown code. Moving
> the clock gating procedure to tegra_cpu_kill that will be run by another
> CPU after the CPU died.

Hmmm. I wonder if this is enough to make kexec-on-Tegra-with-SMP-enabled
work without explicitly hot-unplugging all the CPUs first... An
implementation of cpu_kill() was a major part of what was missing. I
thought an implementation of cpu_kill() would require a bunch of code
from cpu_die() too. Does this patch assume cpu_die() has executed first,
and only then cpu_kill() will work, or can cpu_kill() be used on its own?

> diff --git a/arch/arm/mach-tegra/hotplug.c b/arch/arm/mach-tegra/hotplug.c

> @@ -34,10 +45,6 @@ void __ref tegra_cpu_die(unsigned int cpu)
>  	/* Shut down the current CPU. */
>  	tegra_hotplug_shutdown();
>  
> -	/* Clock gate the CPU */
> -	tegra_wait_cpu_in_reset(cpu);
> -	tegra_disable_cpu_clock(cpu);

I believe that's the last use of the calculation performed right at the
start of this function:

        cpu = cpu_logical_map(cpu);

Can you remove that?

Also, Peter, can you review these 2 patches as well?
