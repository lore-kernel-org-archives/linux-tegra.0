From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH] drm/atomic: Make async plane update checks actually work
 as intended.
Date: Tue, 26 Sep 2017 06:59:16 +0200
Message-ID: <20170926045916.2jmzgljuwyfvbve4@phenom.ffwll.local>
References: <20170904104838.23822-1-maarten.lankhorst@linux.intel.com>
 <20170904104838.23822-7-maarten.lankhorst@linux.intel.com>
 <54467116-df02-e6ad-ac14-90aa79e164e4@gmail.com>
 <a7d5fb04-c2f5-b743-5940-a1bd181d780d@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <a7d5fb04-c2f5-b743-5940-a1bd181d780d-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Mon, Sep 25, 2017 at 08:43:44AM +0200, Maarten Lankhorst wrote:
> Op 24-09-17 om 16:33 schreef Dmitry Osipenko:
> > On 04.09.2017 13:48, Maarten Lankhorst wrote:
> >> By always keeping track of the last commit in plane_state, we know
> >> whether there is an active update on the plane or not. With that
> >> information we can reject the fast update, and force the slowpath
> >> to be used as was originally intended.
> >>
> >> We cannot use plane_state->crtc->state here, because this only mentions
> >> the most recent commit for the crtc, but not the planes that were part
> >> of it. We specifically care about what the last commit involving this
> >> plane is, which can only be tracked with a pointer in the plane state.
> >>
> >> Changes since v1:
> >> - Clean up the whole function here, instead of partially earlier.
> >> - Add mention in the commit message why we need commit in plane_state.
> >> - Swap plane->state in intel_legacy_cursor_update, instead of
> >>   reassigning all variables. With this commit We know that the cursor
> >>   is not part of any active commits so this hack can be removed.
> >>
> >> Cc: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> >> Reviewed-by: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> >> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> #v1
> >> ---
> >>  drivers/gpu/drm/drm_atomic_helper.c  | 53 ++++++++++--------------------------
> >>  drivers/gpu/drm/i915/intel_display.c | 27 +++++++++++-------
> >>  include/drm/drm_plane.h              |  5 ++--
> >>  3 files changed, 35 insertions(+), 50 deletions(-)
> >>
> >> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> >> index c81d46927a74..a2cd432d8b2d 100644
> >> --- a/drivers/gpu/drm/drm_atomic_helper.c
> >> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> >> @@ -1388,35 +1388,31 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
> >>  {
> >>  	struct drm_crtc *crtc;
> >>  	struct drm_crtc_state *crtc_state;
> >> -	struct drm_crtc_commit *commit;
> >> -	struct drm_plane *__plane, *plane = NULL;
> >> -	struct drm_plane_state *__plane_state, *plane_state = NULL;
> >> +	struct drm_plane *plane;
> >> +	struct drm_plane_state *old_plane_state, *new_plane_state;
> >>  	const struct drm_plane_helper_funcs *funcs;
> >> -	int i, j, n_planes = 0;
> >> +	int i, n_planes = 0;
> >>  
> >>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> >>  		if (drm_atomic_crtc_needs_modeset(crtc_state))
> >>  			return -EINVAL;
> >>  	}
> >>  
> >> -	for_each_new_plane_in_state(state, __plane, __plane_state, i) {
> >> +	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i)
> >>  		n_planes++;
> >> -		plane = __plane;
> >> -		plane_state = __plane_state;
> >> -	}
> >>  
> >>  	/* FIXME: we support only single plane updates for now */
> >> -	if (!plane || n_planes != 1)
> >> +	if (n_planes != 1)
> >>  		return -EINVAL;
> >>  
> >> -	if (!plane_state->crtc)
> >> +	if (!new_plane_state->crtc)
> >>  		return -EINVAL;
> >>  
> > Hello,
> >
> > It looks like a NULL-checking of new_plane_state is missed here.
> >
> > [   70.138947] [<c03dd670>] (drm_atomic_helper_async_check) from [<c03e0424>]
> > (drm_atomic_helper_check+0x4c/0x64)
> > [   70.138958] [<c03e0424>] (drm_atomic_helper_check) from [<c03fb6d4>]
> > (drm_atomic_check_only+0x2f4/0x56c)
> > [   70.138969] [<c03fb6d4>] (drm_atomic_check_only) from [<c03fb95c>]
> > (drm_atomic_commit+0x10/0x50)
> > [   70.138979] [<c03fb95c>] (drm_atomic_commit) from [<c03dde50>]
> > (drm_atomic_helper_update_plane+0xf0/0x100)
> > [   70.138991] [<c03dde50>] (drm_atomic_helper_update_plane) from [<c0403548>]
> > (__setplane_internal+0x178/0x214)
> > [   70.139003] [<c0403548>] (__setplane_internal) from [<c04036fc>]
> > (drm_mode_cursor_universal+0x118/0x1a8)
> > [   70.139014] [<c04036fc>] (drm_mode_cursor_universal) from [<c0403900>]
> > (drm_mode_cursor_common+0x174/0x1ec)
> > [   70.139026] [<c0403900>] (drm_mode_cursor_common) from [<c0403fa4>]
> > (drm_mode_cursor_ioctl+0x58/0x60)
> > [   70.139036] [<c0403fa4>] (drm_mode_cursor_ioctl) from [<c03eb0b4>]
> > (drm_ioctl+0x198/0x368)
> > [   70.139047] [<c03eb0b4>] (drm_ioctl) from [<c015fffc>] (do_vfs_ioctl+0x9c/0x8f0)
> > [   70.139058] [<c015fffc>] (do_vfs_ioctl) from [<c0160884>] (SyS_ioctl+0x34/0x5c)
> > [   70.139071] [<c0160884>] (SyS_ioctl) from [<c000f900>]
> > (ret_fast_syscall+0x0/0x48)
> >
> > It's triggered by Tegra DRM driver on Xorg's startup. I also should notice that
> > currently Tegra DRM doesn't have a working HW cursor, I'm going to send out
> > Tegra cursor patches sometime soon.

Please don't in-line reply fixup patches, CI doesn't pick them up but
instead wants to add it to the patch series. Which won't apply because
most of it landed already. Please resend standalone.

> Oops.. I messed up there.. for_each_new_plane_in_state overwrites the state internally..
> ----->8-----
> for_each_oldnew_plane_in_state overwrites the iterator values internally, so we cannot rely
> on it being set to the last valid plane. This was causing a NULL pointer deref when someone
> tries to use the code. Save the plane and use the accessor functions to pull out the relevant
> plane state.

Hm, that's rather tricky :-/ I guess the for_each_if() is the culprit for
this? Could we perhaps fix this somehow by pushing the assignments into
the for_each_if (again using the && trick)? That way these macros are more
robust.

> Cc: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
> Fixes: 669c9215afea ("drm/atomic: Make async plane update checks work as intended, v2.")
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>

Assuming CI also approves:

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>

> ---
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 32fb61169b4f..8573feaea8c0 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1388,23 +1388,30 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_plane *plane;
> +	struct drm_plane *plane = NULL, *__plane;
>  	struct drm_plane_state *old_plane_state, *new_plane_state;
>  	const struct drm_plane_helper_funcs *funcs;
> -	int i, n_planes = 0;
> +	int i;
>  
>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>  		if (drm_atomic_crtc_needs_modeset(crtc_state))
>  			return -EINVAL;
>  	}
>  
> -	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i)
> -		n_planes++;
> +	for_each_new_plane_in_state(state, __plane, new_plane_state, i) {
> +		/* FIXME: we support only single plane updates for now */
> +		if (plane)
> +			return -EINVAL;
> +
> +		plane = __plane;
> +	}
>  
> -	/* FIXME: we support only single plane updates for now */
> -	if (n_planes != 1)
> +	if (!plane)
>  		return -EINVAL;
>  
> +	old_plane_state = drm_atomic_get_old_plane_state(state, plane);
> +	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> +
>  	if (!new_plane_state->crtc)
>  		return -EINVAL;
>  
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
