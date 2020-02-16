From: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
Subject: [PATCH] firmware: tegra: Fix a typo in Kconfig
Date: Sun, 16 Feb 2020 17:17:48 +0100
Message-ID: <20200216161748.21894-1-christophe.jaillet@wanadoo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: thierry.reding-Re5JQEeQqe8AvxtiuMwx3w@public.gmane.org, jonathanh-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org, tglx-hfZtesqFncYOwBW4kG4KsQ@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, kernel-janitors-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

A 'n' is mising in 'commuication'

Signed-off-by: Christophe JAILLET <christophe.jaillet-39ZsbGIQGT5GWvitb5QawA@public.gmane.org>
---
 drivers/firmware/tegra/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/tegra/Kconfig b/drivers/firmware/tegra/Kconfig
index a887731f50d6..1c8ba1f47c7c 100644
--- a/drivers/firmware/tegra/Kconfig
+++ b/drivers/firmware/tegra/Kconfig
@@ -7,7 +7,7 @@ config TEGRA_IVC
 	help
 	  IVC (Inter-VM Communication) protocol is part of the IPC
 	  (Inter Processor Communication) framework on Tegra. It maintains the
-	  data and the different commuication channels in SysRAM or RAM and
+	  data and the different communication channels in SysRAM or RAM and
 	  keeps the content is synchronization between host CPU and remote
 	  processors.
 
-- 
2.20.1
