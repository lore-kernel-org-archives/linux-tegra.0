From: Peter Geis <pgwipeout@gmail.com>
Subject: [PATCH v3 1/2] Add sw2_sw4 voltage table to cpcap regulator.
Date: Tue, 24 Jul 2018 09:25:40 -0400
Message-ID: <20180724132541.17039-2-pgwipeout@gmail.com>
References: <20180724132541.17039-1-pgwipeout@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180724132541.17039-1-pgwipeout@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: broonie@kernel.org
Cc: lgirdwood@gmail.com, robh+dt@kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, Peter Geis <pgwipeout@gmail.com>
List-Id: linux-tegra@vger.kernel.org

SW2 and SW4 use a shared table to provide voltage to the cpu core and
devices on Tegra hardware.
Added this table to the cpcap regulator driver as the first step to
supporting this device on Tegra.

Signed-off-by: Peter Geis <pgwipeout@gmail.com>
---
 drivers/regulator/cpcap-regulator.c | 23 +++++++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/drivers/regulator/cpcap-regulator.c b/drivers/regulator/cpcap-regulator.c
index bd910fe123d9..c0b1e04bd90f 100644
--- a/drivers/regulator/cpcap-regulator.c
+++ b/drivers/regulator/cpcap-regulator.c
@@ -271,6 +271,29 @@ static struct regulator_ops cpcap_regulator_ops = {
 };
 
 static const unsigned int unknown_val_tbl[] = { 0, };
+static const unsigned int sw2_sw4_val_tbl[] = { 612500, 625000, 637500,
+						650000, 662500, 675000,
+						687500, 700000, 712500,
+						725000, 737500, 750000,
+						762500, 775000, 787500,
+						800000, 812500, 825000,
+						837500, 850000, 862500,
+						875000, 887500, 900000,
+						912500, 925000, 937500,
+						950000, 962500, 975000,
+						987500, 1000000, 1012500,
+						1025000, 1037500, 1050000,
+						1062500, 1075000, 1087500,
+						1100000, 1112500, 1125000,
+						1137500, 1150000, 1162500,
+						1175000, 1187500, 1200000,
+						1212500, 1225000, 1237500,
+						1250000, 1262500, 1275000,
+						1287500, 1300000, 1312500,
+						1325000, 1337500, 1350000,
+						1362500, 1375000, 1387500,
+						1400000, 1412500, 1425000,
+						1437500, 1450000, 1462500, };
 static const unsigned int sw5_val_tbl[] = { 0, 5050000, };
 static const unsigned int vcam_val_tbl[] = { 2600000, 2700000, 2800000,
 					     2900000, };
-- 
2.17.1
