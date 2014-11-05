From: Allen Martin <AMartin-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: boot regression with AHCI on jetson-tk1
Date: Wed, 5 Nov 2014 19:46:12 +0000
Message-ID: <3cfbab737b604d139e0aabcc33be0a43@HQMAIL103.nvidia.com>
References: <1411724593-4037-1-git-send-email-cyndis@kapsi.fi>
 <1411724593-4037-3-git-send-email-cyndis@kapsi.fi>
 <20141105053414.GA24124@nvidia.com>,<545A6171.6000802@kapsi.fi>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <545A6171.6000802-/1wQRMveznE@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>, Mikko Perttunen <cyndis-/1wQRMveznE@public.gmane.org>
Cc: "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The hang is the following register write in tegra_ahci_controller_init():

        writel(BIT(0), tegra->sata_regs + SCFG_OFFSET + T_SATA0_INDEX);

here are some debug prints I added:

[    2.893245] tegra_ahci_controller_init: SCFG
[    2.897525] tegra->sata_regs: fe020000
[    2.901273] SCFG_OFFSET: 0x1000
[    2.904426] T_SATA0_INDEX: 0x680
[    2.907653] writing 0x1 to fe021680

A hung PIO usually means the IP block is powered off or in reset, but the previous write to SATA_CONFIGURATION_0 goes through ok.

________________________________________
From: Mikko Perttunen <mikko.perttunen-/1wQRMveznE@public.gmane.org>
Sent: Wednesday, November 5, 2014 9:42 AM
To: Allen Martin; Mikko Perttunen
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Subject: Re: boot regression with AHCI on jetson-tk1

This is very strange. Many people have tested this series; I myself boot
my rev.D all the time without SATA connected and I have never
encountered this. I just tested the commit you mentioned and my Jetson
boots up fine with it.

Based on my device's kernel log, the next message indeed should be from
the ATA framework indicating a new detected interface. This would
correspond to line drivers/ata/ahci_tegra.c:357, so the problem should
lie between the lines ahci_tegra.c:299 and ahci_tegra.c:357. Perhaps you
could do some printk bisecting to narrow that down?

Thanks,
Mikko

On 11/05/2014 07:34 AM, Allen Martin wrote:
> I tried booting 3.18-rc3 on jetson-tk1 and I'm seeing a hang during
> boot right before user space normally comes up.  I bisected the
> regression back to this commit which just turns on AHCI.  I don't have
> any SATA device connected to the board.
>
>
> commit 91816a7fe5a671b826d5288ed7b42e92117a8fe8
> Author: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> Date:   Wed Jul 16 11:54:23 2014 +0300
>
>      ARM: tegra: Add options for Tegra AHCI support to tegra_defconfig
>
>      This adds ATA, SATA_AHCI and AHCI_TEGRA support to tegra_defconfig
>      so that the SATA support will be automatically enabled.
>
>      Signed-off-by: Mikko Perttunen <mperttunen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>      Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
>
> diff --git a/arch/arm/configs/tegra_defconfig
> b/arch/arm/configs/tegra_defconfig
> index 285c433..2b8be48 100644
> --- a/arch/arm/configs/tegra_defconfig
> +++ b/arch/arm/configs/tegra_defconfig
> @@ -102,6 +102,9 @@ CONFIG_BLK_DEV_SD=y
>   CONFIG_BLK_DEV_SR=y
>   CONFIG_SCSI_MULTI_LUN=y
>   # CONFIG_SCSI_LOWLEVEL is not set
> +CONFIG_ATA=y
> +CONFIG_SATA_AHCI=y
> +CONFIG_AHCI_TEGRA=y
>   CONFIG_NETDEVICES=y
>   CONFIG_DUMMY=y
>   CONFIG_IGB=y
>
>
>
> Here's where it hangs, always at the same place:
>
> ...
> [    2.370671] +1.35V_LP0(sd2): supplied by +5V_SYS
> [    2.375732] +1.35V_LP0(sd3): 1350 mV
> [    2.379522] +1.35V_LP0(sd3): supplied by +5V_SYS
> [    2.384551] +1.05V_RUN: 1050 mV
> [    2.387918] +1.05V_RUN: supplied by +5V_SYS
> [    2.392482] +1.8V_VDDIO: 1800 mV
> [    2.395944] +1.8V_VDDIO: supplied by +5V_SYS
> [    2.401498] +VDD_GPU_AP: 650 <--> 1200 mV at 1000 mV 3500 mA
> [    2.407734] +1.05V_RUN_AVDD: 1050 mV at 300 mA
> [    2.412400] +1.05V_RUN_AVDD: supplied by +1.35V_LP0(sd2)
> [    2.418329] +1.8V_RUN_CAM: 1800 mV at 150 mA
> [    2.422838] +1.8V_RUN_CAM: supplied by +3.3V_RUN
> [    2.428665] +1.2V_GEN_AVDD: 1200 mV at 150 mA
> [    2.433268] +1.2V_GEN_AVDD: supplied by +1.8V_VDDIO
> [    2.439489] +1.05V_LP0_VDD_RTC: 1000 mV at 150 mA
> [    2.444426] +1.05V_LP0_VDD_RTC: supplied by +3.3V_SYS
> [    2.450185] +2.8V_RUN_CAM: 2800 mV at 150 mA
> [    2.454711] +2.8V_RUN_CAM: supplied by +3.3V_SYS
> [    2.460022] +1.2V_RUN_CAM_FRONT: 1200 mV at 150 mA
> [    2.465079] +1.2V_RUN_CAM_FRONT: supplied by +1.8V_VDDIO
> [    2.470958] +VDDIO_SDMMC3: 1800 <--> 3300 mV at 150 mA
> [    2.476354] +VDDIO_SDMMC3: supplied by +3.3V_RUN
> [    2.481675] +1.05V_RUN_CAM_REAR: 1050 mV at 150 mA
> [    2.486721] +1.05V_RUN_CAM_REAR: supplied by +1.8V_VDDIO
> [    2.492904] +3.3V_RUN_TOUCH: 2800 mV at 150 mA
> [    2.497608] +3.3V_RUN_TOUCH: supplied by +5V_SYS
> [    2.502933] +2.8V_RUN_CAM_AF: 2800 mV at 150 mA
> [    2.507724] +2.8V_RUN_CAM_AF: supplied by +5V_SYS
> [    2.513126] +1.8V_RUN_VPP_FUSE: 1800 mV at 150 mA
> [    2.518101] +1.8V_RUN_VPP_FUSE: supplied by +3.3V_RUN
> *hang*
> --
> To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
> the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
