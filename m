From: Dmitry Osipenko <digetx@gmail.com>
Subject: [PATCH v1 2/2] ARM: tegra: Use WFE for power-gating on Tegra30
Date: Mon,  8 Jul 2019 02:03:58 +0300
Message-ID: <20190707230358.10672-3-digetx@gmail.com>
References: <20190707230358.10672-1-digetx@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20190707230358.10672-1-digetx@gmail.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Peter De Schrijver <pdeschrijver@nvidia.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-tegra@vger.kernel.org

Turned out that WFI doesn't work reliably on Tegra30 as a trigger for
the power-gating, it causes CPU hang under some circumstances like having
memory controller running of PLLP. The TRM doc states that WFI should be
used for the Big-Little "Cluster Switch", while WFE for the power-gating.
Hence let's use the WFE for CPU0 power-gating, like it is done for the
power-gating of a secondary cores. This fixes CPU hang after entering LP2
with memory running off PLLP.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 arch/arm/mach-tegra/sleep-tegra30.S |  4 +++-
 drivers/soc/tegra/flowctrl.c        | 19 +++++++++++++++++--
 2 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-tegra/sleep-tegra30.S b/arch/arm/mach-tegra/sleep-tegra30.S
index e95e46d65e8c..2e42f2bc0630 100644
--- a/arch/arm/mach-tegra/sleep-tegra30.S
+++ b/arch/arm/mach-tegra/sleep-tegra30.S
@@ -683,10 +683,12 @@ tegra30_enter_sleep:
 	dsb
 	ldr	r0, [r6, r2] /* memory barrier */
 
+	cmp	r10, #TEGRA30
 halted:
 	isb
 	dsb
-	wfi	/* CPU should be power gated here */
+	wfine	/* CPU should be power gated here */
+	wfeeq
 
 	/* !!!FIXME!!! Implement halt failure handler */
 	b	halted
diff --git a/drivers/soc/tegra/flowctrl.c b/drivers/soc/tegra/flowctrl.c
index b6bdeef33db1..b62ff4c1b997 100644
--- a/drivers/soc/tegra/flowctrl.c
+++ b/drivers/soc/tegra/flowctrl.c
@@ -91,8 +91,23 @@ void flowctrl_cpu_suspend_enter(unsigned int cpuid)
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFE_BITMAP;
 		/* clear wfi bitmap */
 		reg &= ~TEGRA30_FLOW_CTRL_CSR_WFI_BITMAP;
-		/* pwr gating on wfi */
-		reg |= TEGRA30_FLOW_CTRL_CSR_WFI_CPU0 << cpuid;
+
+		if (tegra_get_chip_id() == TEGRA30) {
+			/*
+			 * The wfi doesn't work well on Tegra30 because
+			 * CPU hangs under some odd circumstances after
+			 * power-gating (like memory running off PLLP),
+			 * hence use wfe that is working perfectly well.
+			 * Note that Tegra30 TRM doc clearly stands that
+			 * wfi should be used for "Cluster Switching",
+			 * while wfe for the power-gating just like it is
+			 * done on Tegra20.
+			 */
+			reg |= TEGRA20_FLOW_CTRL_CSR_WFE_CPU0 << cpuid;
+		} else {
+			/* pwr gating on wfi */
+			reg |= TEGRA30_FLOW_CTRL_CSR_WFI_CPU0 << cpuid;
+		}
 		break;
 	}
 	reg |= FLOW_CTRL_CSR_INTR_FLAG;			/* clear intr flag */
-- 
2.22.0
