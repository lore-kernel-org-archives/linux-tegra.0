From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v7 2/6] drm/of: Make drm_of_find_panel_or_bridge() to check graph's presence
Date: Sun, 14 Jun 2020 20:22:30 +0300
Message-ID: <20200614172234.8856-3-digetx@gmail.com>
References: <20200614172234.8856-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200614172234.8856-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

When graph isn't defined in a device-tree, the of_graph_get_remote_node()
prints a noisy error message, telling that port node is not found. This is
undesirable behaviour in our case because absence of a panel/bridge graph
is a valid case. Let's check presence of the local port in a device-tree
before proceeding with parsing the graph.

Reviewed-by: Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/gpu/drm/drm_of.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_of.c b/drivers/gpu/drm/drm_of.c
index b50b44e76279..e0652c38f357 100644
--- a/drivers/gpu/drm/drm_of.c
+++ b/drivers/gpu/drm/drm_of.c
@@ -239,13 +239,24 @@ int drm_of_find_panel_or_bridge(const struct device_node *np,
 				struct drm_bridge **bridge)
 {
 	int ret = -EPROBE_DEFER;
-	struct device_node *remote;
+	struct device_node *local, *remote;
 
 	if (!panel && !bridge)
 		return -EINVAL;
 	if (panel)
 		*panel = NULL;
 
+	/*
+	 * of_graph_get_remote_node() produces a noisy error message if port
+	 * node isn't found and the absence of the port is a legit case here,
+	 * so at first we silently check presence of the local port.
+	 */
+	local = of_graph_get_local_port(np);
+	if (!local)
+		return -ENODEV;
+
+	of_node_put(local);
+
 	remote = of_graph_get_remote_node(np, port, endpoint);
 	if (!remote)
 		return -ENODEV;
-- 
2.26.0
