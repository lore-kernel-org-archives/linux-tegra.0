Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013051.outbound.protection.outlook.com [40.93.196.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4D3388371;
	Tue,  5 May 2026 11:26:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777980417; cv=fail; b=Ttvtr+b2ixFmTG+7chvHLJFDXAgEtNF+hFNiLmliQsSdn1Z5i7PaXVg+fOTCynoPxGuxO/SinOCqxP12jMwJBOqaB7P/RvLMeVFcVZCL5eYQ+6nKHARf2+vS99JkMp3ShNnxAGGzhg3mjGKII2SCAq9i/hRsHPxC35/kDB65zKs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777980417; c=relaxed/simple;
	bh=+DQS9sGsna191CcOM6Eei6PJGvVA8PrNWn+rfhTJCFM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Q1zxjVUIuR9zDdrm8y+NA6GvUVCQaGvafApUJbiERAbZ3E9AIoB/KIUYN8wMKECrhU1s63mRKyZAfRpMVEqU5nGiegWs+dBaFT5NuDt14GnUEgwn1jqI6JRm3oIzXYOCsl6UbdqyEuCJVT/VEQ42WeyuoHfh7ygZ30C5Syc7wek=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=SZHaYhaj; arc=fail smtp.client-ip=40.93.196.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="SZHaYhaj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tb+8P6ytTjw64R77zRdyyh0LblNEOHeu3bG4zc/8yDmd61ct8/Gda4in8Z2t/gXnvm4BEOhxQJ5MM+n3HW9hlRt1gf5QRvcTIgJJ0XEY5Z56hxeP8S51PaAdyLbpZtsTEoBgoZyHRWmJJ7Ou6/TXux7Yu3fFOAkFn3C+sUGrYnsv91MfIpMf5KTkGYTi2OTSWVxd9LuSSd/RNvrdADaKG63WWadWSAhFfpPxKFLt6CnOpM7nSavjVkDNK5CrofdbMuqCuW2awMp3/zvyenI6FpSVzRuNPI4Dcwk4Ju869U8p/YU4Q+AacDHVQIzTXZ0rUAHbR10u0700qZLfwJFy6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u/4fdVaTfcKwTqvfPw+ohtwAaQ5TWeKuRUEHEI5QajY=;
 b=q4NjztLom/CR5Eu/9EfLEwfsra7N8n7AH0Ptg+GHoJkf7Jkh7gVzlAxdGD7HgnWSsyukbw+B4HefmzR6UQZOaBe3u4t/nP+f8+jraK3sYYK6geKaRcEcCqA8Qaoh2O0IvU89JRj5iDdZqaHlH2mWsWAWj9FpNgRBmiAD+huYlmX1TnCRIH6+FQFBsrDWgApOVpE9DQoi4Tbd/eLGc6oTPSIopf+RF/D9j3YXCD0Us4YYXzvEj9AoNnO4gMUVBU7gnWIJq9njTgR/lDdRh0GOF7gt5CglWwJ0n7oFYKlNs+aSdeU3RGu8Yrrmco6mBtQE0BjnzyBxCnVvznRqLEyxEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u/4fdVaTfcKwTqvfPw+ohtwAaQ5TWeKuRUEHEI5QajY=;
 b=SZHaYhajeVhnc/RqB1GdkpK3eCl9+C7yUKhOJ6Yt4AsAwRdT8YePnHuFhgOSnJsJQ3HRfJ7MYxS0yVw6tEGdQmZIavWkeCtclgAKZ7FNH8ziRt1H5VrVcl6Bd1Cl5XRBXhVOyvk0Z4H8ZW15hBj42eRjqI4n+iQlZksurSgr4fIwEVgA49Ki8DcQaFbxV4AmBEW5IbsPQLsk/1HtRwiwj3vVz1HEvXyKoJ0XeW/SgWRpiVne669K9TQM1Midnz4YxvxAYXPLWf2NIs0OB9XK1Y24q4+CWNAKv45/F7bcv1IKKzQg4Cup7Hc9wiruo0C/IxwQ0ogzzX026tE6t7rOEA==
Received: from CH2PR16CA0022.namprd16.prod.outlook.com (2603:10b6:610:50::32)
 by BL1PR12MB5755.namprd12.prod.outlook.com (2603:10b6:208:392::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.27; Tue, 5 May
 2026 11:26:51 +0000
Received: from CH2PEPF0000009F.namprd02.prod.outlook.com
 (2603:10b6:610:50:cafe::46) by CH2PR16CA0022.outlook.office365.com
 (2603:10b6:610:50::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Tue,
 5 May 2026 11:26:50 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH2PEPF0000009F.mail.protection.outlook.com (10.167.244.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Tue, 5 May 2026 11:26:50 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:26:33 -0700
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 5 May
 2026 04:26:33 -0700
Received: from 5b171f0-lcelt.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Tue, 5 May 2026 04:26:31 -0700
From: Wei-Cheng Chen <weichengc@nvidia.com>
To: <mathias.nyman@intel.com>, <gregkh@linuxfoundation.org>,
	<thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <waynec@nvidia.com>, <wtsai@nvidia.com>,
	<weichengc@nvidia.com>
Subject: [PATCH] xhci: tegra: Fix ghost USB device on dual-role port unplug
Date: Tue, 5 May 2026 19:26:30 +0800
Message-ID: <20260505112630.217704-1-weichengc@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000009F:EE_|BL1PR12MB5755:EE_
X-MS-Office365-Filtering-Correlation-Id: 3af72f45-a4ea-46e5-07de-08deaa9933b0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|376014|36860700016|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	kcRU+xrTaqD84GeMKXHQ2cwZ5kfP58GRhj3IzbtphVaZWxBgPZA0+4diLjRmMGULui64RbPJ3tbriICVD52eYtzrrUwKWS1Mb0Fj8s9clF0/NqPinoWbcP4RGQtuxZUNkysyxqqlggSQViXxGpKSek6G7mJAO6riW6Ky5A3J7SLKZVHDjGVeEjdsvfAM+zEVzXttkq0UkaBjp3Mta7nOZe3sT8Z8HqyYlIbERzpdrbhDZoDHbEKNqmw+zjuzeT/e/TrMt7SJMNrvb44G0KyzBimY2ShaOZY0gNa3/EAAyHIgxNMp6pzFXeuUs8qUkQjCe7FtUuqzW1mNaZ4QAPdTzSH5Ll9vhUZQygIQ5Ld2nXGvKCePXXZH1nyrHmH1ZziNadaBvoMwgfEoD15RJxPqJl5OF9CzzdySRmmDhFZ99d0xvbv313dpD9jaY8TTBsH8r3x5yeNgtOoe8qj8SFIbOEdSlXm3qM5jIOcofooG33W4iI6SNvqwlP/Rd3+4/sWtFsbAUzva/wBdKr67h7f4YJU191QHREDvw9mTpT6t+l3MTvFuJ09BdfYuT8NAuptmmZJyeOMw0mtYKmZvKXiCCw9haNVbDWXLe6w6AtViYgpz0hlmprbwtpnytbP4XAVnD27/h47ZorsGXTLKFX0f6WylJ0vdulogvwThlGwKUvN5yJMu6N+YJYhFcIiZFbuOuSxZcbIEGME2vu1qCSRVFmgcsN1Kejj5258kHJUY0ss=
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(376014)(36860700016)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	cT6NsAFuQXqunc+fJPj5YQxE0semjOvVxuHqq1KFYgYyfdxWYko3miOEvbl1z40s1aMq+J+GWGWLi3DhOEeWemAfUwt35kkaMoPgcFq0+iCkkDn6Pz8XNI5pgm3K02d1bblYo5Tvbw3hGzOoeBbHMuWf5xbV0TlCP4APIG8KWGXSmY99VqJn8DfmrXl3iHUXWH82XRyXqzZl9U32TcO6lcRWRP9GAI/Q7HdkbH0OT6duSKJo6gNMBwNfYyhC+n8tbCTTd1Qyet1qsg0Izh3g3CWD+KyPQV+Uq9jkvi0rXC5lLkfOxn1TX+5gY6g/gU9SrUPKykRiuoEVKI7ipEcQHkbw/VLVVFLVv920DigvOFZ3CwRSkaE0RoZNwMoG5DDPSusfk0mG1rrXdosd9Z65tQxCsD0P8qsaWLOVFHy3IlgRYcBbhyFYlxshEUPlgPK/
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2026 11:26:50.5585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3af72f45-a4ea-46e5-07de-08deaa9933b0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000009F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5755

When a USB device is unplugged from the dual-role port, the device-mode
path in tegra_xhci_id_work() explicitly clears both SS and HS port power
via direct hub_control ClearPortFeature(POWER) calls. This preempts the
xHCI controller's normal disconnect processing -- PORT_CSC is never
generated, the USB core never sees the disconnect, and the device remains
in its internal tree as a ghost visible in lsusb.

Add an otg_set_port_power flag to control whether the dual-role switch
path performs explicit port power management. SoCs that need it
(Tegra124 / Tegra210 / Tegra186) set the flag; later SoCs (Tegra194 and
beyond) rely on the PHY mode change to handle disconnect naturally and
skip all port power calls.

Within the port power path, otg_reset_sspi additionally gates the SSPI
reset sequence on host-mode entry for SoCs that require it.

Flags set per SoC:
  Tegra124, Tegra186  -> otg_set_port_power
  Tegra210            -> otg_set_port_power, otg_reset_sspi
  Tegra194 and later  -> (none)

Fixes: f836e7843036 ("usb: xhci-tegra: Add OTG support")
Cc: stable@vger.kernel.org # v5.7+
Signed-off-by: Wei-Cheng Chen <weichengc@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 73 ++++++++++++++++++++---------------
 1 file changed, 41 insertions(+), 32 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index d2214d309e9..d5637b37636 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -247,6 +247,7 @@ struct tegra_xusb_soc {
 	bool has_ipfs;
 	bool lpm_support;
 	bool otg_reset_sspi;
+	bool otg_set_port_power;
 
 	bool has_bar2;
 };
@@ -1352,12 +1353,13 @@ static void tegra_xhci_id_work(struct work_struct *work)
 	struct tegra_xusb_mbox_msg msg;
 	struct phy *phy = tegra_xusb_get_phy(tegra, "usb2",
 						    tegra->otg_usb2_port);
+	bool host_mode = tegra->host_mode;
 	u32 status;
 	int ret;
 
-	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(tegra->host_mode));
+	dev_dbg(tegra->dev, "host mode %s\n", str_on_off(host_mode));
 
-	if (tegra->host_mode)
+	if (host_mode)
 		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_HOST);
 	else
 		phy_set_mode_ext(phy, PHY_MODE_USB_OTG, USB_ROLE_NONE);
@@ -1366,41 +1368,43 @@ static void tegra_xhci_id_work(struct work_struct *work)
 								    tegra->otg_usb2_port);
 
 	pm_runtime_get_sync(tegra->dev);
-	if (tegra->host_mode) {
-		/* switch to host mode */
-		if (tegra->otg_usb3_port >= 0) {
-			if (tegra->soc->otg_reset_sspi) {
-				/* set PP=0 */
-				tegra_xhci_hc_driver.hub_control(
-					xhci->shared_hcd, GetPortStatus,
-					0, tegra->otg_usb3_port+1,
-					(char *) &status, sizeof(status));
-				if (status & USB_SS_PORT_STAT_POWER)
-					tegra_xhci_set_port_power(tegra, false,
-								  false);
-
-				/* reset OTG port SSPI */
-				msg.cmd = MBOX_CMD_RESET_SSPI;
-				msg.data = tegra->otg_usb3_port+1;
-
-				ret = tegra_xusb_mbox_send(tegra, &msg);
-				if (ret < 0) {
-					dev_info(tegra->dev,
-						"failed to RESET_SSPI %d\n",
-						ret);
+	if (tegra->soc->otg_set_port_power) {
+		if (host_mode) {
+			/* switch to host mode */
+			if (tegra->otg_usb3_port >= 0) {
+				if (tegra->soc->otg_reset_sspi) {
+					/* set PP=0 */
+					tegra_xhci_hc_driver.hub_control(
+						xhci->shared_hcd, GetPortStatus,
+						0, tegra->otg_usb3_port+1,
+						(char *) &status, sizeof(status));
+					if (status & USB_SS_PORT_STAT_POWER)
+						tegra_xhci_set_port_power(tegra, false,
+									  false);
+
+					/* reset OTG port SSPI */
+					msg.cmd = MBOX_CMD_RESET_SSPI;
+					msg.data = tegra->otg_usb3_port+1;
+
+					ret = tegra_xusb_mbox_send(tegra, &msg);
+					if (ret < 0) {
+						dev_info(tegra->dev,
+							"failed to RESET_SSPI %d\n",
+							ret);
+					}
 				}
-			}
 
-			tegra_xhci_set_port_power(tegra, false, true);
-		}
+				tegra_xhci_set_port_power(tegra, false, true);
+			}
 
-		tegra_xhci_set_port_power(tegra, true, true);
+			tegra_xhci_set_port_power(tegra, true, true);
 
-	} else {
-		if (tegra->otg_usb3_port >= 0)
-			tegra_xhci_set_port_power(tegra, false, false);
+		} else {
+			if (tegra->otg_usb3_port >= 0)
+				tegra_xhci_set_port_power(tegra, false, false);
 
-		tegra_xhci_set_port_power(tegra, true, false);
+			tegra_xhci_set_port_power(tegra, true, false);
+		}
 	}
 	pm_runtime_put_autosuspend(tegra->dev);
 }
@@ -2553,6 +2557,7 @@ static const struct tegra_xusb_soc tegra124_soc = {
 	.scale_ss_clock = true,
 	.has_ipfs = true,
 	.otg_reset_sspi = false,
+	.otg_set_port_power = true,
 	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
@@ -2593,6 +2598,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = true,
 	.otg_reset_sspi = true,
+	.otg_set_port_power = true,
 	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
@@ -2640,6 +2646,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.otg_set_port_power = true,
 	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0xe4,
@@ -2673,6 +2680,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.otg_set_port_power = false,
 	.ops = &tegra124_ops,
 	.mbox = {
 		.cmd = 0x68,
@@ -2708,6 +2716,7 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.scale_ss_clock = false,
 	.has_ipfs = false,
 	.otg_reset_sspi = false,
+	.otg_set_port_power = false,
 	.ops = &tegra234_ops,
 	.mbox = {
 		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
-- 
2.43.0

