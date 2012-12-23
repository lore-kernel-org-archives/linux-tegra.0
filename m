From: Will Deacon <will.deacon-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] kexec: disable non-boot CPUs
Date: Sun, 23 Dec 2012 11:06:02 +0000
Message-ID: <20121223110602.GA16237@mudshark.cambridge.arm.com>
References: <1355960681-32015-1-git-send-email-swarren@wwwdotorg.org>
 <20121220104945.GC16887@mudshark.cambridge.arm.com>
 <50D34934.9070106@wwwdotorg.org>
 <20121220173611.GC5387@mudshark.cambridge.arm.com>
 <50D35214.4090008@wwwdotorg.org>
 <50D371E2.1030807@wwwdotorg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <50D371E2.1030807-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <kexec-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Eric Biederman <ebiederm-aS9lmoZGLiVWk0Htik3J/w@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thu, Dec 20, 2012 at 08:15:30PM +0000, Stephen Warren wrote:
> On 12/20/2012 10:59 AM, Stephen Warren wrote:
> > On 12/20/2012 10:36 AM, Will Deacon wrote:
> >> I think you're better off using what we currently have and hanging your code
> >> off platform_cpu_kill.
> > 
> > OK, I'll look into that. Joseph Lo just posted patches to implement
> > cpu_kill() on Tegra, which was needed to fix some issues in our hotplug
> > code anyway. Perhaps that will remove the need for any other changes...
> 
> Will,

Hi Stephen,

> I just remembered one other advantage of disable_nonboot_cpus(); it
> always makes the kexec happen on the boot CPU. Without this, I believe
> it's random whether CPU0 or CPU1 performs the kexec. I suspect it's most
> likely to work if we can always kexec on the boot CPU rather than a
> random CPU?

It will be the same CPU as the one which made the kexec system call. If you
need to invoke this from a specific CPU, you currently have to do this in
userspace using something like the `taskset' utility. Linux can actually
boot on any physical CPU for ARM now (thanks to the logical map) but most
platforms have restrictions related to secure firmware.

Will
