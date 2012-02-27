From: Simon Glass <sjg@chromium.org>
Subject: [PATCH v6 20/20] tegra: fdt: Enable FDT support for
	Seaboard
Date: Mon, 27 Feb 2012 12:52:53 -0800
Message-ID: <1330375973-10681-21-git-send-email-sjg@chromium.org>
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

This switches Seaboard over to use FDT for run-time config instead of
CONFIG options. USB is the only user at present.

Signed-off-by: Simon Glass <sjg@chromium.org>
---
Changes in v3:
- Drop Tegra USB alignment patch as we will deal with this another way

Changes in v6:
- Drop fdt alignment patch as we will handle this after generic reloc

 include/configs/seaboard.h |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index b6d9f7a..1dc775a 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -27,6 +27,11 @@
 #include <asm/sizes.h>
 #include "tegra2-common.h"
 
+/* Enable fdt support for Seaboard. Flash the image in u-boot-dtb.bin */
+#define CONFIG_DEFAULT_DEVICE_TREE	tegra2-seaboard
+#define CONFIG_OF_CONTROL
+#define CONFIG_OF_SEPARATE
+
 /* High-level configuration options */
 #define TEGRA2_SYSMEM		"mem=384M@0M nvmem=128M@384M mem=512M@512M"
 #define V_PROMPT		"Tegra2 (SeaBoard) # "
-- 
1.7.7.3
