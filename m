Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.56
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794842718;
	b=n11FBSMYJXldtrYT1jqo6L81H587eu9Ek38YtLSNcKK7+H/wP+3/em7MfKrPn/csUNel
	 NLRApqIgppjDzXdJAwiJc47KqTuiNrO6alFJDTDmkR74Eq5J3Ph8ZgcYAXeESZ0hb0sor
	 VD1Y8e2xOsDtAVGT5KaMOMLpI0Phy9OE0befol2QJaXTeuf6HN+GN5eK41OkAcsFilLUR
	 kWG+ZQcavkYpsYzQzXOX8D7a9yMSBAKYtFjVwT0cIVMOyl08sgE9S9J6NtRwovifjOPw6
	 icexsdfxUpzILOSObGx3+KGBqBkSadkeNJB787SJb7juSgyujrKzJuTCCn9RP7tUI9Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794842718;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-ID:References:In-Reply-To:To:CC:
	 X-Mailer:X-Originating-IP:X-ClientProxiedBy:X-EOPAttributedMessage:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=hkm2EcqViRTLk4lidhrdikOrFx+KEAT0CF2Wj1aZpWQ=;
	b=g1OLG5hNGpM0zXDKoZhyt+wbBK9ArrSRxJzNYdIkvWdrTPL33d3VmGyi0WBHtgumakK/
	 LC0olqIyi68dGU5GKYH8S3Iu6J0yiGlkNWL/E/C1d7uXeX8MHo1uUd046RJktHTsa6V/I
	 plNTZQZZI3PU9EIictCzN32EeodglsGVT3vMKlWwCuLpnS66xi+q5lIt8L7kALYwUsN1p
	 delvT32o27AArTLeVKgv3gCPQCIYFO705ccTij+te1N/RwQbVfhDu3OSjvF0PTCTPLC7R
	 xIM0LUO7PUMLBbLtHOP8hXz9jYNivKV/JUinBID5oI2U+0Zi/BYVGjtQH8th8623cRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b="Ob/vSvxq";
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.93.194.56
Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011056.outbound.protection.outlook.com [40.93.194.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36358606A323;
	Mon, 16 Nov 2026 15:25:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36358606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=Ob/vSvxq
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P4KB5iJNs3cZxRWKw6iPyODTMOH0qhwEoLN/FJKGT3SINc8JOvFJyet3UNd4h9PQdJNyxMfSz3WRa6xxrjXe9u4a/xk0ZRn5vXebU2HeWlhHw5DR66Jr1Sb3UgxD+nAE/5oD6dcZz/lfe8EJpd17C475uIQ/B5SbuY3Ib+QrXbg7Jck10Y/rZnmWc5y3kTmfEYgFrgBjnYJIovT6wYnkbpGfTU1AdqIpb77Miz3P/MEl+vCu5zQ8rSvZHU/7V5G/3Axfp3vAyLARNJfwK1c6ypwpOp1Co1geh1iuLJxFeNjpSKiOYkps/EW5gWp4CeIWdVU3xo6jk8Cw5bqMFaNVKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hkm2EcqViRTLk4lidhrdikOrFx+KEAT0CF2Wj1aZpWQ=;
 b=j2UHjrwBGczc449n/sgESXdXBhAWvaQrEXSBbQ17V59FCg6WDCbc7gv0Y1XWNn9SKryqFWH8r615NPv1vGqwdHGquwVcvdxGRNpFO0Nr4u2fiXYV4MFdPpdfpC6VbpzvDjS9g+H16JY7LZucYuP3gwIJEfUmMKDiUAyp9LUJd0FYobyL69F1RoQXZwkITKTqjm2sdlaYzqLdkG0lGyLQWioN/A3UNoDtSfb3QHPrVSRS1yhVIq+OWb6QDZMuvUaND1JlRreTy69e6a3BAvXVTOsU4WCZd+ha9LwMhZ1UyAjAUyvbhTqxGHDF6Z36975WlJK74HhWNMwD/cZkaAJHdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hkm2EcqViRTLk4lidhrdikOrFx+KEAT0CF2Wj1aZpWQ=;
 b=Ob/vSvxqKh+MoVBQwrNkWeT+IZU1QDirjD+M00MUYit16ojaF74zbIk9VRpZilOUhv0Y3+Bo2pcWSrSGq+MDQyK5y55OFwJewvb3zSIioTvpCOBlPvuoUATeTnBjRfmIGyRtlx2dkpeOpTrE64AD9BwaTWUM+ESM3bjDh8nybvDvCYQdYkYkT/nwBlNI53qKwxnFhUFdRdyJUa6RGQRHdmZQwwFSpONC7XXEej5C2gu6kEq01w7YmYYLGkrAQDpzyGKC9O9YHrl9sGDnILOqkB58RQfyZVKzwkWgC46m7saZHMzyr3Tj/4izSwXVOs1IUdLgf3e89AV1h9ljiotwkw==
Received: from PH0PR07CA0013.namprd07.prod.outlook.com (2603:10b6:510:5::18)
 by BL1PR12MB5996.namprd12.prod.outlook.com (2603:10b6:208:39c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Mon, 16 Nov
 2026 15:24:51 +0000
Received: from PH1PEPF00062F29.namprd02.prod.outlook.com
 (2603:10b6:510:5:cafe::42) by PH0PR07CA0013.outlook.office365.com
 (2603:10b6:510:5::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.13 via Frontend Transport; Mon,
 16 Nov 2026 15:24:50 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.160) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 PH1PEPF00062F29.mail.protection.outlook.com (10.167.243.58) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.615.4 via Frontend Transport; Mon, 16 Nov 2026 15:24:50 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:27 -0800
Received: from [127.0.1.1] (10.126.230.37) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Mon, 16 Nov
 2026 07:24:24 -0800
From: Jon Hunter <jonathanh@nvidia.com>
Date: Mon, 16 Nov 2026 15:24:03 +0000
Subject: [PATCH v2 06/12] usb: xhci: tegra: Add support for Tegra238
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20261116-tegra-usb-v2-6-42efc03a9700@nvidia.com>
References: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
In-Reply-To: <20261116-tegra-usb-v2-0-42efc03a9700@nvidia.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, "Nagarjuna
 Kristam" <nkristam@nvidia.com>, JC Kuo <jckuo@nvidia.com>, Mathias Nyman
	<mathias.nyman@intel.com>
CC: Thierry Reding <thierry.reding@gmail.com>, <linux-usb@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Thierry Reding
	<treding@nvidia.com>, Wayne Chang <waynec@nvidia.com>, Jon Hunter
	<jonathanh@nvidia.com>
X-Mailer: b4 0.16.1-dev
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH1PEPF00062F29:EE_|BL1PR12MB5996:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f18fa88-5a19-4c4c-4cd1-08df43f5c1ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|7416014|36860700016|23010399003|18002099003|22082099003|6133799003|261009223027099003|56012099006|11063799006|261102123227099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261022105027099003|261021123027099003|261022075727099003|10067099003;
X-Microsoft-Antispam-Message-Info:
	ek+R+0eFkY2TQAdfgoEVEiU/sgYffwq+hHdSSkgMCLXgAybjfvpyIHTNuKPrXrFl+IU1k6lisrWFkrLzE7uVrLXj2SMF3MoCA/sc2943Q7BR1F5VdtjeK1+Z8NUuSrfAmQOUEeSssmjjvIiaARDteBBkf2Vb8pvn03GPl9DCyjhG68VT12adLE/SX7kof7VBsozQw7tBkfUkGAMtyVdeEbim2FPLbX42RJJTx3Qy7ByFYFm22YUTJylAumQbsqMOVttQaemVc8w6h50DuY87AZDb67NAMdjokuqbEZxhPvRWR0WAmwq+MGgN9ubHRV2eN6mB40T1/2ayPVOUuZ55fx289vDd0905plcbtYTr1G60C2Khx0C5NXNBFQTcMs7+lRm5sPGSGTCtLxjmZBPmdhSsE59fJQJTBhntL79FPhMDiRz6ffNOhUybMArBoN7oVLFz/cOkWdneIshRfzU71dmXk95g8PYESB2lMunuQ16La54ZK0CPZ1vX9v+9edZmcRLJEgbeDDXEwx9iqUy1zFs44urRN3lc1nu6iMbP7mRXbKVZvAXArp9gaFtZPN/flobcHofIDchO/0rYdIy4SP0t6VvahzsP7+3N+0Tc4RNx7U3wS86Q3ZiSeo1QhrBaUVVaC22ltrijBx3sdTLdRilDZHDggYRslT7oPJ4bCYpk9ZBiBlyrSRiPh1E9Tk0CUFLl8fTc89K9rt3GJCy7bQ==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(7416014)(36860700016)(23010399003)(18002099003)(22082099003)(6133799003)(261009223027099003)(56012099006)(11063799006)(261102123227099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261022105027099003)(261021123027099003)(261022075727099003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Va7ukcNUtyDBkdVmgotez4FaZIlw+KaRlNJrZcje93L+o1cH3j3ww5T+y35PWAZz6ZVCrPvuWvny0Ouyo3iQqcqWxFBpfB0To514fi/dNTpNJqaF7Y844zIKxpCuQcafDBnTELXPjnmlZP59fyJ2eGUGJ+0O81Zas6aRdQL/l0sGcF7FDDUPB1LRgaz8nPf7y4W7CvKff/6uKLxkPQRavSzN/WGxjRCSorn1CuhfMxQh5VVqpure3ZFMTbVUGMlsdL8pOYI6RPXFcS8Q9Uw6GAcstWC82NpfL297URxAEKNVcGyCcFIDkqmN3kxYCnlslYvXmiMseq3BpeCr9SqvVvpcbH9brBpvxnWFCmHsAavi4Qpv3Hg/0ICF9Q783fSj6sl+CMtAyEjI3cjgRlMHtAjE3J8UnXyv7Lv7PSWxknE822/Seuw0M5knRsGxz1On
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2026 15:24:50.6343
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f18fa88-5a19-4c4c-4cd1-08df43f5c1ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	PH1PEPF00062F29.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5996

Add XHCI support for the Tegra238 SoC which is similar to the Tegra234
XHCI but only supports 3 USB2 and 3 USB3 ports compared to the 4 USB2
and 4 USB3 ports on Tegra234.

Unlike other Tegra devices, Tegra238 does not have powergates for the
USB host and Superspeed controllers and so for Tegra238 it is only
necessary to manage the resets for these controllers. Add a
'has_powergates' variable to the SoC data to indicate if the Tegra
device supports powergates for the USB host and Superspeed devices.
For Tegra238 the driver uses devm_reset_control_get_shared() to
obtain the 'xusb_ss' reset because it is shared with the Tegra XUDC
driver.

Handle host and superspeed resets independently. During deactivation,
attempt both assertions without rollback so a host reset failure does
not retain the shared superspeed reset vote. During activation, deassert
host before superspeed and unwind failed deassertions to keep the shared
reset count balanced.

Finally, rename the functions tegra_xusb_powergate_partitions and
tegra_xusb_unpowergate_partitions as tegra_xusb_deactivate and
tegra_xusb_activate because now these only handle the resets for
Tegra238.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/host/xhci-tegra.c | 113 +++++++++++++++++++++++++++++++++++-------
 1 file changed, 96 insertions(+), 17 deletions(-)

diff --git a/drivers/usb/host/xhci-tegra.c b/drivers/usb/host/xhci-tegra.c
index 5fbb09d2a1ae..87c0c827832e 100644
--- a/drivers/usb/host/xhci-tegra.c
+++ b/drivers/usb/host/xhci-tegra.c
@@ -252,6 +252,7 @@ struct tegra_xusb_soc {
 
 	bool has_bar2;
 	bool enable_firmware_messages;
+	bool has_powergates;
 };
 
 struct tegra_xusb_context {
@@ -1173,7 +1174,7 @@ static int tegra_xusb_powerdomain_init(struct device *dev,
 	return 0;
 }
 
-static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
+static int tegra_xusb_activate(struct tegra_xusb *tegra)
 {
 	struct device *dev = tegra->dev;
 	int rc;
@@ -1191,7 +1192,7 @@ static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
 			pm_runtime_put_sync(tegra->genpd_dev_ss);
 			return rc;
 		}
-	} else {
+	} else if (tegra->soc->has_powergates) {
 		rc = tegra_pmc_powergate_sequence_power_up(tegra->pmc,
 							   TEGRA_POWERGATE_XUSBA,
 							   tegra->ss_clk,
@@ -1211,15 +1212,33 @@ static int tegra_xusb_unpowergate_partitions(struct tegra_xusb *tegra)
 						      TEGRA_POWERGATE_XUSBA);
 			return rc;
 		}
+	} else {
+		rc = reset_control_deassert(tegra->host_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to deassert host reset: %d\n", rc);
+			goto assert_host;
+		}
+
+		rc = reset_control_deassert(tegra->ss_rst);
+		if (rc < 0) {
+			dev_err(dev, "failed to deassert SS reset: %d\n", rc);
+			goto assert_ss;
+		}
 	}
 
 	return 0;
+
+assert_ss:
+	reset_control_assert(tegra->ss_rst);
+assert_host:
+	reset_control_assert(tegra->host_rst);
+	return rc;
 }
 
-static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
+static int tegra_xusb_deactivate(struct tegra_xusb *tegra)
 {
 	struct device *dev = tegra->dev;
-	int rc;
+	int rc, err;
 
 	if (tegra->use_genpd) {
 		rc = pm_runtime_put_sync(tegra->genpd_dev_host);
@@ -1234,7 +1253,7 @@ static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
 			pm_runtime_get_sync(tegra->genpd_dev_host);
 			return rc;
 		}
-	} else {
+	} else if (tegra->soc->has_powergates) {
 		rc = tegra_pmc_powergate_power_off(tegra->pmc,
 						   TEGRA_POWERGATE_XUSBC);
 		if (rc < 0) {
@@ -1252,6 +1271,20 @@ static int tegra_xusb_powergate_partitions(struct tegra_xusb *tegra)
 							      tegra->host_rst);
 			return rc;
 		}
+	} else {
+		rc = reset_control_assert(tegra->host_rst);
+		if (rc < 0)
+			dev_err(dev, "failed to assert host reset: %d\n", rc);
+
+		/*
+		 * Release the shared SS reset vote even if the host reset fails,
+		 * otherwise the next activation adds an unbalanced deassert vote.
+		 */
+		err = reset_control_assert(tegra->ss_rst);
+		if (err < 0)
+			dev_err(dev, "failed to assert SS reset: %d\n", err);
+
+		return rc ? rc : err;
 	}
 
 	return 0;
@@ -1741,7 +1774,10 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 			goto put_padctl;
 		}
 
-		tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
+		if (tegra->soc->has_powergates)
+			tegra->ss_rst = devm_reset_control_get(&pdev->dev, "xusb_ss");
+		else
+			tegra->ss_rst = devm_reset_control_get_shared(&pdev->dev, "xusb_ss");
 		if (IS_ERR(tegra->ss_rst)) {
 			err = PTR_ERR(tegra->ss_rst);
 			dev_err(&pdev->dev, "failed to get xusb_ss reset: %d\n",
@@ -1749,11 +1785,13 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 			goto put_padctl;
 		}
 
-		tegra->pmc = devm_tegra_pmc_get(&pdev->dev);
-		if (IS_ERR(tegra->pmc)) {
-			err = dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
-					    "failed to get PMC\n");
-			goto put_padctl;
+		if (tegra->soc->has_powergates) {
+			tegra->pmc = devm_tegra_pmc_get(&pdev->dev);
+			if (IS_ERR(tegra->pmc)) {
+				err = dev_err_probe(&pdev->dev, PTR_ERR(tegra->pmc),
+						    "failed to get PMC\n");
+				goto put_padctl;
+			}
 		}
 	} else {
 		err = tegra_xusb_powerdomain_init(&pdev->dev, tegra);
@@ -1867,7 +1905,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = tegra_xusb_unpowergate_partitions(tegra);
+	err = tegra_xusb_activate(tegra);
 	if (err)
 		goto free_firmware;
 
@@ -1959,7 +1997,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 remove_usb2:
 	usb_remove_hcd(tegra->hcd);
 powergate:
-	tegra_xusb_powergate_partitions(tegra);
+	tegra_xusb_deactivate(tegra);
 free_firmware:
 	dma_free_coherent(&pdev->dev, tegra->fw.size, tegra->fw.virt,
 			  tegra->fw.phys);
@@ -1981,7 +2019,7 @@ static int tegra_xusb_probe(struct platform_device *pdev)
 
 static void tegra_xusb_disable(struct tegra_xusb *tegra)
 {
-	tegra_xusb_powergate_partitions(tegra);
+	tegra_xusb_deactivate(tegra);
 	tegra_xusb_powerdomain_remove(tegra->dev, tegra);
 	tegra_xusb_phy_disable(tegra);
 	tegra_xusb_clk_disable(tegra);
@@ -2270,7 +2308,7 @@ static int tegra_xusb_enter_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 	if (wakeup)
 		tegra_xhci_enable_phy_sleepwalk_wake(tegra);
 
-	tegra_xusb_powergate_partitions(tegra);
+	tegra_xusb_deactivate(tegra);
 
 	for (i = 0; i < tegra->num_phys; i++) {
 		if (!tegra->phys[i])
@@ -2316,7 +2354,7 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 		goto out;
 	}
 
-	err = tegra_xusb_unpowergate_partitions(tegra);
+	err = tegra_xusb_activate(tegra);
 	if (err)
 		goto disable_clks;
 
@@ -2374,7 +2412,8 @@ static int tegra_xusb_exit_elpg(struct tegra_xusb *tegra, bool is_auto_resume)
 		if (!wakeup)
 			phy_exit(tegra->phys[i]);
 	}
-	tegra_xusb_powergate_partitions(tegra);
+
+	tegra_xusb_deactivate(tegra);
 disable_clks:
 	tegra_xusb_clk_disable(tegra);
 out:
@@ -2581,6 +2620,7 @@ static const struct tegra_xusb_soc tegra124_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.enable_firmware_messages = true,
+	.has_powergates = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_124_SOC) || IS_ENABLED(CONFIG_ARCH_TEGRA_132_SOC)
 MODULE_FIRMWARE("nvidia/tegra124/xusb.bin");
@@ -2623,6 +2663,7 @@ static const struct tegra_xusb_soc tegra210_soc = {
 		.smi_intr = XUSB_CFG_ARU_SMI_INTR,
 	},
 	.enable_firmware_messages = true,
+	.has_powergates = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_210_SOC)
 MODULE_FIRMWARE("nvidia/tegra210/xusb.bin");
@@ -2673,6 +2714,7 @@ static const struct tegra_xusb_soc tegra186_soc = {
 	},
 	.lpm_support = true,
 	.enable_firmware_messages = true,
+	.has_powergates = true,
 };
 
 static const char * const tegra194_supply_names[] = {
@@ -2708,6 +2750,7 @@ static const struct tegra_xusb_soc tegra194_soc = {
 	},
 	.lpm_support = true,
 	.enable_firmware_messages = true,
+	.has_powergates = true,
 };
 #if IS_ENABLED(CONFIG_ARCH_TEGRA_194_SOC)
 MODULE_FIRMWARE("nvidia/tegra194/xusb.bin");
@@ -2746,6 +2789,40 @@ static const struct tegra_xusb_soc tegra234_soc = {
 	.lpm_support = true,
 	.has_bar2 = true,
 	.enable_firmware_messages = true,
+	.has_powergates = true,
+};
+
+static const struct tegra_xusb_phy_type tegra238_phy_types[] = {
+	{ .name = "usb3", .num = 3, },
+	{ .name = "usb2", .num = 3, },
+};
+
+static const struct tegra_xusb_soc tegra238_soc = {
+	.supply_names = tegra194_supply_names,
+	.num_supplies = ARRAY_SIZE(tegra194_supply_names),
+	.phy_types = tegra238_phy_types,
+	.num_types = ARRAY_SIZE(tegra238_phy_types),
+	.max_num_wakes = 6,
+	.context = &tegra186_xusb_context,
+	.ports = {
+		.usb3 = { .offset = 0, .count = 3, },
+		.usb2 = { .offset = 3, .count = 3, },
+	},
+	.scale_ss_clock = false,
+	.has_ipfs = false,
+	.otg_reset_sspi = false,
+	.ops = &tegra234_ops,
+	.mbox = {
+		.cmd = XUSB_BAR2_ARU_MBOX_CMD,
+		.data_in = XUSB_BAR2_ARU_MBOX_DATA_IN,
+		.data_out = XUSB_BAR2_ARU_MBOX_DATA_OUT,
+		.owner = XUSB_BAR2_ARU_MBOX_OWNER,
+		.smi_intr = XUSB_BAR2_ARU_SMI_INTR,
+	},
+	.lpm_support = true,
+	.has_bar2 = true,
+	.enable_firmware_messages = true,
+	.has_powergates = false,
 };
 
 static const struct tegra_xusb_soc tegra264_soc = {
@@ -2773,6 +2850,7 @@ static const struct tegra_xusb_soc tegra264_soc = {
 	.lpm_support = true,
 	.has_bar2 = true,
 	.enable_firmware_messages = false,
+	.has_powergates = true,
 };
 
 static const struct of_device_id tegra_xusb_of_match[] = {
@@ -2781,6 +2859,7 @@ static const struct of_device_id tegra_xusb_of_match[] = {
 	{ .compatible = "nvidia,tegra186-xusb", .data = &tegra186_soc },
 	{ .compatible = "nvidia,tegra194-xusb", .data = &tegra194_soc },
 	{ .compatible = "nvidia,tegra234-xusb", .data = &tegra234_soc },
+	{ .compatible = "nvidia,tegra238-xusb", .data = &tegra238_soc },
 	{ .compatible = "nvidia,tegra264-xusb", .data = &tegra264_soc },
 	{ },
 };

-- 
2.43.0

