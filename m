From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 4/6] ARM: firmware: add prepare_idle() operation
Date: Fri, 7 Feb 2014 13:35:04 +0900
Message-ID: <1391747706-1847-5-git-send-email-acourbot@nvidia.com>
References: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

Some firmwares do not put the CPU into idle mode themselves, but still
need to be informed that the CPU is about to enter idle mode before this
happens. Add a prepare_idle() operation to the firmware_ops structure to
handle such cases.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/include/asm/firmware.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm/include/asm/firmware.h b/arch/arm/include/asm/firmware.h
index 15631300c238..2c9f10df7568 100644
--- a/arch/arm/include/asm/firmware.h
+++ b/arch/arm/include/asm/firmware.h
@@ -22,6 +22,10 @@
  */
 struct firmware_ops {
 	/*
+	 * Inform the firmware we intend to enter CPU idle mode
+	 */
+	int (*prepare_idle)(void);
+	/*
 	 * Enters CPU idle mode
 	 */
 	int (*do_idle)(void);
-- 
1.8.5.3
