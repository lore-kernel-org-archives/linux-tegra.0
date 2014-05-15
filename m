From: Andrew Bresticker <abrestic@chromium.org>
Subject: [RFC PATCH 05/10] ARM: tegra: Export function to read USB calibration
 data
Date: Wed, 14 May 2014 17:33:01 -0700
Message-ID: <1400113986-339-6-git-send-email-abrestic@chromium.org>
References: <1400113986-339-1-git-send-email-abrestic@chromium.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1400113986-339-1-git-send-email-abrestic@chromium.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-usb@vger.kernel.org
Cc: Mark Rutland <mark.rutland@arm.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Russell King <linux@arm.linux.org.uk>, Mathias Nyman <mathias.nyman@intel.com>, Pawel Moll <pawel.moll@arm.com>, Stephen Warren <swarren@wwwdotorg.org>, Andrew Bresticker <abrestic@chromium.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter De Schrijver <pdeschrijver@nvidia.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Kishon Vijay Abraham I <kishon@ti.com>, Rob Herring <robh+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Kumar Gala <galak@codeaurora.org>, Grant Likely <grant.likely@linaro.org>, Mike Turquette <mturquette@linaro.org>
List-Id: linux-tegra@vger.kernel.org

Board-specific USB configuration data is stored in FUSE_SKU_CALIB_0.
Export a function to read it so the PHY can be properly configured.

Signed-off-by: Andrew Bresticker <abrestic@chromium.org>
---
 arch/arm/mach-tegra/fuse.c | 13 +++++++++++++
 include/linux/tegra-soc.h  |  1 +
 2 files changed, 14 insertions(+)

diff --git a/arch/arm/mach-tegra/fuse.c b/arch/arm/mach-tegra/fuse.c
index c9ac23b..e457ef7 100644
--- a/arch/arm/mach-tegra/fuse.c
+++ b/arch/arm/mach-tegra/fuse.c
@@ -34,6 +34,7 @@
 #define FUSE_UID_HIGH		0x10c
 
 /* Tegra30 and later */
+#define FUSE_USB_CALIB		0x1f0
 #define FUSE_VENDOR_CODE	0x200
 #define FUSE_FAB_CODE		0x204
 #define FUSE_LOT_CODE_0		0x208
@@ -154,6 +155,18 @@ u32 tegra_read_chipid(void)
 	return readl_relaxed(IO_ADDRESS(TEGRA_APB_MISC_BASE) + 0x804);
 }
 
+u32 tegra_read_usb_calibration_data(void)
+{
+	u32 reg;
+
+	tegra_fuse_enable_clk();
+	reg = tegra_fuse_readl(FUSE_USB_CALIB);
+	tegra_fuse_disable_clk();
+
+	return reg;
+}
+EXPORT_SYMBOL(tegra_read_usb_calibration_data);
+
 static void __init tegra20_fuse_init_randomness(void)
 {
 	u32 randomness[2];
diff --git a/include/linux/tegra-soc.h b/include/linux/tegra-soc.h
index 95f611d..492dc95 100644
--- a/include/linux/tegra-soc.h
+++ b/include/linux/tegra-soc.h
@@ -18,5 +18,6 @@
 #define __LINUX_TEGRA_SOC_H_
 
 u32 tegra_read_chipid(void);
+u32 tegra_read_usb_calibration_data(void);
 
 #endif /* __LINUX_TEGRA_SOC_H_ */
-- 
1.9.1.423.g4596e3a
