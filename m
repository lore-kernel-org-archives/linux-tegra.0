From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: [RFC v2 1/8] video: tegra: Add nvhost driver
Date: Mon, 3 Dec 2012 08:26:44 +0200
Message-ID: <50BC4624.4050707@nvidia.com>
References: <20121129114704.GB6150@avionic-0098.adnet.avionic-design.de> <50B7AB93.5060207@wwwdotorg.org> <1354265429.1479.187.camel@tellur> <50B9EDA9.2000500@nvidia.com> <20121201151020.GC18209@avionic-0098.adnet.avionic-design.de> <50BA3668.1010504@nvidia.com> <1354383291.1503.25.camel@tellur> <50BA5AB2.8000604@nvidia.com> <CAPM=9tzUYkMZhwReSDLxvMYvgDmXukajm8EMqtzqmcNeD+oMAw@mail.gmail.com> <50BB3A5D.6070304@nvidia.com> <20121202205527.GA22086@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121202205527.GA22086-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org" <dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org>, "linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 02.12.2012 22:55, Thierry Reding wrote:
> FWIW I'm convinced that you're genuinely trying to make this work and
> nobody welcomes this more than me. However it is only natural if you
> dump such a large body of code on the community that people will
> disagree with some of the design decisions.
> 
> So when I comment on the design or patches in general, it is not my
> intention to exclude you or NVIDIA in any way. All I'm trying to do is
> spot problematic or unclear parts that will make working with the code
> any more difficult than it has to be.

Thanks, I know it'a a large dump and you've made great comments about
the code, and hit most of the sore spots I've had with the driver, too.
I appreciate your effort - this process is making the driver better.

It's good to hear that our goals are aligned. So now that we got that
out of the system, let's get back to business. :-)

> Since tegra-drm is a DRM driver it should stay in drivers/gpu/drm. I can
> also live with the host1x driver staying in drivers/video, but I don't
> think it's the proper location and drivers/gpu/host1x seems like a much
> better fit.

That sounds like a plan to me.

Terje
