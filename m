From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: Re: Arm errata 752520
Date: Fri, 11 Oct 2013 09:45:11 -0600
Message-ID: <52581D07.8020206@wwwdotorg.org>
References: <20131011105401.443ccdc1@parrot.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20131011105401.443ccdc1-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
Cc: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>, Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 10/11/2013 02:54 AM, Matthieu CASTET wrote:
> Hi,
> 
> tegra kernel on android tree have a workaround for cortex A9 errata
> 752520 :

You probably wanted to email the Tegra maintainers and list.

> "ARM: errata: 752520: Faulty arbitration between PLD and Cacheable TLB
> requests may create a system deadlock."
> https://android.googlesource.com/kernel/tegra/+/eabc12e1afe0bfc2f9e6f7bacae03985439df1a2%5E!/#F1
> 
> But this errata is not in mainline kernel. Do you know why ?
> Should a patch be submitted to add it ?

Looking at that link, the WAR is enabled in the CPU's diagnostic
register, and IIRC, writes to that register are only possible from
secure mode. Since the Linux kernel does not always run in secure mode,
and has no way of detecting whether it is, it cannot implement the WAR.
Instead, the bootloader or secure firmware must do this before booting
the kernel.

> PS : There is also another patch for errata 720791.

I assume there are similar limits on the "chicken power ctrl" register,
whatever that is! (name take from the same kernel source tree you linked
to above).
