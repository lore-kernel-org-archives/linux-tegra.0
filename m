From: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>
Subject: Re: [PATCH v4 03/10] pwm: Add device tree support
Date: Thu, 15 Mar 2012 12:44:37 +0000
Message-ID: <201203151244.37483.arnd@arndb.de>
References: <1331740593-10807-1-git-send-email-thierry.reding@avionic-design.de> <201203150840.42659.arnd@arndb.de> <20120315102944.GB3138@opensource.wolfsonmicro.com>
Mime-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-15"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120315102944.GB3138-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Brown <broonie-yzvPICuk2AATkU/dhu1WVueM+bqZidxxQQ4Iyu8u01E@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Mitch Bradley <wmb-D5eQfiDGL7eakBO8gow8eQ@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Ryan Mallon <rmallon-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Lars-Peter Clausen <lars-Qo5EllUWu/uELgA04lAiVw@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Eric Miao <eric.y.miao-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Thursday 15 March 2012, Mark Brown wrote:
> Similar code is going in for regulators in 3.4 along with the core
> -EPROBE_DEFER change (though not OF specific) and I sent a similar patch
> for GPIOs too, hopefully Grant will ack it in time for it to make it in.
> 
> My theory is that since you need to explicitly know that the thing
> you're requesting is there in order to request it (eg, have a PWM number
> or DT link) the overwhemlingly common case for a failure to request will
> be that the provider didn't register yet which is exactly the case where
> deferral is desired.  It therefore seems sensible to have the framework
> default the drivers to retrying rather than have almost every individual
> driver look at the failure, figure out if it was a missing provider, and
> then retry.  Drivers that have a good reason to fail can always check
> for -EPROBE_DEFER and override it.
> 
> The result should be that we can take advantage of probe deferral over
> large areas of the kernel without having to go and explicitly modify so
> many drivers - if the frameworks like GPIO, clk and regulator can do
> this that ought to cover 90% of the cases where probe deferral will be
> needed without having to do anything more than have good error handling
> paths on probe which is a good idea anyway.

Ok, makes sense.

Thanks,
	
	Arnd
