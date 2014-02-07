From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v2 3/6] ARM: firmware: enable Trusted Foundations by default
Date: Fri, 7 Feb 2014 13:35:03 +0900
Message-ID: <1391747706-1847-4-git-send-email-acourbot@nvidia.com>
References: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1391747706-1847-1-git-send-email-acourbot@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, Russell King <linux@arm.linux.org.uk>, Tomasz Figa <t.figa@samsung.com>
Cc: Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, gnurou@gmail.com, Alexandre Courbot <acourbot@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

As discussed previously (https://lkml.org/lkml/2013/11/26/289), enable
Trusted Foundation support by default since it already depends on a
supporting architecture being selected.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 arch/arm/firmware/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/firmware/Kconfig b/arch/arm/firmware/Kconfig
index bb126594995e..ad396af68e47 100644
--- a/arch/arm/firmware/Kconfig
+++ b/arch/arm/firmware/Kconfig
@@ -11,6 +11,7 @@ menu "Firmware options"
 config TRUSTED_FOUNDATIONS
 	bool "Trusted Foundations secure monitor support"
 	depends on ARCH_SUPPORTS_TRUSTED_FOUNDATIONS
+	default y
 	help
 	  Some devices (including most Tegra-based consumer devices on the
 	  market) are booted with the Trusted Foundations secure monitor
-- 
1.8.5.3
