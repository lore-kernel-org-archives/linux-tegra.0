Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E332C678DA
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231258AbjAPPve (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbjAPPvb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:31 -0500
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D0EFCC0D;
        Mon, 16 Jan 2023 07:51:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TmXxxHFmxmdgF6wB08nqawTX5d+wjSrzZ9jJW1koMTh1xDpsed7bkeASsbNhef0BebU4s4FtZ1LnUoBhTrsUf2B3XZtq7XbbI7DC5t00yDAjTAhd6t0XWjYOp65U2POCWL66fyLO/XOyjc5yvs2HDKvmfM87+qIEDdiR5IdwfhI6sJIH19+T5MWAdORA1Q93tIKglTNy/4jR54SHogGTeOXDgx7VmBX4mr87x1g/gHOS+hYe04n/mXUa4uaiHgByAhvgN3mpddKlXW5yZwsfhRLFsZkNPnt0ouEt4P4uGotjwkcRwletO9BgE6/HhJlDWHnj2ANlnFOdfNOeUucm1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S8gS+A4+OHJ9sGDL1cJBwHktVJudxKv8QhNzn/LL/gI=;
 b=Hu9kxJagavvw1cia/+hQFSo+6TanDwZw19ZVHsV2wRVdKG3bCnJokwf5dgd5+mwYc1FXQQ+DWluwXREi8GACeF/83ZmtNYlHEyVwOBv6uOUBbZtYID5eBIUMtAp5eTosEe8nVZjvAubG+Nn+xd4U7m2F3NUCfDkvFHTOi69MyzzoLoTe8q7471lhfcX6iLocSjZhTG9aZR3GkOgyzyxkcYRY3/asXi8/TRafX/xdOeL7LWf08SvYJYCqkv2ce6zkWqVUwGfAezOe9DB3keMwRSt02NalTvupY/T8icp5KCEsZo9CajGFQl27ItdWRZ42WrzSOpq0hRaIdRmhw7jHww==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S8gS+A4+OHJ9sGDL1cJBwHktVJudxKv8QhNzn/LL/gI=;
 b=FDMROhOakhv1BTu1IGqMOapp/g4cS/vyQuflnwV12w32N4iOEJEcw2dZfqlSBEF6dT+zzcA9qaaPxZx337rBuTcay/hO6xPoUq4KjCb2cQyvvhlVHXya7rA1S4f0XyFzear1Fm1vTxlLq1KfoMUPv6O/tPJ0mM3g2LX5YzVcZy/autJpki+cIA/WVr/OBzvk05K2ZAMAd6m0fnWYEtYL96v09Lun6Z0ppfrFM+sgMkv2AtAatu0vwytRsXz43mTFVc9wionB4UgOu9CdJzpVFicpmxZBzDREEJvOJOYNnFBIImCgZAKvzQxBcIM7QTMM2c6z9AjwXMX48kb+Jyt0ow==
Received: from BL1PR13CA0159.namprd13.prod.outlook.com (2603:10b6:208:2bd::14)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 15:51:28 +0000
Received: from BL02EPF00010209.namprd05.prod.outlook.com
 (2603:10b6:208:2bd:cafe::df) by BL1PR13CA0159.outlook.office365.com
 (2603:10b6:208:2bd::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF00010209.mail.protection.outlook.com (10.167.241.198) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Mon, 16 Jan 2023 15:51:28 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:12 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:12 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:51:09 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 3/5] usb: typec: ucsi_ccg: Replace ccgx to well-known regex
Date:   Mon, 16 Jan 2023 15:50:43 +0000
Message-ID: <20230116155045.100780-4-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116155045.100780-1-jonathanh@nvidia.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00010209:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: a52fa497-55de-4e50-e7bc-08daf7d987e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rtLg5ng+/g3aBa00UXFaPklZ1uPS+tvEDABx/g0b6t44WAtf2u8yvs6J0tlmZ5nQIexxUYFiioG2Foy8Zd8VEtU24GDPO98o/om09DNF3P3EGHQLMAAPkSk5RX3W3FhO5+dljE/jYKQ933tzKEXXPhnN3QpuP0Oip3ovKJuL9+xYigJhhdTDH1yghXo/Ynxndvrg7VpoBt0u7Dv7mvcIAnpCbx8W6A7H//oU48sYBulNsd94opgBKsth3L0GbgUI+dxTQ8hCYhEd+v8+3CXMXRsS7u0AFmWvB9Y+SX9uXcHLq0rmqCJIFnlFw2hYHDGJgSsxvKDbt7KAqVvuFExGuZ2DkY9C+3I2MeI8WwoI3vL66CeCOhaoFrObofKuukkPd6/CbuJXfwbYRhu3DU0f4qPUYf2bvQaSs3CwyGK3OYMmxG3qbSqaOE067cq03uJWA5Brvezg4r2ZM3tbBdSh5AIkk7MTXMsD8rriA9g3GTurFQL3pyAI0ikYYUygTVDojcK6pZUTnqCz2KP4SdD9q6LweVX1ObAXDzKTQEcA0qjewd+EGenFP3YuWZbhqyIYLmt+jje3FResu0tSjSkIWaFhWS8ACsXd44OmNgaeSUXr36ALKaRh39ietaS0eMXEvjbDIOzU574f9WHrzH177eNh12RwcAvREYZkDFU5NrGN42QMqZRu4/LqdiZXgtvoB8kGd+1UNEMrf9ffV+SXLQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(46966006)(36840700001)(86362001)(82310400005)(426003)(26005)(4326008)(8676002)(36756003)(186003)(70206006)(70586007)(47076005)(41300700001)(2616005)(316002)(1076003)(7696005)(107886003)(110136005)(54906003)(6666004)(478600001)(40460700003)(2906002)(356005)(7636003)(82740400003)(336012)(83380400001)(5660300002)(36860700001)(8936002)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:28.4271
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a52fa497-55de-4e50-e7bc-08daf7d987e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00010209.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

ccgx is refer to the cypress cypd4226 typec controller.
Replace ccgx to well-known regex "cypress".

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
V2 -> V4: nothing has changed
V1 -> V2: new change added for adding cypress,firmware-build

 drivers/usb/typec/ucsi/ucsi_ccg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/typec/ucsi/ucsi_ccg.c b/drivers/usb/typec/ucsi/ucsi_ccg.c
index 4bc31ed8e5bc..d6114fb8d5a9 100644
--- a/drivers/usb/typec/ucsi/ucsi_ccg.c
+++ b/drivers/usb/typec/ucsi/ucsi_ccg.c
@@ -1357,7 +1357,7 @@ static int ucsi_ccg_probe(struct i2c_client *client)
 	INIT_WORK(&uc->pm_work, ccg_pm_workaround_work);
 
 	/* Only fail FW flashing when FW build information is not provided */
-	status = device_property_read_u16(dev, "ccgx,firmware-build",
+	status = device_property_read_u16(dev, "cypress,firmware-build",
 					  &uc->fw_build);
 	if (status)
 		dev_err(uc->dev, "failed to get FW build information\n");
-- 
2.25.1

