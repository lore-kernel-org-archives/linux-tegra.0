From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 12/12] JUST FOR TEST: Add one-shot trigger to update
 display
Date: Wed, 1 Jul 2015 12:34:57 +0200
Message-ID: <20150701103457.GD24055@phenom.ffwll.local>
References: <1435738915-31973-1-git-send-email-markz@nvidia.com>
 <1435738915-31973-13-git-send-email-markz@nvidia.com>
 <20150701083617.GF30960@phenom.ffwll.local>
 <5593AC80.10801@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <5593AC80.10801-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mark Zhang <markz-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Jul 01, 2015 at 05:01:52PM +0800, Mark Zhang wrote:
> On 07/01/2015 04:36 PM, Daniel Vetter wrote:
> > On Wed, Jul 01, 2015 at 04:21:55PM +0800, Mark Zhang wrote:
> >> This HACK adds a workqueue to refresh the display periodically.
> >> This is used just for testing.
> > 
> > ->dirty is the drm hook you're looking for, it's meant to flush out any
> > frontbuffer rendering. Generic kms clients using the dumb buffers (e.g.
> > fedora boot splash) use this already.
> > 
> 
> Oh... I did a grep in drm source and are you talking about
> "drm_framebuffer_funcs->dirty"? Yeah, that should work for me.. but that
> requires userspace sending IOCTL to trigger, right? Honestly I'm lazy so
> I created this HACK so that I don't need userspace to test.

Yeah userspace needs to send ioctl already after each drawing. Generic
userspace does that already since it's required by qxl, udl, soon i915 and
probably a few others too. fbdev emulation is more annyoing but there's
code to move around in these drivers (qxl seems best to me as a starting
point) too.

Imo without this you shouldn't merge one-shot, at least not enabled by
default.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
