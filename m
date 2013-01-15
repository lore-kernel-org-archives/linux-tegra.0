From: Joseph Lo <josephl-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [PATCH 00/16] big.LITTLE low-level CPU and cluster power
 management
Date: Tue, 15 Jan 2013 10:44:08 +0800
Message-ID: <1358217848.8513.14.camel@jlo-ubuntu-64.nvidia.com>
References: <1357777251-13541-1-git-send-email-nicolas.pitre@linaro.org>
	 <1358157392.19304.243.camel@jlo-ubuntu-64.nvidia.com>
	 <alpine.LFD.2.02.1301140849020.6300@xanadu.home>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <alpine.LFD.2.02.1301140849020.6300-QuJgVwGFrdf/9pzu0YdTqQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Nicolas Pitre <nicolas.pitre-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Cc: "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, 2013-01-14 at 22:05 +0800, Nicolas Pitre wrote:
> On Mon, 14 Jan 2013, Joseph Lo wrote:
> 
> > Hi Nicolas,
> > 
> > On Thu, 2013-01-10 at 08:20 +0800, Nicolas Pitre wrote:
> > > This is the initial public posting of the initial support for big.LITTLE.
> > > Included here is the code required to safely power up and down CPUs in a
> > > b.L system, whether this is via CPU hotplug, a cpuidle driver or the
> > > Linaro b.L in-kernel switcher[*] on top of this.  Only  SMP secondary
> > > boot and CPU hotplug support is included at this time.  Getting to this
> > > point already represents a significcant chunk of code as illustrated by
> > > the diffstat below.
> > > 
> > > 
> > 
> > Thanks for introducing this series.
> > I am taking a look at this series. It introduced an algorithm for
> > syncing and avoid racing when syncing the power status of clusters and
> > CPUs. Do you think these codes could have a chance to become a generic
> > framework?
> 
> Yes.  As I mentioned before, the bL_ prefix is implied only by the fact 
> that big.LITTLE was the motivation for creating this code.
> 
> > The Tegra chip series had a similar design for CPU clusters and it 
> had
> > limitation that the CPU0 always needs to be the last CPU to be shut down
> > before cluster power down as well. I believe it can also get benefits of
> > this works. We indeed need a similar algorithm to sync CPUs power status
> > before cluster power down and switching.
> > 
> > The "bL_entry.c", "bL_entry.S", "bL_entry.h", "vlock.h" and "vlock.S"
> > looks have a chance to be a common framework for ARM platform even if it
> > just support one cluster. Because some systems had the limitations for
> > cluster power down. That's why the coupled cpuidle been introduced. And
> > this framework could be enabled automatically if platform dependent or
> > by menuconfig.
> 
> Absolutely.
> 
So do you have a plan to make it become a generic framework in this
series or later work?

(And I will add some common power sync wrapper functions that based on
this framework for all Tegra series.)

> 
> > For ex,
> > 	select CPUS_CLUSTERS_POWER_SYNC_FRAMEWORK if SMP && CPU_PM
> > 
> > How do you think of this suggestion?
> 
> I'd prefer a more concise name though.
> 
Sure. :-)

Thanks,
Joseph
