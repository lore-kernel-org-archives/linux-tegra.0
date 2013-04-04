From: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH tegra-cbootimage-configs] Add Tegra20 Tamonten configurations
Date: Thu,  4 Apr 2013 11:30:14 +0200
Message-ID: <1365067814-12925-1-git-send-email-thierry.reding@avionic-design.de>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

In addition to providing the BCT configuration that is common for all
Tegra20 Tamonten-derived boards, add scripts to build images that can
be flashed to NAND for the Plutux, Medcom-Wide and TEC boards.

Signed-off-by: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 .../Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.cfg | 132 +++++++++++++++++++++
 tamonten/build.sh                                  |  35 ++++++
 tamonten/tegra20-medcom-wide/build.sh              |  23 ++++
 .../tegra20-medcom-wide/tegra20-medcom-wide.cfg    |  22 ++++
 tamonten/tegra20-plutux/build.sh                   |  23 ++++
 tamonten/tegra20-plutux/tegra20-plutux.cfg         |  22 ++++
 tamonten/tegra20-tec/build.sh                      |  23 ++++
 tamonten/tegra20-tec/tegra20-tec.cfg               |  22 ++++
 8 files changed, 302 insertions(+)
 create mode 100644 tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.cfg
 create mode 100755 tamonten/build.sh
 create mode 100755 tamonten/tegra20-medcom-wide/build.sh
 create mode 100644 tamonten/tegra20-medcom-wide/tegra20-medcom-wide.cfg
 create mode 100755 tamonten/tegra20-plutux/build.sh
 create mode 100644 tamonten/tegra20-plutux/tegra20-plutux.cfg
 create mode 100755 tamonten/tegra20-tec/build.sh
 create mode 100644 tamonten/tegra20-tec/tegra20-tec.cfg

diff --git a/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.cfg b/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.cfg
new file mode 100644
index 0000000..16ff9af
--- /dev/null
+++ b/tamonten/Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.cfg
@@ -0,0 +1,132 @@
+# Copyright (C) 2011-2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+Version       = 0x00020001;
+BlockSize     = 0x00020000;
+PageSize      = 0x00000800;
+PartitionSize = 0x01000000;
+OdmData       = 0x2b2d8011;
+
+DevType[0] = NvBootDevType_Nand;
+DeviceParam[0].NandParams.ClockDivider  = 0x00000004;
+DeviceParam[0].NandParams.NandTiming2   = 0x0000000a;
+DeviceParam[0].NandParams.NandTiming    = 0x3b269213;
+DeviceParam[0].NandParams.BlockSizeLog2 = 0x00000000;
+DeviceParam[0].NandParams.PageSizeLog2  = 0x00000000;
+
+SDRAM[0].MemoryType                 = NvBootMemoryType_Ddr2;
+SDRAM[0].PllMChargePumpSetupControl = 0x00000008;
+SDRAM[0].PllMLoopFilterSetupControl = 0x00000000;
+SDRAM[0].PllMInputDivider           = 0x0000000c;
+SDRAM[0].PllMFeedbackDivider        = 0x0000029a;
+SDRAM[0].PllMPostDivider            = 0x00000000;
+SDRAM[0].PllMStableTime             = 0x0000012c;
+SDRAM[0].EmcClockDivider            = 0x00000001;
+SDRAM[0].EmcAutoCalInterval         = 0x00000000;
+SDRAM[0].EmcAutoCalConfig           = 0xe0a61111;
+SDRAM[0].EmcAutoCalWait             = 0x00000000;
+SDRAM[0].EmcPinProgramWait          = 0x00000000;
+SDRAM[0].EmcRc                      = 0x00000014;
+SDRAM[0].EmcRfc                     = 0x00000041;
+SDRAM[0].EmcRas                     = 0x0000000f;
+SDRAM[0].EmcRp                      = 0x00000005;
+SDRAM[0].EmcR2w                     = 0x00000004;
+SDRAM[0].EmcW2r                     = 0x00000005;
+SDRAM[0].EmcR2p                     = 0x00000003;
+SDRAM[0].EmcW2p                     = 0x0000000b;
+SDRAM[0].EmcRrd                     = 0x00000004;
+SDRAM[0].EmcRdRcd                   = 0x00000005;
+SDRAM[0].EmcWrRcd                   = 0x00000005;
+SDRAM[0].EmcRext                    = 0x00000001;
+SDRAM[0].EmcWdv                     = 0x00000003;
+SDRAM[0].EmcQUseExtra               = 0x00000000;
+SDRAM[0].EmcQUse                    = 0x00000004;
+SDRAM[0].EmcQRst                    = 0x00000003;
+SDRAM[0].EmcQSafe                   = 0x00000009;
+SDRAM[0].EmcRdv                     = 0x0000000c;
+SDRAM[0].EmcRefresh                 = 0x000004df;
+SDRAM[0].EmcBurstRefreshNum         = 0x00000000;
+SDRAM[0].EmcPdEx2Wr                 = 0x00000003;
+SDRAM[0].EmcPdEx2Rd                 = 0x00000003;
+SDRAM[0].EmcPChg2Pden               = 0x00000005;
+SDRAM[0].EmcAct2Pden                = 0x00000005;
+SDRAM[0].EmcAr2Pden                 = 0x00000001;
+SDRAM[0].EmcRw2Pden                 = 0x0000000e;
+SDRAM[0].EmcTxsr                    = 0x000000c8;
+SDRAM[0].EmcTcke                    = 0x00000003;
+SDRAM[0].EmcTfaw                    = 0x0000000f;
+SDRAM[0].EmcTrpab                   = 0x00000006;
+SDRAM[0].EmcTClkStable              = 0x0000000f;
+SDRAM[0].EmcTClkStop                = 0x00000002;
+SDRAM[0].EmcTRefBw                  = 0x00000000;
+SDRAM[0].EmcFbioCfg1                = 0x00000000;
+SDRAM[0].EmcFbioDqsibDlyMsb         = 0x00000000;
+SDRAM[0].EmcFbioDqsibDly            = 0x2f2f2f2f;
+SDRAM[0].EmcFbioQuseDlyMsb          = 0x00000000;
+SDRAM[0].EmcFbioQuseDly             = 0x2f2f2f2f;
+SDRAM[0].EmcFbioCfg5                = 0x00000083;
+SDRAM[0].EmcFbioCfg6                = 0x00000002;
+SDRAM[0].EmcFbioSpare               = 0x00000000;
+SDRAM[0].EmcMrsResetDllWait         = 0x00000000;
+SDRAM[0].EmcMrsResetDll             = 0x00000000;
+SDRAM[0].EmcMrsDdr2DllReset         = 0x00000100;
+SDRAM[0].EmcMrs                     = 0x00000a5a;
+SDRAM[0].EmcEmrsEmr2                = 0x00200000;
+SDRAM[0].EmcEmrsEmr3                = 0x00300000;
+SDRAM[0].EmcEmrsDdr2DllEnable       = 0x00100000;
+SDRAM[0].EmcEmrsDdr2OcdCalib        = 0x00100382;
+SDRAM[0].EmcEmrs                    = 0x00100002;
+SDRAM[0].EmcMrw1                    = 0x00000000;
+SDRAM[0].EmcMrw2                    = 0x00000000;
+SDRAM[0].EmcMrw3                    = 0x00000000;
+SDRAM[0].EmcMrwResetCommand         = 0x00000000;
+SDRAM[0].EmcMrwResetNInitWait       = 0x00000000;
+SDRAM[0].EmcAdrCfg1                 = 0x00070303;
+SDRAM[0].EmcAdrCfg                  = 0x00070303;
+SDRAM[0].McEmemCfg                  = 0x00080000;
+SDRAM[0].McLowLatencyConfig         = 0x80000003;
+SDRAM[0].EmcCfg2                    = 0x00000405;
+SDRAM[0].EmcCfgDigDll               = 0x00380006;
+SDRAM[0].EmcCfgClktrim0             = 0x00000000;
+SDRAM[0].EmcCfgClktrim1             = 0x00000000;
+SDRAM[0].EmcCfgClktrim2             = 0x00000000;
+SDRAM[0].EmcCfg                     = 0x0001ff00;
+SDRAM[0].EmcDbg                     = 0x01000000;
+SDRAM[0].AhbArbitrationXbarCtrl     = 0x00010000;
+SDRAM[0].EmcDllXformDqs             = 0x00000010;
+SDRAM[0].EmcDllXformQUse            = 0x00000008;
+SDRAM[0].WarmBootWait               = 0x00000002;
+SDRAM[0].EmcCttTermCtrl             = 0x00000802;
+SDRAM[0].EmcOdtWrite                = 0x00000000;
+SDRAM[0].EmcOdtRead                 = 0x00000000;
+SDRAM[0].EmcZcalRefCnt              = 0x00000000;
+SDRAM[0].EmcZcalWaitCnt             = 0x00000000;
+SDRAM[0].EmcZcalMrwCmd              = 0x00000000;
+SDRAM[0].EmcMrwZqInitDev0           = 0x00000000;
+SDRAM[0].EmcMrwZqInitDev1           = 0x00000000;
+SDRAM[0].EmcMrwZqInitWait           = 0x00000000;
+SDRAM[0].EmcDdr2Wait                = 0x00000002;
+SDRAM[0].PmcDdrPwr                  = 0x00000001;
+SDRAM[0].ApbMiscGpXm2CfgAPadCtrl    = 0x77ffc000;
+SDRAM[0].ApbMiscGpXm2CfgCPadCtrl2   = 0x08080079;
+SDRAM[0].ApbMiscGpXm2CfgCPadCtrl    = 0x77fffff0;
+SDRAM[0].ApbMiscGpXm2CfgDPadCtrl2   = 0x44440009;
+SDRAM[0].ApbMiscGpXm2CfgDPadCtrl    = 0x77fffff0;
+SDRAM[0].ApbMiscGpXm2ClkCfgPadCtrl  = 0x77ffc000;
+SDRAM[0].ApbMiscGpXm2CompPadCtrl    = 0x01f1f008;
+SDRAM[0].ApbMiscGpXm2VttGenPadCtrl  = 0x07076600;
diff --git a/tamonten/build.sh b/tamonten/build.sh
new file mode 100755
index 0000000..300859f
--- /dev/null
+++ b/tamonten/build.sh
@@ -0,0 +1,35 @@
+#!/bin/sh
+
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+set -e
+
+# generate Tegra20 Tamonten BCT
+for cfg in Tamonten_T2_*.cfg; do
+	cbootimage -t20 -gbct $cfg ${cfg%.cfg}.bct
+done
+
+subdirs="$subdirs tegra20-plutux"
+subdirs="$subdirs tegra20-medcom-wide"
+subdirs="$subdirs tegra20-tec"
+
+# descend into board subdirectories
+for subdir in $subdirs; do
+	( cd $subdir && ./build.sh )
+done
diff --git a/tamonten/tegra20-medcom-wide/build.sh b/tamonten/tegra20-medcom-wide/build.sh
new file mode 100755
index 0000000..025ceed
--- /dev/null
+++ b/tamonten/tegra20-medcom-wide/build.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+set -e
+
+cbootimage -t20 tegra20-medcom-wide.cfg tegra20-medcom-wide.img
diff --git a/tamonten/tegra20-medcom-wide/tegra20-medcom-wide.cfg b/tamonten/tegra20-medcom-wide/tegra20-medcom-wide.cfg
new file mode 100644
index 0000000..0976a13
--- /dev/null
+++ b/tamonten/tegra20-medcom-wide/tegra20-medcom-wide.cfg
@@ -0,0 +1,22 @@
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+Version       = 0x00020001;
+Bctcopy       = 1;
+Bctfile       = ../Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct;
+BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tamonten/tegra20-plutux/build.sh b/tamonten/tegra20-plutux/build.sh
new file mode 100755
index 0000000..e1ce9a7
--- /dev/null
+++ b/tamonten/tegra20-plutux/build.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+set -e
+
+cbootimage -t20 tegra20-plutux.cfg tegra20-plutux.img
diff --git a/tamonten/tegra20-plutux/tegra20-plutux.cfg b/tamonten/tegra20-plutux/tegra20-plutux.cfg
new file mode 100644
index 0000000..0976a13
--- /dev/null
+++ b/tamonten/tegra20-plutux/tegra20-plutux.cfg
@@ -0,0 +1,22 @@
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+Version       = 0x00020001;
+Bctcopy       = 1;
+Bctfile       = ../Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct;
+BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
diff --git a/tamonten/tegra20-tec/build.sh b/tamonten/tegra20-tec/build.sh
new file mode 100755
index 0000000..a523b46
--- /dev/null
+++ b/tamonten/tegra20-tec/build.sh
@@ -0,0 +1,23 @@
+#!/bin/sh
+
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+set -e
+
+cbootimage -t20 tegra20-tec.cfg tegra20-tec.img
diff --git a/tamonten/tegra20-tec/tegra20-tec.cfg b/tamonten/tegra20-tec/tegra20-tec.cfg
new file mode 100644
index 0000000..0976a13
--- /dev/null
+++ b/tamonten/tegra20-tec/tegra20-tec.cfg
@@ -0,0 +1,22 @@
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damages
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose,
+# including commercial applications, and to alter it and redistribute it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must not
+#    claim that you wrote the original software. If you use this software
+#    in a product, an acknowledgment in the product documentation would be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distribution.
+
+Version       = 0x00020001;
+Bctcopy       = 1;
+Bctfile       = ../Tamonten_T2_512MB_MEM2G16D2D-ABG-25_366MHz.bct;
+BootLoader    = u-boot.bin,0x00108000,0x00108000,Complete;
-- 
1.8.2
