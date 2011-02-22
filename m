From: Colin Cross <ccross@android.com>
Subject: [PATCH 6/7] ARM: tegra: common: Enable core clocks
Date: Mon, 21 Feb 2011 18:39:51 -0800
Message-ID: <1298342392-21236-7-git-send-email-ccross@android.com>
References: <1298342392-21236-1-git-send-email-ccross@android.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Return-path: <linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org>
In-Reply-To: <1298342392-21236-1-git-send-email-ccross@android.com>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
	<mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: linux-arm-kernel-bounces@lists.infradead.org
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=m.gmane.org@lists.infradead.org
To: linux-tegra@vger.kernel.org
Cc: Russell King <linux@arm.linux.org.uk>, konkers@android.com, mike@compulab.co.il, linux-kernel@vger.kernel.org, Colin Cross <ccross@android.com>, olof@lixom.net, linux-arm-kernel@lists.infradead.org
List-Id: linux-tegra@vger.kernel.org

Enable the cpu, emc (memory controller) and csite (debug and
trace controller) clocks during init to prevent them from
being disabled by the bootloader clock disabling code.

Signed-off-by: Colin Cross <ccross@android.com>
---
 arch/arm/mach-tegra/common.c |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)

diff --git a/arch/arm/mach-tegra/common.c b/arch/arm/mach-tegra/common.c
index 14fa533..516e100 100644
--- a/arch/arm/mach-tegra/common.c
+++ b/arch/arm/mach-tegra/common.c
@@ -56,6 +56,9 @@ static __initdata struct tegra_clk_init_table common_clk_init_table[] = {
 	{ "sclk",	"pll_p_out4",	108000000,	true },
 	{ "hclk",	"sclk",		108000000,	true },
 	{ "pclk",	"hclk",		54000000,	true },
+	{ "csite",	NULL,		0,		true },
+	{ "emc",	NULL,		0,		true },
+	{ "cpu",	NULL,		0,		true },
 	{ NULL,		NULL,		0,		0},
 };
 
-- 
1.7.3.1
