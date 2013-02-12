From: Mark Rutland <mark.rutland-5wv7dgnIgG8@public.gmane.org>
Subject: Re: [PATCH] HACK: ARM: Fix generic timer broadcast for TWD
Date: Tue, 12 Feb 2013 17:24:18 +0000
Message-ID: <20130212172418.GC13775@e106331-lin.cambridge.arm.com>
References: <1360684194-10894-1-git-send-email-thierry.reding@avionic-design.de>
 <20130212155516.GP17833@n2100.arm.linux.org.uk>
 <20130212171217.GB13775@e106331-lin.cambridge.arm.com>
 <20130212171501.GT17833@n2100.arm.linux.org.uk>
Mime-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130212171501.GT17833-l+eeeJia6m9vn6HldHNs0ANdhmdF6hFW@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Russell King - ARM Linux <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Santosh Shilimkar <santosh.shilimkar-l0cyMroinI0@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Tue, Feb 12, 2013 at 05:15:01PM +0000, Russell King - ARM Linux wrote:
> On Tue, Feb 12, 2013 at 05:12:17PM +0000, Mark Rutland wrote:
> > [...]
> > 
> > > So, things to be done here:
> > > 1. Fix the #else part of the code.
> > > 2. Fix the reported oops.
> > 
> > I believe the patch below solves point 1. Nothing refers to smp_timer_broadcast
> > any more (as I've tested with git grep), so removing it shouldn't create any
> > additional problems.
> > 
> > Russell, are you happy for me to drop this in the patch system?
> 
> Yes, it might as well go into the devel-stable branch along with your
> other patches.  Thanks.
> 

Submitted as 7651/1.

Thanks,
Mark.
