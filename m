Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99C64C4332F
	for <linux-tegra@archiver.kernel.org>; Fri, 21 Oct 2022 08:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbiJUImS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 21 Oct 2022 04:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229795AbiJUImR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 21 Oct 2022 04:42:17 -0400
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2089.outbound.protection.outlook.com [40.107.220.89])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86C9124E3AC
        for <linux-tegra@vger.kernel.org>; Fri, 21 Oct 2022 01:42:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JqwzBby5Wd3pulnfvy9jtntpIZrP6YMYPWfq07j+fzFo1Q6wOhCpjmAGe6oW4zSqwfFiqsndlNjjv7I3Hmov0xa/gYW28sniX6TeoE0mQpFNvB4JF1gkLjD7l6hHkHM5Be6TTJu4Uvyhp5sGFho1zP0RgCYjPzqF+j1PcNz6HBZB58XIfz8R0W57P1gukglEZkeEh3juK/ccISHnw5V5VFQlRN/KRS408NTV6BTiCErz8Fk1PnaGiEIZ0FzNNVeGi6fZgdbokGQgyL92QfyMqCjWo/fEGf3dm2MuXYkvB1R/pdVFQ/eVIsGUJEwH3BWIvOtT3ljocZaR9Nm3qRQK5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM/A0WIH/GzkFxF/q6myWG5gXkuSF77TryLzR39KYc8=;
 b=m9WHiFgjUYZYaVSfva9K+h2FVG6QWmE4cq7kizq9bRyl+xTEyzaBSSDFe742oUCiEfF3z5Wru19gjKQkT3umSuwGO+WCI2B3jCK1t90yn0uaVqCmGdaNS1ThpsAb7Zo6l7zJXOKkILQiMHERoQdMvZZlm0Rrhmhz+04PojRaaT3sJ+RpSnLuw01IjP2vWpevRl8cFTtiLkne9LgCAsCdEV8DObOxI+M1TjOGAsdhMlr9bWEMXsNLP7LB9fLEtDnxAjx8DLpq1NFO8uU1RkrMeTINKm8oFtl0/u5SJQQJ3DFVGgh8l7JhJmleYy58AeWaTB8OuCWDfChv6nThwzFCQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SM/A0WIH/GzkFxF/q6myWG5gXkuSF77TryLzR39KYc8=;
 b=Zh0slJNcJfqtqheZLLkem8t4dWXYoxJuMNzWGu0MsNhSQHNHG5BS4eP2MrTg/bOInfE96QQO6aS7Iv7VH6XFmsH+Ft1ZwVAaZ0AacT4hzuagq1uGcOohm0rgHjGEnpfTL8gJEF5z6qwKa7Xs0pln4IsF39oCUJGhbCoaOVuTdq2LLybRTTOAvjGPxOBU0mejlGjgva46BAigxgGq6jc9KtiNEbuI1W2xXiDLL66J3w3PbHsc88oBOet8D6LxZkgPQ7nhT3G6TvNy/QulROTzOzk0kOihcIRcz4MqLx13/vNMoSMXY20EzLG4aDTqEMR0iPVI1TKoOhRHJPE/YiaoDw==
Received: from DM6PR02CA0058.namprd02.prod.outlook.com (2603:10b6:5:177::35)
 by DM6PR12MB4579.namprd12.prod.outlook.com (2603:10b6:5:2ac::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 08:42:13 +0000
Received: from DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::72) by DM6PR02CA0058.outlook.office365.com
 (2603:10b6:5:177::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21 via Frontend
 Transport; Fri, 21 Oct 2022 08:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT060.mail.protection.outlook.com (10.13.173.63) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5746.16 via Frontend Transport; Fri, 21 Oct 2022 08:42:13 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 21 Oct
 2022 01:42:05 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.29; Fri, 21 Oct
 2022 01:42:04 -0700
Received: from jilin-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 21 Oct 2022 01:42:04 -0700
From:   Jim Lin <jilin@nvidia.com>
To:     <jonathanh@nvidia.com>, <thierry.reding@gmail.com>
CC:     <linux-tegra@vger.kernel.org>, <jilin@nvidia.com>
Subject: [PATCH v5 1/3] xhci: hub: export symbol on xhci_hub_control
Date:   Fri, 21 Oct 2022 16:41:57 +0800
Message-ID: <20221021084159.13954-2-jilin@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221021084159.13954-1-jilin@nvidia.com>
References: <20221021084159.13954-1-jilin@nvidia.com>
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT060:EE_|DM6PR12MB4579:EE_
X-MS-Office365-Filtering-Correlation-Id: 00cdfe13-1336-4835-bec5-08dab340269c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oL6tDBp56rTYJKdyDDQcsSYhQI6lDHycQDo5gTN1vNrOoXYpuub4gQoBw8qfva+o9pg03AXILcDknIKagDhFkYn7+R/o+Pk6D3Q4RY7xAv/JwABvzaJFPoSjwoyGW7zh1j67YC0ZV213kHFV4VAPxwT/FE5kFlskvpn6RcBseM33Tz1RJG/YrGNWzgRNvT+Dseg+1UmNArsxaWQ9qlNEIGppjEmG8B8VS260dURqesYTW39QtzEsMQ4Re7bTFWk9hd0LH9Hx8Q75uM+w5m/+a69yHeZDrAuaFb39pTOP2/75YOVDuOVFirK3wBSq/+FjqGf9VrQ4swBVHGp45aF44Av5bwHnJvOrlHJvoxy1RQXHVA9nNL0rRYn4rMnSOl1aQGFDJBUAW1AnIIEXY3GeWiaxwWYW9XZObVYaNOAmncZTVTN1dVSg6d/3jA9rxP9grI0dPP2b6oaw5j1ElevekZKrz3pJ9kFLWjlTz6qCLfHo+FDje8EU4w78EFf+xzE97jRV4KUKvuetBbF+J5GEkpM1xuHk/fV5Urx6i2xpzzXLgCX9+HiQn1KqzaNWpeLrDo/AcoHivOso6Gds0eYgy+ZUIJ5mlCmnYcPdITjf5raw5OELaa2wxoL+IHjAlHmdhxjxy//cZFaPUrk57qkSjeiUUnzow9Qw3KLcLl/iUml2Gkg/glwpkpIbVvdylXjHpzncdK94MeIn+kX7eJCOTy5+ReQY9mb+EdhaKmuK8Grg7ZDIGxgqWcglHAaZOlN7AuOrWwgxVme3swp5an67EA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(39860400002)(451199015)(46966006)(36840700001)(40470700004)(54906003)(86362001)(83380400001)(110136005)(5660300002)(4326008)(8676002)(70206006)(70586007)(4744005)(2616005)(1076003)(186003)(40460700003)(26005)(41300700001)(36756003)(7696005)(8936002)(316002)(336012)(107886003)(6666004)(2906002)(47076005)(426003)(40480700001)(82310400005)(7636003)(82740400003)(356005)(36860700001)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:42:13.1557
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 00cdfe13-1336-4835-bec5-08dab340269c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT060.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4579
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add EXPORT_SYMBOL_GPL on xhci_hub_control() for other driver module
to invoke and avoid linking error.

Signed-off-by: Jim Lin <jilin@nvidia.com>

---
v5: new change

 drivers/usb/host/xhci-hub.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/usb/host/xhci-hub.c b/drivers/usb/host/xhci-hub.c
index af946c42b6f0..4f20cdae2a89 100644
--- a/drivers/usb/host/xhci-hub.c
+++ b/drivers/usb/host/xhci-hub.c
@@ -1604,6 +1604,7 @@ int xhci_hub_control(struct usb_hcd *hcd, u16 typeReq, u16 wValue,
 	spin_unlock_irqrestore(&xhci->lock, flags);
 	return retval;
 }
+EXPORT_SYMBOL_GPL(xhci_hub_control);
 
 /*
  * Returns 0 if the status hasn't changed, or the number of bytes in buf.
-- 
2.17.1

