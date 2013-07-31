From: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: [PATCH 1/6] usb: host: add has_tdi_phy_lpm capability bit
Date: Wed, 31 Jul 2013 20:41:57 +0300
Message-ID: <1375292522-7855-2-git-send-email-ttynkkynen@nvidia.com>
References: <1375292522-7855-1-git-send-email-ttynkkynen@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain
Return-path: <linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <1375292522-7855-1-git-send-email-ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Sender: linux-usb-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: balbi-l0cyMroinI0@public.gmane.org
Cc: linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-kernel-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, linux-usb-u79uwXL29TY76Z2rM5mHXA@public.gmane.org, swarren-3lzwWm7+Weoh9ZMKESR00Q@public.gmane.org, gregkh-hQyY1W1yCW8ekmWlsbkhG0B+6BGkLq7r@public.gmane.org, stern-nwvwT67g6+6dFdvTe/nMLpVzexx5G7lz@public.gmane.org, Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>, Alexander Shishkin <alexander.shishkin-VuQAYsv1563Yd54FQh9/CA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

The has_hostpc capability bit indicates that the host controller has the
HOSTPC register extensions, but at the same time enables clock disabling
power saving features with the PHY Low Power Clock Disable (PHCD) bit.

However, some host controllers have the HOSTPC extensions but don't
support the low-power feature, so the PHCD bit must not be set on those
controllers. Add a separate capability bit for the low-power feature
instead, and change all existing users of has_hostpc to use this new
capability bit.

The idea for this commit is taken from an old 2012 commit that never got
merged ("disociate chipidea PHY low power suspend control from hostpc")

Inspired-by: Matthieu CASTET <matthieu.castet-ITF29qwbsa/QT0dZR+AlfA@public.gmane.org>
Signed-off-by: Tuomas Tynkkynen <ttynkkynen-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
---
 drivers/usb/chipidea/host.c |  1 +
 drivers/usb/host/ehci-hub.c | 14 +++++++-------
 drivers/usb/host/ehci.h     |  1 +
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/chipidea/host.c b/drivers/usb/chipidea/host.c
index 40d0fda..9b3aaf1 100644
--- a/drivers/usb/chipidea/host.c
+++ b/drivers/usb/chipidea/host.c
@@ -63,6 +63,7 @@ static int host_start(struct ci_hdrc *ci)
 	ehci = hcd_to_ehci(hcd);
 	ehci->caps = ci->hw_bank.cap;
 	ehci->has_hostpc = ci->hw_bank.lpm;
+	ehci->has_tdi_phy_lpm = ci->hw_bank.lpm;
 
 	ret = usb_add_hcd(hcd, 0, 0);
 	if (ret)
diff --git a/drivers/usb/host/ehci-hub.c b/drivers/usb/host/ehci-hub.c
index 2b70277..8044a74 100644
--- a/drivers/usb/host/ehci-hub.c
+++ b/drivers/usb/host/ehci-hub.c
@@ -183,7 +183,7 @@ static void ehci_adjust_port_wakeup_flags(struct ehci_hcd *ehci,
 	spin_lock_irq(&ehci->lock);
 
 	/* clear phy low-power mode before changing wakeup flags */
-	if (ehci->has_hostpc) {
+	if (ehci->has_tdi_phy_lpm) {
 		port = HCS_N_PORTS(ehci->hcs_params);
 		while (port--) {
 			u32 __iomem	*hostpc_reg = &ehci->regs->hostpc[port];
@@ -217,7 +217,7 @@ static void ehci_adjust_port_wakeup_flags(struct ehci_hcd *ehci,
 	}
 
 	/* enter phy low-power mode again */
-	if (ehci->has_hostpc) {
+	if (ehci->has_tdi_phy_lpm) {
 		port = HCS_N_PORTS(ehci->hcs_params);
 		while (port--) {
 			u32 __iomem	*hostpc_reg = &ehci->regs->hostpc[port];
@@ -309,7 +309,7 @@ static int ehci_bus_suspend (struct usb_hcd *hcd)
 		}
 	}
 
-	if (changed && ehci->has_hostpc) {
+	if (changed && ehci->has_tdi_phy_lpm) {
 		spin_unlock_irq(&ehci->lock);
 		msleep(5);	/* 5 ms for HCD to enter low-power mode */
 		spin_lock_irq(&ehci->lock);
@@ -435,7 +435,7 @@ static int ehci_bus_resume (struct usb_hcd *hcd)
 		goto shutdown;
 
 	/* clear phy low-power mode before resume */
-	if (ehci->bus_suspended && ehci->has_hostpc) {
+	if (ehci->bus_suspended && ehci->has_tdi_phy_lpm) {
 		i = HCS_N_PORTS(ehci->hcs_params);
 		while (i--) {
 			if (test_bit(i, &ehci->bus_suspended)) {
@@ -788,7 +788,7 @@ static int ehci_hub_control (
 				goto error;
 
 			/* clear phy low-power mode before resume */
-			if (ehci->has_hostpc) {
+			if (ehci->has_tdi_phy_lpm) {
 				temp1 = ehci_readl(ehci, hostpc_reg);
 				ehci_writel(ehci, temp1 & ~HOSTPC_PHCD,
 						hostpc_reg);
@@ -1031,12 +1031,12 @@ static int ehci_hub_control (
 
 			/* After above check the port must be connected.
 			 * Set appropriate bit thus could put phy into low power
-			 * mode if we have hostpc feature
+			 * mode if we have tdi_phy_lpm feature
 			 */
 			temp &= ~PORT_WKCONN_E;
 			temp |= PORT_WKDISC_E | PORT_WKOC_E;
 			ehci_writel(ehci, temp | PORT_SUSPEND, status_reg);
-			if (ehci->has_hostpc) {
+			if (ehci->has_tdi_phy_lpm) {
 				spin_unlock_irqrestore(&ehci->lock, flags);
 				msleep(5);/* 5ms for HCD enter low pwr mode */
 				spin_lock_irqsave(&ehci->lock, flags);
diff --git a/drivers/usb/host/ehci.h b/drivers/usb/host/ehci.h
index 64f9a08..d034d94 100644
--- a/drivers/usb/host/ehci.h
+++ b/drivers/usb/host/ehci.h
@@ -210,6 +210,7 @@ struct ehci_hcd {			/* one per controller */
 	#define OHCI_HCCTRL_LEN         0x4
 	__hc32			*ohci_hcctrl_reg;
 	unsigned		has_hostpc:1;
+	unsigned		has_tdi_phy_lpm:1;
 	unsigned		has_ppcd:1; /* support per-port change bits */
 	u8			sbrn;		/* packed release number */
 
-- 
1.8.1.5

--
To unsubscribe from this list: send the line "unsubscribe linux-usb" in
the body of a message to majordomo-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
