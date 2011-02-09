From: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Subject: [PATCH 2/4] usb: host: ehci-hcd: Add controller_resets_phy quirk
Date: Tue,  8 Feb 2011 21:22:05 -0800
Message-ID: <1297228927-23497-3-git-send-email-benoit@android.com>
References: <1297228927-23497-1-git-send-email-benoit@android.com>
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1297228927-23497-1-git-send-email-benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: David Brownell <dbrownell-Rn4VEauK+AKRv+LV9MX5uipxlwaOVQ5f@public.gmane.org>, Greg Kroah-Hartman <gregkh-l3A5Bk7waGM@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Robert Morell <rmorell-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Cc: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Erik Gilling <konkers-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>

Tegra quirk: Resetting the controller has the side effect of resetting
the PHY. Only reset the controller when doing so won't also reset the
phy.

Signed-off-by: Gary King <gking-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Signed-off-by: Benoit Goby <benoit-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>
---
 drivers/usb/host/ehci-hcd.c |    3 ++-
 drivers/usb/host/ehci.h     |    1 +
 2 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index 30515d3..7afa345 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -275,7 +275,8 @@ static int ehci_reset (struct ehci_hcd *ehci)
 
 	command |= CMD_RESET;
 	dbg_cmd (ehci, "reset", command);
-	ehci_writel(ehci, command, &ehci->regs->command);
+	if (!ehci->controller_resets_phy)
+		ehci_writel(ehci, command, &ehci->regs->command);
 	ehci_to_hcd(ehci)->state = HC_STATE_HALT;
 	ehci->next_statechange = jiffies;
 	retval = handshake (ehci, &ehci->regs->command,
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index f86d3fa..8854491 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -134,6 +134,7 @@ struct ehci_hcd {			/* one per controller */
 	unsigned		amd_pll_fix:1;
 	unsigned		fs_i_thresh:1;	/* Intel iso scheduling */
 	unsigned		use_dummy_qh:1;	/* AMD Frame List table quirk*/
+	unsigned		controller_resets_phy:1; /* Tegra quirk */
 
 	/* required for usb32 quirk */
 	#define OHCI_CTRL_HCFS          (3 << 6)
-- 
1.7.3.1

--
To unsubscribe from this list: send the line "unsubscribe linux-tegra" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
