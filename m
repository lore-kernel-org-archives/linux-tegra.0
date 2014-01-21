From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH 1/5] ARM: trusted_foundations: fix vendor prefix typos
Date: Tue, 21 Jan 2014 19:10:12 +0900
Message-ID: <1390299016-14105-2-git-send-email-acourbot@nvidia.com>
References: <1390299016-14105-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1390299016-14105-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

of_register_trusted_foundations() and the firmware Kconfig used
the wrong vendor prefix for Trusted Logic Mobility.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/firmware/Kconfig                  | 2 +-
 arch/arm/include/asm/trusted_foundations.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/firmware/Kconfig b/arch/arm/firmware/Kconfig
index bb00ccf00d66..bb126594995e 100644
--- a/arch/arm/firmware/Kconfig
+++ b/arch/arm/firmware/Kconfig
@@ -20,7 +20,7 @@ config TRUSTED_FOUNDATIONS
 	  This option allows the kernel to invoke the secure monitor whenever
 	  required on devices using Trusted Foundations. See
 	  arch/arm/include/asm/trusted_foundations.h or the
-	  tl,trusted-foundations device tree binding documentation for details
+	  tlm,trusted-foundations device tree binding documentation for details
 	  on how to use it.
 
 	  Say n if you don't know what this is about.
diff --git a/arch/arm/include/asm/trusted_foundations.h b/arch/arm/include/asm/trusted_foundations.h
index 3bd36e2c5f2e..997862fd5d77 100644
--- a/arch/arm/include/asm/trusted_foundations.h
+++ b/arch/arm/include/asm/trusted_foundations.h
@@ -59,7 +59,7 @@ static inline void of_register_trusted_foundations(void)
 	 * If we find the target should enable TF but does not support it,
 	 * fail as the system won't be able to do much anyway
 	 */
-	if (of_find_compatible_node(NULL, NULL, "tl,trusted-foundations"))
+	if (of_find_compatible_node(NULL, NULL, "tlm,trusted-foundations"))
 		register_trusted_foundations(NULL);
 }
 #endif /* CONFIG_TRUSTED_FOUNDATIONS */
-- 
1.8.5.3
