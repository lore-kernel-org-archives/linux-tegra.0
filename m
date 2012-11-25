From: =?UTF-8?B?VGVyamUgQmVyZ3N0csO2bQ==?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sun, 25 Nov 2012 17:47:32 +0200
Message-ID: <50B23D94.8070604@nvidia.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de> <1353797672.1479.17.camel@tellur>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1353797672.1479.17.camel@tellur>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Cc: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>, "xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org" <xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On 25.11.2012 00:54, Lucas Stach wrote:
> As much as I dislike to say this, but forking the modesetting driver to
> bring in the Tegra specific 2D accel might be the best way to go for
> now. Especially looking at the very limited resources available to
> tegradrm development and NVIDIAs expressed desire to do as few changes
> as possible to their downstream work.

Which changes to downstream work would these be? What changes would help
in getting the acceleration support into mode setting driver?

We've done quite a lot of changes in downstream nvhost to help
upstreaming, and I'll keep downstream nvhost as close to upstream as
possible when/if nvhost wiggles its way into upstream. But you might be
talking about something else.

> We don't have any standard DRM IOCTLs for doing acceleration today. The
> single fact that we are stitching together command streams in userspace
> for execution by the GPU renders a common interface unusable. We don't

Command streams for Tegra 2D are easiest to stitch together in user
space. We have discussed the possibility to implement some simple
operations in kernel, too, f.ex. using 2D to clear or copy a memory
region. But in the end there are not too many reasons to implement that
in kernel versus doing it in user space.

Do we have to even attempt standardizing the IOCTLs? The standardization
could happen in libdrm level. We've already implemented some common 2D
operations for Tegra 2D, but we haven't yet solved the question that
where should we put the code in - in our internal tree it's now inside
libdrm. None of the other GPUs supported by libdrm implement
acceleration inside libdrm, so if we follow that, we'll just provide
libtegradrm with the 2D operations. That'll require a Tegra specific
modesetting driver.

Path of least resistance?

Terje
