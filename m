Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24855C54EAA
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:43:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234166AbjAXLnt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:43:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38634 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233951AbjAXLns (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:43:48 -0500
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07DCE3FF14;
        Tue, 24 Jan 2023 03:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQGIpk0s559CVLFtPZ3yzw8S0guJi35Z7oNdX3fyvb5DsExC8fwkq6j7N/7VpCI0CWTN8wSNEJZDr6jOibnZaGyyOV6nd5bRl3VCr/O4UeENVqDs5cfyJ673nVhw9MqiONFFU7eCbg8935HR/IKvPs7WCeqxlDK6bBQ79d2iHKP9kBiFBMIq2Rhws+ixvrrIHitANn8uAu4goEInAlKM5s0ATre12fNaYXsC4lUdNmeQpyrbPjKRxuqK96j6UXGC3xMFWeIx+UgIEsyo0n0zMy+smEiE1OlZ2D6wnn5t9EnIswjR3jq7+o4IRGbzU8bVFSnEFFp467/ESLZEUtWUxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GJDhsok1tyITNJ3tne/LHY5ahJSRlDb0sCy5IzITtxQ=;
 b=EcmjjZKGVnWr5PD5gic30gql+MzJVA0Dlm7r96Ul3kiO6og0jKEeM+EAYGFI5FVLpFWlCbK7mrFrTQUiUmm0KidA+rdsPPX1logCKPkHAyPZWXTzFTEe6368YxrtRhn5BsKXJnxZZ9ZJzsmzP55DguQQ+443BLV5s/VraGK09RP46XPjnR4kstVoWn1aH3G4nLFzeSYk86clbQ3HuG5DrrEGcUmQWgAMK3wBSJQqtcb2d0DwmYT35f2wDEvl+9lKYMTHFiedUbzhqvGnNxzLjx62jRTmgEpaJfZKsoez6xvQ6Qy7aceWonaT0PpyiFxzLFjt2guR9m45nIW8AxN8UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GJDhsok1tyITNJ3tne/LHY5ahJSRlDb0sCy5IzITtxQ=;
 b=dtEld90N9Kse57aJI3/Pzkpw0y4ZS0UbSm46UdF8u3kSO/H1qVvx27rWi1hsScL4Hu6QpE7N83CxQN6YvI1ZsLFnhd2W2soyns/gc9UiCPNDTg9izTgbu4O8S7Qex/sAOjDeVjgJ2k+pnmFSCFBCBXJpMXvpXM0q0tO3AmXU9qfltMXlMDKMceoFzY/cc3nhnZGZBlc8PtT7uqDPGAX7WcpnReGLY0jPqmthUrWJWd7FI/1Zr3Q/iyI4FsByVU6jyiDoB4Dt9rEanZ2tDHn8C9zFjxFbA2BcXVKSM2CQrDTnn3Jm4ygZEauI/l31APIgmKVo/n+V5Kmhvsl47Zkezg==
Received: from DS7PR03CA0163.namprd03.prod.outlook.com (2603:10b6:5:3b2::18)
 by DM6PR12MB4172.namprd12.prod.outlook.com (2603:10b6:5:212::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:43 +0000
Received: from DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::81) by DS7PR03CA0163.outlook.office365.com
 (2603:10b6:5:3b2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT073.mail.protection.outlook.com (10.13.173.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Tue, 24 Jan 2023 11:43:43 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:30 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:29 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:28 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 2/6] i2c: nvidia-gpu: Add ACPI property to align with device-tree
Date:   Tue, 24 Jan 2023 11:43:14 +0000
Message-ID: <20230124114318.18345-3-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230124114318.18345-1-jonathanh@nvidia.com>
References: <20230124114318.18345-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT073:EE_|DM6PR12MB4172:EE_
X-MS-Office365-Filtering-Correlation-Id: 9196df54-77dc-451b-0bca-08dafe003ece
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FdAGK+uLunPDutEBd3KWGl8KMqPAiVrqt7XwaCMOvQsrxUkJWNQUK0RNQwdcCmr7Z4StZPXlLAEy/mMBfveULnzEqVV1kK7U495+8XF2E4458PWyXLB+akqb57Bt5DDw0ILs751M34gC2rTl3AHENlKDnuehknAPLK0FWzo1FXy5hBGjs/D9SilOEFaSE5dxKtYmY3glaM2N4yGWplovmOdfgU6PyOMfz//22VKxagOK9pX5tw72Vsmv54TE6ZjLavp46Phwxtt0c8WovX1aOol6OxMry5H9KIC/P+LbB7YVyapAjecJN8sybkxNV8EECvOUFfBnR5yV/I3NPJRpEhG2YEabNkxacWbIafPi5p5WNl6O/0DgrwHXxX5nPE6kFLPfc75hMDs5ajUjB4g2lC+0vfaGpSSqGaFtdm5zctzU6GCfNlTDpe9nBdjMuIX5UzW2aBwS224bNmCbAZpz0Kdb5VcObKBmtOh55LwOyYTF4HGx8CzqAwXZWZTouA6jHxIpbnL2ysZisMuug78CcoTC7+2rUkIpzoT8DQ9SftHxkhAlH3e7poQZJjfhx9symCZW4KuFZqot+WDWRzrZLvolYe6sBRaMzS7nsIY41CWMfMKJDhplsrxK3iyFAghVMEkr8Dg8J5xO4WiH8+WIToyBlyFhLS2f/bRM6ekWGhBqPlmnuCnnve52qjPHiWwhVgjvKEmeoE6EJnT+WQ9XEA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(39860400002)(396003)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(40460700003)(82740400003)(36860700001)(36756003)(356005)(86362001)(8936002)(5660300002)(7636003)(2906002)(70206006)(40480700001)(41300700001)(4326008)(8676002)(70586007)(82310400005)(336012)(426003)(47076005)(2616005)(186003)(110136005)(54906003)(6666004)(7696005)(1076003)(26005)(478600001)(316002)(107886003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:43.1930
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9196df54-77dc-451b-0bca-08dafe003ece
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT073.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4172
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Wayne Chang <waynec@nvidia.com>

Device-tree uses the 'firmware-name' string property to pass a name of
the firmware build to the Cypress CCGx driver. Add a new ACPI string
property to the NVIDIA GPU I2C driver to align with device-tree so that
we can migrate to using a common property name for both ACPI and
device-tree.

Signed-off-by: Wayne Chang <waynec@nvidia.com>
Co-developed-by: Jon Hunter <jonathanh@nvidia.com>
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
---
V7: Added Heikki's reviewed-by
V6: no changes
V5: Added this patch from V3

 drivers/i2c/busses/i2c-nvidia-gpu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/i2c/busses/i2c-nvidia-gpu.c b/drivers/i2c/busses/i2c-nvidia-gpu.c
index 12e330cd7635..6d81ea530a83 100644
--- a/drivers/i2c/busses/i2c-nvidia-gpu.c
+++ b/drivers/i2c/busses/i2c-nvidia-gpu.c
@@ -261,6 +261,7 @@ MODULE_DEVICE_TABLE(pci, gpu_i2c_ids);
 static const struct property_entry ccgx_props[] = {
 	/* Use FW built for NVIDIA (nv) only */
 	PROPERTY_ENTRY_U16("ccgx,firmware-build", ('n' << 8) | 'v'),
+	PROPERTY_ENTRY_STRING("firmware-name", "nvidia,gpu"),
 	{ }
 };
 
-- 
2.25.1

