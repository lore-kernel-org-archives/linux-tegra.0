From: Prateek Patel <prpatel@nvidia.com>
Subject: [PATCH] of: reserved_mem: disable kmemleak scan on removed memory blocks
Date: Fri, 9 Nov 2018 12:39:49 +0530
Message-ID: <1541747389-28544-1-git-send-email-prpatel@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: robh+dt@kernel.org, frowand.list@gmail.com
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, talho@nvidia.com, swarren@nvidia.com, prpatel@nvidia.com, vdumpa@nvidia.com, snikam@nvidia.com, Sri Krishna chowdary <schowdary@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

From: Sri Krishna chowdary <schowdary@nvidia.com>

Memory reserved with "nomap" DT property in of_reserved_mem.c
removes the memory block. The removed memory blocks don't have
VA to PA mapping created in kernel page table. Kmemleak scan on
removed memory blocks is causing page faults and leading to
kernel panic. So, Disable kmemleak scan on the removed memory
blocks.

Following is the observed crash log:
[  154.846370] Unable to handle kernel paging request at virtual address ffffffc070a00000
<1>[  154.846576] Mem abort info:
<1>[  154.846635]   Exception class = DABT (current EL), IL = 32 bits
<1>[  154.846737]   SET = 0, FnV = 0
<1>[  154.846796]   EA = 0, S1PTW = 0
<1>[  154.846859] Data abort info:
<1>[  154.846913]   ISV = 0, ISS = 0x00000006
<1>[  154.846983]   CM = 0, WnR = 0
<1>[  154.847053] swapper pgtable: 4k pages, 39-bit VAs, pgd = ffffff8009df7000
<1>[  154.847228] [ffffffc070a00000] *pgd=000000087fff5803, *pud=000000087fff5803, *pmd=0000000000000000
<0>[  154.847408] Internal error: Oops: 96000006 [#1] PREEMPT SMP
<4>[  154.847511] Modules linked in: nvs_led_test nvs_bmi160 nvs_cm3218 nvs_bh1730fvc nvi_bmpX80 nvi_ak89xx nvi_mpu cdc_acm uas lr388k7_ts imx268 imx318 imx204 imx274 imx185 lc898212 ov23850 ov10823 ov9281 ov5693 tc358840 pca9570 nvs snd_soc_tegra_machine_driver_mobile lp855x_bl spidev input_cfboost pwm_tegra tegra_cryptodev tegra_se_nvhost tegra_se_elp tegra_se ghash_ce sha2_ce sha1_ce aes_ce_ccm cryptd nvgpu cpufreq_userspace snd_soc_tegra186_alt_dspk snd_soc_tegra186_alt_asrc snd_soc_tegra186_alt_arad snd_soc_tegra210_alt_ope snd_soc_tegra210_alt_mvc snd_soc_tegra210_alt_dmic snd_soc_tegra210_alt_amx snd_soc_tegra210_alt_adx snd_soc_tegra210_alt_afc snd_soc_tegra210_alt_mixer snd_soc_tegra210_alt_i2s snd_soc_tegra210_alt_sfc snd_soc_tegra210_alt_adsp snd_soc_tegra210_alt_admaif snd_soc_
 tegra210_alt_xbar
<4>[  154.882606]  snd_soc_tegra_alt_utils snd_hda_tegra
<4>[  154.888133] CPU: 2 PID: 8079 Comm: sh Not tainted 4.14.53-tegra-05132-g9c33465 #2
<4>[  154.895983] Hardware name: e3360_1099 (DT)
<4>[  154.900447] task: ffffffc7d62dda00 task.stack: ffffff800e2b0000
<4>[  154.906502] PC is at scan_block+0x7c/0x148
<4>[  154.911234] LR is at scan_block+0x78/0x148
<4>[  154.915689] pc : [<ffffff8008271724>] lr : [<ffffff8008271720>] pstate: 804000c9
<4>[  154.923290] sp : ffffff800e2b3b80
<4>[  154.927228] x29: ffffff800e2b3b80 x28: ffffffc7d62dda00
<4>[  154.932999] x27: ffffff8009aaa000 x26: ffffffc070c00000
<4>[  154.938769] x25: 00000000000000c0 x24: ffffff8009d90608
<4>[  154.944287] x23: ffffffc7dc6c6000 x22: ffffff8009d90000
<4>[  154.950320] x21: ffffff8009aeb320 x20: ffffffc070a00ff9
<4>[  154.955919] x19: ffffffc070a00000 x18: 00000000bec4c3f2
<4>[  154.961438] x17: 0000002224777924 x16: ffffff80080bb0e0
<4>[  154.967124] x15: 0000000000000000 x14: 0000000000000f75
<4>[  154.973069] x13: 000fffffffffffff x12: ffffffbf1e9f4240
<4>[  154.978670] x11: 0000000000000040 x10: 0000000000000ad0
<4>[  154.984107] x9 : ffffff800e2b3ab0 x8 : ffffffc7d62de530
<4>[  154.989958] x7 : 0000000780000000 x6 : 0000000000000018
<4>[  154.995645] x5 : 0000000000000000 x4 : 0000000000000000
<4>[  155.001245] x3 : ffffff8009aaa000 x2 : 00000047f6712000
<4>[  155.006846] x1 : ffffffc7d1ae6900 x0 : 0000000000000000

Signed-off-by: Sri Krishna chowdary <schowdary@nvidia.com>
Signed-off-by: Prateek <prpatel@nvidia.com>
---
 drivers/of/of_reserved_mem.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/of/of_reserved_mem.c b/drivers/of/of_reserved_mem.c
index 1977ee0..ac8f377 100644
--- a/drivers/of/of_reserved_mem.c
+++ b/drivers/of/of_reserved_mem.c
@@ -21,6 +21,7 @@
 #include <linux/sort.h>
 #include <linux/slab.h>
 #include <linux/memblock.h>
+#include <linux/kmemleak.h>
 
 #define MAX_RESERVED_REGIONS	32
 static struct reserved_mem reserved_mem[MAX_RESERVED_REGIONS];
@@ -50,8 +51,10 @@ int __init __weak early_init_dt_alloc_reserved_memory_arch(phys_addr_t size,
 	}
 
 	*res_base = base;
-	if (nomap)
+	if (nomap) {
+		kmemleak_no_scan(__va(base));
 		return memblock_remove(base, size);
+	}
 	return 0;
 }
 
-- 
2.1.4
