From: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
Subject: [PATCH] fix drivers/staging/nvec linkage error when keyboard is disabled
Date: Sat, 8 Oct 2011 19:29:14 +0200
Message-ID: <20112.34922.209107.730268@pilspetsen.it.uu.se>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
Cc: linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
List-Id: linux-tegra@vger.kernel.org

Building linux-3.1-rc9 for the Tegra ARM SoC with CONFIG_MFD_NVEC=y
and CONFIG_KEYBOARD_NVEC=n results in the following linkage error:

drivers/built-in.o: In function `tegra_nvec_probe':
/tmp/linux-3.1-rc9/drivers/staging/nvec/nvec.c:373: undefined reference to `nvec_kbd_init'
make: *** [.tmp_vmlinux1] Error 1

Fixed by #ifdef:ing the call to nvec_kbd_init(), similar to the
existing #ifdef CONFIG_SERIO_NVEC_PS2 around the nvec_ps2() call.

Signed-off-by: Mikael Pettersson <mikpe-1zs4UD6AkMk@public.gmane.org>
---

--- linux-3.1-rc9/drivers/staging/nvec/nvec.c.~1~	2011-10-08 16:28:20.000000000 +0200
+++ linux-3.1-rc9/drivers/staging/nvec/nvec.c	2011-10-08 19:09:18.000000000 +0200
@@ -370,7 +370,9 @@ static int __devinit tegra_nvec_probe(st
 	nvec_write_async(nvec, EC_ENABLE_EVENT_REPORTING,
 				sizeof(EC_ENABLE_EVENT_REPORTING));
 
+#ifdef CONFIG_KEYBOARD_NVEC
 	nvec_kbd_init(nvec);
+#endif
 #ifdef CONFIG_SERIO_NVEC_PS2
 	nvec_ps2(nvec);
 #endif
