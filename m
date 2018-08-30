From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] soc/tegra: pmc: Make readx_poll_timeout atomic
Date: Thu, 30 Aug 2018 21:36:35 +0300
Message-ID: <20180830183635.4474-2-digetx@gmail.com>
References: <20180830183635.4474-1-digetx@gmail.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180830183635.4474-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

This fixes splat like the one below if CONFIG_DEBUG_ATOMIC_SLEEP=y on
Tegra30.

 BUG: sleeping function called from invalid context at drivers/soc/tegra/pmc.c:301
 in_atomic(): 1, irqs_disabled(): 0, pid: 1, name: swapper/0
 CPU: 0 PID: 1 Comm: swapper/0 Not tainted 4.18.0-next-20180821-00176-g7a0f73ae4245 #824
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 [<c01134f4>] (unwind_backtrace) from [<c010db2c>] (show_stack+0x20/0x24)
 [<c010db2c>] (show_stack) from [<c0bd0f3c>] (dump_stack+0x94/0xa8)
 [<c0bd0f3c>] (dump_stack) from [<c0151df8>] (___might_sleep+0x13c/0x174)
 [<c0151df8>] (___might_sleep) from [<c0151ea0>] (__might_sleep+0x70/0xa8)
 [<c0151ea0>] (__might_sleep) from [<c0588264>] (tegra_powergate_set+0xb0/0x1e8)
 [<c0588264>] (tegra_powergate_set) from [<c05899f4>] (tegra_pmc_cpu_power_on+0x44/0x50)
 [<c05899f4>] (tegra_pmc_cpu_power_on) from [<c0122554>] (tegra_boot_secondary+0x20c/0x288)
 [<c0122554>] (tegra_boot_secondary) from [<c011051c>] (__cpu_up+0xb8/0x14c)
 [<c011051c>] (__cpu_up) from [<c01282a0>] (bringup_cpu+0x30/0xfc)
 [<c01282a0>] (bringup_cpu) from [<c01276bc>] (cpuhp_invoke_callback+0xd0/0x98c)
 [<c01276bc>] (cpuhp_invoke_callback) from [<c0128b3c>] (_cpu_up+0xe0/0x1c0)
 [<c0128b3c>] (_cpu_up) from [<c0128e04>] (do_cpu_up+0x70/0xa4)
 [<c0128e04>] (do_cpu_up) from [<c0128e54>] (cpu_up+0x1c/0x20)
 [<c0128e54>] (cpu_up) from [<c12112e0>] (smp_init+0xb0/0x100)
 [<c12112e0>] (smp_init) from [<c12010d0>] (kernel_init_freeable+0x16c/0x398)
 [<c12010d0>] (kernel_init_freeable) from [<c0be76e4>] (kernel_init+0x18/0x124)
 [<c0be76e4>] (kernel_init) from [<c01010f0>] (ret_from_fork+0x14/0x24)

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/soc/tegra/pmc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/tegra/pmc.c b/drivers/soc/tegra/pmc.c
index d6bc9f66f1cd..2d5d4b0c211a 100644
--- a/drivers/soc/tegra/pmc.c
+++ b/drivers/soc/tegra/pmc.c
@@ -297,8 +297,8 @@ static int tegra_powergate_set(unsigned int id, bool new_state)
 
 	tegra_pmc_writel(PWRGATE_TOGGLE_START | id, PWRGATE_TOGGLE);
 
-	err = readx_poll_timeout(tegra_powergate_state, id, status,
-				 status == new_state, 10, 100000);
+	err = readx_poll_timeout_atomic(tegra_powergate_state, id, status,
+					status == new_state, 10, 100000);
 
 	spin_unlock(&pmc->powergates_lock);
 
-- 
2.18.0
