Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74D05C678DC
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:22:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232515AbjAPPWp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:22:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232127AbjAPPWA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:22:00 -0500
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2044.outbound.protection.outlook.com [40.107.92.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C1634C1C;
        Mon, 16 Jan 2023 07:19:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=F59GhJndZkJEj+1nN9nZDHhjTeCIVgBb5+Hj+1EFPg9GPiCcJ4eZ3l+AFHLDjWt2Z0h4t9lGztb1p3kD99LQr/ZwJF8h1Ti2WYPwPQbONNqfwQZUtbW9MOYE/aM7gj59GMM0sgnmK2mcHwqDCTViGUywQ/x8f61bgXR43UgpzHEJoQhZpG9FisKVWqra1tUmyRPJVgj2BnmTw4J9Z4O+HDkb+fRzCENdtaU74T/hbN/eaL4StBjH1T1B8msQDZKS5iAsc8gqfRIF4Y0H///S804TYKMwWBNkaIfZ2qiT/hUGS8REpvYGBMYIFd7OeP8qZbsHq6d5XkXrw2MlGPwD7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wzVpI3jrPa3M81Cy968FcWv0NJdn9w7ErG4UubBrYw=;
 b=mzLKT2rG4F5xpo5OE4gPQgJWRJpAsDStKwvJKrGJfM9owG6XXpcDimc+ZD3w6gtkDnA8svR7shI9P+p1TtZZvEoeNc5qSP8Ggi+9Lu0iHfDfB4IRfh1lfq9QzAck75bS9q7HOJpVk5JNNKF0afteJEr/MeYoq5r75w0iO4UZ9Ti7hm34YAIJ09ylKLtbnYqlh65WrrbVIj08s8TpgiHuVLl34uLlQoe7hdFARoaezbhVEB/PyYNn3lTkO9fFeGMCCS8OUk4laIgaZuYENtf/hjc27s0uc/O8fuSx8DckIjA3OaZgeiNPy0l/P6amqXavJRYmhVCgusl3AYe8oaz9Sw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=gmail.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wzVpI3jrPa3M81Cy968FcWv0NJdn9w7ErG4UubBrYw=;
 b=VdZZy/lsvLOqEMOiSukO+89h4dypZ9j+7Ivzd1C52u3X+u2TxbRVU+jrzdTsp0R3VyP+p+wCwe0Gmf3eEsKLVZD/IB8AesRmDBVW5rIkDkYGGuttgAvNdCiLjeB+NHtVDgKN9a4s9Z8OEF8E22RF6WeFnGe+pm7WvAqqzAetchsDwMmX/dkQRgzNVyNGgqShP09f5scGiCaU1jrNjGJC6m9GyvTEqGywopvW4aNMBWD7zxDASzkOrro+WAfho7EZUn+kLANw5H8cXiWfFzo1fFxMRlzir3cgusIbP1uBExLwvZoH9TP+yxe+TCiVdhVqG/Rkx0D4wzRCituo6F2g+w==
Received: from DM5PR08CA0030.namprd08.prod.outlook.com (2603:10b6:4:60::19) by
 SA0PR12MB7075.namprd12.prod.outlook.com (2603:10b6:806:2d5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:19:45 +0000
Received: from DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:60:cafe::6f) by DM5PR08CA0030.outlook.office365.com
 (2603:10b6:4:60::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:19:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT042.mail.protection.outlook.com (10.13.173.165) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:19:44 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:19:38 -0800
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Mon, 16 Jan 2023 07:19:37 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:19:35 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sing-Han Chen <singhanc@nvidia.com>,
        "Wayne Chang" <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [RESEND PATCH V4 4/5] usb: gadget: tegra-xudc: Add Tegra234 support
Date:   Mon, 16 Jan 2023 15:19:16 +0000
Message-ID: <20230116151917.94193-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116151917.94193-1-jonathanh@nvidia.com>
References: <20230116151917.94193-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT042:EE_|SA0PR12MB7075:EE_
X-MS-Office365-Filtering-Correlation-Id: 54627baf-fdd9-4d34-ed37-08daf7d51934
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rxalbaJLofiTsPk1t+zDV4gStGYocHk9onvWgZ5KLouOid2kjqWVP226q2RNpgDHBPeCzzjbElOeiFllOyXTqhp1ItYRlznxKC5+N9rAxO15XlWk8SyVFZKqSjAKVFlpefU89ayyHB92JSccOwppPTy8gC26HAvCf7R5STAJTZpYxnb/njM2HBsa/AExAP1/OnApoiOMIuj7/wNzqWaOl5Dmo130NzXFxMZ3U12Vz0RzrRo1xvuNA0OO4StSXqyNZcwDyyocYQfJHd6DwyJ1oI6SlWOFhnlzhet6bNve6p+XI80UmUWjIQk6auR/bmzsyQzQOdGKHp88FRxf3e864Ikh3ZXa5PdcDVVapkNsNegTO4nVEp7bRrjwbZynyJZ5SMOoJB2h7SFWV1ypiNYJ7Q17CXZryCOq1YbjkjNxJWHUKEUGyc+wIDo2u7n3/XkNmF60Eato0pAy92srP9vlWfmJPIajbKneTu+KFo8Oy2RSxnnN3h9a0s2R6fEBWSlI3Ou3ZDzlbWSv/pOMETXasfMuwHCdxo7slDsfdn5u0tMawUXqI/PShzdQj8Isw6491jRvaY5re2tp/qMYERLN/kl49o7Y03cK64HeQAL2DAgiP3t9pOmLpvo7O7IE5XPbjAnpqvAhdNY8eD7gkjFVekB6cWWhniZSIDTke89NBl9oPPJ8kxF9EQ0gij+HfUtlTGgBdJ7zVhyR1miDuYCPmA==
X-Forefront-Antispam-Report: CIP:216.228.118.232;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(376002)(39860400002)(346002)(451199015)(46966006)(36840700001)(40470700004)(86362001)(36756003)(82310400005)(186003)(4326008)(8676002)(26005)(70206006)(426003)(70586007)(2616005)(47076005)(41300700001)(316002)(40480700001)(1076003)(7696005)(110136005)(54906003)(6666004)(478600001)(40460700003)(2906002)(7636003)(356005)(82740400003)(83380400001)(36860700001)(107886003)(5660300002)(8936002)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:19:44.7933
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 54627baf-fdd9-4d34-ed37-08daf7d51934
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.232];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT042.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7075
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Sing-Han Chen <singhanc@nvidia.com>

This commit adds support for XUSB device mode controller support on
Tegra234 SoC. This is very similar to the existing Tegra194 XUDC.

Signed-off-by: Sing-Han Chen <singhanc@nvidia.com>
Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V1 -> V4: nothing has changed

 drivers/usb/gadget/udc/tegra-xudc.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/drivers/usb/gadget/udc/tegra-xudc.c b/drivers/usb/gadget/udc/tegra-xudc.c
index 76919d7570d2..ff697190469b 100644
--- a/drivers/usb/gadget/udc/tegra-xudc.c
+++ b/drivers/usb/gadget/udc/tegra-xudc.c
@@ -3660,6 +3660,19 @@ static struct tegra_xudc_soc tegra194_xudc_soc_data = {
 	.has_ipfs = false,
 };
 
+static struct tegra_xudc_soc tegra234_xudc_soc_data = {
+	.clock_names = tegra186_xudc_clock_names,
+	.num_clks = ARRAY_SIZE(tegra186_xudc_clock_names),
+	.num_phys = 4,
+	.u1_enable = true,
+	.u2_enable = true,
+	.lpm_enable = true,
+	.invalid_seq_num = false,
+	.pls_quirk = false,
+	.port_reset_quirk = false,
+	.has_ipfs = false,
+};
+
 static const struct of_device_id tegra_xudc_of_match[] = {
 	{
 		.compatible = "nvidia,tegra210-xudc",
@@ -3673,6 +3686,10 @@ static const struct of_device_id tegra_xudc_of_match[] = {
 		.compatible = "nvidia,tegra194-xudc",
 		.data = &tegra194_xudc_soc_data
 	},
+	{
+		.compatible = "nvidia,tegra234-xudc",
+		.data = &tegra234_xudc_soc_data
+	},
 	{ }
 };
 MODULE_DEVICE_TABLE(of, tegra_xudc_of_match);
-- 
2.25.1

