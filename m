From: Rhyland Klein <rklein@nvidia.com>
Subject: [PATCH v2 1/4] mfd: tps65090: Fix enum in header file
Date: Mon, 4 Mar 2013 14:01:46 -0500
Message-ID: <1362423709-29596-2-git-send-email-rklein@nvidia.com>
References: <1362423709-29596-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1362423709-29596-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Samuel Ortiz <sameo@linux.intel.com>, Anton Vorontsov <cbou@mail.ru>, Mark Brown <broonie@opensource.wolfsonmicro.com>
Cc: Laxman Dewangan <ldewangan@nvidia.com>, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The enum is missing the definition for the first bit, which makes all
the rest off by one. Add definition for the TPS65090_IRQ_INTERRUPT bit
which at 0.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v2:
 - no changes since v1

 include/linux/mfd/tps65090.h |    1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mfd/tps65090.h b/include/linux/mfd/tps65090.h
index 6694cf4..9ce231f 100644
--- a/include/linux/mfd/tps65090.h
+++ b/include/linux/mfd/tps65090.h
@@ -27,6 +27,7 @@
 
 /* TPS65090 IRQs */
 enum {
+	TPS65090_IRQ_INTERRUPT,
 	TPS65090_IRQ_VAC_STATUS_CHANGE,
 	TPS65090_IRQ_VSYS_STATUS_CHANGE,
 	TPS65090_IRQ_BAT_STATUS_CHANGE,
-- 
1.7.9.5
