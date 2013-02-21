From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH v4 1/9] drm: Add consistency check for page-flipping
Date: Thu, 21 Feb 2013 15:35:53 +0100
Message-ID: <1361457361-13838-2-git-send-email-thierry.reding@avionic-design.de>
References: <1361457361-13838-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1361457361-13838-1-git-send-email-thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Dave Airlie <airlied-cv59FeDIM0c@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Driver implementations of the drm_crtc's .page_flip() function are
required to update the crtc->fb field on success to reflect that the new
framebuffer is now in use. This is important to keep reference counting
on the framebuffers balanced.

While at it, document this requirement to keep others from falling into
the same trap.

Suggested-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Reviewed-by: Daniel Vetter <daniel.vetter-/w4YWyX8dFk@public.gmane.org>
---
 Documentation/DocBook/drm.tmpl | 6 ++++++
 drivers/gpu/drm/drm_crtc.c     | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/Documentation/DocBook/drm.tmpl b/Documentation/DocBook/drm.tmpl
index 51e1904..a6428dd 100644
--- a/Documentation/DocBook/drm.tmpl
+++ b/Documentation/DocBook/drm.tmpl
@@ -1161,6 +1161,12 @@ int max_width, max_height;</synopsis>
             any new rendering to the frame buffer until the page flip completes.
           </para>
           <para>
+            If a page flip can be successfully scheduled the driver must set the
+            <code>drm_crtc-&lt;fb</code> field to the new framebuffer pointed to
+            by <code>fb</code>. This is important so that the reference counting
+            on framebuffers stays balanced.
+          </para>
+          <para>
             If a page flip is already pending, the
             <methodname>page_flip</methodname> operation must return
             -<errorname>EBUSY</errorname>.
diff --git a/drivers/gpu/drm/drm_crtc.c b/drivers/gpu/drm/drm_crtc.c
index 781aef5..3bdf2a6 100644
--- a/drivers/gpu/drm/drm_crtc.c
+++ b/drivers/gpu/drm/drm_crtc.c
@@ -3792,6 +3792,13 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 		/* Keep the old fb, don't unref it. */
 		old_fb = NULL;
 	} else {
+		/*
+		 * Warn if the driver hasn't properly updated the crtc->fb
+		 * field to reflect that the new framebuffer is now used.
+		 * Failing to do so will screw with the reference counting
+		 * on framebuffers.
+		 */
+		WARN_ON(crtc->fb != fb);
 		/* Unref only the old framebuffer. */
 		fb = NULL;
 	}
-- 
1.8.1.2
