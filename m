From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v4 6/8] ARM: tegra: Always boot CPU in ARM-mode
Date: Mon, 18 Feb 2019 03:17:24 +0300
Message-ID: <20190218001726.16785-7-digetx@gmail.com>
References: <20190218001726.16785-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190218001726.16785-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Russell King <linux@armlinux.org.uk>, Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Robert Yang <decatf@gmail.com>, =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>
Cc: linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

CPU always jumps into reset handler in ARM-mode from the Trusted
Foundations firmware, hence let's make CPU to always jump into kernel
in ARM-mode regardless of the firmware presence. This is required to
make Thumb-2 kernel working with the Trusted Foundations firmware on
Tegra30.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/reset-handler.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/mach-tegra/reset-handler.S b/arch/arm/mach-tegra/reset-handler.S
index a9f13230da2f..c827b185d281 100644
--- a/arch/arm/mach-tegra/reset-handler.S
+++ b/arch/arm/mach-tegra/reset-handler.S
@@ -112,7 +112,7 @@ ENTRY(__tegra_cpu_reset_handler_start)
  * NOTE: This code is copied to IRAM. All code and data accesses
  *       must be position-independent.
  */
-
+	.arm
 	.align L1_CACHE_SHIFT
 ENTRY(__tegra_cpu_reset_handler)
 
-- 
2.20.1
