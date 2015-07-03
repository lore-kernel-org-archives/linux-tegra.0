From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 12/12] JUST FOR TEST: Add one-shot trigger to update
 display
Date: Fri, 3 Jul 2015 10:03:28 +0200
Message-ID: <20150703080328.GI23343@phenom.ffwll.local>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
 <1435738915-31973-13-git-send-email-markz@nvidia.com>
 <20150701083617.GF30960@phenom.ffwll.local>
 <5593AC80.10801@nvidia.com>
 <20150701103457.GD24055@phenom.ffwll.local>
 <5593E055.5050305@nvidia.com>
 <20150701145535.GW23343@phenom.ffwll.local>
 <55964083.60001@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <55964083.60001-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Fri, Jul 03, 2015 at 03:57:55PM +0800, Mark Zhang wrote:
> On 07/01/2015 10:55 PM, Daniel Vetter wrote:
> > On Wed, Jul 01, 2015 at 08:43:01PM +0800, Mark Zhang wrote:
> >> On 07/01/2015 06:34 PM, Daniel Vetter wrote:
> [...]
> >>>
> >>
> >> Alright, this makes sense. I have no idea about qxl, what I have now is
> >> an ubuntu running on Tegra114. So I'm wondering what I suppose to do is
> >> installing qemu on the ubuntu?
> > 
> > My suggestion is just to take the qxl code, move it to the fbdev emulation
> > helper, make it generic and use it. If you want you can do a
> > compile-tested patch on top to switch qxl over to the newly added helpers.
> > No need to install/run qxl itself. Just that qxl seems to have the most
> > complete solution for what you need.
> 
> OK, thanks Daniel. I'm not quite familiar with the userspace, but I
> think this is the summary:
> 
> - For legacy FB support, we can use the "->dirty" fops, port the qxl
> codes to drm_fb_helper.c, just as you described.

Note that this is for legacy frontbuffer rendering only. All other screen
updates (setplane, setcrtc, pageflip) will go through the atomic flip
path, thanks to all the atomic helpers.

> - For atomic page flip, the one-shot can be triggered when flipping the
> window/plane.
> - How about the front buffer rendering/drawing? I mean, if a drm
> userspace app requests a dumb buffer then draws on it, how can we
> trigger the one-shot to update the display? Do we need to add an
> additional IOCTL to do that?

dumb buffer userspace is required to call dirtyfb ioctl.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
