Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6A1FC5479D
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Jan 2023 15:30:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235503AbjAFPaT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Jan 2023 10:30:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235665AbjAFP3j (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Jan 2023 10:29:39 -0500
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2068.outbound.protection.outlook.com [40.107.94.68])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6138CD11;
        Fri,  6 Jan 2023 07:29:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jlLrTlg76IUSKBlprY/CDzT7nWy43vcuKgHufvc6FF2D0icH5WU+vBYvIDut0Nu/r01zcHMK7bx3n36rHUg4UfuEg8HeG6ORFlhrhe9CD0o0tj7pusQF0AvNdDCOWEDB6yQFoBpZM5uFEjcJPTNqs4cyvGSHpe59iHoJuxWMaP9NlV2v4oMNcBF5rP3L4Ghu6vY/loOsqd2QKUqxIs35ZMfxNnjGt0UAnRa25y9/qQuESZ6LMwnaaoMMR1yctmUkoqh3SUIHDtXt6Y/4d/GlPl+p4lILFl3V3ffOL77KbbgePWUWoolY7/aY/u3NtWOj9MTPagsKEdOcJ68BbKvCrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eSVXCP/o6cHqAkxiCme3Jxy5gUUyf1TsmF3P5iP1mlQ=;
 b=iyGfK9bmt+ey/LlMfrroiUBp2Xp4y3kwpVEKFXYqlHNd1N6qGspHb2N2sZz2OeUMUImYXLVircCA0iW060rPZA9vghmqVcKPByaiUtsDFD1Uu0gsKngkMBvm/0bJqq6t48xzcLiphXj5+Q5FY8E1Chbx92++ZgS2eZFt9GqKAy8t6W5oCQfMluXS/Tpr3tv/j4x5aw2N9UDT6vdZPnoe0rSOsrxSs+58nbrcL5nAkyxhnGiAGtP+VeKeGI6Ek2xX4uNvC5/kCpkAqJDX3sWL6iUu5wH7vq/GMtVhXwjoUv0SFil1paP1l1FEMsYCe4tqLo+vGOOLYTQ/92wUh4Gdbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eSVXCP/o6cHqAkxiCme3Jxy5gUUyf1TsmF3P5iP1mlQ=;
 b=XEK6tBDRHKY1QMA+VvwQAvMnNfROcXscxosLIuh/l8023C10ufzBxWLM8gs3Dp0WDMJgWXGM7529wFbXKUNGA+oQC6v/qGLM95oJVVC/lRw6LG2GQ8zYJBBkOzLE92bEoHpClZ0tVv3joH8W3FAKnnB0lUlqRaxkbtbQMwxf72SW0TWAECc66P/jQDsp/MYhRIHt/i2qPj//80YsGffmBnjc3CQ7tZBUU2hn8TiiGunaKFEIx4cxx0DbOuwAm5Du78q/8vhiOXeTZag6jxvPKMsgeYD0nABJWt+RG6F7hP94qhv7azMEWhB6RT/WesgqixSbbHUoKD+9BivQTNCaUw==
Received: from BN8PR15CA0006.namprd15.prod.outlook.com (2603:10b6:408:c0::19)
 by MW4PR12MB7311.namprd12.prod.outlook.com (2603:10b6:303:227::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.19; Fri, 6 Jan
 2023 15:29:36 +0000
Received: from BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:c0:cafe::d5) by BN8PR15CA0006.outlook.office365.com
 (2603:10b6:408:c0::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.15 via Frontend
 Transport; Fri, 6 Jan 2023 15:29:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT058.mail.protection.outlook.com (10.13.177.58) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5966.17 via Frontend Transport; Fri, 6 Jan 2023 15:29:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:23 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 6 Jan 2023
 07:29:22 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Fri, 6 Jan 2023 07:29:20 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 4/6] phy: tegra: xusb: Disable trk clk when not in use
Date:   Fri, 6 Jan 2023 15:28:56 +0000
Message-ID: <20230106152858.49574-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230106152858.49574-1-jonathanh@nvidia.com>
References: <20230106152858.49574-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT058:EE_|MW4PR12MB7311:EE_
X-MS-Office365-Filtering-Correlation-Id: 40f79cb7-f11d-4c36-1242-08daeffad154
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fVCqAJbQAAY+8O3ixbM+AHZOQopI8Jgy7SL1ECam2R0kpMbAKHsy+zd3fOVobOeW4siUdj+P936syAX9I6u11EUmR51Qv2Q9iZ19E7952gBv9qTPEumO+BvH5FWU4ALEYcsw4+/WQBptmqqsMEA9lun9fVMBfqVnhfrn1COxPZqEzZFOTk6qDNIch4xZEUS/ng/KZQ3qX+ndqAZVqRcbys6HJSj8Oyv4BwcSgzoiYEmCQIX9i/98WH9X/MYFfIhWKp3fY0qfb/ceMmmWGYNpg39yzPVEq164HY+NHSskDpyUz7AkJLeXhI1wyj2tHqQ8UBY0A8GOUlH4RdtO8v6B6exG0qiltfdrW6GhjXta7q5/eHkC1+HE/HbScxL6EjuXMfjyrKmJHlgs31nCxUVepSyP70m6mNo6rPFqVLb6q3f6/uN+r6Eu14KwI+Y/crLOz3vA6quO+xoidBXC/ZZoaNzRoil/WxoRDWgYoqVANPLa3nY6XNNv3LUtH1J0bar2F2zv5znGBDQSE+9EFi5tYSV7QeZZK+IkSp9xWkeZy3fpjVa/ObynxlMw/PzYCXKaSOllSb7JvZAbK8SaRyBedW/3PoL1LBIRtFAXYryIWCTRk2grrgUYQk8HpzRrf5hvsY6jFlxMBhbrd87pQFSWJi1qwgWjYPKyLjVtnQim8d7EHg+P3A5h6kbtgkCh/bUQ30mfAGQ7OSG7aubinoNPcVzGjNB6yD4TD5Q5njTVPHQUYEDcwuPMuTNJ+MT9ypqG
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(396003)(136003)(376002)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(41300700001)(8936002)(70586007)(316002)(70206006)(5660300002)(8676002)(54906003)(110136005)(2906002)(4326008)(7696005)(6666004)(107886003)(478600001)(7636003)(47076005)(336012)(86362001)(186003)(26005)(426003)(83380400001)(2616005)(82740400003)(356005)(36756003)(1076003)(40480700001)(40460700003)(36860700001)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2023 15:29:35.7125
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40f79cb7-f11d-4c36-1242-08daeffad154
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7311
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Pad tracking is a one-time calibration for Tegra186 and Tegra194.
Clk should be disabled after calibration.

Disable clk after calibration.
While at it add 100us delay for HW recording the calibration value.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V4 -> V5: no changes
V3 -> V4: no changes
V2 -> V3: no changes
V1 -> V2: update the commit message

 drivers/phy/tegra/xusb-tegra186.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/phy/tegra/xusb-tegra186.c b/drivers/phy/tegra/xusb-tegra186.c
index 6a8bd87cfdbd..c00d14f27ab4 100644
--- a/drivers/phy/tegra/xusb-tegra186.c
+++ b/drivers/phy/tegra/xusb-tegra186.c
@@ -609,6 +609,10 @@ static void tegra186_utmi_bias_pad_power_on(struct tegra_xusb_padctl *padctl)
 	value &= ~USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
+	udelay(100);
+
+	clk_disable_unprepare(priv->usb2_trk_clk);
+
 	mutex_unlock(&padctl->lock);
 }
 
@@ -633,8 +637,6 @@ static void tegra186_utmi_bias_pad_power_off(struct tegra_xusb_padctl *padctl)
 	value |= USB2_PD_TRK;
 	padctl_writel(padctl, value, XUSB_PADCTL_USB2_BIAS_PAD_CTL1);
 
-	clk_disable_unprepare(priv->usb2_trk_clk);
-
 	mutex_unlock(&padctl->lock);
 }
 
-- 
2.25.1

