Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B1D9C5479D
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Jan 2023 11:05:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232244AbjAKLFe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Jan 2023 06:05:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233905AbjAKLFb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Jan 2023 06:05:31 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2051.outbound.protection.outlook.com [40.107.220.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30206BE3B;
        Wed, 11 Jan 2023 03:05:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Cn0uM6DxtKSccZF0lIFhCnuRQJ8o0S88UUmXBwpVSiFfsUEu0u8jSI0elxU4hrEHPt5r91iu5ZfQSE643CBQ4B+HafUfTc7G+bC+1uqIu8xntcUOk9x2feQ7MoEAPL0yLZ9RS1FzatmvyGEmbwB+v9XexAWlQjPn1KKLQAPWPv+RNQjayIiW8yd5L9CKHZiceXoMJlQP4ohStAt+J3/IscTebA0nZjBoSsj9Mj9+/EErjbmkPxVQf4ciLhuDTYFyCoQ7KAmokRZYdpXaAdYNaLsMNDNz/yCiyvgJmjPcFbts1YP/wc+LX3zFPmJlXBJNR/cdClcAYwM9L8iy6+Wv4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uJiQn4lnChHAXYOaL0iUsThiNIeDlNEcfNrUn72TUmU=;
 b=LL/cXZI16Q2D6cgZTkUxrLJUa8PABQ/CZulxypTxApIjZWp5eCoL4FfOE8oi4xqSnALY6ale3blmZ7Zo09nuu03141JJjLXNlj0guDVlfO74E5jh0vmU/cbz8GLJZBVbSYnXp5GUahHkLoTg2o4MG3jHaK37hW7qCT8apST57imaK7DcAuZgWvGzBjQjd73TldgQZZ7DTyRieBz+tuKrchhsckgByyF0Xyca0/LOjdS8tEG+5qZKGmK0PZdmSPJ2i/N/KYslDdSMRf+Ry53eJ3w6LlSYyIXXyQGMV66arnEGpYN7AYiuE0BuOaAASi+1OmFif4v4sjJCe/N32u77+g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uJiQn4lnChHAXYOaL0iUsThiNIeDlNEcfNrUn72TUmU=;
 b=Yk8eGj+fEV3A3IELhUmvfDuEHXIcnJVnvIawRoMtYDSLJTvF6tGZAHOQ+jFM+K8y5o9+PvOnFv2LSFH3Y0dM4Sa2HphgG89Rp9s1o8miVMTQpk6BC3PaAjvsc2DhQAKUAORyjp0Iznw5xOGVKrkye6OOK7UK6x26guG03zYqmCuaZytZTiHu9d4uWcpRKo51FN2psrFOOKZe4yROM4KZpeCkTEJubA4MFWNxzcgCf8WzQxtNrVpFubcUWqThkVqSzaz5+HgpbJ1CTi0YgXJggZVMFJ0cIFzv1tUzgpJyT2DsOs5QaVnD5AwkdYPd2oVD8I/61SPKCXjZ2/qWrPWffg==
Received: from DM6PR06CA0064.namprd06.prod.outlook.com (2603:10b6:5:54::41) by
 CY8PR12MB8339.namprd12.prod.outlook.com (2603:10b6:930:7e::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Wed, 11 Jan 2023 11:05:27 +0000
Received: from DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:54:cafe::f) by DM6PR06CA0064.outlook.office365.com
 (2603:10b6:5:54::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Wed, 11 Jan 2023 11:05:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT083.mail.protection.outlook.com (10.13.173.97) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.18 via Frontend Transport; Wed, 11 Jan 2023 11:05:27 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:16 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 11 Jan
 2023 03:05:16 -0800
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 11 Jan 2023 03:05:14 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Vinod Koul <vkoul@kernel.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <waynec@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V6 4/6] phy: tegra: xusb: Disable trk clk when not in use
Date:   Wed, 11 Jan 2023 11:04:48 +0000
Message-ID: <20230111110450.24617-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230111110450.24617-1-jonathanh@nvidia.com>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT083:EE_|CY8PR12MB8339:EE_
X-MS-Office365-Filtering-Correlation-Id: 27e1c20b-ac45-480c-5c53-08daf3c3bf10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4kk52DKEUOLYZt50PXk9+jBUFQRdYq7ncxgQXJlrWJau2ajU/Y9709K/7g+x6Q5GkQJBprt09MdTtn9PTj79tYAggSv0/mvHuqyH/pTNXHTsiK+JBd9oZAkgCIIcUq/Br4Y2Xw5qAe4KQqlWIjmTOoiRV+V22+ABltK8ZSsZpLv+02y7Uk2uOYcinnKEymaymE0HvhNiVbxKFercsjISJau8xAPYJcf2Qrb159y0NSlBqDt68B02aFLoDGQb2MmU1jos3xbzrZQLzW1P1Rif36Dzcuneu12hlo6qygiNpk7fWlW5Ojj+al+0kg/YmOxqa+HrBcHOoTqON9NsB9AOcPkt9RbkNOYcUhjlJX2XmBAYcKdlZmIeRHN9lzwo/FTrJ8arnxMZYEKYMu1WfIRqtbOzLMYZSI+fVXrG70IzDQcMWAsb9hSqsp6aArXzv770tB0pgiHnMUaGanpBBovnr1Bki07ltj1tL7FyqIj7O/eC57QINSDI3AttV0d/umb3Isp3C15tHHLoQw5Bjidey535DqGRzOb624nglbTi79kFzg8J9WModsGbeiRDjpv6SethRPOItKwfA/xvxhqdnjaJJEY7i4c1FUX/eUQOsy5N22yn2/VtTmAqedcxgSu2pEBlujUBkErU7ALHVPYzerJuxSW01+UVuKwZvuMRnKGf/WgxpAp9IKWDqJymAnsXpIwyqa/GRzhZ2dwHUq5TJg==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(136003)(346002)(376002)(451199015)(40470700004)(36840700001)(46966006)(6666004)(107886003)(36860700001)(2906002)(8676002)(36756003)(5660300002)(8936002)(83380400001)(82740400003)(4326008)(356005)(7636003)(41300700001)(47076005)(478600001)(426003)(336012)(186003)(26005)(82310400005)(70586007)(70206006)(40480700001)(7696005)(1076003)(86362001)(40460700003)(316002)(2616005)(110136005)(54906003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jan 2023 11:05:27.4476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27e1c20b-ac45-480c-5c53-08daf3c3bf10
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT083.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8339
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
V2 -> V6: no changes
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

