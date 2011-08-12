From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [RFC PATCH 01/12] dt: Add of_find_child_node_by_name()
Date: Fri, 12 Aug 2011 16:54:46 -0600
Message-ID: <1313189697-21287-2-git-send-email-swarren@nvidia.com>
References: <1313189697-21287-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
In-Reply-To: <1313189697-21287-1-git-send-email-swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Unsubscribe: <https://lists.ozlabs.org/options/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=unsubscribe>
List-Archive: <http://lists.ozlabs.org/pipermail/devicetree-discuss>
List-Post: <mailto:devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Help: <mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=help>
List-Subscribe: <https://lists.ozlabs.org/listinfo/devicetree-discuss>,
	<mailto:devicetree-discuss-request-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org?subject=subscribe>
Errors-To: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
Sender: devicetree-discuss-bounces+gldd-devicetree-discuss=m.gmane.org-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org
To: Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

This function retrieves a named child node of a given parent node.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c  |   18 ++++++++++++++++++
 include/linux/of.h |    2 ++
 2 files changed, 20 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 3ff22e3..7eea9e3 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -388,6 +388,24 @@ struct device_node *of_find_node_by_name(struct device_node *from,
 }
 EXPORT_SYMBOL(of_find_node_by_name);
 
+struct device_node *of_find_child_node_by_name(
+	const struct device_node *parent, const char *name)
+{
+	struct device_node *child;
+
+	read_lock(&devtree_lock);
+
+	for_each_child_of_node(parent, child) {
+		if (!strcmp(child->name, name))
+			break;
+	}
+
+	read_unlock(&devtree_lock);
+
+	return child;
+}
+EXPORT_SYMBOL(of_find_child_node_by_name);
+
 /**
  *	of_find_node_by_type - Find a node by its "device_type" property
  *	@from:	The node to start searching from, or NULL to start searching
diff --git a/include/linux/of.h b/include/linux/of.h
index 9180dc5..032c71b 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -161,6 +161,8 @@ extern struct device_node *of_find_node_by_name(struct device_node *from,
 #define for_each_node_by_name(dn, name) \
 	for (dn = of_find_node_by_name(NULL, name); dn; \
 	     dn = of_find_node_by_name(dn, name))
+extern struct device_node *of_find_child_node_by_name(
+	const struct device_node *node, const char *name);
 extern struct device_node *of_find_node_by_type(struct device_node *from,
 	const char *type);
 #define for_each_node_by_type(dn, type) \
-- 
1.7.0.4
