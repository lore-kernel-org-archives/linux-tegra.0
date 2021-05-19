Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDAB6C433B4
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:36:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A2BEC61244
	for <linux-tegra@archiver.kernel.org>; Wed, 19 May 2021 16:36:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346964AbhESQh1 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 May 2021 12:37:27 -0400
Received: from mail-co1nam11on2050.outbound.protection.outlook.com ([40.107.220.50]:20768
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1347383AbhESQh0 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 May 2021 12:37:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iJvb87ZJ3n6Zi/7rCkKNxmyoG/4b8WN7xvLSOpNuG+T/R02GMMeJO1uyTHb6NMl/Yk7YPfoeSAWfDUkxTabvq1KfbAp7rWPGrGaBR0/O3H8O2LLJvGc6Gk2WRX/pjOm68MCsVL3oK3Cvc2P8k4Qv5RiAKelZQyoztZp1SMTokiqGUbAPdwx0YsjD3sej+K46cSBvaNnNDhpB4PuK9JUOt/tr3nb8YJ359ftW2xKCeF5F5iirPKgw9RP3YDzpDmlO+hfVNZhpO1nbb7iZCyCxkwILVnF/fN6YVTVguwVIPtJec63BW4VEkc5lC9fPq7RgauOhhwIBu1OiBdbYam9hqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sda9LWtEfKPrKlCcNlFHgu77jjlI2bP/I6NrgFOmqd0=;
 b=Kc2sgvZoQHYq9l4xRYn4EHjiqtehCcFjV7TSqFDKijCV6qCVKp2Spj9yIEMaiLmD3Fwo2mnBMCmY/uQ79GSFJxN1szuWIBPu40g8HFlg4ntE+XNgVBq0ekJDtm928islL+BQv6ZgijNj1X96OZwUC36iirC6K8xoAg8i9T11XhWpqTjr93/mdItr2YcO1zu0VEB2DHEMmsFzWUTx7Qyiv69yx1zF9y+S68k9R/s2owOykqbtSjkB6olQpF0+1PfkLUWHoX7fV9HUuBk39xn7DNBqX9Zv9pfkQ9wZXgEXN5I2hdfg+SV8+CdG9Mdx7K1uC97Hhccta90lubCi7Wpu5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sda9LWtEfKPrKlCcNlFHgu77jjlI2bP/I6NrgFOmqd0=;
 b=qsehwjgYsQLxbV5ZWQ+jdsaylQQkf2cDMnMDr91KmJiz4Dwp4In+xkbZ17VenJ+xN0VHh3ztm0yGS3ZX2J/wNUb7Yk+hqtn008a6GmJbuZuPTALbWJScSztaot8avYIr44uZYFm3vGmcsXkwmwslisUJRfsOdkLepn/ieENYgpG8UTIdMZybqipv8b7Vb/F6gakZ2ex+MwxVTHEos33AGENp1gCrS7XVCNftCYPLFzyRTAW9fEi43usrqc+dnJkruhCtJBQtksSsYSAKCmmmKSK98JOnRPYkKhIxaarnG2pm2m1DnM1UwTafBvFxcBoEWIDAcJ++wF1vA4z4VFlZSQ==
Received: from MWHPR22CA0012.namprd22.prod.outlook.com (2603:10b6:300:ef::22)
 by DM6PR12MB4299.namprd12.prod.outlook.com (2603:10b6:5:223::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.26; Wed, 19 May
 2021 16:36:05 +0000
Received: from CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:ef:cafe::56) by MWHPR22CA0012.outlook.office365.com
 (2603:10b6:300:ef::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4108.32 via Frontend
 Transport; Wed, 19 May 2021 16:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT007.mail.protection.outlook.com (10.13.174.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Wed, 19 May 2021 16:36:05 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 19 May
 2021 09:36:05 -0700
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 19 May 2021 16:36:03 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Felipe Balbi <balbi@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 1/2] usb: gadget: tegra-xudc: Don't print error on probe deferral
Date:   Wed, 19 May 2021 17:35:52 +0100
Message-ID: <20210519163553.212682-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7cd566fd-2338-4088-e1f6-08d91ae432ca
X-MS-TrafficTypeDiagnostic: DM6PR12MB4299:
X-Microsoft-Antispam-PRVS: <DM6PR12MB4299AE76CEC7CA537004C740D92B9@DM6PR12MB4299.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1728;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IIvEKAjYtAmXVO/6sukCV18oTIHqsKjmR61FhtmTLQ/dJdGoxf15W6mY1y9byzedZdgV7nyhdr6amJr5Yu+vQbnc+xXA+L/NRcpm+2t+XSfs7GCRxZG9uWstQLBz0sPnC8EzSvTraR9Sd9g1UrU4e2Ke2vDHVtsJxfuWKOxy0ClsfsflmNzUaFjNM1wf+ZZpxrCjpP7mjT2n7E3VcWnys/+e+/uezEZ71XQvjZOPjTf7lM5JhalJx+Q0m62ov65k69eiWNtF+GZBhsPJ20JLNl3v+NWc3NSZqcTpVIRhyJt9atVA4e4oKYD0+7Qn+LZFYaCc5ERCahs1rQOWsfQVNSZOCNeaIGC2kk62hmfpaPS2kGMFWj7SUO7HenDB1EJ1ruG3B8WPWeip7gn+IjhXsoLwztO93stOyjfYXELfbDVyfNTjeoq36ucKqr4n0uV/PolOBnHhIndPPc36wt3jRW6xxuTQ9GAtKjcHiau2U3csN/uZXJowijnUcS+MRqZuJQIR5UbktESQ4y0VRlyF+Js9+dX3nqafybBIPrTacyjuY03q1+ct/zyQLzo8YrVcBCzgdfhVkUeC3jq6EuxCRPKPrcd7TUStJmsyiSE2XKQ+dLcqO0/uULz+5DsgOkYNGqnosukW4Fx0GiOAcwesICSdsoGB5xooTCtx32dip2w=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(376002)(346002)(396003)(136003)(46966006)(36840700001)(7696005)(26005)(2616005)(2906002)(316002)(7636003)(1076003)(47076005)(70206006)(70586007)(356005)(4744005)(36860700001)(86362001)(336012)(426003)(8676002)(82740400003)(82310400003)(5660300002)(36756003)(83380400001)(107886003)(478600001)(6666004)(110136005)(8936002)(54906003)(186003)(4326008);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2021 16:36:05.5579
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cd566fd-2338-4088-e1f6-08d91ae432ca
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT007.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4299
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The Tegra XUDC driver prints the following error when deferring probe
if the USB PHY is not found ...

 ERR KERN tegra-xudc 3550000.usb: failed to get usbphy-0: -517

Deferring probe can be normal and so update to driver to avoid printing
this error if probe is being deferred.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 2319c9737c2b..a62bf095954b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3520,8 +3520,8 @@ static int tegra_xudc_phy_get(struct tegra_xudc *xudc)
 						&xudc->vbus_nb);
 			if (IS_ERR(xudc->usbphy[i])) {
 				err = PTR_ERR(xudc->usbphy[i]);
-				dev_err(xudc->dev, "failed to get usbphy-%d: %d\n",
-					i, err);
+				dev_err_probe(xudc->dev, err,
+					      "failed to get usbphy-%d\n", i);
 				goto clean_up;
 			}
 		} else if (!xudc->utmi_phy[i]) {
-- 
2.25.1

