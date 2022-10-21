Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 980E7C43217
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229736AbiJUImU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:42:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230138AbiJUImS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 04:42:18 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DAC2024E387
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 01:42:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GC6bBM5G1cEY39edu0QqUVa6YTSQXMlWHpxOp2LMU3V8XS1YrA697jEDMekj+zXJt4bh/w/Lj9dLmUgw94vbTTG7iG07EzSvgk2Gy/yVw0qFLIG6K5jw1V3PRN67xHv0bSKJAUx+9EebIg25S9qy1uVW2AHOP5mO8dAm2l2PTKkhN+MyN6PCu/a/g9Ujux/gGEvZKCgWTHdzc2Zyl5wFclgmyp67fdZ4730zkkwta7BrphPXrd6Qg93zAR4H7MKHWoV3DkkSYoA6h1yBgT5e5+BLcLJIa59B7TDuYGOj2PAPF5BqJdw9xR6+9PbMRpUZejJ5NVHcLReytXxPFKeAmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J0mLcsnN9bOL2ZI5/K14w7oV2ubzH+mMbLDegToQKXw=;
 b=WTdPsprVFwRf6jkgiHuw/5vlDmfJQOnYUq1Dj8Kop4dHVoVT0S38500RF1rwoqaQXRF6EUbRK7pqbBJBSmAxdDK2pSSgIamr64wItA5Cj7AEsNcYSYCsQIji6iYopQwJqfAzrb58GRoU7rnKKGO/1je24rXWDmURSJiL8P0Twii96TMbsd0rjwlHvmqbZ/4J4PIJdHqgWzNHRG/i0xYGdgApuy+H13lWn3jNqA9zzRot5oZWNOau4MBLTk40/d3lvehuVAIhKs3KUU/f/R1YLVixFo/H2jC0r/nu9bVSSM1Jca4sPtSeLxM/Yr91lVjm6URHPbYx/aWhmTT/6Rpslw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J0mLcsnN9bOL2ZI5/K14w7oV2ubzH+mMbLDegToQKXw=;
 b=ucXOQcBD/Ezzcn+bJsCocgIRC0sBj1kFuu1dE49Sxjns4fiQ64oA3wVrDpuPb4tLHZTkfPGzTnbvf9FCOvFXUyutPV2RqZtKfWsLbn3PM1M2euaAUoYVoufOopWzzztE21q0aYBlstubvl/kBDrxLch8vPzqGCW37WhKTbF7VIFKY13GlM4NZKmpXgeyvVaU93ts6UC2DRX+aY4/l1GJEPB+Z0kY5AW/aes3U0XoKCrIGW+rWBHhmefmYjefAefBnCZ3iWH/s4D090r2FWFPMqinLSTo/fAYyJHQxzhMjpKxoK1y2NTcT3XELLyK87TUg5vbQfK6ak5SlbblFFGAsQ==
Received: from DM6PR12CA0028.namprd12.prod.outlook.com (2603:10b6:5:1c0::41)
 by MN2PR12MB4357.namprd12.prod.outlook.com (2603:10b6:208:262::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 08:42:14 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::75) by DM6PR12CA0028.outlook.office365.com
 (2603:10b6:5:1c0::41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.35 via Frontend
 Transport; Fri, 21 Oct 2022 08:42:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:42:14 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 21 Oct
 2022 01:42:06 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 01:42:06 -0700
Received: from jilin-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 21 Oct 2022 01:42:05 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <jilin@nvidia.com>
Subject: [PATCH v5 2/3] xhci: Add hub_control to xhci_driver_overrides
Date:   Fri, 21 Oct 2022 16:41:58 +0800
Message-ID: <20221021084159.13954-3-jilin@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021084159.13954-1-jilin@nvidia.com>
References: <20221021084159.13954-1-jilin@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|MN2PR12MB4357:EE_
X-MS-Office365-Filtering-Correlation-Id: ecf9f32a-4e33-48ca-d00a-08dab340274e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: TP9Z9AQsWJHCz5jsUACrdYEweBcmB+/txh8JL0cnrRN2E+dS7Cqr3m4DXPqnuQk8d6qTK9bPb+8EjZzrDLT0wpnjkb67dy1cgJ3QftDUDWACqcc8YzDG5qYFqTv9pJvNNh+kCzG60vHna1neG4Rk7Ieh0HEi1MXBCRfrlkASW6GF2vHM2CRsNBX86qQ+Be8030GUcTpzpRS5paWtVPfE/dTJl6kKJCKJ4ofCIxnOz/zOsLzFAAHnWLVcyet2/gpwvcM6ZJKVbT8M2XmINvzHRg62kd2PO4gwGGAtpzdyaue6HUqvqWQShu0WXJPQtcVWoWJfoTIRIloWeKmNh0GkuRzAtM5KPdnYYt29RaNcI/eaN2PQ40a+LDFIqHt/2v/X0CG1qfD40D31MgADc2E1P4UJCmqzBXtOZvmMz0xUQ6+BV3WVPoyHxo47pgybj6cLhp5OVFYxZ0kiGnZKL2jwi0k8rfHzDMKUEvvm+rIZTNK4q2Bgy6j1sODSm3m1GUpH0/00wPtPxNbf+bUQgkMmGnpPF8Q/JJdpsOyQm9BRx1zMRe6+9KI2IeBWLKIlPYlfw4usQWJXsoPZYoL02TzcRZh4iTbhK4TOw3dIcPr8jLHB9lCqtuBYyoAm+Wk8GUBolJmqcu7jG2ZeNc/diVqrschDPIIOVVustvN6ciAuFr+9QPcMrE9ca/KCjQS3quGxtRhRy4ac8zEa0G1Uax65HewjSwEI+XCloaXv7DXVyUBg9v4Gn3XYJmM2Mb5Wq4F9vJGKEdtIjX+yQMSkCZmFLw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(136003)(376002)(396003)(451199015)(36840700001)(40470700004)(46966006)(54906003)(110136005)(86362001)(8676002)(26005)(4326008)(426003)(47076005)(70206006)(41300700001)(70586007)(5660300002)(336012)(7696005)(36756003)(316002)(8936002)(36860700001)(40480700001)(107886003)(6666004)(1076003)(82740400003)(356005)(7636003)(186003)(2906002)(478600001)(2616005)(82310400005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:42:14.3226
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecf9f32a-4e33-48ca-d00a-08dab340274e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4357
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add hub_control to "struct xhci_driver_overrides".
Add hub_control to xhci_init_driver() for platform xhci driver to
override it for local feature.

Signed-off-by: Jim Lin <jilin@nvidia.com>

---
v5: new change

 drivers/usb/host/xhci.c | 2 ++
 drivers/usb/host/xhci.h | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/drivers/usb/host/xhci.c b/drivers/usb/host/xhci.c
index 902f410874e8..3c7bf0a0e0b4 100644
--- a/drivers/usb/host/xhci.c
+++ b/drivers/usb/host/xhci.c
@@ -5461,6 +5461,8 @@ void xhci_init_driver(struct hc_driver *drv,
 			drv->check_bandwidth = over->check_bandwidth;
 		if (over->reset_bandwidth)
 			drv->reset_bandwidth = over->reset_bandwidth;
+		if (over->hub_control)
+			drv->hub_control = over->hub_control;
 	}
 }
 EXPORT_SYMBOL_GPL(xhci_init_driver);
diff --git a/drivers/usb/host/xhci.h b/drivers/usb/host/xhci.h
index 5a75fe563123..f5a17c75c144 100644
--- a/drivers/usb/host/xhci.h
+++ b/drivers/usb/host/xhci.h
@@ -1943,6 +1943,8 @@ struct xhci_driver_overrides {
 			     struct usb_host_endpoint *ep);
 	int (*check_bandwidth)(struct usb_hcd *, struct usb_device *);
 	void (*reset_bandwidth)(struct usb_hcd *, struct usb_device *);
+	int (*hub_control)(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
+		u16 wIndex, char *buf, u16 wLength);
 };
 
 #define	XHCI_CFC_DELAY		10
-- 
2.17.1

