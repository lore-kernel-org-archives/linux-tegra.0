From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [pinmux scripts PATCH 1/5] Remove stale FIXME in board-to-uboot.py
Date: Wed, 25 Mar 2015 12:06:13 -0600
Message-ID: <1427306777-17669-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

The FIXME has already been fixed!

Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
This series mainly adds support for configuring the MIPI pad control
registers, along with a few fixes/cleanups first. I'll enhance the
Jetson TK1 board file to actually include MIPI pad control settings
as soon as I've cleared up one other change in the latest spreadsheet.
---
 board-to-uboot.py | 1 -
 1 file changed, 1 deletion(-)

diff --git a/board-to-uboot.py b/board-to-uboot.py
index f47f6f6c47b3..f337b6371955 100755
--- a/board-to-uboot.py
+++ b/board-to-uboot.py
@@ -41,7 +41,6 @@ board = tegra_pmx_board_parser.load_board(args.board)
 
 copyright_year = datetime.date.today().year
 
-# FIXME: Need to make rcv_sel parameter to PINCFG() macro below optional
 print('''\
 /*
  * Copyright (c) %(copyright_year)d, NVIDIA CORPORATION. All rights reserved.
-- 
1.9.1
