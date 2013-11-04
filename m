From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v2 13/27] drm/tegra: Move subdevice infrastructure to
 host1x
Date: Mon, 4 Nov 2013 17:08:05 +0100
Message-ID: <20131104160805.GH4167@phenom.ffwll.local>
References: <1381134884-5816-1-git-send-email-treding@nvidia.com>
 <1381134884-5816-14-git-send-email-treding@nvidia.com>
 <20131104102054.GD4167@phenom.ffwll.local>
 <20131104110655.GN27445@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131104110655.GN27445-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 04, 2013 at 12:06:57PM +0100, Thierry Reding wrote:
> On Mon, Nov 04, 2013 at 11:20:55AM +0100, Daniel Vetter wrote:
> > On Mon, Oct 07, 2013 at 10:34:30AM +0200, Thierry Reding wrote:
> > > +static struct drm_bus drm_host1x_bus = {
> > > +	.bus_type = DRIVER_BUS_HOST1X,
> > > +	.set_busid = drm_host1x_set_busid,
> > > +};
> > 
> > Imo this needs to die asap, i.e. before it lands in drm-next. I've just
> > spent a bit of time trying to rid ourselves of this midlayer
> > brain-damange, and now new stuff crops up. See
> > 
> > http://cgit.freedesktop.org/~danvet/drm/log/?h=drm-init-cleanup
> > 
> > drm_bus is a terribly midlayer madness disaster and needs to just burn
> > down. So what exactly is the reason here to not go with the drm_platform.c
> > stuff until I've gotten around to completely rip it all out?
> 
> Dave asked me whether it was possible to move the Tegra DRM driver back
> into drivers/gpu/drm (from drivers/gpu/host1x/drm) and introducing this
> new bus was the only solution I saw (besides perhaps using cross-
> subsystem global variables) to do that.
> 
> Now, I'm not a big fan at all of the whole drm_bus shebang myself, so
> whatever help you need in getting rid of it, please let me know. The
> drm_bus implementation that this adds is about 34 lines, so it shouldn't
> be difficult to get rid of. If you throw out drm_driver.bus completely,
> then it should be a matter of just deleting that code and the rest
> should be able to continue working as is. The only reason I added it is
> because the kernel crashes if its not there, depending on what userspace
> is run.

Oh, so you actually need the bus->set_busid callback? Since that's one of
those old ugly dragons from the ums days and really shouldn't be used by
anything modern. E.g. rendernodes completely disallow it, and afaik the
x86 systems I have here also don't use it. So you've copy&pasted a piece
of lore that you _never_ should have used, and since I'm too late we now
have userspace that depends upon it :(

Aside: The reason we have drm_platform.c is to make the shadow-attach
possible that ums drm drivers needed. Luckily we've never merged an ARM
shadow-attaching ums drm driver, but unfortunately everyone just kept on
using the old crap without too much though.

If you just need to prevent the Oops (and please hunt down that piece of
userspace calling the setversion ioctl and figure out where it is, link to
sources highly appreciated) you can peek at drm_usb.c for the true noop
implementation. Would be great if you can figure this out before -rc1 - I
want to dump my current pile of patches onto Dave by then for 3.14.

Wrt the drm_put_dev in drm_host1x_exit I don't care one bit what you do in
your driver, as long as you call drm_put_dev directly ;-) It looks like
I'm lucky and can just drop the tegra patch as soon as your tree has
landed.

> So I find myself in the middle of controversy again... I seem to have a
> knack for it.

Looks like it's just a small one here ... you need to try harder.

Btw the longer-term plan is that you can embedd the struct drm_device into
whatever driver private struct is suitable and completely control it's
lifetime. That would allow us to ditch the drm_dev->usbdevice and
->platform_device pointers (killing dev->agp and dev->pdev is much harder
due to the big pile of legacy drives, but in principal not impossible for
someone with too much time).
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
