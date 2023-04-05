Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B87EC76188
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 18:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233423AbjDESTX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 14:19:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233171AbjDESTW (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 14:19:22 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2074.outbound.protection.outlook.com [40.107.244.74])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 230A565BC;
        Wed,  5 Apr 2023 11:19:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hWflxJGfay7HriVW5y8rDgoiX1qX+tKMSNq01dj+bPU/MfMP8PZ+pLnIRqPVDY5Er9qQVlP22hebL5CT7Zf/ThI6cRF6SIa5UTWovkfT4HxT7aPqqkrim/VlMVlL5yZJlYcYnzjwvbZ9RhtlOqFQLw3gm3L0LKzdYaVumXJubyFLjFYEY1o+GPb6rK8K5AicDt6AewE87M6DbiOPTnJ3IJskRiTyheoO73d4PdaX9XSeo6jjonD8O33ZgU3DgaLdUpwrdr/ve4P7JHdI5he2hXeRQptNekXMxdVAiUO8l+0HU8MAc6ganLUGLclcQXwTfBnrKdCmtnG9rKpbBoF2VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zIVjWz4mZruIUfOqrol0plrlBIuKdOWi7ZloQD3+EPw=;
 b=CF4pDEUYQgQduWIpON0OtTZmh7rflorEF952ShoNpximem5nN+EKAVsB8CUXlLUjakbMeyDPW8x8bDAOYthPeYd5oGjSqKmeGrmAi/AiTx7Mr4yBkRWc3A0nXt4cPY/G+hC7Y/8aPMmTE9HUhxsk3WF7m+5BMU+1xYKf+w4L9Ju+DGkAiXjhlk9oraFOIuy39Ms/KOBDC13x1OBd1j0PQEBkgW561AKC/s0F+tmZsjwf2uvEbqwmEiRGwMCdJn278JmZh9hYq1y7FqHAAZ2NiRJlRFfiSznxhHp96JgfHnisxcrnh8NktuQz6+yJn/x/Tberp4nqfybwU0AplpJhUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zIVjWz4mZruIUfOqrol0plrlBIuKdOWi7ZloQD3+EPw=;
 b=t+22IIoQt9uE1qm4erQXNL0DUXahx5Mm9Fb98KahtVb0JajSF1HG478980x0IioNfnd/IYfHXwnrAupP2FkywaEtxNRz7gJd7Z4i5h+lxFRu6qxLRct1OkqFRm2mWC4DE0fz5/0m3D+O7BKk0OzC3NMwPK08FKuofUBojFE+UVORJ4J3AW/X5JNmQ2ScKFMWaJ923/nodAv4rycCxKUFB7t94jTCyy1jRF6jsDWTVH3pkaaAaghsUbqitaguJwN4vFYWcv/VNoq5hb826WIoyH0LhvGH8AafQGv6jG54XtHGhIhElCcyP8E4BtI+yWG45kFtkZHPBTP30ctcBSF3Hg==
Received: from DS7PR05CA0091.namprd05.prod.outlook.com (2603:10b6:8:56::12) by
 MN2PR12MB4566.namprd12.prod.outlook.com (2603:10b6:208:26a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30; Wed, 5 Apr
 2023 18:19:13 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::78) by DS7PR05CA0091.outlook.office365.com
 (2603:10b6:8:56::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.30 via Frontend
 Transport; Wed, 5 Apr 2023 18:19:12 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6277.30 via Frontend Transport; Wed, 5 Apr 2023 18:19:12 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Wed, 5 Apr 2023
 11:19:07 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.37; Wed, 5 Apr 2023 11:19:07 -0700
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Wed, 5 Apr 2023 11:19:06 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Nagarjuna Kristam <nkristam@nvidia.com>
CC:     <linux-usb@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] usb: gadget: tegra-xudc: Remove unneeded return variable
Date:   Wed, 5 Apr 2023 19:18:54 +0100
Message-ID: <20230405181854.42355-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230405181854.42355-1-jonathanh@nvidia.com>
References: <20230405181854.42355-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|MN2PR12MB4566:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b7cb989-962f-41ea-5200-08db360241fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oJ0/UqJ5KaTqcHpe/+0aqmGmqdBkc/dECUd5TnL2EdbCf40XsI5eOHn++R5uyCtbZPW0+0TeY4dx0Tus5cZO2WKiZqBGS0AwLzCrT8MfJGil9V+w9pDwtb5kRQAGNpEheIOh7mwuyqZveY+yMwVTH0ZaEucn5kI63h2TfZQk8vXt0VkHE+jfTS7KVHdMvxoLXh1SBy7fBRwO1Ey/qNILdj6m6+4l12Ukkg4GDoqcQSpHmPNoRIgiRmVrrvxnkmGanqwK0BAsUJIm5bVWvGXO3uIQiNUGm52ije6RoHZDusY+sp2l/dj1djwR8zEcpu5HWE6bD0BysKgShT9aX1SY71Qg44IwdaZQWC4tMFwIB9xCXL66jVuA6fjZp46Zeibunc19dJoCnHCLBY1hX6o8uAdotE8ap/BfVKNBTHEt9hKM80jQ2G+0W6VFiP+ujpNMKtS/NRQ9EZ1u2/EjwRV+8FZZtlqbofWp6fn5VRgk2Ra2W7qh988LmheSCn4DUSLmjpxQ+nPgbtc6L/VS86c+Qmsu+KZnx8cmnYBkSu51F2RfvRXPVRO49zZzsEeyz9+ba6ev6GWRuKJETYj4fuNSPZelMfD/rEuYhg0rIYe2z2dPRi6YRZ0/H/FTjrTiUc1UWkl+OCdEM2boZ715Agzz6vqN4m352HXChIP3pIitHUB/6OMuvbuGgAnwKYPC3Oav9VMvNjRVESC9nD+ElwPFKQ4swlP2sdCml//o4UvfD6tMS7Dv+LMiwSHfY1QG1Iit
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230028)(4636009)(136003)(376002)(39860400002)(346002)(396003)(451199021)(36840700001)(46966006)(40470700004)(478600001)(8676002)(4326008)(82740400003)(356005)(26005)(1076003)(5660300002)(40480700001)(8936002)(316002)(110136005)(6636002)(54906003)(426003)(336012)(36860700001)(47076005)(41300700001)(7636003)(70206006)(70586007)(7696005)(2906002)(83380400001)(40460700003)(82310400005)(2616005)(107886003)(6666004)(86362001)(186003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Apr 2023 18:19:12.6293
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b7cb989-962f-41ea-5200-08db360241fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4566
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The 'ret' variable in the function tegra_xudc_gadget_vbus_draw() is not
needed and so remove this variable.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/usb/gadget/udc/tegra-xudc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 5bccd64847ff..34e9c1df54c7 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -2162,15 +2162,14 @@ static int tegra_xudc_gadget_stop(struct usb_gadget *gadget)
 static int tegra_xudc_gadget_vbus_draw(struct usb_gadget *gadget,
 						unsigned int m_a)
 {
-	int ret = 0;
 	struct tegra_xudc *xudc = to_xudc(gadget);
 
 	dev_dbg(xudc->dev, "%s: %u mA\n", __func__, m_a);
 
 	if (xudc->curr_usbphy && xudc->curr_usbphy->chg_type == SDP_TYPE)
-		ret = usb_phy_set_power(xudc->curr_usbphy, m_a);
+		return usb_phy_set_power(xudc->curr_usbphy, m_a);
 
-	return ret;
+	return 0;
 }
 
 static int tegra_xudc_set_selfpowered(struct usb_gadget *gadget, int is_on)
-- 
2.34.1

