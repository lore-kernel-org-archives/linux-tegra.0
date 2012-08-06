From: Prashant Gaikwad <pgaikwad@nvidia.com>
Subject: [PATCH v4 3/6] ARM: tegra: Rename tegra20 clock file
Date: Mon, 6 Aug 2012 11:57:41 +0530
Message-ID: <1344234464-23901-4-git-send-email-pgaikwad@nvidia.com>
References: <1344234464-23901-1-git-send-email-pgaikwad@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1344234464-23901-1-git-send-email-pgaikwad@nvidia.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: swarren@wwwdotorg.org
Cc: Prashant Gaikwad <pgaikwad@nvidia.com>, pdeschrijver@nvidia.com, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ccross@android.com, olof@lixom.net, linux-arm-kernel@lists.infradead.org, mturquette@ti.com
List-Id: linux-tegra@vger.kernel.org

Make the name consistent with other files.
s/tegra2/tegra20

Signed-off-by: Prashant Gaikwad <pgaikwad@nvidia.com>
---
 arch/arm/mach-tegra/Makefile                       |    2 +-
 .../{tegra2_clocks.c => tegra20_clocks.c}          |    0
 2 files changed, 1 insertions(+), 1 deletions(-)
 rename arch/arm/mach-tegra/{tegra2_clocks.c => tegra20_clocks.c} (100%)

diff --git a/arch/arm/mach-tegra/Makefile b/arch/arm/mach-tegra/Makefile
index 655fcfc..f07f994 100644
--- a/arch/arm/mach-tegra/Makefile
+++ b/arch/arm/mach-tegra/Makefile
@@ -12,7 +12,7 @@ obj-y					+= powergate.o
 obj-y					+= apbio.o
 obj-$(CONFIG_CPU_IDLE)			+= cpuidle.o
 obj-$(CONFIG_CPU_IDLE)			+= sleep.o
-obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra2_clocks.o
+obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra20_clocks.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)         += tegra20_clocks_data.o
 obj-$(CONFIG_ARCH_TEGRA_2x_SOC)		+= tegra2_emc.o
 obj-$(CONFIG_ARCH_TEGRA_3x_SOC)		+= tegra30_clocks.o
diff --git a/arch/arm/mach-tegra/tegra2_clocks.c b/arch/arm/mach-tegra/tegra20_clocks.c
similarity index 100%
rename from arch/arm/mach-tegra/tegra2_clocks.c
rename to arch/arm/mach-tegra/tegra20_clocks.c
-- 
1.7.4.1
