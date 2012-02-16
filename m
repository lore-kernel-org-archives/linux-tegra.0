From: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Subject: [PATCH v3 27/28] tegra: Mark board init files for ARMv4t
Date: Thu, 16 Feb 2012 06:49:14 -0800
Message-ID: <1329403755-6396-28-git-send-email-sjg@chromium.org>
References: <1329403755-6396-1-git-send-email-sjg@chromium.org>
Mime-Version: 1.0
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1329403755-6396-1-git-send-email-sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: U-Boot Mailing List <u-boot-0aAXYlwwYIKGBzrmiIFOJg@public.gmane.org>
Cc: Wolfgang Denk <wd-ynQEQJNshbs@public.gmane.org>, Albert ARIBAUD <albert.u.boot-LhW3hqR2+23R7s880joybQ@public.gmane.org>, Graeme Russ <graeme.russ-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org>, Mike Frysinger <vapier-aBrp7R+bbdUdnm+yROfE0A@public.gmane.org>, Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Tom Warren <twarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Since Tegra executes early code on an ARMv4T (but the rest on ARMv7)
we must mark the new board init files for compilation with ARMv4t
architecture.

Signed-off-by: Simon Glass <sjg-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
---

 arch/arm/cpu/armv7/tegra2/config.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/arch/arm/cpu/armv7/tegra2/config.mk b/arch/arm/cpu/armv7/tegra2/config.mk
index 2303dba..4b43dde 100644
--- a/arch/arm/cpu/armv7/tegra2/config.mk
+++ b/arch/arm/cpu/armv7/tegra2/config.mk
@@ -28,6 +28,8 @@
 # file with compatible flags
 ifdef CONFIG_TEGRA2
 CFLAGS_arch/arm/lib/board.o += -march=armv4t
+CFLAGS_common/board_f.o += -march=armv4t
+CFLAGS_lib/initcall.o += -march=armv4t
 endif
 
 USE_PRIVATE_LIBGCC = yes
-- 
1.7.7.3
