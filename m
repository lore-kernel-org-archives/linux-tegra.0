From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 28/28] tegra: Enable generic board for Seaboard.
Date: Thu, 16 Feb 2012 06:49:15 -0800
Message-ID: <1329403755-6396-29-git-send-email-sjg@chromium.org>
References: <1329403755-6396-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329403755-6396-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Graeme Russ <graeme.russ-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Enable CONFIG_SYS_GENERIC_BOARD for Tegra 2 Seaboard.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---
Changes in v2:
- Add CONFIG_SYS_GENERIC_BOARD to allow board to select generic board
- Add PowerPC support
- Change generic board to an opt-in system on a per-board basic
- Rebase to master

Changes in v3:
- Rebase on top of x86/master (which has not yet been pulled to master)
- Rebase to master

 include/configs/seaboard.h |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/include/configs/seaboard.h b/include/configs/seaboard.h
index 261f952..11d9e8d 100644
--- a/include/configs/seaboard.h
+++ b/include/configs/seaboard.h
@@ -27,6 +27,8 @@
 #include <asm/sizes.h>
 #include "tegra2-common.h"
 
+#define CONFIG_SYS_GENERIC_BOARD
+
 /* High-level configuration options */
 #define TEGRA2_SYSMEM		"mem=384M@0M nvmem=128M@384M mem=512M@512M"
 #define V_PROMPT		"Tegra2 (SeaBoard) # "
-- 
1.7.7.3
