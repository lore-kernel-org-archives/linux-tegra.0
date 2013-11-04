From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PULL] drm/tegra: Changes for v3.13-rc1
Date: Mon, 4 Nov 2013 17:21:21 +0100
Message-ID: <20131104162121.GJ4167@phenom.ffwll.local>
References: <20131031091727.GA16198@ulmo.nvidia.com>
 <20131104102253.GE4167@phenom.ffwll.local>
 <20131104121145.GB18722@ulmo.nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <20131104121145.GB18722-AwZRO8vwLAwmlAP/+Wk3EA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Dave Airlie <airlied-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Nov 04, 2013 at 01:11:46PM +0100, Thierry Reding wrote:
> On Mon, Nov 04, 2013 at 11:22:53AM +0100, Daniel Vetter wrote:
> > On Thu, Oct 31, 2013 at 10:17:28AM +0100, Thierry Reding wrote:
> [...]
> > >       drm/tegra: Move subdevice infrastructure to host1x
> > 
> > I've just shot at this patch on the m-l, but I'd be rather unhappy if the
> > new drm_bus madness this add gets into drm-next. Would be a definite step
> > backwards imo for the drm core. Also more work for me to fix it all up ...
> 
> In all fairness, the patches were posted for review a while back (4
> weeks ago) and I had no idea any such rework was in place, much less
> that anybody else considered drm_bus to be a bad idea.
> 
> Perhaps we could maintain a list of TODO items somewhere with notes as
> to what's currently being worked on. Maybe such a list already exists
> and I'm just not aware of it?

drm_bus goes back to the shadow attach horror stories of legacy drm
drivers with ums. It was done for platform drivers due to some out-of-tree
ARM drivers that luckily have never been merged. It's just part of the
lore ;-)

> It'd be unfortunate if this series can't be merged for 3.13. The patch
> you object to is early in the list and everything after it depends on
> it, so if that doesn't make it in, then none of the rest will make it
> either.
> 
> I've also explained elsewhere that the only thing drm_bus related that
> this adds is a new define for DRIVER_BUS_HOST1X and an implementation of
> .set_busid. The former should be trivial to remove, while the latter is
> the only one that you've kept in the cleanup tree you've posted.

It'll die soon, together with drm_bus. I've just grown a bit frustrated
thinking that I'm too late at preventing old cruft from spreading ;-)

> Also I'd like to reassert my offer to help. While working on this I've
> actually came across various oddities myself, like how the bus type was
> completely unused, and had added them to my TODO list of things to look
> into later.

After a bit of cooling of I've looked at the situation. See my reply to
the patch itself, it should be easily fixed by just throwing a pretty tiny
fixup patch on top. Then the host1x drm_bus is just a copy of the drm_bus,
and so really easy to deal with.

> I really appreciate the work you do, but I think we could use some more
> coordination to avoid conflicts such as these and perhaps share the load
> of cleanup work. Is there anything in particular that I could do to help
> improve the situation?

For better coordination I wonder whether we should have a drm-integration
tree with all the driver wip stuff (lesser requirements than linux-next,
so not just stuff ready for the next merge window) plus big cleanup
branches like this and big features like the atomic modeset stuff rob is
working on. But atm I'm still rather reluctant to try it out for fear of
getting stuck with it ;-)

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
