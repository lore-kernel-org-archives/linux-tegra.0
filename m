From: Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>
Subject: Re: [PATCH v3 1/7] drm: Add consistency check for page-flipping
Date: Wed, 13 Feb 2013 20:20:09 +0100
Message-ID: <20130213192009.GP5813@phenom.ffwll.local>
References: <1360771506-17849-1-git-send-email-thierry.reding@avionic-design.de>
 <1360771506-17849-2-git-send-email-thierry.reding@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Content-Disposition: inline
In-Reply-To: <1360771506-17849-2-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

On Wed, Feb 13, 2013 at 05:05:00PM +0100, Thierry Reding wrote:
> Driver implementations of the drm_crtc's .page_flip() function are
> required to update the crtc->fb field on success to reflect that the new
> framebuffer is now in use. This is important to keep reference counting
> on the framebuffers balanced.
> 
> While at it, document this requirement to keep others from falling into
> the same trap.
> 
> Suggested-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
> ---
>  Documentation/DocBook/drm.tmpl | 6 ++++++
>  drivers/gpu/drm/drm_crtc.c     | 7 +++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/Documentation/DocBook/drm.tmpl b/Documentation/DocBook/drm.tmpl
> index fae8018..8dfaeb0 100644
> --- a/Documentation/DocBook/drm.tmpl
> +++ b/Documentation/DocBook/drm.tmpl
> @@ -1161,6 +1161,12 @@ int max_width, max_height;</synopsis>
>              any new rendering to the frame buffer until the page flip completes.
>            </para>
>            <para>
> +            If a page flip can be successfully scheduled the driver must set the
> +            <code>drm_crtc-&lt;fb</code> field to the new framebuffer pointed to
> +            by <code>fb</code>. This is important so that the reference counting
> +            on framebuffers stays balanced.
> +          </para>
> +          <para>
>              If a page flip is already pending, the
>              <methodname>page_flip</methodname> operation must return
>              -<errorname>EBUSY</errorname>.
> diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
> index 838c9b6..d86edc1 100644
> --- a/drivers/gpu/drm/drm_crtc.c
> +++ b/drivers/gpu/drm/drm_crtc.c
> @@ -3766,6 +3766,13 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
>  		/* Keep the old fb, don't unref it. */
>  		old_fb = NULL;
>  	} else {
> +		/*
> +		 * Warn if the driver hasn't properly updated the crtc->fb
> +		 * field to reflect that the new framebuffer is now used.
> +		 * Failing to do so will screw with the reference counting
> +		 * on framebuffers.
> +		 */
> +		WARN_ON(crtc->fb != fb);
>  		/* Unref only the old framebuffer. */
>  		fb = NULL;
>  	}
> -- 
> 1.8.1.2
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org
> http://lists.freedesktop.org/mailman/listinfo/dri-devel

-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
