From: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: Re: xf86-video-tegra or xf86-video-modesetting?
Date: Mon, 26 Nov 2012 13:56:25 +0800
Message-ID: <50B30489.4030904@nvidia.com>
References: <20121124210916.GB27042@avionic-0098.adnet.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20121124210916.GB27042-RM9K5IK7kjIyiCvfTdI0JKcOhU4Rzj621B7CTYaBSLdn68oJJulU0Q@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org" <xorg-devel-go0+a7rfsptAfugRpC6u6w@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

In technical, it's true to focus xf86-video-modesetting on the hardware
independent stuffs/making frameworks and GPU vendors upstreams their
hardware dependent codes. But this needs a lot of cooperation and the
progress would be slow. This is not GPU vendors want so I assume they'll
not put lots of efforts into it.

So I think it's better to fork the xf86-video-modesetting right now
unless someday most of the GPU vendors are willing to work together and
do contributions to modesetting driver.

Mark
On 11/25/2012 05:09 AM, Thierry Reding wrote:
> * PGP Signed by an unknown key
> 
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
> However, that has all the usual drawbacks of a fork so I thought maybe
> it would be better to write some code to xf86-video-modesetting to add
> GPU-specific acceleration on top. Such code could be leveraged by other
> drivers as well and all of them could share a common base for the
> functionality provided through the standard DRM IOCTLs.
> 
> That approach has some disadvantages of its own, like the potential
> bloat if many GPUs do the same. It would also be a bit of a step back
> to the old monolithic days of X.
> 
> So what do other people think?
> 
> Thierry
> 
> * Unknown Key
> * 0x7F3EB3A1
> 
