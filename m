From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 2/9] fdt: Add function to allow aliases to refer to multiple nodes
Date: Fri,  3 Feb 2012 17:13:53 -0800
Message-ID: <1328318041-10943-3-git-send-email-sjg@chromium.org>
References: <1328318041-10943-1-git-send-email-sjg@chromium.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1328318041-10943-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Jerry Van Baren <vanbaren-He//nVnquyzQT0dZR+AlfA@public.gmane.org>, Devicetree Discuss <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Some devices can deal with multiple compatible properties. The devices
need to know which nodes to bind to which features. For example an
I2C driver which supports two different controller types will want to
know which type it is dealing with in each case.

The new fdtdec_add_aliases_for_id() function deals with this by allowing
the driver to search for additional compatible nodes for a different ID.
It can then detect the new ones and perform appropriate processing.

Another option considered was to return a tuple (node offset, compat id)
and have the function be passed a list of compatible IDs. This is more
overhead for the common case though. We may add such a function later if
more drivers in U-Boot require it.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v3:
- Add comments and warning for mixed alias use in fdtdec

 include/fdtdec.h |   23 +++++++++++++++++++++++
 lib/fdtdec.c     |   22 ++++++++++++++++++----
 2 files changed, 41 insertions(+), 4 deletions(-)

diff --git a/include/fdtdec.h b/include/fdtdec.h
index bd2222c..b028bfb 100644
--- a/include/fdtdec.h
+++ b/include/fdtdec.h
@@ -200,6 +200,29 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 			enum fdt_compat_id id, int *node_list, int maxcount);
 
 /*
+ * This function is similar to fdtdec_find_aliases_for_id() except that it
+ * adds to the node_list that is passed in. Any 0 elements are considered
+ * available for allocation - others are considered already used and are
+ * skipped.
+ *
+ * You can use this by calling fdtdec_find_aliases_for_id() with an
+ * uninitialised array, then setting the elements that are returned to -1,
+ * say, then calling this function, perhaps with a different compat id.
+ * Any elements you get back that are >0 are new nodes added by the call
+ * to this function.
+ *
+ * Note that if you have some nodes with aliases and some without, you are
+ * sailing close to the wind. The call to fdtdec_find_aliases_for_id() with
+ * one compat_id may fill in positions for which you have aliases defined
+ * for another compat_id. When you later call *this* function with the second
+ * compat_id, the alias positions may already be used. A debug warning may
+ * be generated in this case, but it is safest to define aliases for all
+ * nodes when you care about the ordering.
+ */
+int fdtdec_add_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount);
+
+/*
  * Get the name for a compatible ID
  *
  * @param id		Compatible ID to look for
diff --git a/lib/fdtdec.c b/lib/fdtdec.c
index 7260c73..35361d1 100644
--- a/lib/fdtdec.c
+++ b/lib/fdtdec.c
@@ -151,10 +151,18 @@ int fdtdec_next_alias(const void *blob, const char *name,
 	return node;
 }
 
-/* TODO: Can we tighten this code up a little? */
 int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 			enum fdt_compat_id id, int *node_list, int maxcount)
 {
+	memset(node_list, '\0', sizeof(*node_list) * maxcount);
+
+	return fdtdec_add_aliases_for_id(blob, name, id, node_list, maxcount);
+}
+
+/* TODO: Can we tighten this code up a little? */
+int fdtdec_add_aliases_for_id(const void *blob, const char *name,
+			enum fdt_compat_id id, int *node_list, int maxcount)
+{
 	int name_len = strlen(name);
 	int nodes[maxcount];
 	int num_found = 0;
@@ -184,8 +192,6 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 		       __func__, name);
 
 	/* Now find all the aliases */
-	memset(node_list, '\0', sizeof(*node_list) * maxcount);
-
 	for (offset = fdt_first_property_offset(blob, alias_node);
 			offset > 0;
 			offset = fdt_next_property_offset(blob, offset)) {
@@ -232,11 +238,19 @@ int fdtdec_find_aliases_for_id(const void *blob, const char *name,
 		 * it as done.
 		 */
 		if (fdtdec_get_is_enabled(blob, node)) {
+			if (node_list[number]) {
+				debug("%s: warning: alias '%s' requires that "
+				      "a node be placed in the list in a "
+				      "position which is already filled by "
+				      "node '%s'\n", __func__, path,
+				      fdt_get_name(blob, node, NULL));
+				continue;
+			}
 			node_list[number] = node;
 			if (number >= num_found)
 				num_found = number + 1;
 		}
-		nodes[j] = 0;
+		nodes[found] = 0;
 	}
 
 	/* Add any nodes not mentioned by an alias */
-- 
1.7.7.3
