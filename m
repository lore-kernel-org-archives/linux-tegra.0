From: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCHv8 01/21] of: introduce of_property_for_each_phandle_with_args()
Date: Fri, 30 May 2014 14:20:14 +0300
Message-ID: <1401448834-32659-2-git-send-email-hdoyu@nvidia.com>
References: <1401448834-32659-1-git-send-email-hdoyu@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1401448834-32659-1-git-send-email-hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Iterating over a property containing a list of phandles with arguments
is a common operation for device drivers. This patch adds a new
of_property_for_each_phandle_with_args() macro to make the iteration
simpler.

Signed-off-by: Hiroshi Doyu <hdoyu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>
Cc: Grant Likely <grant.likely-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
Reviewed-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/of/base.c  | 50 ++++++++++++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 86 insertions(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 03e7fc6c93e8..9c6834794fd5 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1492,6 +1492,56 @@ void of_print_phandle_args(const char *msg, const struct of_phandle_args *args)
 	printk("\n");
 }
 
+void of_phandle_iter_next(struct of_phandle_iter *iter)
+{
+	struct device_node *dn;
+	int i, count;
+
+	if (!iter->cur || (iter->cur >= iter->end))
+		goto err_out;
+
+	dn = of_find_node_by_phandle(be32_to_cpup(iter->cur++));
+	if (!dn)
+		goto err_out;
+
+	if (iter->cells_name) {
+		if (of_property_read_u32(dn, iter->cells_name, &count))
+			goto err_out;
+	} else {
+		count =  iter->cell_count;
+	}
+
+	iter->out_args.np = dn;
+	iter->out_args.args_count = count;
+	for (i = 0; i < count; i++)
+		iter->out_args.args[i] = be32_to_cpup(iter->cur++);
+
+	return;
+
+err_out:
+	iter->cur = NULL;
+}
+EXPORT_SYMBOL_GPL(of_phandle_iter_next);
+
+void of_phandle_iter_start(struct of_phandle_iter *iter,
+			   const struct device_node *np,
+			   const char *list_name, const char *cells_name,
+			   int cell_count)
+{
+	size_t bytes;
+
+	iter->cur = of_get_property(np, list_name, &bytes);
+	if (!iter->cur)
+		return;
+	iter->end = iter->cur;
+	if (bytes)
+		iter->end += bytes / sizeof(*iter->cur);
+	iter->cells_name = cells_name;
+	iter->cell_count = cell_count;
+	of_phandle_iter_next(iter);
+}
+EXPORT_SYMBOL_GPL(of_phandle_iter_start);
+
 static int __of_parse_phandle_with_args(const struct device_node *np,
 					const char *list_name,
 					const char *cells_name,
diff --git a/include/linux/of.h b/include/linux/of.h
index fa362867b453..f925f16ef1a8 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -74,6 +74,18 @@ struct of_phandle_args {
 	uint32_t args[MAX_PHANDLE_ARGS];
 };
 
+/*
+ * keep the state at iterating a list of phandles with variable number
+ * of args
+ */
+struct of_phandle_iter {
+	const __be32 *cur; /* current phandle */
+	const __be32 *end; /* end of the last phandle */
+	const char *cells_name;
+	int cell_count;
+	struct of_phandle_args out_args;
+};
+
 extern int of_node_add(struct device_node *node);
 
 /* initialize a node */
@@ -303,6 +315,12 @@ extern int of_parse_phandle_with_fixed_args(const struct device_node *np,
 extern int of_count_phandle_with_args(const struct device_node *np,
 	const char *list_name, const char *cells_name);
 
+extern void of_phandle_iter_start(struct of_phandle_iter *iter,
+				  const struct device_node *np,
+				  const char *list_name,
+				  const char *cells_name, int cell_count);
+extern void of_phandle_iter_next(struct of_phandle_iter *iter);
+
 extern void of_alias_scan(void * (*dt_alloc)(u64 size, u64 align));
 extern int of_alias_get_id(struct device_node *np, const char *stem);
 
@@ -554,6 +572,18 @@ static inline int of_count_phandle_with_args(struct device_node *np,
 	return -ENOSYS;
 }
 
+static inline void of_phandle_iter_start(struct of_phandle_iter *iter,
+					 const struct device_node *np,
+					 const char *list_name,
+					 const char *cells_name,
+					 int cell_count);
+{
+}
+
+static inline void of_phandle_iter_next(struct of_phandle_iter *iter)
+{
+}
+
 static inline int of_alias_get_id(struct device_node *np, const char *stem)
 {
 	return -ENOSYS;
@@ -742,6 +772,12 @@ static inline int of_property_read_u32(const struct device_node *np,
 	for (dn = of_find_node_with_property(NULL, prop_name); dn; \
 	     dn = of_find_node_with_property(dn, prop_name))
 
+#define of_property_for_each_phandle_with_args(iter, np, list_name,	\
+					       cells_name, cell_count)	\
+	for (of_phandle_iter_start(&iter, np, list_name,		\
+				   cells_name, cell_count);		\
+	     iter.cur; of_phandle_iter_next(&iter))
+
 static inline int of_get_child_count(const struct device_node *np)
 {
 	struct device_node *child;
-- 
2.0.0.rc1.15.g7e76a2f
