From: Lucas Stach <dev-8ppwABl0HbeELgA04lAiVw@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Sat, 24 Nov 2012 23:54:32 +0100
Message-ID: <1353797672.1479.17.camel@tellur>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124210916.GB27042-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Am Samstag, den 24.11.2012, 22:09 +0100 schrieb Thierry Reding:
> Hi,
> 
> With tegra-drm going into Linux 3.8 and NVIDIA posting initial patches
> for 2D acceleration on top of it, I've been looking at the various ways
> how this can best be leveraged.
> 
> The most obvious choice would be to start work on an xf86-video-tegra
> driver that uses the code currently in the works to implement the EXA
> callbacks that allow some of the rendering to be offloaded to the GPU.
> The way I would go about this is to fork xf86-video-modesetting, do some
> rebranding and add the various bits required to offload rendering.
> 
As much as I dislike to say this, but forking the modesetting driver to
bring in the Tegra specific 2D accel might be the best way to go for
now. Especially looking at the very limited resources available to
tegradrm development and NVIDIAs expressed desire to do as few changes
as possible to their downstream work.

> However, that has all the usual drawbacks of a fork so I thought maybe
> it would be better to write some code to xf86-video-modesetting to add
> GPU-specific acceleration on top. Such code could be leveraged by other
> drivers as well and all of them could share a common base for the
> functionality provided through the standard DRM IOCTLs.
> 
We don't have any standard DRM IOCTLs for doing acceleration today. The
single fact that we are stitching together command streams in userspace
for execution by the GPU renders a common interface unusable. We don't
even have a common interface to allocate GPU resources suitable for
acceleration: the dumb IOCTLs are only guaranteed to give you a buffer
the display engine can scan out from, nothing in there let's you set up
more fancy things like tiling etc, which might be needed to operate on
the buffer with other engines in some way.

> That approach has some disadvantages of its own, like the potential
> bloat if many GPUs do the same. It would also be a bit of a step back
> to the old monolithic days of X.
> 
For some thoughts about how a unified accelerated driver for various
hardware devices could be done I would like to point at my presentation
at this years XDC.
However doing this right might prove as a major task, so as I already
said it might be more worthwhile to just stuff the Tegra specific bits
into a fork of the modesetting driver.

Regards,
Lucas
