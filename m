From: Stephen Warren <swarren@nvidia.com>
Subject: [PATCH v3 06/13] dt: add empty for_each_child_of_node, of_find_property
Date: Thu, 25 Aug 2011 17:43:37 -0600
Message-ID: <1314315824-9687-7-git-send-email-swarren@nvidia.com>
References: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1314315824-9687-1-git-send-email-swarren@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Colin Cross <ccross@android.com>, Erik Gilling <konkers@android.com>, Olof Johansson <olof@lixom.net>
Cc: Russell King <linux@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, devicetree-discuss@lists.ozlabs.org, linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Belisko Marek <marek.belisko@gmail.com>, Jamie Iles <jamie@jamieiles.com>, Shawn Guo <shawn.guo@freescale.com>, Sergei Shtylyov <sshtylyov@mvista.com>, Linus Walleij <linus.walleij@linaro.org>, Stephen Warren <swarren@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The patch adds a couple empty functions for non-dt build, so that
drivers migrating to dt can save some '#ifdef CONFIG_OF'.

Signed-off-by: Stephen Warren <swarren@nvidia.com>
---
 include/linux/of.h |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/include/linux/of.h b/include/linux/of.h
index 9180dc5..1fc5875 100644
--- a/include/linux/of.h
+++ b/include/linux/of.h
@@ -242,6 +242,16 @@ static inline bool of_have_populated_dt(void)
 	return false;
 }
 
+#define for_each_child_of_node(parent, child) \
+	while (0)
+
+static inline struct property *of_find_property(const struct device_node *np,
+						const char *name,
+						int *lenp)
+{
+	return NULL;
+}
+
 static inline int of_property_read_u32_array(const struct device_node *np,
 					     const char *propname,
 					     u32 *out_values, size_t sz)
-- 
1.7.0.4
