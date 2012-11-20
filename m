From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH V4 1/3] of: introduce for_each_matching_node_and_match()
Date: Tue, 20 Nov 2012 16:12:20 -0700
Message-ID: <1353453142-4973-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>, John Stultz <johnstul-r/Jw6+rmf7HQT0dZR+AlfA@public.gmane.org>, Thomas Gleixner <tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>
Cc: Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Josh Cartwright <josh.cartwright-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Thomas Petazzoni <thomas.petazzoni-wi1+55ScJUtKEb57/3fJTNBPR1lH4CV8@public.gmane.org>, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The following pattern of code is tempting:

    for_each_matching_node(np, table) {
        match = of_match_node(table, np);

However, this results in iterating over table twice; the second time
inside of_match_node(). The implementation of for_each_matching_node()
already found the match, so this is redundant. Invent new function
of_find_matching_node_and_match() and macro
for_each_matching_node_and_match() to remove the double iteration,
thus transforming the above code to:

    for_each_matching_node_and_match(np, table, &match)

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
v4: New patch.

This series is based on the ARM sys_timer rework that I posted yesterday,
although patch 1/3 should be completely independant of that, and could
perhaps even be applied for 3.8 right now.

I hope that these patches can be taken through arm-soc tree for 3.9;
I will repost them based on 3.8-rc1 at the appropriate time.
---
 drivers/of/base.c  |   18 +++++++++++++-----
 include/linux/of.h |   15 +++++++++++++--
 2 files changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index f2f63c8..094271e 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -594,27 +594,35 @@ const struct of_device_id *of_match_node(const struct of_device_id *matches,
 EXPORT_SYMBOL(of_match_node);
 
 /**
- *	of_find_matching_node - Find a node based on an of_device_id match
- *				table.
+ *	of_find_matching_node_and_match - Find a node based on an of_device_id
+ *					  match table.
  *	@from:		The node to start searching from or NULL, the node
  *			you pass will not be searched, only the next one
  *			will; typically, you pass what the previous call
  *			returned. of_node_put() will be called on it
  *	@matches:	array of of device match structures to search in
+ *	@match		Updated to point at the matches entry which matched
  *
  *	Returns a node pointer with refcount incremented, use
  *	of_node_put() on it when done.
  */
-struct device_node *of_find_matching_node(struct device_node *from,
-					  const struct of_device_id *matches)
+struct device_node *of_find_matching_node_and_match(struct device_node *from,
+					const struct of_device_id *matches,
+					const struct of_device_id **match)
 {
 	struct device_node *np;
 
+	if (match)
+		*match = NULL;
+
 	read_lock(&devtree_lock);
 	np = from ? from->allnext : allnodes;
 	for (; np; np = np->allnext) {
-		if (of_match_node(matches, np) && of_node_get(np))
+		if (of_match_node(matches, np) && of_node_get(np)) {
+			if (match)
+				*match = matches;
 			break;
+		}
 	}
 	of_node_put(from);
 	read_unlock(&devtree_lock);
diff --git a/include/linux/of.h b/include/linux/of.h
index 681a6c8..1000496 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -180,11 +180,22 @@ extern struct device_node *of_find_compatible_node(struct device_node *from,
 #define for_each_compatible_node(dn, type, compatible) \
 	for (dn = of_find_compatible_node(NULL, type, compatible); dn; \
 	     dn = of_find_compatible_node(dn, type, compatible))
-extern struct device_node *of_find_matching_node(struct device_node *from,
-	const struct of_device_id *matches);
+extern struct device_node *of_find_matching_node_and_match(
+	struct device_node *from,
+	const struct of_device_id *matches,
+	const struct of_device_id **match);
+static inline struct device_node *of_find_matching_node(
+	struct device_node *from,
+	const struct of_device_id *matches)
+{
+	return of_find_matching_node_and_match(from, matches, NULL);
+}
 #define for_each_matching_node(dn, matches) \
 	for (dn = of_find_matching_node(NULL, matches); dn; \
 	     dn = of_find_matching_node(dn, matches))
+#define for_each_matching_node_and_match(dn, matches, match) \
+	for (dn = of_find_matching_node_and_match(NULL, matches, match); \
+	     dn; dn = of_find_matching_node_and_match(dn, matches, match))
 extern struct device_node *of_find_node_by_path(const char *path);
 extern struct device_node *of_find_node_by_phandle(phandle handle);
 extern struct device_node *of_get_parent(const struct device_node *node);
-- 
1.7.10.4
