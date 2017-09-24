From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: Re: [PATCH v2 6/6] drm/atomic: Make async plane update checks work as
 intended, v2.
Date: Sun, 24 Sep 2017 17:33:28 +0300
Message-ID: <54467116-df02-e6ad-ac14-90aa79e164e4@gmail.com>
References: <20170904104838.23822-1-maarten.lankhorst@linux.intel.com>
 <20170904104838.23822-7-maarten.lankhorst@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20170904104838.23822-7-maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
Cc: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>, intel-gfx-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On 04.09.2017 13:48, Maarten Lankhorst wrote:
> By always keeping track of the last commit in plane_state, we know
> whether there is an active update on the plane or not. With that
> information we can reject the fast update, and force the slowpath
> to be used as was originally intended.
> 
> We cannot use plane_state->crtc->state here, because this only mentions
> the most recent commit for the crtc, but not the planes that were part
> of it. We specifically care about what the last commit involving this
> plane is, which can only be tracked with a pointer in the plane state.
> 
> Changes since v1:
> - Clean up the whole function here, instead of partially earlier.
> - Add mention in the commit message why we need commit in plane_state.
> - Swap plane->state in intel_legacy_cursor_update, instead of
>   reassigning all variables. With this commit We know that the cursor
>   is not part of any active commits so this hack can be removed.
> 
> Cc: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Signed-off-by: Maarten Lankhorst <maarten.lankhorst-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
> Reviewed-by: Gustavo Padovan <gustavo.padovan-ZGY8ohtN/8qB+jHODAdFcQ@public.gmane.org>
> Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org> #v1
> ---
>  drivers/gpu/drm/drm_atomic_helper.c  | 53 ++++++++++--------------------------
>  drivers/gpu/drm/i915/intel_display.c | 27 +++++++++++-------
>  include/drm/drm_plane.h              |  5 ++--
>  3 files changed, 35 insertions(+), 50 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index c81d46927a74..a2cd432d8b2d 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -1388,35 +1388,31 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
>  {
>  	struct drm_crtc *crtc;
>  	struct drm_crtc_state *crtc_state;
> -	struct drm_crtc_commit *commit;
> -	struct drm_plane *__plane, *plane = NULL;
> -	struct drm_plane_state *__plane_state, *plane_state = NULL;
> +	struct drm_plane *plane;
> +	struct drm_plane_state *old_plane_state, *new_plane_state;
>  	const struct drm_plane_helper_funcs *funcs;
> -	int i, j, n_planes = 0;
> +	int i, n_planes = 0;
>  
>  	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
>  		if (drm_atomic_crtc_needs_modeset(crtc_state))
>  			return -EINVAL;
>  	}
>  
> -	for_each_new_plane_in_state(state, __plane, __plane_state, i) {
> +	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i)
>  		n_planes++;
> -		plane = __plane;
> -		plane_state = __plane_state;
> -	}
>  
>  	/* FIXME: we support only single plane updates for now */
> -	if (!plane || n_planes != 1)
> +	if (n_planes != 1)
>  		return -EINVAL;
>  
> -	if (!plane_state->crtc)
> +	if (!new_plane_state->crtc)
>  		return -EINVAL;
>  

Hello,

It looks like a NULL-checking of new_plane_state is missed here.

[   70.138947] [<c03dd670>] (drm_atomic_helper_async_check) from [<c03e0424>]
(drm_atomic_helper_check+0x4c/0x64)
[   70.138958] [<c03e0424>] (drm_atomic_helper_check) from [<c03fb6d4>]
(drm_atomic_check_only+0x2f4/0x56c)
[   70.138969] [<c03fb6d4>] (drm_atomic_check_only) from [<c03fb95c>]
(drm_atomic_commit+0x10/0x50)
[   70.138979] [<c03fb95c>] (drm_atomic_commit) from [<c03dde50>]
(drm_atomic_helper_update_plane+0xf0/0x100)
[   70.138991] [<c03dde50>] (drm_atomic_helper_update_plane) from [<c0403548>]
(__setplane_internal+0x178/0x214)
[   70.139003] [<c0403548>] (__setplane_internal) from [<c04036fc>]
(drm_mode_cursor_universal+0x118/0x1a8)
[   70.139014] [<c04036fc>] (drm_mode_cursor_universal) from [<c0403900>]
(drm_mode_cursor_common+0x174/0x1ec)
[   70.139026] [<c0403900>] (drm_mode_cursor_common) from [<c0403fa4>]
(drm_mode_cursor_ioctl+0x58/0x60)
[   70.139036] [<c0403fa4>] (drm_mode_cursor_ioctl) from [<c03eb0b4>]
(drm_ioctl+0x198/0x368)
[   70.139047] [<c03eb0b4>] (drm_ioctl) from [<c015fffc>] (do_vfs_ioctl+0x9c/0x8f0)
[   70.139058] [<c015fffc>] (do_vfs_ioctl) from [<c0160884>] (SyS_ioctl+0x34/0x5c)
[   70.139071] [<c0160884>] (SyS_ioctl) from [<c000f900>]
(ret_fast_syscall+0x0/0x48)

It's triggered by Tegra DRM driver on Xorg's startup. I also should notice that
currently Tegra DRM doesn't have a working HW cursor, I'm going to send out
Tegra cursor patches sometime soon.

This variant works for me:

	if (!new_plane_state || !new_plane_state->crtc)
		return -EINVAL;

>  	funcs = plane->helper_private;
>  	if (!funcs->atomic_async_update)
>  		return -EINVAL;
>  
> -	if (plane_state->fence)
> +	if (new_plane_state->fence)
>  		return -EINVAL;
>  
>  	/*
> @@ -1424,31 +1420,11 @@ int drm_atomic_helper_async_check(struct drm_device *dev,
>  	 * the plane.  This prevents our async update's changes from getting
>  	 * overridden by a previous synchronous update's state.
>  	 */
> -	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
> -		if (plane->crtc != crtc)
> -			continue;
> -
> -		spin_lock(&crtc->commit_lock);
> -		commit = list_first_entry_or_null(&crtc->commit_list,
> -						  struct drm_crtc_commit,
> -						  commit_entry);
> -		if (!commit) {
> -			spin_unlock(&crtc->commit_lock);
> -			continue;
> -		}
> -		spin_unlock(&crtc->commit_lock);
> -
> -		if (!crtc->state->state)
> -			continue;
> +	if (old_plane_state->commit &&
> +	    !try_wait_for_completion(&old_plane_state->commit->hw_done))
> +		return -EBUSY;
>  
> -		for_each_plane_in_state(crtc->state->state, __plane,
> -					__plane_state, j) {
> -			if (__plane == plane)
> -				return -EINVAL;
> -		}
> -	}
> -
> -	return funcs->atomic_async_check(plane, plane_state);
> +	return funcs->atomic_async_check(plane, new_plane_state);
>  }
>  EXPORT_SYMBOL(drm_atomic_helper_async_check);
>  
> @@ -1814,9 +1790,10 @@ int drm_atomic_helper_setup_commit(struct drm_atomic_state *state,
>  	}
>  
>  	for_each_oldnew_plane_in_state(state, plane, old_plane_state, new_plane_state, i) {
> -		/* commit tracked through new_crtc_state->commit, no need to do it explicitly */
> -		if (new_plane_state->crtc)
> -			continue;
> +		/*
> +		 * Unlike connectors, always track planes explicitly for
> +		 * async pageflip support.
> +		 */
>  
>  		/* Userspace is not allowed to get ahead of the previous
>  		 * commit with nonblocking ones. */
> diff --git a/drivers/gpu/drm/i915/intel_display.c b/drivers/gpu/drm/i915/intel_display.c
> index 7abbc761a635..0add029d95f6 100644
> --- a/drivers/gpu/drm/i915/intel_display.c
> +++ b/drivers/gpu/drm/i915/intel_display.c
> @@ -13064,6 +13064,14 @@ intel_legacy_cursor_update(struct drm_plane *plane,
>  		goto slow;
>  
>  	old_plane_state = plane->state;
> +	/*
> +	 * Don't do an async update if there is an outstanding commit modifying
> +	 * the plane.  This prevents our async update's changes from getting
> +	 * overridden by a previous synchronous update's state.
> +	 */
> +	if (old_plane_state->commit &&
> +	    !try_wait_for_completion(&old_plane_state->commit->hw_done))
> +		goto slow;
>  
>  	/*
>  	 * If any parameters change that may affect watermarks,
> @@ -13125,19 +13133,12 @@ intel_legacy_cursor_update(struct drm_plane *plane,
>  	}
>  
>  	old_fb = old_plane_state->fb;
> -	old_vma = to_intel_plane_state(old_plane_state)->vma;
>  
>  	i915_gem_track_fb(intel_fb_obj(old_fb), intel_fb_obj(fb),
>  			  intel_plane->frontbuffer_bit);
>  
>  	/* Swap plane state */
> -	new_plane_state->fence = old_plane_state->fence;
> -	new_plane_state->commit = old_plane_state->commit;
> -	*to_intel_plane_state(old_plane_state) = *to_intel_plane_state(new_plane_state);
> -	new_plane_state->fence = NULL;
> -	new_plane_state->commit = NULL;
> -	new_plane_state->fb = old_fb;
> -	to_intel_plane_state(new_plane_state)->vma = NULL;
> +	plane->state = new_plane_state;
>  
>  	if (plane->state->visible) {
>  		trace_intel_update_plane(plane, to_intel_crtc(crtc));
> @@ -13149,13 +13150,19 @@ intel_legacy_cursor_update(struct drm_plane *plane,
>  		intel_plane->disable_plane(intel_plane, to_intel_crtc(crtc));
>  	}
>  
> -	if (old_vma)
> +	old_vma = to_intel_plane_state(old_plane_state)->vma;
> +	if (old_vma) {
> +		to_intel_plane_state(old_plane_state)->vma = NULL;
>  		intel_unpin_fb_vma(old_vma);
> +	}
>  
>  out_unlock:
>  	mutex_unlock(&dev_priv->drm.struct_mutex);
>  out_free:
> -	intel_plane_destroy_state(plane, new_plane_state);
> +	if (ret)
> +		intel_plane_destroy_state(plane, new_plane_state);
> +	else
> +		intel_plane_destroy_state(plane, old_plane_state);
>  	return ret;
>  
>  slow:
> diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
> index 7d96116fd4c4..feb9941d0cdb 100644
> --- a/include/drm/drm_plane.h
> +++ b/include/drm/drm_plane.h
> @@ -124,9 +124,10 @@ struct drm_plane_state {
>  	bool visible;
>  
>  	/**
> -	 * @commit: Tracks the pending commit to prevent use-after-free conditions.
> +	 * @commit: Tracks the pending commit to prevent use-after-free conditions,
> +	 * and for async plane updates.
>  	 *
> -	 * Is only set when @crtc is NULL.
> +	 * May be NULL.
>  	 */
>  	struct drm_crtc_commit *commit;
>  
> 


-- 
Dmitry
