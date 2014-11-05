From: Allen Martin <amartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: boot regression with AHCI on jetson-tk1
Date: Tue, 4 Nov 2014 21:34:14 -0800
Message-ID: <20141105053414.GA24124@nvidia.com>
References: <1411724593-4037-1-git-send-email-cyndis@kapsi.fi>
 <1411724593-4037-3-git-send-email-cyndis@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1411724593-4037-3-git-send-email-cyndis-/1wQRMveznE@public.gmane.org>
Content-Disposition: inline
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

I tried booting 3.18-rc3 on jetson-tk1 and I'm seeing a hang during
boot right before user space normally comes up.  I bisected the
regression back to this commit which just turns on AHCI.  I don't have
any SATA device connected to the board.


commit 91816a7fe5a671b826d5288ed7b42e92117a8fe8
Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Date:   Wed Jul 16 11:54:23 2014 +0300

    ARM: tegra: Add options for Tegra AHCI support to tegra_defconfig
    
    This adds ATA, SATA_AHCI and AHCI_TEGRA support to tegra_defconfig
    so that the SATA support will be automatically enabled.
    
    Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
    Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

diff --git a/arch/arm/configs/tegra_defconfig
b/arch/arm/configs/tegra_defconfig
index 285c433..2b8be48 100644
--- a/arch/arm/configs/tegra_defconfig
+++ b/arch/arm/configs/tegra_defconfig
@@ -102,6 +102,9 @@ CONFIG_BLK_DEV_SD=y
 CONFIG_BLK_DEV_SR=y
 CONFIG_SCSI_MULTI_LUN=y
 # CONFIG_SCSI_LOWLEVEL is not set
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_AHCI_TEGRA=y
 CONFIG_NETDEVICES=y
 CONFIG_DUMMY=y
 CONFIG_IGB=y



Here's where it hangs, always at the same place:

...
[    2.370671] +1.35V_LP0(sd2): supplied by +5V_SYS
[    2.375732] +1.35V_LP0(sd3): 1350 mV 
[    2.379522] +1.35V_LP0(sd3): supplied by +5V_SYS
[    2.384551] +1.05V_RUN: 1050 mV 
[    2.387918] +1.05V_RUN: supplied by +5V_SYS
[    2.392482] +1.8V_VDDIO: 1800 mV 
[    2.395944] +1.8V_VDDIO: supplied by +5V_SYS
[    2.401498] +VDD_GPU_AP: 650 <--> 1200 mV at 1000 mV 3500 mA 
[    2.407734] +1.05V_RUN_AVDD: 1050 mV at 300 mA 
[    2.412400] +1.05V_RUN_AVDD: supplied by +1.35V_LP0(sd2)
[    2.418329] +1.8V_RUN_CAM: 1800 mV at 150 mA 
[    2.422838] +1.8V_RUN_CAM: supplied by +3.3V_RUN
[    2.428665] +1.2V_GEN_AVDD: 1200 mV at 150 mA 
[    2.433268] +1.2V_GEN_AVDD: supplied by +1.8V_VDDIO
[    2.439489] +1.05V_LP0_VDD_RTC: 1000 mV at 150 mA 
[    2.444426] +1.05V_LP0_VDD_RTC: supplied by +3.3V_SYS
[    2.450185] +2.8V_RUN_CAM: 2800 mV at 150 mA 
[    2.454711] +2.8V_RUN_CAM: supplied by +3.3V_SYS
[    2.460022] +1.2V_RUN_CAM_FRONT: 1200 mV at 150 mA 
[    2.465079] +1.2V_RUN_CAM_FRONT: supplied by +1.8V_VDDIO
[    2.470958] +VDDIO_SDMMC3: 1800 <--> 3300 mV at 150 mA 
[    2.476354] +VDDIO_SDMMC3: supplied by +3.3V_RUN
[    2.481675] +1.05V_RUN_CAM_REAR: 1050 mV at 150 mA 
[    2.486721] +1.05V_RUN_CAM_REAR: supplied by +1.8V_VDDIO
[    2.492904] +3.3V_RUN_TOUCH: 2800 mV at 150 mA 
[    2.497608] +3.3V_RUN_TOUCH: supplied by +5V_SYS
[    2.502933] +2.8V_RUN_CAM_AF: 2800 mV at 150 mA 
[    2.507724] +2.8V_RUN_CAM_AF: supplied by +5V_SYS
[    2.513126] +1.8V_RUN_VPP_FUSE: 1800 mV at 150 mA 
[    2.518101] +1.8V_RUN_VPP_FUSE: supplied by +3.3V_RUN
*hang*
