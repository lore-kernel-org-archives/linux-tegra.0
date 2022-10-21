Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 413B1C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230018AbiJUImW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJUImV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 04:42:21 -0400
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26C48246C3B
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 01:42:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BAELCMO9PBig0+JxhlG1keUM5c8x1dFEeWkzkcIZjLUMR/3VxSN/T1v3Jg1smSsvxflM9bx5TRq4Z7uB3fiz+nuaRhn6F1XfRY5TqdxNc4uI4NfEcOSDhx+EgpXcSCdGjxSvznbL3rVtCjo5IaLJ/0kXbOMuaRzqFVpouiGyOyxTYDw8yjDFI0ZxRAYO+sOxkSYgJEEM0ro9u8kMp777HJQ37J7I7+e62EAABHTyf5yUqK3yWIG5BVil24J9rgawXQwGU9KN2yrHwSl7mI7u9FYbY13A1gAnXwzkCTkZk3tezQHsoq7msKeD6gpsXLHM6OM+2UI1CsnLOpBCs3CMTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fj8WcPMVr+uAUP+be3D2ZSJEO5oSnNt8kyvJDANVEuk=;
 b=Gcj4uL+tph+cMqqR7lcjI709jKXJ/KVO/TXDucghAXHrEK5NmEypCdNlYhBKgMYzwrVIqfYw3ZbcOP7aUWEQhPVVQW/TX+Iwyzm/lPlXpGSENF80SOYJ0sVFrkaoAE+WXaQJYle92qCB5wsYxQohY2CFZSNPcBQaMeFL4lnUhiXYxoeSEQFOSqCQbFzyoH/+JMsJCaFmkQ/e7WO1obj61XTMvT/u4ECfT7KRsxZzOrAvmIW1co4KOWHPt/1ixUjJGykN+tc7LyPIJpwT3JP/U4A1w1Z+jfVPZjbVGRNoHxx6ihHClLwisl498jg4xZQ07IXN7uw04yT8E+hfbsiZuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fj8WcPMVr+uAUP+be3D2ZSJEO5oSnNt8kyvJDANVEuk=;
 b=fS7bfjCaFmjYKqISjlLPaoa7+noX+cnPhLmQtQyYdUq6gcd7+NAzObwULwht78aiJsskrO7A6vLlVQ3jUUE0qm8b+ZemSGMUcWUGB8GgHhMC+j0BkZzLCBfTESSurI2nu1w4xDiDUQlgo0yZ936l/uvfJKr1osmkZGvRJCOV0KQ125yGY8ILXlAm9RTqz95wcydYFFxyIXtnms/OSx/kKQjegen4Wxu18YJALfQW6NJz5nXBAVw/a7FFBAForQABr0HTW70Bv91R5f74JFhBD43oRfg+jNgCPlHkAKwIwQtwO1bM9PO14+eDLxT1/rzBiUqgWvzjIh+50Qoa/Akdmw==
Received: from BN0PR04CA0099.namprd04.prod.outlook.com (2603:10b6:408:ec::14)
 by MN0PR12MB6319.namprd12.prod.outlook.com (2603:10b6:208:3c0::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35; Fri, 21 Oct
 2022 08:42:18 +0000
Received: from BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ec:cafe::52) by BN0PR04CA0099.outlook.office365.com
 (2603:10b6:408:ec::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 08:42:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT087.mail.protection.outlook.com (10.13.177.24) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:42:18 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 21 Oct
 2022 01:42:07 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 01:42:07 -0700
Received: from jilin-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 21 Oct 2022 01:42:06 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <jilin@nvidia.com>
Subject: [PATCH v5 3/3] xhci: tegra: USB2 pad power controls
Date:   Fri, 21 Oct 2022 16:41:59 +0800
Message-ID: <20221021084159.13954-4-jilin@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021084159.13954-1-jilin@nvidia.com>
References: <20221021084159.13954-1-jilin@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT087:EE_|MN0PR12MB6319:EE_
X-MS-Office365-Filtering-Correlation-Id: 570695a7-23d8-42ad-d0ce-08dab34029a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Gqjy+qoyYg48MC8Zt6dmwenVnh0HbCK75GHk7+VoDnmHXyphtnVQVQug/1nkkvSrBMz+ijtJG11GZZCSZzHeB7ceLlSHXL/GYUhBgvZ32lfkWS/r7INDg+NzL2MlXE9Lv3UFEKDAmRPcNmkuV5Cf9XwGplW1XWAL9U91Y2+elBOIS4A6Zxd5nFbBRam0v5zuYWKM3KlaKeFgyocHF+ES4MBa+bMXgknHF8CW9KwXmvjtFl4/ke7faYv2Y2q5NG/RpxFZYJmf4AzAoo0dT7Rkb8WgFqCRLXRJV2RpzcQ3sLQMOdyK8OuwZa5EAWIwiDF1WyoKPPsGx4UsEKGQKhaBJpdLHg+f6Nwf2jFOy/TzxiTSjczruwf1azRkxCsnOBDfi37pqNxXo23HP7JTiYQqqB1KZtinolcvZXG7uRVjc5adFqCNYIMpGrKnrCc+jebQFAHpJ4BPtQEFGNmPsO/Q1tJ6naWh3DfBNeF03zJ4UMFdrtJvs4nNUyGrHWIwtRk2RWwy5tUAy6ISQY7CrpxpksyaO2kqgB2x8HNf8QfKT3fVb81CMJirxC8+2xR2EdZqK3c40Ospx6IsYQI6UcIAPox+WQjlCsEpTRWus9LjgqtctPzdM+AnlBrTnnwzkmUq9E2/qKM5i0B7QS8eQwk1kwxg2cnUBrGp8nvbDa2FrkbuuDsgrLcqvWAsiMCJHoZZb4EsXMsfmOHe5b4hKWfmVTArVaFdGZJbrmYPoKFnD7l/2oW/L9VM2OREUNs3U2eEzr6pBDyYiguz23bfIDIHnA==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(346002)(396003)(376002)(136003)(451199015)(36840700001)(46966006)(40470700004)(86362001)(478600001)(82310400005)(54906003)(110136005)(7636003)(316002)(356005)(6666004)(5660300002)(82740400003)(70586007)(107886003)(41300700001)(8676002)(4326008)(70206006)(2906002)(26005)(83380400001)(47076005)(426003)(40460700003)(336012)(1076003)(8936002)(186003)(36860700001)(2616005)(7696005)(40480700001)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:42:18.2326
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 570695a7-23d8-42ad-d0ce-08dab34029a5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT087.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6319
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Program USB2 pad PD controls during port connect/disconnect, port
suspend/resume, and test mode, to reduce power consumption on
disconnect or suspend.

Signed-off-by: Jim Lin <jilin@nvidia.com>

---
v2: Fix issue that wrong tegra->phys[] may be accessed on tegra124
v3: No change on copyright
v4: Remove hcd_to_tegra_xusb() function which is used only once.
v5: Update .hub_control in tegra_xhci_overrides (xhci-tegra.c)
    Invoke xhci_hub_control() directly (xhci-tegra.c)

 drivers/usb/host/xhci-tegra.c | 131 +++++++++++++++++++++++++++++++++-
 1 file changed, 130 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index c8af2cd2216d..f685bb7459ba 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -189,6 +189,13 @@ struct tegra_xusb_context_soc {
 	} fpci;
 };
 
+enum tegra_xhci_phy_type {
+	USB3_PHY,
+	USB2_PHY,
+	HSIC_PHY,
+	MAX_PHY_TYPES,
+};
+
 struct tegra_xusb_soc {
 	const char *firmware;
 	const char * const *supply_names;
@@ -274,6 +281,7 @@ struct tegra_xusb {
 
 	bool suspended;
 	struct tegra_xusb_context context;
+	u32 enable_utmi_pad_after_lp0_exit;
 };
 
 static struct hc_driver __read_mostly tegra_xhci_hc_driver;
@@ -1949,12 +1957,30 @@ static void tegra_xhci_enable_phy_sleepwalk_wake(struct tegra_xusb *tegra)
 static void tegra_xhci_disable_phy_wake(struct tegra_xusb *tegra)
 {
 	struct tegra_xusb_padctl *padctl = tegra->padctl;
-	unsigned int i;
+	unsigned int i, j;
 
 	for (i = 0; i < tegra->num_phys; i++) {
 		if (!tegra->phys[i])
 			continue;
+		if (tegra_xusb_padctl_remote_wake_detected(padctl, tegra->phys[i])) {
+			if (i < tegra->soc->phy_types[USB3_PHY].num) {
+				/* USB3 */
+				j = i;
+			} else if (i < (tegra->soc->phy_types[USB3_PHY].num +
+					tegra->soc->phy_types[USB2_PHY].num)) {
+				/* USB2 */
+				j = i - tegra->soc->phy_types[USB3_PHY].num;
+				tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
+			} else {
+				/* HSIC */
+				j = i - (tegra->soc->phy_types[USB3_PHY].num +
+					 tegra->soc->phy_types[USB2_PHY].num);
+			}
+			dev_dbg(tegra->dev,
+				"%s port %u (0 based) remote wake detected\n",
+				dev_name(&tegra->phys[i]->dev), j);
 
+		}
 		tegra_xusb_padctl_disable_phy_wake(padctl, tegra->phys[i]);
 	}
 }
@@ -1972,6 +1998,23 @@ static void tegra_xhci_disable_phy_sleepwalk(struct tegra_xusb *tegra)
 	}
 }
 
+static void tegra_xhci_program_utmi_power_lp0_exit(struct tegra_xusb *tegra)
+{
+	unsigned int i;
+
+	for (i = 0; i < tegra->soc->phy_types[USB2_PHY].num; i++) {
+		if (!is_host_mode_phy(tegra, USB2_PHY, i))
+			continue;
+		/* USB2 */
+		if (tegra->enable_utmi_pad_after_lp0_exit & BIT(i))
+			tegra_phy_xusb_utmi_pad_power_on(
+				tegra->phys[tegra->soc->phy_types[USB3_PHY].num + i]);
+		else
+			tegra_phy_xusb_utmi_pad_power_down(
+				tegra->phys[tegra->soc->phy_types[USB3_PHY].num + i]);
+	}
+}
+
 static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 {
 	struct xhci_hcd *xhci = hcd_to_xhci(tegra->hcd);
@@ -1980,6 +2023,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 	unsigned int i;
 	int err;
 	u32 usbcmd;
+	u32 portsc;
 
 	dev_dbg(dev, "entering ELPG\n");
 
@@ -1993,6 +2037,15 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool runtime)
 		goto out;
 	}
 
+	for (i = 0; i < tegra->soc->phy_types[USB2_PHY].num; i++) {
+		if (!xhci->usb2_rhub.ports[i])
+			continue;
+		portsc = readl(xhci->usb2_rhub.ports[i]->addr);
+		tegra->enable_utmi_pad_after_lp0_exit &= ~BIT(i);
+		if (((portsc & PORT_PLS_MASK) == XDEV_U3) || ((portsc & DEV_SPEED_MASK) == XDEV_FS))
+			tegra->enable_utmi_pad_after_lp0_exit |= BIT(i);
+	}
+
 	err = xhci_suspend(xhci, wakeup);
 	if (err < 0) {
 		dev_err(tegra->dev, "failed to suspend XHCI: %d\n", err);
@@ -2066,6 +2119,8 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool runtime)
 
 		phy_power_on(tegra->phys[i]);
 	}
+	if (tegra->suspended)
+		tegra_xhci_program_utmi_power_lp0_exit(tegra);
 
 	tegra_xusb_config(tegra);
 	tegra_xusb_restore_context(tegra);
@@ -2437,8 +2492,82 @@ static int tegra_xhci_setup(struct usb_hcd *hcd)
 	return xhci_gen_setup(hcd, tegra_xhci_quirks);
 }
 
+static int tegra_xhci_hub_control(struct usb_hcd *hcd, u16 type_req, u16 value, u16 index,
+				  char *buf, u16 length)
+{
+	struct tegra_xusb *tegra = dev_get_drvdata(hcd->self.controller);
+	struct xhci_hcd *xhci = hcd_to_xhci(hcd);
+	struct xhci_hub *rhub;
+	struct xhci_bus_state *bus_state;
+	int port = (index & 0xff) - 1;
+	int i;
+	struct xhci_port **ports;
+	u32 portsc;
+	int ret;
+
+	rhub = &xhci->usb2_rhub;
+	bus_state = &rhub->bus_state;
+	if (bus_state->resuming_ports && hcd->speed == HCD_USB2) {
+		ports = rhub->ports;
+		i = rhub->num_ports;
+		while (i--) {
+			if (!test_bit(i, &bus_state->resuming_ports))
+				continue;
+			portsc = readl(ports[i]->addr);
+			if ((portsc & PORT_PLS_MASK) == XDEV_RESUME)
+				tegra_phy_xusb_utmi_pad_power_on(
+					tegra->phys[tegra->soc->phy_types[USB3_PHY].num + i]);
+		}
+	}
+
+	if (hcd->speed == HCD_USB2) {
+		i = tegra->soc->phy_types[USB3_PHY].num + port;
+		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_SUSPEND)) {
+			if (!index || index > rhub->num_ports)
+				return -EPIPE;
+			tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
+		}
+		if ((type_req == SetPortFeature) && (value == USB_PORT_FEAT_RESET)) {
+			if (!index || index > rhub->num_ports)
+				return -EPIPE;
+			ports = rhub->ports;
+			portsc = readl(ports[port]->addr);
+			if (portsc & PORT_CONNECT)
+				tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
+		}
+	}
+
+	ret = xhci_hub_control(hcd, type_req, value, index, buf, length);
+	if (ret < 0)
+		return ret;
+
+	if (hcd->speed == HCD_USB2) {
+		if ((type_req == SetPortFeature) && (value == USB_PORT_FEAT_SUSPEND))
+			/* We don't suspend the PAD while HNP role swap happens on the OTG port */
+			if (!((hcd->self.otg_port == (port + 1)) && hcd->self.b_hnp_enable))
+				tegra_phy_xusb_utmi_pad_power_down(tegra->phys[i]);
+
+		if ((type_req == ClearPortFeature) && (value == USB_PORT_FEAT_C_CONNECTION)) {
+			ports = rhub->ports;
+			portsc = readl(ports[port]->addr);
+			if (!(portsc & PORT_CONNECT)) {
+				/* We don't suspend the PAD while HNP role swap happens on the OTG
+				 * port
+				 */
+				if (!((hcd->self.otg_port == (port + 1)) && hcd->self.b_hnp_enable))
+					tegra_phy_xusb_utmi_pad_power_down(tegra->phys[i]);
+			}
+		}
+		if ((type_req == SetPortFeature) && (value == USB_PORT_FEAT_TEST))
+			tegra_phy_xusb_utmi_pad_power_on(tegra->phys[i]);
+	}
+
+	return ret;
+}
+
 static const struct xhci_driver_overrides tegra_xhci_overrides __initconst = {
 	.reset = tegra_xhci_setup,
+	.hub_control = tegra_xhci_hub_control,
 };
 
 static int __init tegra_xusb_init(void)
-- 
2.17.1

