From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: [PATCH 5/5] ARM: tegra: cpuidle: use firmware call for power
 down
Date: Wed, 22 Jan 2014 13:45:00 -0700
Message-ID: <52E02DCC.1000404@wwwdotorg.org>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com> <1390299016-14105-6-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1390299016-14105-6-git-send-email-acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Alexandre Courbot <acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 01/21/2014 03:10 AM, Alexandre Courbot wrote:
> Invoke the do_idle() firmware call before suspending a CPU so that the
> underlying firmware (if any) can take necessary action.

> diff --git a/arch/arm/mach-tegra/cpuidle-tegra114.c b/arch/arm/mach-tegra/cpuidle-tegra114.c

> @@ -45,6 +46,8 @@ static int tegra114_idle_power_down(struct cpuidle_device *dev,
>  
>  	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_ENTER, &dev->cpu);
>  
> +	call_firmware_op(do_idle);
> +
>  	cpu_suspend(0, tegra30_sleep_cpu_secondary_finish);
>  
>  	clockevents_notify(CLOCK_EVT_NOTIFY_BROADCAST_EXIT, &dev->cpu);

Don't you need to have the kernel also *not* do something when entering
idle; doesn't the FW op replace some of the register writes that the
kernel would otherwise be doing?
