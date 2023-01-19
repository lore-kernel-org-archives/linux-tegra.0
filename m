Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B49C00A5A
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 11:18:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229876AbjASLSJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 06:18:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjASLSI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 06:18:08 -0500
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (mail-sn1nam02on2067.outbound.protection.outlook.com [40.107.96.67])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF5F56DB13;
        Thu, 19 Jan 2023 03:18:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aweTTF70eMYcgCuIuDUbtRgiMxdAfHcvmbiKRqBnZpXMMQkkIpZc0r3WfOuWRLRMXA00245LB2gDccflGPn8bS33T3E2yXTNCa+HmtxUbsmG+eqw+v6HWxPxLUY1Yck4I7YnCIjVTom98MRItQUEXp2DAYc1NMORZYjJYFc+GkZxiXhtVP43Bo+vsoGU7E4b73yWuMh1teOcJmwTsuOwqYbqCqxYE1gPtaqDaL8qwvrzxkLdu9l0KdD/AzH0+/OL6ryBN6bCC/INrspNXfA1+AEoZz/Z5+fjzDSaYr1VKasRxoix6zPQV7LPCMyXpQ4lKjpT2dt3Aj/y3+O1eZd5iA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vvbSLL4cVaSEMZw3bUFKt5OT0xgYezWryxPGVxopgzM=;
 b=VO489wSKed2C7HY5tghT+ld6OkSXYImBNzhCRuDjKXtbLKBGyr96TC/6VFsJaTdmsWktyXugWJXE0YWFD1CTSvCPxQ79dKLpqDPxuaaVAl/jkpk9k+XuX/OAnwa4wzCr7fOUgFBGCwhwxVNBYajlq9ZEoWwG5BCrrKCD4uxiVVhBqSC8JTMZvALVWcE/9KRDguppHP3xgfUow/py0wH9nOxtg4CCXU4B6NUZGWQs41k0OftnN+NNwhq3PIay/EHl+AGheyUTsgAw52nh7jyldUHvILDcQR1TExAn9QuaP6w2mE/W/S7/5yOFKmN7HmKDMVPcg9D61uQfW1LTKzuAaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vvbSLL4cVaSEMZw3bUFKt5OT0xgYezWryxPGVxopgzM=;
 b=CvOqumvvn6G8KYa8dIsDiKrthnmR+qJUNjNt2hsaOnZHnDCcAifu8DUWW8owM+DYzIvHA+I8Zsm6R9I/j/SABEZY1/U92mOgO0PXodnLz0HBgz8DK47i2dqMUvyAzNaPlB/w8e0pPjEpBYfLhp7H05K7HrV+/CnyVYBE4N27KxafYen5YEPwbf/FQ3t5VnlQy+rQ/yjAeH5mLfhGonGTFVaX87f67/QGDyoZJDMLX/D5epc9aahuGLQH3YMlVkM95YODcszaWiVqcEeLZTw4qFKS5CZ2vXTeowaHR5wEqzsFX7I2JLQ6R6QAqASgnqo8Rk4Dgx32Yptsb5JIbqWeEA==
Received: from DM6PR14CA0041.namprd14.prod.outlook.com (2603:10b6:5:18f::18)
 by CH2PR12MB4072.namprd12.prod.outlook.com (2603:10b6:610:7e::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Thu, 19 Jan
 2023 11:18:05 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:18f:cafe::77) by DM6PR14CA0041.outlook.office365.com
 (2603:10b6:5:18f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 11:18:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Thu, 19 Jan 2023 11:18:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:52 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 03:17:52 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 03:17:50 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 0/6] Add device-tree support for Cypress CYPD4226
Date:   Thu, 19 Jan 2023 11:17:35 +0000
Message-ID: <20230119111741.33901-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT021:EE_|CH2PR12MB4072:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c377afe-c844-41a6-4a2f-08dafa0ed619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iyqv/imP9Klhcj2+Jw3E4/tjMeNmtwDlDD9sCAvQA6q1PEN7tlKHHMC+L9I5jBUyiTLGnBxjLUALhRqfKTdNa2Eg5EiXGenVSm3mxsPTHp9RWf0b48EFimN8cvxB6VATeup09TuXqjrozBBpbKlR72uqyinT5sCiu9wLPuHru1CG5x3GdjGwqsypTXLzeA/fFzqrgo+v2+35iQpR+kqtf+e8998Lxx9ud3NbTtMSNM+Blw0rW/bhSd797hr0Mtg406LtjNOWOB82ul6rxFFpm+udQ5D+YcZ1Yi45hpMl8z+Bs5vVFUePzAJgZpZOFOwRuHIL44XMMzcX5PqbibPSK2luTikC588BVORWTdbPNz9B6j081dQNKNcjO+OiTu/rO6m0kh2Q9S1G/61rpleRjnRNEqjd1JtDYSavOZYF3FhZja32zsXz5nAQHAAYbDu8MFxMV2Xaq0ufGyaLm/aFwca8ktN3ZzQVjEgo+2EiNZ00lwT3ZtSuK3ZxscqRURAFcCAb8FcbcyJ4+3IwR6Hk8/7wJPAly6mUFXMINXpA6wRrGEte2rwryZ6VdCIZr9YECAb2SFJ91CGcwnPsSqzGcP3nJOj7mBXKeSP9PFF63l8oI4xF1nHAnlcDtnAEF7cLZ+nw0YoBCies0qg7Q9g3z6rX1QXrroEhzmXvtVwEPV2c6OtVu0+D6QcEebhXz2+pHB59refSKNsbGK35ag+VVmVfGk3xh9lREt5cxqfyrqqi8yDl5TJNWFzhyU0/rzRUPA1JSRsHnAQzoXNx1JbC8QPKx7LdolVT30zgqN6cty8=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(136003)(396003)(39860400002)(376002)(346002)(451199015)(40470700004)(36840700001)(46966006)(2616005)(4326008)(86362001)(70586007)(70206006)(186003)(26005)(8676002)(426003)(47076005)(41300700001)(82310400005)(8936002)(36756003)(336012)(36860700001)(1076003)(5660300002)(82740400003)(7696005)(83380400001)(110136005)(478600001)(40480700001)(54906003)(356005)(2906002)(107886003)(6666004)(316002)(7636003)(966005)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 11:18:05.3251
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c377afe-c844-41a6-4a2f-08dafa0ed619
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4072
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree support for Cypress CYPD4226 Type-C controller and
enable for the Jetson AGX Orin board. This series is derived from the
series to enable USB host and device support for Jetson AGX Orin [0].
I have split this out from that series because it was getting quite
big.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (1):
  arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin

Wayne Chang (5):
  dt-bindings: usb: Add Cypress cypd4226 Type-C controller
  i2c: nvidia-gpu: Add ACPI property to align with device-tree
  usb: typec: ucsi_ccg: Add OF support
  i2c: nvidia-gpu: Remove ccgx,firmware-build property
  usb: typec: ucsi_ccg: Remove ccgx,firmware-build property

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 24 +++++-
 4 files changed, 122 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

