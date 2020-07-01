From: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Subject: [PATCH v10 1/2] of_graph: add of_graph_is_present()
Date: Wed,  1 Jul 2020 10:42:31 +0300
Message-ID: <20200701074232.13632-2-digetx@gmail.com>
References: <20200701074232.13632-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20200701074232.13632-1-digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Sam Ravnborg <sam-uyr5N9Q2VtJg9hUCZPvPmw@public.gmane.org>, Laurent Pinchart <laurent.pinchart-ryLnwIuWjnjg/C1BVhZhaw@public.gmane.org>, Rob Herring <robh+dt-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>, Frank Rowand <frowand.list-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: dri-devel-PD4FTy7X32lNgt0PjOBp9y5qC8QIuHrW@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In some cases it's very useful to silently check whether port node exists
at all in a device-tree before proceeding with parsing the graph. The DRM
bridges code is one example of such case where absence of a graph in a
device-tree is a legit condition.

This patch adds of_graph_is_present() which returns true if given
device-tree node contains OF graph port.

Reviewed-by: Rob Herring <robh-DgEjT+Ai2ygdnm+yROfE0A@public.gmane.org>
Signed-off-by: Dmitry Osipenko <digetx-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
---
 drivers/of/property.c    | 23 +++++++++++++++++++++++
 include/linux/of_graph.h |  6 ++++++
 2 files changed, 29 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 6a5760f0d6cd..fed7229d9d9f 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -29,6 +29,29 @@
 
 #include "of_private.h"
 
+/**
+ * of_graph_is_present() - check graph's presence
+ * @node: pointer to device_node containing graph port
+ *
+ * Return: True if @node has a port or ports (with a port) sub-node,
+ * false otherwise.
+ */
+bool of_graph_is_present(const struct device_node *node)
+{
+	struct device_node *ports, *port;
+
+	ports = of_get_child_by_name(node, "ports");
+	if (ports)
+		node = ports;
+
+	port = of_get_child_by_name(node, "port");
+	of_node_put(ports);
+	of_node_put(port);
+
+	return !!port;
+}
+EXPORT_SYMBOL(of_graph_is_present);
+
 /**
  * of_property_count_elems_of_size - Count the number of elements in a property
  *
diff --git a/include/linux/of_graph.h b/include/linux/of_graph.h
index 01038a6aade0..4d7756087b6b 100644
--- a/include/linux/of_graph.h
+++ b/include/linux/of_graph.h
@@ -38,6 +38,7 @@ struct of_endpoint {
 	     child = of_graph_get_next_endpoint(parent, child))
 
 #ifdef CONFIG_OF
+bool of_graph_is_present(const struct device_node *node);
 int of_graph_parse_endpoint(const struct device_node *node,
 				struct of_endpoint *endpoint);
 int of_graph_get_endpoint_count(const struct device_node *np);
@@ -56,6 +57,11 @@ struct device_node *of_graph_get_remote_node(const struct device_node *node,
 					     u32 port, u32 endpoint);
 #else
 
+static inline bool of_graph_is_present(const struct device_node *node)
+{
+	return false;
+}
+
 static inline int of_graph_parse_endpoint(const struct device_node *node,
 					struct of_endpoint *endpoint)
 {
-- 
2.26.0
