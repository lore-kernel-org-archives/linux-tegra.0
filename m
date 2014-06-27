From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
Subject: [RFC 1/5] clk: Add temporary mapping to the existing API
Date: Fri, 27 Jun 2014 09:57:48 +0200
Message-ID: <1403855872-14749-2-git-send-email-tomeu.vizoso@collabora.com>
References: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1403855872-14749-1-git-send-email-tomeu.vizoso@collabora.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Mike Turquette <mturquette@linaro.org>, Rabin Vincent <rabin.vincent@stericsson.com>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>
List-Id: linux-tegra@vger.kernel.org

To preserve git-bisectability, add aliases from the future provider API to the
existing public API.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---

Don't like this much, would be great to hear of alternatives.

 include/linux/clk-provider.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index 0c287db..e9ccc50 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -16,6 +16,24 @@
 
 #ifdef CONFIG_COMMON_CLK
 
+/* Temporarily map the to-be-added API to the old API, just so stuff compiles */
+#define clk_core			clk
+
+#define clk_core_to_clk
+
+#define __clk_get_internal		clk_get
+#define __clk_get_sys_internal		clk_get_sys
+#define __devm_clk_get_internal		devm_clk_get
+#define __of_clk_get_internal		of_clk_get
+#define __of_clk_get_by_name_internal	of_clk_get_by_name
+
+#define __clk_set_rate_internal		clk_set_rate
+#define __clk_get_rate_internal		clk_get_rate
+#define __clk_set_parent_internal	clk_set_parent
+#define __clk_get_parent_internal	clk_get_parent
+#define __clk_prepare_internal		clk_prepare
+#define __clk_unprepare_internal	clk_unprepare
+
 /*
  * flags used across common struct clk.  these flags should only affect the
  * top-level framework.  custom flags for dealing with hardware specifics
-- 
1.9.3
