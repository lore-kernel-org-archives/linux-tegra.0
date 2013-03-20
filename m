From: Marek Vasut <marex-ynQEQJNshbs@public.gmane.org>
Subject: Re: [PATCH V4 6/9] ARM: mxs: Provide regulator to pwm-backlight
Date: Wed, 20 Mar 2013 15:03:20 +0100
Message-ID: <201303201503.20480.marex@denx.de>
References: <1363719573-20926-1-git-send-email-achew@nvidia.com> <5148E252.9050900@wwwdotorg.org> <20130320082318.GA28775@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20130320082318.GA28775-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Andrew Chew <achew-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, romain.naour-oid7hba3+9NWj0EZb7rXcA@public.gmane.org, kgene.kim-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, drwyrm-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, stefan-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, laforge-WB6LKoYH/xlAfugRpC6u6w@public.gmane.org, philipp.zabel-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, lost.distance-/E1597aS9LQAvxtiuMwx3w@public.gmane.org, robert.jarzmik-GANU6spQydw@public.gmane.org, eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org, haojian.zhuang-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, kyungmin.park-Sze3O3UU22JBDgjK7y7TUQ@public.gmane.org, gxt-TG0Ac1+ktVePQbnJrJN+5g@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, linux-ci5G2KO2hbZ+pU9mqzGVBQ@public.gmane.org, thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org, acourbot-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, linux-samsung-soc-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, openezx-devel-ZwoEplunGu3n3BO9LpVK+9i2O/JbrIOy@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Mark,

> On Tue, Mar 19, 2013 at 04:10:26PM -0600, Stephen Warren wrote:
> > On 03/19/2013 03:27 PM, Marek Vasut wrote:
> > > Do we really need a mandatory regulator? Why can't it be optional?
> > 
> > IIRC, the previous advice I've seen is that if a device (driver) uses a
> > regulator, it must /require/ a regulator, and if a particular board
> > doesn't actually have a SW-controlled regulator, then a fixed- or dummy-
> > regulator should be provided to satisfy this requirement.
> > 
> > CC'ing Mark Brown to make sure I really do Recall Correctly.
> 
> Yes, and it should be fixed rather than dummy.  The issue is partly that
> it's probably important that the device has power so we don't want to
> just ignore errors and partly that this is something which applies to
> essentially all devices so whatever we do for this case ought to be done
> by the core so all devices can benefit and we don't have to duplicate
> lots of code in individual drivers.

Thanks for clearing this!

Best regards,
Marek Vasut
