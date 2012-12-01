From: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Sun, 2 Dec 2012 07:42:06 +1000
Message-ID: <CAPM=9tzUYkMZhwReSDLxvMYvgDmXukajm8EMqtzqmcNeD+oMAw@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-2-git-send-email-tbergstrom@nvidia.com>
	<20121128212301.GA25531@avionic-0098.adnet.avionic-design.de>
	<50B73710.2040102@nvidia.com>
	<20121129114704.GB6150@avionic-0098.adnet.avionic-design.de>
	<50B7AB93.5060207@wwwdotorg.org>
	<1354265429.1479.187.camel@tellur>
	<50B9EDA9.2000500@nvidia.com>
	<20121201151020.GC18209@avionic-0098.adnet.avionic-design.de>
	<50BA3668.1010504@nvidia.com>
	<1354383291.1503.25.camel@tellur>
	<50BA5AB2.8000604@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <50BA5AB2.8000604-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Guys I think you guys might be overthniking things here.

I know you have some sort of upstream/downstream split, but really in
the upstream kernel, we don't care about that, so don't make it our
problem.

There is no need for any sort of stable API between host1x and the sub
drivers, we change APIs in the kernel the whole time it isn't a
problem.

If you need to change the API, submit a single patch changing it
across all the drivers in the tree, collecting Acks or not as needed.
We do this the whole time, I've never had or seen a problem with it.

We don't do separate subsystems APIs set in stone bullshit, and all
subsystem maintainers are used to dealing with these sort of issues.
You get an ack from one maintainer and the other one sticks it in his
tree with a note to Linus.

You can put the code where you want, maybe just under drivers/gpu
instead of drivers/video or drivers/gpu/drm, just make sure you have a
path for it into the kernel.

And I have an non-upstream precedent for v4l sitting on drm, some
radeon GPUs have capture tuners, and the only way to implement that
would be to stick a v4l driver in the radeon drm driver. Not a
problem, just never finished writing the code.

Dave.
