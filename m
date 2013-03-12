From: Rhyland Klein <rklein@nvidia.com>
Subject: [Patch v3 1/4] mfd: tps65090: Fix enum in header file
Date: Tue, 12 Mar 2013 18:08:06 -0400
Message-ID: <1363126089-9071-2-git-send-email-rklein@nvidia.com>
References: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1363126089-9071-1-git-send-email-rklein@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Stephen Warren <swarren@wwwdotorg.org>, Mark Brown <broonie@opensource.wolfsonmicro.com>, Anton Vorontsov <cbou@mail.ru>, Samuel Ortiz <sameo@linux.intel.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, Laxman Dewangan <ldewangan@nvidia.com>, Rhyland Klein <rklein@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

The enum is missing the definition for the first bit, which makes all
the rest off by one. Add definition for the TPS65090_IRQ_INTERRUPT bit
which at 0.

Signed-off-by: Rhyland Klein <rklein@nvidia.com>
---
v3:
 - no changes since v2
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
