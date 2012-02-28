From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH] ARM: tegra: match SoC name not board name in DT board files
Date: Mon, 27 Feb 2012 18:26:16 -0700
Message-ID: <1330392376-7884-1-git-send-email-swarren@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

board-dt-tegra*.c should support any board using Tegra when booted using
device tree. Instead of explicitly listing all the supported boards,
which requires a kernel change for each new board, list the supported SoC
model instead.

Note that the board files do currently have explicit support for setting
up each board's pinmux. However, it's fairly likely that at least the
basic devices on any new board will work just fine as set up by the boot-
loader, and the pinmux data should be moving into device tree soon anyway.

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 arch/arm/mach-tegra/board-dt-tegra20.c |    6 +-----
 arch/arm/mach-tegra/board-dt-tegra30.c |    2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/arch/arm/mach-tegra/board-dt-tegra20.c b/arch/arm/mach-tegra/board-dt-tegra20.c
index 6d1dd19..89adbb8 100644
--- a/arch/arm/mach-tegra/board-dt-tegra20.c
+++ b/arch/arm/mach-tegra/board-dt-tegra20.c
@@ -130,11 +130,7 @@ static void __init tegra_dt_init(void)
 }
 
 static const char *tegra20_dt_board_compat[] = {
-	"compulab,trimslice",
-	"nvidia,harmony",
-	"compal,paz00",
-	"nvidia,seaboard",
-	"nvidia,ventana",
+	"nvidia,tegra20",
 	NULL
 };
 
diff --git a/arch/arm/mach-tegra/board-dt-tegra30.c b/arch/arm/mach-tegra/board-dt-tegra30.c
index 1401cf3..fd04757 100644
--- a/arch/arm/mach-tegra/board-dt-tegra30.c
+++ b/arch/arm/mach-tegra/board-dt-tegra30.c
@@ -91,7 +91,7 @@ static void __init tegra30_dt_init(void)
 }
 
 static const char *tegra30_dt_board_compat[] = {
-	"nvidia,cardhu",
+	"nvidia,tegra30",
 	NULL
 };
 
-- 
1.7.0.4
