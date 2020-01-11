From: Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC 0/2] iommu: arm-smmu: Add support for early direct mappings
Date: Fri, 10 Jan 2020 20:56:39 -0800
Message-ID: <20200111045639.210486-1-saravanak@google.com>
References: <20191209150748.2471814-1-thierry.reding@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20191209150748.2471814-1-thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org
Cc: iommu-cunTk1MwBs9QetFLy7KEm3xJsTq8ys+cHZ5vskTnxNA@public.gmane.org, joro-zLv9SwRftAIdnm+yROfE0A@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, robin.murphy-5wv7dgnIgG8@public.gmane.org, will-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org, Saravana Kannan <saravanak-hpIqsD4AKlfQT0dZR+AlfA@public.gmane.org>, Patrick Daly <pdaly-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Pratik Patel <pratikp-sgV2jX0FEOL9JmXXK+q4OQ@public.gmane.org>, Rob Clark <robdclark-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, kernel-team-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Hi Thierry,

I happened upon this thread while looking into another thread [1].

> From: Thierry Reding <treding-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> 
> On some platforms, the firmware will setup hardware to read from a given
> region of memory. One such example is a display controller that is
> scanning out a splash screen from physical memory.
> 
> During Linux' boot process, the ARM SMMU will configure all contexts to
> fault by default. This means that memory accesses that happen by an SMMU
> master before its driver has had a chance to properly set up the IOMMU
> will cause a fault. This is especially annoying for something like the
> display controller scanning out a splash screen because the faults will
> result in the display controller getting bogus data (all-ones on Tegra)
> and since it repeatedly scans that framebuffer, it will keep triggering
> such faults and spam the boot log with them.

While I'm not an expert on IOMMUs, I have a decent high level
understanding of the problem you are trying to solve.

> In order to work around such problems, scan the device tree for IOMMU
> masters and set up a special identity domain that will map 1:1 all of
> the reserved regions associated with them. This happens before the SMMU
> is enabled, so that the mappings are already set up before translations
> begin.

I'm not sure if this RFC will solve the splash screen issue across SoCs
([1] seems to have a different issue and might not have memory-regions).

> One thing that was pointed out earlier, and which I don't have a good
> idea on how to solve it, is that the early identity domain is not
> discarded. The assumption is that the standard direct mappings code of
> the IOMMU framework will replace the early identity domain once devices
> are properly attached to domains, but we don't have a good point in time
> when it would be safe to remove the early identity domain.

You are in luck! I added sync_state() driver callbacks [2] exactly for
cases like this. Heck, I even listed IOMMUs as an example use case. :)
sync_state() works even with modules if one enables of_devlink [3] kernel
parameter (which already supports iommus DT bindings). I'd be happy to
answer any question you have on sync_state() and of_devlink.

> One option that I can think of would be to create an early identity
> domain for each master and inherit it when that master is attached to
> the domain later on, but that seems rather complicated from an book-
> keeping point of view and tricky because we need to be careful not to
> map regions twice, etc.
> 
> Any good ideas on how to solve this? It'd also be interesting to see if
> there's a more generic way of doing this. I know that something like
> this isn't necessary on earlier Tegra SoCs with the custom Tegra SMMU
> because translations are only enabled when the devices are attached to a
> domain.

Good foresight. As [1] shows, identity mapping doesn't solve it in a
generic way.

How about actually reading the current settings/mappings and just
inheriting that instead of always doing a 1:1 identity mapping? And then
those "inherited" mappings can be dropped when you get a sync_state().
What's wrong with that option?

Cheers,
Saravana

[1] https://lore.kernel.org/linux-arm-msm/20200108091641.GA15147@willie-the-truck/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/driver-api/driver-model/driver.rst#n172
[3] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/admin-guide/kernel-parameters.txt#n3239
