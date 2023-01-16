Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2187C54EBE
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Jan 2023 15:51:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231295AbjAPPvg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Jan 2023 10:51:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231247AbjAPPvc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Jan 2023 10:51:32 -0500
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2084.outbound.protection.outlook.com [40.107.223.84])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A92F21A494;
        Mon, 16 Jan 2023 07:51:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=OczeH0ryB+dXUDJpUsKxoOF068fxjNA36iXCITO8SU6mG5KVMp9XqCTz2CZ3YLGG/QPOtuKszwanhbao49P24GS8m9LqawMmvheZWW6ajtcTUF244Qx4Mi4nLkWBMHZQCFc0oDnID91/thMshpnpRl0yOh/1nbqZ2AhYQ9bipFo15+2VYRRTetNf2PIuZ/Ng6wQZ9J5+HSrxPbhGgrVj1kVOCw5YxwKb6b52zjfpodxYSycllYXemm7fUsu6jwHP/2gY8oHrvjgQTw0nIKqFItfboCWVpNG/PL99eYzM8wBctDdTzbaKygXZUtxk8KrffKPUvGRoWvY39ZexK7EOVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KGni8ioPw54bmdE+KbZBu6di20jvVBsni4UtN10Svrs=;
 b=KFQGkCgA/zaHDAdVJR4H2ORyExYcUL+oWiGFFFmucIaST1JPemjk35n+6oEeH4KDzt46f8ipWFEw/9JfCGUoPz2KE5k6Vu7dWUPEkC63/1p26tQ5BROkwS6Q9gIzSvy7zQnXZ+A34M7vXpJppQw65ttQAdKe/3RQhA9JflFtbUhc+GuTluqOyAlr0y1RlygndzuvX+G4jFfyzIiMMg7cS9r0ETUbDSwYTAk0jIiYR1gcUPIOB98zcnUTMKrM0awUeOpSssM0P2OEnOyiuATZozQaOMzHsR/vKmMO7fEUVnFtoSnwjc3kHqycCsercHm5SeZq4/XrG7VB1DIoWF7uTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KGni8ioPw54bmdE+KbZBu6di20jvVBsni4UtN10Svrs=;
 b=JEkemIH2v87IdUq0hu+bsIidpC2jaUUG9wlqQLteugPM8s23thWz/7lC7Gl11WEhCr98lrjXeK/Z1a0xYTg54yQZd0+ZXGbWLx3eoAtXOnxm6iLNjj9O9uRM7VPtTaBGhMednKLsGWNqOGy+un19DHaexLbUlZLnHhpytownAVD45GH8V28BfbifbZUHL01OswRkTGaKRDUl+g7ixTcRgRjBW0xMuglTmtmmyKi59IAC4NGk75/WG43aPJmpNciyYkE38/Agujl9S060JN/AU0G91Z5ObHyiGYC/s2Q95CuJ4UdFHsM2XWfOfpKPmUZefDnvKkFsoyxqa2BHcgLCww==
Received: from MW4P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::7) by
 SJ0PR12MB8140.namprd12.prod.outlook.com (2603:10b6:a03:4e3::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Mon, 16 Jan 2023 15:51:29 +0000
Received: from CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8b:cafe::46) by MW4P221CA0002.outlook.office365.com
 (2603:10b6:303:8b::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 15:51:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT018.mail.protection.outlook.com (10.13.175.16) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 15:51:29 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:15 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 07:51:15 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Mon, 16 Jan 2023 07:51:12 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Wayne Chang <waynec@nvidia.com>, <linux-usb@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 4/5] i2c: nvidia-gpu: Replace ccgx to well-known regex
Date:   Mon, 16 Jan 2023 15:50:44 +0000
Message-ID: <20230116155045.100780-5-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230116155045.100780-1-jonathanh@nvidia.com>
References: <20230116155045.100780-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT018:EE_|SJ0PR12MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: 55460d3a-de5a-4e9e-80ed-08daf7d98869
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qoBlEKJRs5TlHaY+AkYSPQRwTmja2OZfsIni0MTlLGM6/yczK1a8r+inM8+rtnJOQuhZRaB8frhtki436+B5mPSGNElkMFmKUaMpXr7Xd1CAQp+K9eak33QsxPKyavkfXywOE4w6+L5d0X35oozhtemP2u0Yu4g/gsF9DEjhjtwt1iDb9JcPfO25NvFGLOD1Ajy6jFn7xmku/F7wJQYzFWNTFBvfX7QlZv90v13RedWZViWqvBTmnH10At5YKvuEPSnkxxJFVGYOqGNpkV26z54aPbDaCRP+z2ODvxSm/Va2EI7um81aq8tuAiQr6lS0ls8ouTGdjcsUN7QXMw2lgXmLG3mVNuwAxpi5agh2Yl8B9WsY5wOhZADyEXy9Bgrn9XVNA2znSUYXkMgHKf6MVGZNVd8gzUEybgt2ubvz6oG6/TxtGNRIueZvBhF3t+TBwAvL08imZ3d8XLU8y1qFFzdtCTNEd/MXJmgezYbv9iE+g9UZ2fAPZgPPEd7yXBQNxgZvDsWpxdGWi/qZ4bsH8VS+4P562B2zOlPsswUh3fYtvzDdl22awTElgwEGm6W9MWEfrWbxODGtwumATIhlIcLu9EnvR37IKPFj1O0rw0vFaxmqoTnTGyWlZQIoKqvz4o+MDa0CZ7WEU02h7Pz2FPzT3/H+W96aiXnqKy0PUx34jUEJXP6mBxPKUOQwCti3nUMD10gvOBtaYfTzo3Gbzw==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(39860400002)(396003)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(36756003)(107886003)(36860700001)(6666004)(2906002)(70206006)(4326008)(82310400005)(5660300002)(8676002)(83380400001)(8936002)(4744005)(426003)(82740400003)(356005)(41300700001)(478600001)(7636003)(47076005)(70586007)(186003)(40480700001)(336012)(7696005)(26005)(86362001)(1076003)(40460700003)(2616005)(316002)(54906003)(110136005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 15:51:29.3363
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55460d3a-de5a-4e9e-80ed-08daf7d98869
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT018.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8140
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
V1 -> V2: New change for adding cypress,firmware-build

 drivers/i2c/busses/i2c-nvidia-gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..0934f8ad7f49 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -260,7 +260,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
-	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_U16("cypress,firmware-build", ('n' << 8) | 'v'),
 	{ }
 };
 
-- 
2.25.1

