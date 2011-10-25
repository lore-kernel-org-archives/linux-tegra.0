From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH v3 1/3] dt: add empty of_machine_is_compatible
Date: Tue, 25 Oct 2011 14:01:26 +0200
Message-ID: <1319544088-25946-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>
Cc: linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The patch adds an empty function for non-dt build, so that
drivers migrating to dt can save some '#ifdef CONFIG_OF'.

v3: New patch

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
Patch 2 relies on this patch, but this patch would typically be merged via
Grant's OF/DT tree.

 include/linux/of.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 736b747..47303c7 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -302,6 +302,11 @@ static inline struct device_node *of_parse_phandle(struct device_node *np,
 	return NULL;
 }
 
+static inline int of_machine_is_compatible(const char *compat)
+{
+	return 0;
+}
+
 #define of_match_ptr(_ptr)	NULL
 #endif /* CONFIG_OF */
 
-- 
1.7.4.1
