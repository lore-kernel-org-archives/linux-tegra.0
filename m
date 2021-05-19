Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24F1CC43460
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:36:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2FCB61353
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:36:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1354967AbhESQh3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 12:37:29 -0400
Received: from mail-dm6nam11on2074.outbound.protection.outlook.com ([40.107.223.74]:49344
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347383AbhESQh2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 12:37:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g8j04amX2t9oyA4pmzfbS7hSBDHcAUtTZej228caDWnIPArIvGb1XsvC62Go6AA1243TosBNFze5HsnA6DUB23NLH3+hiKGCDHO1kaegfPa9TuTOv48doM7lfNCTBRdz4wjBGbNtk4lJ0WVs43t004ufdxvERtjKZDzFZzh9yzzxDBeLmOU1gVF0yXt1szLD9cozkzITDmHiaowIyV2PF6g5X0j+cOeew7Tqk565uBHAm5x+cIg1LluBWPcbIeDH/t6HKsWNxqPgD+ASuE8gPlz5qnVr95yLVHwNj67kQDj65mNKxCtrlXOeN95k0R0gbMwwkOzR14SBqbHttqCZoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5phPIq361jOiAfWusI4aLUSvUHoRzob92PocHDIXgQE=;
 b=WEWllNYtd7zqHnWxyHWS1FgLAp/MtB86j9gPSBnhz099qgR2WV1DagFrH84wh/gKf5Kll2o5Y01Fnq91j8+0TJGxd1/VWd+AacV+1C/dtP6niUBcrhu3+h9JUgmvi7EjPsjPcUF8Q94N4RLAJ2fb4HVbJ76UIy8HHTqLD4xdGE/Onr9iRbB6NM2h2DsOejAF1qR2T0e8Wod3V3osZmDlzJcSNcww5p11tB2t9OIE/idk8sYDlGam1j8B67dY6yuG/cG0+/xqerY1WsU/IaqHqkYKSSDAb3yJRwE/6+nL+WdDzSEI/MEnjUYJjdDLU84M8fxxuQsGuJDcHL4ePlcI1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5phPIq361jOiAfWusI4aLUSvUHoRzob92PocHDIXgQE=;
 b=RgRYfYmj2u6VIBw9HPu+hsmWXu7ndFYUp4oNCPgk66p+D4/T14OhztctkMYcmLSR8GvB55LM0muqLjqXML9NbmCQEF7jTeYVFsRZQKps/oRsYs/bmzFS+0MOGnce3JSs47veSbztHkOvcAwxLr/u5ACWDtAvdvS4y43nRC8UBxirKWaGWznCGNLHk3nfyyOzldTsu2q09KBFxwwYaMr88hyqFMEGOsvQZBYdQYp64ixBcMirI56p+vQbBaCttJx8cHVh/HaphNhXzHgB5O63BNS6nKYh+yb7pSjBKMc4qWoZpWzQMh6hNbiVowUTaPLE97K2yK8d+1k8gv2wZRDA7Q==
Received: from CO2PR04CA0174.namprd04.prod.outlook.com (2603:10b6:104:4::28)
 by BL1PR12MB5334.namprd12.prod.outlook.com (2603:10b6:208:31d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25; Wed, 19 May
 2021 16:36:07 +0000
Received: from CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
 (2603:10b6:104:4:cafe::99) by CO2PR04CA0174.outlook.office365.com
 (2603:10b6:104:4::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.25 via Frontend
 Transport; Wed, 19 May 2021 16:36:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT043.mail.protection.outlook.com (10.13.174.193) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 16:36:07 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 09:36:06 -0700
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 16:36:05 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] usb: gadget: tegra-xudc: Use dev_err_probe()
Date:   Wed, 19 May 2021 17:35:53 +0100
Message-ID: <20210519163553.212682-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210519163553.212682-1-jonathanh@nvidia.com>
References: <20210519163553.212682-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 439d35c4-9dbf-4182-4722-08d91ae433ef
X-MS-TrafficTypeDiagnostic: BL1PR12MB5334:
X-Microsoft-Antispam-PRVS: <BL1PR12MB5334AF726FEDE6D861C67510D92B9@BL1PR12MB5334.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:220;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TcnS7e1dilWXZoJlElMHFb9b/ly1dhzWoJ8brKA3LNdpqso6FDFZcNfNt+5HZaF9/14K4ZahkG5unRQ1xmCYyq9rz4U9a3B7yKebR+WbYjLOPD8K+snAT3jBellYphxc0adRlr0wssC2/WOoMC9qyhpIFNODP9GAoWc1plOZP7ePnN0EwCtL2LFhEpn6Z4f1m82Sbx6fIDGgGdFdUaMo+cdVU4lkuFjJU6f1HnqDWbcJc4hVQjIbX6SAF1v89bDKTKhAfvVrE2ECUPKB0OhsUJ0xYtlPmRZ4+eACy7hhrMBS85Lx5PndRp8utrgsZXRfmMKsT1qyBFFUQiox/cG7KrtybTk/S+MenQ6AP2uxNug3NkZH3bipH4QXroDAemuWhEIsPxNt/q3Q4BDsR2pV7iL3tptYpqygeq01Et9253Yg3IsvhV5qujjy4V3Q9gsEbWfYzA1e6GJg63kQoa8wRwdMIUcEPJr4464y54EaCJsvK2/pQhpIGMhGL6f7rSXBmaclo9ZoQL5kUMN0XF4t1dmPgOLaMkHbsLdJuVUxf3FzEtbzSHQeSKy0qJwv/ZiK3rU8tf6ft4Vt+1GJlJgCdgaCUI4W/m+LkfllU8k0aCV1gkCV+69/J+IrO2WQY82Lz+KnSDwv7vXYy7CBXrzw5A==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(136003)(346002)(36840700001)(46966006)(426003)(70206006)(2616005)(5660300002)(70586007)(7696005)(316002)(6666004)(4326008)(36860700001)(186003)(36756003)(47076005)(86362001)(1076003)(110136005)(82740400003)(82310400003)(356005)(7636003)(336012)(8936002)(26005)(8676002)(54906003)(107886003)(2906002)(83380400001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 16:36:07.4711
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 439d35c4-9dbf-4182-4722-08d91ae433ef
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT043.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5334
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Rather than testing if the error code is -EPROBE_DEFER before printing
an error message, use dev_err_probe() instead to simplify the code.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 20 ++++++--------------
 1 file changed, 6 insertions(+), 14 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index a62bf095954b..a4fd4ee6770f 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3508,10 +3508,8 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 		xudc->utmi_phy[i] = devm_phy_optional_get(xudc->dev, phy_name);
 		if (IS_ERR(xudc->utmi_phy[i])) {
 			err = PTR_ERR(xudc->utmi_phy[i]);
-			if (err != -EPROBE_DEFER)
-				dev_err(xudc->dev, "failed to get usb2-%d PHY: %d\n",
-					i, err);
-
+			dev_err_probe(xudc->dev, err,
+				      "failed to get usb2-%d PHY\n", i);
 			goto clean_up;
 		} else if (xudc->utmi_phy[i]) {
 			/* Get usb-phy, if utmi phy is available */
@@ -3538,10 +3536,8 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 		xudc->usb3_phy[i] = devm_phy_optional_get(xudc->dev, phy_name);
 		if (IS_ERR(xudc->usb3_phy[i])) {
 			err = PTR_ERR(xudc->usb3_phy[i]);
-			if (err != -EPROBE_DEFER)
-				dev_err(xudc->dev, "failed to get usb3-%d PHY: %d\n",
-					usb3, err);
-
+			dev_err_probe(xudc->dev, err,
+				      "failed to get usb3-%d PHY\n", usb3);
 			goto clean_up;
 		} else if (xudc->usb3_phy[i])
 			dev_dbg(xudc->dev, "usb3-%d PHY registered", usb3);
@@ -3781,9 +3777,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 
 	err = devm_clk_bulk_get(&pdev->dev, xudc->soc->num_clks, xudc->clks);
 	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(xudc->dev, "failed to request clocks: %d\n", err);
-
+		dev_err_probe(xudc->dev, err, "failed to request clocks\n");
 		return err;
 	}
 
@@ -3798,9 +3792,7 @@ static int tegra_xudc_probe(struct platform_device *pdev)
 	err = devm_regulator_bulk_get(&pdev->dev, xudc->soc->num_supplies,
 				      xudc->supplies);
 	if (err) {
-		if (err != -EPROBE_DEFER)
-			dev_err(xudc->dev, "failed to request regulators: %d\n", err);
-
+		dev_err_probe(xudc->dev, err, "failed to request regulators\n");
 		return err;
 	}
 
-- 
2.25.1

