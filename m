From: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH V2] drm/tegra: Fix crash caused by reference count imbalance
Date: Wed, 18 May 2016 12:11:29 +0100
Message-ID: <1463569889-14632-1-git-send-email-jonathanh@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, David Airlie <airlied-cv59FeDIM0c@public.gmane.org>, Daniel Vetter <daniel-/w4YWyX8dFk@public.gmane.org>, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, Alexandre Courbot <gnurou-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Commit d2307dea14a4 ("drm/atomic: use connector references (v3)") added
reference counting for DRM connectors and this caused a crash when
exercising system suspend on Tegra114 Dalmore.

The Tegra DSI driver implements a Tegra specific function,
tegra_dsi_connector_duplicate_state(), to duplicate the connector state
and destroys the state using the generic helper function,
drm_atomic_helper_connector_destroy_state(). Following commit
d2307dea14a4 ("drm/atomic: use connector references (v3)") there is
now an imbalance in the connector reference count because the Tegra
function to duplicate state does not take a reference when duplicating
the state information. However, the generic helper function to destroy
the state information assumes a reference has been taken and during
system suspend, when the connector state is destroyed, this leads to a
crash because we attempt to put the reference for an object that has
already been freed.

Fix this by calling __drm_atomic_helper_connector_duplicate_state() from
tegra_dsi_connector_duplicate_state() to ensure that we take a reference
on a connector if crtc is set. Note that this will also copy the
connector state a 2nd time, but this should be harmless.

By fixing tegra_dsi_connector_duplicate_state() to take a reference,
although a crash was no longer seen, it was then observed that after
each system suspend-resume cycle, the reference would be one greater
than before the suspend-resume cycle. Following commit d2307dea14a4
("drm/atomic: use connector references (v3)"), it was found that we
also need to put the reference when calling the function
tegra_dsi_connector_reset() before freeing the state. Fix this by
updating tegra_dsi_connector_reset() to call the function
__drm_atomic_helper_connector_destroy_state() in order to put the
reference for the connector.

Finally, add a warning if allocating memory for the state information
fails in tegra_dsi_connector_reset().

Fixes: d2307dea14a4 ("drm/atomic: use connector references (v3)")

Signed-off-by: Jon Hunter <jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---

V2 changes:
- Updated to next-20160518
- Replaced open coding of call to drm_connector_reference() with
  __drm_atomic_helper_connector_duplicate_state() per Daniel's feedback.

 drivers/gpu/drm/tegra/dsi.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/dsi.c b/drivers/gpu/drm/tegra/dsi.c
index 44e102799195..a49bb006182d 100644
--- a/drivers/gpu/drm/tegra/dsi.c
+++ b/drivers/gpu/drm/tegra/dsi.c
@@ -745,13 +745,17 @@ static void tegra_dsi_soft_reset(struct tegra_dsi *dsi)
 
 static void tegra_dsi_connector_reset(struct drm_connector *connector)
 {
-	struct tegra_dsi_state *state =
-		kzalloc(sizeof(*state), GFP_KERNEL);
+	struct tegra_dsi_state *state = kzalloc(sizeof(*state), GFP_KERNEL);
 
-	if (state) {
+	if (WARN_ON(!state))
+		return;
+
+	if (connector->state) {
+		__drm_atomic_helper_connector_destroy_state(connector->state);
 		kfree(connector->state);
-		__drm_atomic_helper_connector_reset(connector, &state->base);
 	}
+
+	__drm_atomic_helper_connector_reset(connector, &state->base);
 }
 
 static struct drm_connector_state *
@@ -764,6 +768,9 @@ tegra_dsi_connector_duplicate_state(struct drm_connector *connector)
 	if (!copy)
 		return NULL;
 
+	__drm_atomic_helper_connector_duplicate_state(connector,
+						      &copy->base);
+
 	return &copy->base;
 }
 
-- 
2.1.4
