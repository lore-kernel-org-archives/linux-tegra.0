From: Paul Bolle <pebolle@tiscali.nl>
Subject: [PATCH] ARM: tegra: remove TEGRA_EMC_SCALING_ENABLE
Date: Sun, 06 Apr 2014 12:19:13 +0200
Message-ID: <1396779553.30640.16.camel@x220>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: Russell King <linux@arm.linux.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Commit a7cbe92cef27 ("ARM: tegra: remove tegra EMC scaling driver")
removed the only user of TEGRA_EMC_SCALING_ENABLE. Remove its Kconfig
entry too.

Signed-off-by: Paul Bolle <pebolle@tiscali.nl>
---
 arch/arm/mach-tegra/Kconfig | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/mach-tegra/Kconfig b/arch/arm/mach-tegra/Kconfig
index 92d660f9610f..55b305d51669 100644
--- a/arch/arm/mach-tegra/Kconfig
+++ b/arch/arm/mach-tegra/Kconfig
@@ -70,7 +70,4 @@ config TEGRA_AHB
 	  which controls AHB bus master arbitration and some
 	  performance parameters(priority, prefech size).
 
-config TEGRA_EMC_SCALING_ENABLE
-	bool "Enable scaling the memory frequency"
-
 endmenu
-- 
1.9.0
