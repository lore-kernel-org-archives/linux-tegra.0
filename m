From: Guennadi Liakhovetski <g.liakhovetski-Mmb7MZpHnFY@public.gmane.org>
Subject: Re: Can I put a V4L2 soc camera driver under other subsystem directory?
Date: Thu, 8 Aug 2013 22:52:47 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.1308082225150.29611@axis700.grange>
References: <CAK5ve-J7Sn5wuJ_z6Lqr=_qMQRqF12Aa6GfTv4xBhh=n_28Yjg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <CAK5ve-J7Sn5wuJ_z6Lqr=_qMQRqF12Aa6GfTv4xBhh=n_28Yjg-JsoAwUIsXosN+BqQ9rBEUg@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Bryan Wu <cooloney-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, linux-tegra <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Hi Bryan,

On Wed, 7 Aug 2013, Bryan Wu wrote:

> Hi Guennadi and LMML,
> 
> I'm working on a camera controller driver for Tegra, which is using
> soc_camera. But we also need to use Tegra specific host1x interface
> like syncpt APIs.
> 
> Since host1x is quite Tegra specific framework which is in
> drivers/gpu/host1x and has several host1x's client driver like graphic
> 2D driver, my v4l2 soc_camera driver is also a host1x client driver.
> Right now host1x does not expose any global include header files like
> API in the kernel, because no other users. So we plan to put all
> host1x related driver together, is that OK for us to put our Tegra
> soc_camera driver into drivers/gpu/host1x/camera or similar?
> 
> I guess besides it will introduce some extra maintenance it should be OK, right?

Exactly, there's already been a precedent:

http://www.mail-archive.com/linux-media-u79uwXL29TY76Z2rM5mHXA@public.gmane.org/msg56213.html

It hasn't been finalised yet though.

Thanks
Guennadi
---
Guennadi Liakhovetski, Ph.D.
Freelance Open-Source Software Developer
http://www.open-technology.de/
