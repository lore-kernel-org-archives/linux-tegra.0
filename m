From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V3 1/6] dt: add property iteration helpers
Date: Thu, 22 Mar 2012 12:27:17 -0600
Message-ID: <1332440842-1098-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linus.walleij-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org
Cc: grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org, rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org, linus.walleij-0IS4wlFg1OjSUeElwK9/Pw@public.gmane.org, B29396-KZfg59tc24xl57MIdRCFDg@public.gmane.org, s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org, dongas86-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, shawn.guo-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, thomas.abraham-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org, tony-4v6yS6AI5VpBDgjK7y7TUQ@public.gmane.org, sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

This patch adds macros of_property_for_each_u32() and
of_property_for_each_string(), which iterate over an array of values
within a device-tree property. Usage is for example:

struct property *prop;
const __be32 *p;
u32 u;
of_property_for_each_u32(np, "propname", prop, p, u)
	printk("U32 value: %x\n", u);

struct property *prop;
const char *s;
of_property_for_each_string(np, "propname", prop, s)
	printk("String value: %s\n", s);

Based on work by Rob Herring <robherring2-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>

Signed-off-by: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Acked-by: Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
---
v3: Moved code in base.c, defines/prototypes into of.h.
v2: Simplified the implementation per suggestion by Rob Herring.
---
 drivers/of/base.c  |   41 +++++++++++++++++++++++++++++++++++++++++
 include/linux/of.h |   35 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+), 0 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 5806449..d9bfd49 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -1260,3 +1260,44 @@ int of_alias_get_id(struct device_node *np, const char *stem)
 	return id;
 }
 EXPORT_SYMBOL_GPL(of_alias_get_id);
+
+const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
+			       u32 *pu)
+{
+	const void *curv = cur;
+
+	if (!prop)
+		return NULL;
+
+	if (!cur) {
+		curv = prop->value;
+		goto out_val;
+	}
+
+	curv += sizeof(*cur);
+	if (curv >= prop->value + prop->length)
+		return NULL;
+
+out_val:
+	*pu = be32_to_cpup(curv);
+	return curv;
+}
+EXPORT_SYMBOL_GPL(of_prop_next_u32);
+
+const char *of_prop_next_string(struct property *prop, const char *cur)
+{
+	const void *curv = cur;
+
+	if (!prop)
+		return NULL;
+
+	if (!cur)
+		return prop->value;
+
+	curv += strlen(cur) + 1;
+	if (curv >= prop->value + prop->length)
+		return NULL;
+
+	return curv;
+}
+EXPORT_SYMBOL_GPL(of_prop_next_string);
diff --git a/include/linux/of.h b/include/linux/of.h
index ba5d849..7c58550 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -269,6 +269,37 @@ extern void of_detach_node(struct device_node *);
 #endif
 
 #define of_match_ptr(_ptr)	(_ptr)
+
+/*
+ * struct property *prop;
+ * const __be32 *p;
+ * u32 u;
+ *
+ * of_property_for_each_u32(np, "propname", prop, p, u)
+ *         printk("U32 value: %x\n", u);
+ */
+const __be32 *of_prop_next_u32(struct property *prop, const __be32 *cur,
+			       u32 *pu);
+#define of_property_for_each_u32(np, propname, prop, p, u)	\
+	for (prop = of_find_property(np, propname, NULL),	\
+		p = of_prop_next_u32(prop, NULL, &u);		\
+		p;						\
+		p = of_prop_next_u32(prop, p, &u))
+
+/*
+ * struct property *prop;
+ * const char *s;
+ *
+ * of_property_for_each_string(np, "propname", prop, s)
+ *         printk("String value: %s\n", s);
+ */
+const char *of_prop_next_string(struct property *prop, const char *cur);
+#define of_property_for_each_string(np, propname, prop, s)	\
+	for (prop = of_find_property(np, propname, NULL),	\
+		s = of_prop_next_string(prop, NULL);		\
+		s;						\
+		s = of_prop_next_string(prop, s))
+
 #else /* CONFIG_OF */
 
 static inline bool of_have_populated_dt(void)
@@ -359,6 +390,10 @@ static inline int of_machine_is_compatible(const char *compat)
 
 #define of_match_ptr(_ptr)	NULL
 #define of_match_node(_matches, _node)	NULL
+#define of_property_for_each_u32(np, propname, prop, p, u) \
+	while (0)
+#define of_property_for_each_string(np, propname, prop, s) \
+	while (0)
 #endif /* CONFIG_OF */
 
 /**
-- 
1.7.0.4
