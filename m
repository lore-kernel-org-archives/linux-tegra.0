From: Stephen Warren <swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Subject: [PATCH 4/6] USB: EHCI: export symbols for ehci-hcd sub-drivers
Date: Mon,  3 Jun 2013 13:21:28 -0600
Message-ID: <1370287290-21579-5-git-send-email-swarren@wwwdotorg.org>
References: <1370287290-21579-1-git-send-email-swarren@wwwdotorg.org>
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1370287290-21579-1-git-send-email-swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Felipe Balbi <balbi-l0cyMroinI0@public.gmane.org>
Cc: Greg Kroah-Hartman <gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org>, Alan Stern <stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org>, Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Venu Byravarasu <vbyravarasu-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

From: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>

In order to split ehci-hcd.c into separate modules, various symbols must
be exported. Also, rename the symbols to add an ehci_ prefix, to avoid
any naming clashes.

Signed-off-by: Manjunath Goudar <manjunath.goudar-QSEj5FYQhm4dnm+yROfE0A@public.gmane.org>
[swarren, reworked Manjunath's patches to split them more logically]
Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/host/ehci-hcd.c   |   28 +++++++++++++++++-----------
 drivers/usb/host/ehci-hub.c   |    9 +++++----
 drivers/usb/host/ehci-tegra.c |   14 +++++++-------
 drivers/usb/host/ehci.h       |    8 ++++++++
 4 files changed, 37 insertions(+), 22 deletions(-)

diff --git a/drivers/usb/host/ehci-hcd.c b/drivers/usb/host/ehci-hcd.c
index da1c224..75cf500 100644
--- a/drivers/usb/host/ehci-hcd.c
+++ b/drivers/usb/host/ehci-hcd.c
@@ -139,7 +139,7 @@ static inline unsigned ehci_read_frame_index(struct ehci_hcd *ehci)
 /*-------------------------------------------------------------------------*/
 
 /*
- * handshake - spin reading hc until handshake completes or fails
+ * ehci_handshake - spin reading hc until handshake completes or fails
  * @ptr: address of hc register to be read
  * @mask: bits to look at in result of read
  * @done: value of those bits when handshake succeeds
@@ -155,8 +155,8 @@ static inline unsigned ehci_read_frame_index(struct ehci_hcd *ehci)
  * before driver shutdown. But it also seems to be caused by bugs in cardbus
  * bridge shutdown:  shutting down the bridge before the devices using it.
  */
-static int handshake (struct ehci_hcd *ehci, void __iomem *ptr,
-		      u32 mask, u32 done, int usec)
+int ehci_handshake(struct ehci_hcd *ehci, void __iomem *ptr,
+		   u32 mask, u32 done, int usec)
 {
 	u32	result;
 
@@ -172,6 +172,7 @@ static int handshake (struct ehci_hcd *ehci, void __iomem *ptr,
 	} while (usec > 0);
 	return -ETIMEDOUT;
 }
+EXPORT_SYMBOL_GPL(ehci_handshake);
 
 /* check TDI/ARC silicon is in host mode */
 static int tdi_in_host_mode (struct ehci_hcd *ehci)
@@ -186,7 +187,7 @@ static int tdi_in_host_mode (struct ehci_hcd *ehci)
  * Force HC to halt state from unknown (EHCI spec section 2.3).
  * Must be called with interrupts enabled and the lock not held.
  */
-static int ehci_halt (struct ehci_hcd *ehci)
+int ehci_halt(struct ehci_hcd *ehci)
 {
 	u32	temp;
 
@@ -212,12 +213,13 @@ static int ehci_halt (struct ehci_hcd *ehci)
 	spin_unlock_irq(&ehci->lock);
 	synchronize_irq(ehci_to_hcd(ehci)->irq);
 
-	return handshake(ehci, &ehci->regs->status,
+	return ehci_handshake(ehci, &ehci->regs->status,
 			  STS_HALT, STS_HALT, 16 * 125);
 }
+EXPORT_SYMBOL_GPL(ehci_halt);
 
 /* put TDI/ARC silicon into EHCI mode */
-static void tdi_reset (struct ehci_hcd *ehci)
+void ehci_tdi_reset(struct ehci_hcd *ehci)
 {
 	u32		tmp;
 
@@ -231,12 +233,13 @@ static void tdi_reset (struct ehci_hcd *ehci)
 		tmp |= USBMODE_BE;
 	ehci_writel(ehci, tmp, &ehci->regs->usbmode);
 }
+EXPORT_SYMBOL_GPL(ehci_tdi_reset);
 
 /*
  * Reset a non-running (STS_HALT == 1) controller.
  * Must be called with interrupts enabled and the lock not held.
  */
-static int ehci_reset (struct ehci_hcd *ehci)
+int ehci_reset(struct ehci_hcd *ehci)
 {
 	int	retval;
 	u32	command = ehci_readl(ehci, &ehci->regs->command);
@@ -251,7 +254,7 @@ static int ehci_reset (struct ehci_hcd *ehci)
 	ehci_writel(ehci, command, &ehci->regs->command);
 	ehci->rh_state = EHCI_RH_HALTED;
 	ehci->next_statechange = jiffies;
-	retval = handshake (ehci, &ehci->regs->command,
+	retval = ehci_handshake(ehci, &ehci->regs->command,
 			    CMD_RESET, 0, 250 * 1000);
 
 	if (ehci->has_hostpc) {
@@ -263,7 +266,7 @@ static int ehci_reset (struct ehci_hcd *ehci)
 		return retval;
 
 	if (ehci_is_TDI(ehci))
-		tdi_reset (ehci);
+		ehci_tdi_reset(ehci);
 
 	if (ehci->debug)
 		dbgp_external_startup(ehci_to_hcd(ehci));
@@ -272,6 +275,7 @@ static int ehci_reset (struct ehci_hcd *ehci)
 			ehci->resuming_ports = 0;
 	return retval;
 }
+EXPORT_SYMBOL_GPL(ehci_reset);
 
 /*
  * Idle the controller (turn off the schedules).
@@ -286,7 +290,8 @@ static void ehci_quiesce (struct ehci_hcd *ehci)
 
 	/* wait for any schedule enables/disables to take effect */
 	temp = (ehci->command << 10) & (STS_ASS | STS_PSS);
-	handshake(ehci, &ehci->regs->status, STS_ASS | STS_PSS, temp, 16 * 125);
+	ehci_handshake(ehci, &ehci->regs->status, STS_ASS | STS_PSS, temp,
+			16 * 125);
 
 	/* then disable anything that's still active */
 	spin_lock_irq(&ehci->lock);
@@ -295,7 +300,8 @@ static void ehci_quiesce (struct ehci_hcd *ehci)
 	spin_unlock_irq(&ehci->lock);
 
 	/* hardware can take 16 microframes to turn off ... */
-	handshake(ehci, &ehci->regs->status, STS_ASS | STS_PSS, 0, 16 * 125);
+	ehci_handshake(ehci, &ehci->regs->status, STS_ASS | STS_PSS, 0,
+			16 * 125);
 }
 
 /*-------------------------------------------------------------------------*/
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index b2f6450..3be5129 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -33,7 +33,7 @@
 
 #ifdef	CONFIG_PM
 
-static int ehci_hub_control(
+int ehci_hub_control(
 	struct usb_hcd	*hcd,
 	u16		typeReq,
 	u16		wValue,
@@ -712,7 +712,7 @@ ehci_hub_descriptor (
 
 /*-------------------------------------------------------------------------*/
 
-static int ehci_hub_control (
+int ehci_hub_control(
 	struct usb_hcd	*hcd,
 	u16		typeReq,
 	u16		wValue,
@@ -892,7 +892,7 @@ static int ehci_hub_control (
 						PORT_SUSPEND | PORT_RESUME);
 				ehci_writel(ehci, temp, status_reg);
 				clear_bit(wIndex, &ehci->resuming_ports);
-				retval = handshake(ehci, status_reg,
+				retval = ehci_handshake(ehci, status_reg,
 					   PORT_RESUME, 0, 2000 /* 2msec */);
 				if (retval != 0) {
 					ehci_err(ehci,
@@ -918,7 +918,7 @@ static int ehci_hub_control (
 			/* REVISIT:  some hardware needs 550+ usec to clear
 			 * this bit; seems too long to spin routinely...
 			 */
-			retval = handshake(ehci, status_reg,
+			retval = ehci_handshake(ehci, status_reg,
 					PORT_RESET, 0, 1000);
 			if (retval != 0) {
 				ehci_err (ehci, "port %d reset error %d\n",
@@ -1132,6 +1132,7 @@ error_exit:
 	spin_unlock_irqrestore (&ehci->lock, flags);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(ehci_hub_control);
 
 static void ehci_relinquish_port(struct usb_hcd *hcd, int portnum)
 {
diff --git a/drivers/usb/host/ehci-tegra.c b/drivers/usb/host/ehci-tegra.c
index 8390c87..29d4643 100644
--- a/drivers/usb/host/ehci-tegra.c
+++ b/drivers/usb/host/ehci-tegra.c
@@ -179,7 +179,7 @@ static int tegra_ehci_hub_control(
 		 * If a transaction is in progress, there may be a delay in
 		 * suspending the port. Poll until the port is suspended.
 		 */
-		if (handshake(ehci, status_reg, PORT_SUSPEND,
+		if (ehci_handshake(ehci, status_reg, PORT_SUSPEND,
 						PORT_SUSPEND, 5000))
 			pr_err("%s: timeout waiting for SUSPEND\n", __func__);
 
@@ -227,9 +227,9 @@ static int tegra_ehci_hub_control(
 		spin_lock_irqsave(&ehci->lock, flags);
 
 		/* Poll until the controller clears RESUME and SUSPEND */
-		if (handshake(ehci, status_reg, PORT_RESUME, 0, 2000))
+		if (ehci_handshake(ehci, status_reg, PORT_RESUME, 0, 2000))
 			pr_err("%s: timeout waiting for RESUME\n", __func__);
-		if (handshake(ehci, status_reg, PORT_SUSPEND, 0, 2000))
+		if (ehci_handshake(ehci, status_reg, PORT_SUSPEND, 0, 2000))
 			pr_err("%s: timeout waiting for SUSPEND\n", __func__);
 
 		ehci->reset_done[wIndex-1] = 0;
@@ -480,7 +480,7 @@ static int controller_resume(struct device *dev)
 	tegra_ehci_phy_restore_start(hcd->phy, tegra->port_speed);
 
 	/* Enable host mode */
-	tdi_reset(ehci);
+	ehci_tdi_reset(ehci);
 
 	/* Enable Port Power */
 	val = readl(&hw->port_status[0]);
@@ -511,14 +511,14 @@ static int controller_resume(struct device *dev)
 	}
 
 	/* Poll until CCS is enabled */
-	if (handshake(ehci, &hw->port_status[0], PORT_CONNECT,
+	if (ehci_handshake(ehci, &hw->port_status[0], PORT_CONNECT,
 						 PORT_CONNECT, 2000)) {
 		pr_err("%s: timeout waiting for PORT_CONNECT\n", __func__);
 		goto restart;
 	}
 
 	/* Poll until PE is enabled */
-	if (handshake(ehci, &hw->port_status[0], PORT_PE,
+	if (ehci_handshake(ehci, &hw->port_status[0], PORT_PE,
 						 PORT_PE, 2000)) {
 		pr_err("%s: timeout waiting for USB_PORTSC1_PE\n", __func__);
 		goto restart;
@@ -536,7 +536,7 @@ static int controller_resume(struct device *dev)
 		writel(val, &hw->port_status[0]);
 
 		/* Wait until port suspend completes */
-		if (handshake(ehci, &hw->port_status[0], PORT_SUSPEND,
+		if (ehci_handshake(ehci, &hw->port_status[0], PORT_SUSPEND,
 							 PORT_SUSPEND, 1000)) {
 			pr_err("%s: timeout waiting for PORT_SUSPEND\n",
 								__func__);
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 918008a..67606ec7 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -806,6 +806,14 @@ struct ehci_driver_overrides {
 extern void	ehci_init_driver(struct hc_driver *drv,
 				const struct ehci_driver_overrides *over);
 extern int	ehci_setup(struct usb_hcd *hcd);
+extern int	ehci_handshake(struct ehci_hcd *ehci, void __iomem *ptr,
+				u32 mask, u32 done, int usec);
+extern int	ehci_hub_control(struct usb_hcd  *hcd, u16 typeReq,
+				u16 wValue, u16 wIndex, char *buf,
+				u16 wLength);
+extern int	ehci_reset(struct ehci_hcd *ehci);
+extern int	ehci_halt(struct ehci_hcd *ehci);
+extern void	ehci_tdi_reset(struct ehci_hcd *ehci);
 
 #ifdef CONFIG_PM
 extern int	ehci_suspend(struct usb_hcd *hcd, bool do_wakeup);
-- 
1.7.10.4

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
