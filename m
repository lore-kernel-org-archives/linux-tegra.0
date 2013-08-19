From: Soeren Grunewald <soeren.grunewald-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Subject: [PATCH] =?UTF-8?q?Add=20the=20Tamonten=E2=84=A2=20NG=20Evaluation?= =?UTF-8?q?=20Carrier=20board?=
Date: Mon, 19 Aug 2013 12:05:57 +0200
Message-ID: <1376906757-28185-2-git-send-email-soeren.grunewald@avionic-design.de>
References: <1376906757-28185-1-git-send-email-soeren.grunewald@avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1376906757-28185-1-git-send-email-soeren.grunewald-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

=46rom: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>

Add the build script to create bootable image for the Tamonten=E2=84=A2=
 NG
Evaluation Carrier board using the Tamonten=E2=84=A2 NG COM module.

Change-Id: I0a72de713fd322f679439ea1b9205d238f9265ef
Signed-off-by: Alban Bedel <alban.bedel-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
---
 ..._Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg | 240 +++++++++++++=
++++++++
 tegra30/avionic-design/tamonten-ng/tegra30.img.cfg |  22 ++
 tegra30/avionic-design/tec-ng/build.sh             |  27 +++
 3 files changed, 289 insertions(+)
 create mode 100644 tegra30/avionic-design/tamonten-ng/TamontenNG_Nanya=
_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
 create mode 100644 tegra30/avionic-design/tamonten-ng/tegra30.img.cfg
 create mode 100755 tegra30/avionic-design/tec-ng/build.sh

diff --git a/tegra30/avionic-design/tamonten-ng/TamontenNG_Nanya_1GB_NT=
5CC256M16CP-DI_750MHz_emmc.bct.cfg b/tegra30/avionic-design/tamonten-ng=
/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct.cfg
new file mode 100644
index 0000000..277a433
--- /dev/null
+++ b/tegra30/avionic-design/tamonten-ng/TamontenNG_Nanya_1GB_NT5CC256M=
16CP-DI_750MHz_emmc.bct.cfg
@@ -0,0 +1,240 @@
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damage=
s
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose=
,
+# including commercial applications, and to alter it and redistribute =
it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must =
not
+#    claim that you wrote the original software. If you use this softw=
are
+#    in a product, an acknowledgment in the product documentation woul=
d be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must =
not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distrib=
ution.
+
+Version       =3D 0x00030001;
+BlockSize     =3D 0x00004000;
+PageSize      =3D 0x00000200;
+PartitionSize =3D 0x02000000;
+OdmData       =3D 0x400c0000;
+
+DevType[0] =3D NvBootDevType_Sdmmc;
+DeviceParam[0].SdmmcParams.ClockDivider           =3D 0x00000009;
+DeviceParam[0].SdmmcParams.DataWidth              =3D NvBootSdmmcDataW=
idth_8Bit;
+DeviceParam[0].SdmmcParams.MaxPowerClassSupported =3D 0x00000000;
+DeviceParam[0].SdmmcParams.SdController           =3D 0x00000000;
+
+DevType[1] =3D NvBootDevType_Sdmmc;
+DeviceParam[1].SdmmcParams.ClockDivider           =3D 0x00000009;
+DeviceParam[1].SdmmcParams.DataWidth              =3D NvBootSdmmcDataW=
idth_8Bit;
+DeviceParam[1].SdmmcParams.MaxPowerClassSupported =3D 0x00000000;
+DeviceParam[1].SdmmcParams.SdController           =3D 0x00000000;
+
+DevType[2] =3D NvBootDevType_Sdmmc;
+DeviceParam[2].SdmmcParams.ClockDivider           =3D 0x00000009;
+DeviceParam[2].SdmmcParams.DataWidth              =3D NvBootSdmmcDataW=
idth_8Bit;
+DeviceParam[2].SdmmcParams.MaxPowerClassSupported =3D 0x00000000;
+DeviceParam[2].SdmmcParams.SdController           =3D 0x00000000;
+
+DevType[3] =3D NvBootDevType_Sdmmc;
+DeviceParam[3].SdmmcParams.ClockDivider           =3D 0x00000009;
+DeviceParam[3].SdmmcParams.DataWidth              =3D NvBootSdmmcDataW=
idth_8Bit;
+DeviceParam[3].SdmmcParams.MaxPowerClassSupported =3D 0x00000000;
+DeviceParam[3].SdmmcParams.SdController           =3D 0x00000000;
+
+SDRAM[0].MemoryType                               =3D NvBootMemoryType=
_Ddr3;
+SDRAM[0].PllMChargePumpSetupControl               =3D 0x00000008;
+SDRAM[0].PllMLoopFilterSetupControl               =3D 0x00000000;
+SDRAM[0].PllMInputDivider                         =3D 0x0000000c;
+SDRAM[0].PllMFeedbackDivider                      =3D 0x000002ee;
+SDRAM[0].PllMPostDivider                          =3D 0x00000000;
+SDRAM[0].PllMStableTime                           =3D 0x0000012c;
+SDRAM[0].EmcClockDivider                          =3D 0x00000000;
+SDRAM[0].EmcClockSource                           =3D 0x00000000;
+SDRAM[0].EmcClockUsePllMUD                        =3D 0x00000001;
+SDRAM[0].EmcAutoCalInterval                       =3D 0x001fffff;
+SDRAM[0].EmcAutoCalConfig                         =3D 0xa0f10000;
+SDRAM[0].EmcAutoCalWait                           =3D 0x00000064;
+SDRAM[0].EmcAdrCfg                                =3D 0x00000000;
+SDRAM[0].EmcPinProgramWait                        =3D 0x00000001;
+SDRAM[0].EmcPinExtraWait                          =3D 0x00000000;
+SDRAM[0].EmcTimingControlWait                     =3D 0x00000000;
+SDRAM[0].EmcRc                                    =3D 0x00000023;
+SDRAM[0].EmcRfc                                   =3D 0x00000094;
+SDRAM[0].EmcRas                                   =3D 0x00000019;
+SDRAM[0].EmcRp                                    =3D 0x00000009;
+SDRAM[0].EmcR2w                                   =3D 0x00000005;
+SDRAM[0].EmcW2r                                   =3D 0x0000000d;
+SDRAM[0].EmcR2p                                   =3D 0x00000004;
+SDRAM[0].EmcW2p                                   =3D 0x00000013;
+SDRAM[0].EmcRdRcd                                 =3D 0x00000009;
+SDRAM[0].EmcWrRcd                                 =3D 0x00000009;
+SDRAM[0].EmcRrd                                   =3D 0x00000004;
+SDRAM[0].EmcRext                                  =3D 0x00000001;
+SDRAM[0].EmcWext                                  =3D 0x00000000;
+SDRAM[0].EmcWdv                                   =3D 0x00000007;
+SDRAM[0].EmcQUse                                  =3D 0x0000000c;
+SDRAM[0].EmcQRst                                  =3D 0x00000009;
+SDRAM[0].EmcQSafe                                 =3D 0x0000000a;
+SDRAM[0].EmcRdv                                   =3D 0x00000012;
+SDRAM[0].EmcCtt                                   =3D 0x00000000;
+SDRAM[0].EmcCttDuration                           =3D 0x00000000;
+SDRAM[0].EmcRefresh                               =3D 0x0000169a;
+SDRAM[0].EmcBurstRefreshNum                       =3D 0x00000000;
+SDRAM[0].EmcPreRefreshReqCnt                      =3D 0x000005a6;
+SDRAM[0].EmcPdEx2Wr                               =3D 0x00000003;
+SDRAM[0].EmcPdEx2Rd                               =3D 0x00000010;
+SDRAM[0].EmcPChg2Pden                             =3D 0x00000001;
+SDRAM[0].EmcAct2Pden                              =3D 0x00000000;
+SDRAM[0].EmcAr2Pden                               =3D 0x0000000e;
+SDRAM[0].EmcRw2Pden                               =3D 0x00000018;
+SDRAM[0].EmcTxsr                                  =3D 0x0000009e;
+SDRAM[0].EmcTxsrDll                               =3D 0x00000200;
+SDRAM[0].EmcTcke                                  =3D 0x00000005;
+SDRAM[0].EmcTfaw                                  =3D 0x0000001e;
+SDRAM[0].EmcTrpab                                 =3D 0x00000000;
+SDRAM[0].EmcTClkStable                            =3D 0x00000007;
+SDRAM[0].EmcTClkStop                              =3D 0x00000008;
+SDRAM[0].EmcTRefBw                                =3D 0x000016da;
+SDRAM[0].EmcQUseExtra                             =3D 0x00000000;
+SDRAM[0].EmcFbioCfg5                              =3D 0x00005088;
+SDRAM[0].EmcFbioCfg6                              =3D 0x00000004;
+SDRAM[0].EmcFbioSpare                             =3D 0xd8000000;
+SDRAM[0].EmcCfgRsv                                =3D 0xff00ff49;
+SDRAM[0].EmcMrs                                   =3D 0x80000d71;
+SDRAM[0].EmcEmrs                                  =3D 0x80100002;
+SDRAM[0].EmcMrw1                                  =3D 0x00000000;
+SDRAM[0].EmcMrw2                                  =3D 0x00000000;
+SDRAM[0].EmcMrw3                                  =3D 0x00000000;
+SDRAM[0].EmcMrwExtra                              =3D 0x00000000;
+SDRAM[0].EmcWarmBootMrw1                          =3D 0x00000000;
+SDRAM[0].EmcWarmBootMrw2                          =3D 0x00000000;
+SDRAM[0].EmcWarmBootMrw3                          =3D 0x00000000;
+SDRAM[0].EmcWarmBootMrwExtra                      =3D 0x00000000;
+SDRAM[0].EmcWarmBootExtraModeRegWriteEnable       =3D 0x00000000;
+SDRAM[0].EmcExtraModeRegWriteEnable               =3D 0x00000000;
+SDRAM[0].EmcMrwResetCommand                       =3D 0x00000000;
+SDRAM[0].EmcMrwResetNInitWait                     =3D 0x00000000;
+SDRAM[0].EmcMrsWaitCnt                            =3D 0x012a000c;
+SDRAM[0].EmcCfg                                   =3D 0x23e00000;
+SDRAM[0].EmcCfg2                                  =3D 0x000c0099;
+SDRAM[0].EmcDbg                                   =3D 0x01000400;
+SDRAM[0].EmcCmdQ                                  =3D 0x10004408;
+SDRAM[0].EmcMc2EmcQ                               =3D 0x06000404;
+SDRAM[0].EmcDynSelfRefControl                     =3D 0x80002d93;
+SDRAM[0].AhbArbitrationXbarCtrlMemInitDone        =3D 0x00000001;
+SDRAM[0].EmcCfgDigDll                             =3D 0xf0080191;
+SDRAM[0].EmcCfgDigDllPeriod                       =3D 0x00008000;
+SDRAM[0].EmcDevSelect                             =3D 0x00000002;
+SDRAM[0].EmcSelDpdCtrl                            =3D 0x0004032c;
+SDRAM[0].EmcDllXformDqs0                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs1                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs2                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs3                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs4                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs5                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs6                          =3D 0x00000008;
+SDRAM[0].EmcDllXformDqs7                          =3D 0x00000008;
+SDRAM[0].EmcDllXformQUse0                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse1                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse2                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse3                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse4                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse5                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse6                         =3D 0x00000000;
+SDRAM[0].EmcDllXformQUse7                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs0                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs1                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs2                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs3                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs4                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs5                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs6                         =3D 0x00000000;
+SDRAM[0].EmcDliTrimTxDqs7                         =3D 0x00000000;
+SDRAM[0].EmcDllXformDq0                           =3D 0x0000000c;
+SDRAM[0].EmcDllXformDq1                           =3D 0x0000000c;
+SDRAM[0].EmcDllXformDq2                           =3D 0x0000000c;
+SDRAM[0].EmcDllXformDq3                           =3D 0x0000000c;
+SDRAM[0].WarmBootWait                             =3D 0x00000002;
+SDRAM[0].EmcCttTermCtrl                           =3D 0x00000802;
+SDRAM[0].EmcOdtWrite                              =3D 0x00000000;
+SDRAM[0].EmcOdtRead                               =3D 0x00000000;
+SDRAM[0].EmcZcalInterval                          =3D 0x00020000;
+SDRAM[0].EmcZcalWaitCnt                           =3D 0x00000040;
+SDRAM[0].EmcZcalMrwCmd                            =3D 0x80000000;
+SDRAM[0].EmcMrsResetDll                           =3D 0x00000000;
+SDRAM[0].EmcZcalInitDev0                          =3D 0x80000011;
+SDRAM[0].EmcZcalInitDev1                          =3D 0x00000000;
+SDRAM[0].EmcZcalInitWait                          =3D 0x00000001;
+SDRAM[0].EmcZcalColdBootEnable                    =3D 0x00000001;
+SDRAM[0].EmcZcalWarmBootEnable                    =3D 0x00000001;
+SDRAM[0].EmcMrwLpddr2ZcalWarmBoot                 =3D 0x000a00ab;
+SDRAM[0].EmcZqCalDdr3WarmBoot                     =3D 0x00000011;
+SDRAM[0].EmcZcalWarmBootWait                      =3D 0x00000001;
+SDRAM[0].EmcMrsWarmBootEnable                     =3D 0x00000001;
+SDRAM[0].EmcMrsResetDllWait                       =3D 0x00000000;
+SDRAM[0].EmcEmrsEmr2                              =3D 0x80200018;
+SDRAM[0].EmcEmrsEmr3                              =3D 0x80300000;
+SDRAM[0].EmcMrsExtra                              =3D 0x80000d71;
+SDRAM[0].EmcWarmBootMrs                           =3D 0x80100002;
+SDRAM[0].EmcWarmBootEmrs                          =3D 0x80000d71;
+SDRAM[0].EmcWarmBootEmr2                          =3D 0x80200018;
+SDRAM[0].EmcWarmBootEmr3                          =3D 0x80300000;
+SDRAM[0].EmcWarmBootMrsExtra                      =3D 0x80100002;
+SDRAM[0].EmcEmrsDdr2DllEnable                     =3D 0x00000000;
+SDRAM[0].EmcMrsDdr2DllReset                       =3D 0x00000000;
+SDRAM[0].EmcEmrsDdr2OcdCalib                      =3D 0x00000000;
+SDRAM[0].EmcDdr2Wait                              =3D 0x00000000;
+SDRAM[0].EmcClkenOverride                         =3D 0x00000000;
+SDRAM[0].EmcExtraRefreshNum                       =3D 0x00000002;
+SDRAM[0].EmcClkenOverrideAllWarmBoot              =3D 0x00000000;
+SDRAM[0].McClkenOverrideAllWarmBoot               =3D 0x00000000;
+SDRAM[0].EmcCfgDigDllPeriodWarmBoot               =3D 0x00000003;
+SDRAM[0].PmcVddpSel                               =3D 0x00000002;
+SDRAM[0].PmcDdrPwr                                =3D 0x00000003;
+SDRAM[0].PmcDdrCfg                                =3D 0x00000002;
+SDRAM[0].PmcIoDpdReq                              =3D 0x80800000;
+SDRAM[0].PmcENoVttGen                             =3D 0x00000000;
+SDRAM[0].PmcNoIoPower                             =3D 0x00000000;
+SDRAM[0].EmcXm2CmdPadCtrl                         =3D 0x000002a0;
+SDRAM[0].EmcXm2CmdPadCtrl2                        =3D 0x770c0000;
+SDRAM[0].EmcXm2DqsPadCtrl                         =3D 0x770c1414;
+SDRAM[0].EmcXm2DqsPadCtrl2                        =3D 0x0800013d;
+SDRAM[0].EmcXm2DqsPadCtrl3                        =3D 0x08000021;
+SDRAM[0].EmcXm2DqPadCtrl                          =3D 0x770c2990;
+SDRAM[0].EmcXm2DqPadCtrl2                         =3D 0x22220000;
+SDRAM[0].EmcXm2ClkPadCtrl                         =3D 0x77fff884;
+SDRAM[0].EmcXm2CompPadCtrl                        =3D 0x01f1f501;
+SDRAM[0].EmcXm2VttGenPadCtrl                      =3D 0x07077404;
+SDRAM[0].EmcXm2VttGenPadCtrl2                     =3D 0x54000000;
+SDRAM[0].EmcXm2QUsePadCtrl                        =3D 0x080001e8;
+SDRAM[0].McEmemAdrCfg                             =3D 0x00000000;
+SDRAM[0].McEmemAdrCfgDev0                         =3D 0x00080303;
+SDRAM[0].McEmemAdrCfgDev1                         =3D 0x00080303;
+SDRAM[0].McEmemCfg                                =3D 0x00000400;
+SDRAM[0].McEmemArbCfg                             =3D 0x0000000b;
+SDRAM[0].McEmemArbOutstandingReq                  =3D 0x80000087;
+SDRAM[0].McEmemArbTimingRcd                       =3D 0x00000004;
+SDRAM[0].McEmemArbTimingRp                        =3D 0x00000005;
+SDRAM[0].McEmemArbTimingRc                        =3D 0x00000012;
+SDRAM[0].McEmemArbTimingRas                       =3D 0x0000000c;
+SDRAM[0].McEmemArbTimingFaw                       =3D 0x0000000e;
+SDRAM[0].McEmemArbTimingRrd                       =3D 0x00000002;
+SDRAM[0].McEmemArbTimingRap2Pre                   =3D 0x00000003;
+SDRAM[0].McEmemArbTimingWap2Pre                   =3D 0x0000000c;
+SDRAM[0].McEmemArbTimingR2R                       =3D 0x00000002;
+SDRAM[0].McEmemArbTimingW2W                       =3D 0x00000002;
+SDRAM[0].McEmemArbTimingR2W                       =3D 0x00000004;
+SDRAM[0].McEmemArbTimingW2R                       =3D 0x00000008;
+SDRAM[0].McEmemArbDaTurns                         =3D 0x08040202;
+SDRAM[0].McEmemArbDaCovers                        =3D 0x00160d12;
+SDRAM[0].McEmemArbMisc0                           =3D 0x710c2213;
+SDRAM[0].McEmemArbMisc1                           =3D 0x78000000;
+SDRAM[0].McEmemArbRing1Throttle                   =3D 0x001f0000;
+SDRAM[0].McEmemArbOverride                        =3D 0x00000080;
+SDRAM[0].McEmemArbRsv                             =3D 0xff00ff00;
+SDRAM[0].McClkenOverride                          =3D 0x00000000;
diff --git a/tegra30/avionic-design/tamonten-ng/tegra30.img.cfg b/tegra=
30/avionic-design/tamonten-ng/tegra30.img.cfg
new file mode 100644
index 0000000..c137519
--- /dev/null
+++ b/tegra30/avionic-design/tamonten-ng/tegra30.img.cfg
@@ -0,0 +1,22 @@
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damage=
s
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose=
,
+# including commercial applications, and to alter it and redistribute =
it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must =
not
+#    claim that you wrote the original software. If you use this softw=
are
+#    in a product, an acknowledgment in the product documentation woul=
d be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must =
not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distrib=
ution.
+
+Version       =3D 0x00020001;
+Bctcopy       =3D 1;
+Bctfile       =3D TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bc=
t;
+BootLoader    =3D u-boot.bin,0x80108000,0x80108000,Complete;
diff --git a/tegra30/avionic-design/tec-ng/build.sh b/tegra30/avionic-d=
esign/tec-ng/build.sh
new file mode 100755
index 0000000..f522c12
--- /dev/null
+++ b/tegra30/avionic-design/tec-ng/build.sh
@@ -0,0 +1,27 @@
+#!/bin/sh
+
+# Copyright (C) 2013 Avionic Design GmbH
+#
+# This software is provided 'as-is', without any express or implied
+# warranty. In no event will the authors be held liable for any damage=
s
+# arising from the use of this software.
+#
+# Permission is granted to anyone to use this software for any purpose=
,
+# including commercial applications, and to alter it and redistribute =
it
+# freely, subject to the following restrictions:
+#
+# 1. The origin of this software must not be misrepresented; you must =
not
+#    claim that you wrote the original software. If you use this softw=
are
+#    in a product, an acknowledgment in the product documentation woul=
d be
+#    appreciated but is not required.
+# 2. Altered source versions must be plainly marked as such, and must =
not be
+#    misrepresented as being the original software.
+# 3. This notice may not be removed or altered from any source distrib=
ution.
+
+set -e
+set -x
+
+cbootimage -t30 -gbct \
+    ../tamonten-ng/TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.b=
ct.cfg \
+    TamontenNG_Nanya_1GB_NT5CC256M16CP-DI_750MHz_emmc.bct
+cbootimage -t30 ../tamonten-ng/tegra30.img.cfg tegra30-tec-ng.img
--=20
1.8.3.1
