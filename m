From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 15/20] tegra: fdt: Add function to return
	peripheral/clock ID
Date: Mon, 27 Feb 2012 12:52:48 -0800
Message-ID: <1330375973-10681-16-git-send-email-sjg@chromium.org>
References: <1330375973-10681-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <u-boot-bounces@lists.denx.de>
In-Reply-To: <1330375973-10681-1-git-send-email-sjg@chromium.org>
List-Unsubscribe: <http://lists.denx.de/mailman/options/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=unsubscribe>
List-Archive: <http://lists.denx.de/pipermail/u-boot>
List-Post: <mailto:u-boot@lists.denx.de>
List-Help: <mailto:u-boot-request@lists.denx.de?subject=help>
List-Subscribe: <http://lists.denx.de/mailman/listinfo/u-boot>,
	<mailto:u-boot-request@lists.denx.de?subject=subscribe>
Sender: u-boot-bounces@lists.denx.de
Errors-To: u-boot-bounces@lists.denx.de
To: U-Boot Mailing List <u-boot@lists.denx.de>
Cc: Devicetree Discuss <devicetree-discuss@lists.ozlabs.org>, Jerry Van Baren <vanbaren@cideas.com>, Tom Warren <twarren@nvidia.com>, linux-tegra@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

A common requirement is to find the clock ID for a peripheral. This is the
second cell of the 'clocks' property (the first being the phandle itself).

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v4:
- Add fdtdec function to return peripheral ID

Changes in v6:
- Move peripheral decode function into Tegra's clock.c

 arch/arm/cpu/armv7/tegra2/clock.c        |   19 +++++++++++++++++++
 arch/arm/include/asm/arch-tegra2/clock.h |   13 +++++++++++++
 2 files changed, 32 insertions(+), 0 deletions(-)

diff --git a/arch/arm/cpu/armv7/tegra2/clock.c b/arch/arm/cpu/armv7/tegra2/clock.c
index 11d2346..ffbfc28 100644
--- a/arch/arm/cpu/armv7/tegra2/clock.c
+++ b/arch/arm/cpu/armv7/tegra2/clock.c
@@ -28,6 +28,7 @@
 #include <asm/arch/tegra2.h>
 #include <common.h>
 #include <div64.h>
+#include <fdtdec.h>
 
 /*
  * This is our record of the current clock rate of each clock. We don't
@@ -918,6 +919,24 @@ void clock_ll_start_uart(enum periph_id periph_id)
 	reset_set_enable(periph_id, 0);
 }
 
+
+int clock_decode_periph_id(const void *blob, int node)
+{
+	enum periph_id id;
+	int err, valid;
+	u32 cell[2];
+
+	err = fdtdec_get_int_array(blob, node, "clocks", cell,
+				   ARRAY_SIZE(cell));
+	if (err)
+		return -1;
+	id = cell[1];
+
+	valid = clock_periph_id_isvalid(id);
+	assert(valid);
+	return valid ? id : PERIPH_ID_NONE;
+}
+
 int clock_verify(void)
 {
 	struct clk_pll *pll = get_pll(CLOCK_ID_PERIPH);
diff --git a/arch/arm/include/asm/arch-tegra2/clock.h b/arch/arm/include/asm/arch-tegra2/clock.h
index 080ef18..6b12c76 100644
--- a/arch/arm/include/asm/arch-tegra2/clock.h
+++ b/arch/arm/include/asm/arch-tegra2/clock.h
@@ -177,6 +177,7 @@ enum periph_id {
 	PERIPH_ID_CRAM2,
 
 	PERIPH_ID_COUNT,
+	PERIPH_ID_NONE = -1,
 };
 
 /* Converts a clock number to a clock register: 0=L, 1=H, 2=U */
@@ -355,6 +356,18 @@ unsigned clock_get_rate(enum clock_id clkid);
  */
 void clock_ll_start_uart(enum periph_id periph_id);
 
+/**
+ * Decode a peripheral ID from a device tree node.
+ *
+ * This works by looking up the peripheral's 'clocks' node and reading out
+ * the second cell, which is the clock number / peripheral ID.
+ *
+ * @param blob		FDT blob to use
+ * @param node		Node to look at
+ * @return peripheral ID, or PERIPH_ID_NONE if none
+ */
+enum periph_id clock_decode_periph_id(const void *blob, int node);
+
 /*
  * Checks that clocks are valid and prints a warning if not
  *
-- 
1.7.7.3
