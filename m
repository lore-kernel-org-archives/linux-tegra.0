Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7D6FC432BE
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F325610C8
	for <linux-tegra@archiver.kernel.org>; Thu,  2 Sep 2021 05:54:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236874AbhIBFzF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 2 Sep 2021 01:55:05 -0400
Received: from mail-bn8nam11on2081.outbound.protection.outlook.com ([40.107.236.81]:7169
        "EHLO NAM11-BN8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231831AbhIBFzF (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 2 Sep 2021 01:55:05 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=l5Z6j+YmiRxHWefOg3kJMDlqvmtH4NysdLwlZo2s7omMfMEolTe4GT7dUmahPMCP/5PTjtio+AUi3N3RDW9+acRr+6ObozBBKfk4cOLfHKC9sZXNpV27m5yFDHmkAIoCqLkCAedAA6I0lQvMeXiHV8hWGceZqsKeDDj/an4qkDVkkvpeJzIL7TVn8Pbkuke4OHTe8M+zz9I6y1YXDWBICRzrRslpT7GlX9+bPhKMgIlHwzV2WaWZ4N4zocvvjoyT3qHk4pc8JixU8Vx8uLOZMOYBVvHEQ1Qg37ia2EuX2LGd3a3IiMP7ikIQL9kz8yKvvzzJl0V4vWsxgF+4x0fiUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96pHYFwItkzuDMnI8r+0F4avl46UgcWQ2Z1A/sNrLbE=;
 b=DPUeIdZnQuLRCWmnoXdV77JP+SJ2sGWFkJu33j3MU3aEGRW3dLAeIjszR/NUjQJf+9MZbchkSoXhYJ0s/Tmxpfz4dIrix4qCJ5Ifyv0LNbsVxVNV5S3r1n2sxOFkds2L5X4BVHN0AcMXHZCkqXynS2CJShmjUs1AokJfiD9rWJrkDrGWRcZW2NmRjDd5Rw8sSKTy/ukz8XYC8y+lSQh2UEOlYOVfwWKB9Qp0ACGG4fODb9Jnsjmz8Py7bCMbbATe4DIIKHE2ZZM1UXrTKCbRH/ed+J9mlKx2y9fKyQzzLd6+DfDxWxYY3o/lgmc0eu5lC021swl2Ah+DBCOa9ytPmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=96pHYFwItkzuDMnI8r+0F4avl46UgcWQ2Z1A/sNrLbE=;
 b=YGMr5eocyre/YGTBBhOZ2KDUlfiC63xsndPiSe/9svvG3NacnWd/UhnLVIenjP+rzd94Ul344NRnaKXpO/lHpKTmcSdwihwOMisg+eo778ir4koSAiuJCaS3iYxCedXW4mUcnRyo7NsDIh5d1ha/E2s6ELbnOHyfT8z443PZMET6HHEZh/J70ZMNCfUQaMpvwv+ooR7/zpVjOCWEQ5iyXBW4KIVIhojXr9GWYvP6ouCDg+3oH6O0NWriK4ZbEWXwr697P0IOmFtLok6L2AUKFx/hWXG1u0pf1NmUC4MkdoBJ3X6LI1l4Dn1lDqmBtSNkUPLDjyAKYDC9olx9UPffNA==
Received: from MW4PR03CA0069.namprd03.prod.outlook.com (2603:10b6:303:b6::14)
 by BL1PR12MB5317.namprd12.prod.outlook.com (2603:10b6:208:31f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20; Thu, 2 Sep
 2021 05:54:06 +0000
Received: from CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:b6:cafe::d6) by MW4PR03CA0069.outlook.office365.com
 (2603:10b6:303:b6::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.21 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT059.mail.protection.outlook.com (10.13.174.160) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Thu, 2 Sep 2021 05:54:03 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 22:54:03 -0700
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Thu, 2 Sep 2021 05:54:00 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v2 0/3] Convert name-prefix doc to json-schema
Date:   Thu, 2 Sep 2021 11:23:50 +0530
Message-ID: <1630562033-13231-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 53d77e1b-a011-45f2-84b1-08d96dd611e3
X-MS-TrafficTypeDiagnostic: BL1PR12MB5317:
X-Microsoft-Antispam-PRVS: <BL1PR12MB53176A5BCE873A7780EB9C37A7CE9@BL1PR12MB5317.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:514;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFY1G+QtsLYBnx5nNmMLO19tMRNav4bhQ7yqUvH0esn+FrP5AIaVFyXI7WmM76JXuiBQrpW042a95fSBpVemv1UAGWTUvwPwXmi+/l9GT662KIHXYuBCVa6PzPcpgKe/XmS5tZu7xPIc6VaRT2eiT9RTzIzT2AFv3LB45/CN4zpiNKVb9rPqP5xAkVJ4/78cy/fXtkjA+70MteALwu/4tP1dHdvmkeImA7X2WkzMlCLHzZScuzNkFL2To/ZEfL6LE8Tp/e9yPviMmrnjiPb+KPihtHon4YOrzb55IbIe05WM7dsPYA+Gw0t4pirPdL0pualnaMgZUnMrmnW0iReP2uaFlUWlIDEvwlfqHLFO3WedYJxjdgimLYNe3gj4sjfgkXedZi/m3OJWPG1tKVjvteTDHI2jQmdF2psDI7qoOg0K8tUYypOjj735vplTLCiv/Tl3G/ZZNd5Jn79vAyH5CvX0YdFB3+YtzGMjXL90Te5A+zskyUfq+8hD1jJyZ3xPeRFWpU127uX/UZrlRC3Wui6RQGOoFQJa9++a2P6lWNeh1eTVJth6HFHbyuL+SUWv5ZhDGhsy8PUIOD7BySJsQB6Txg2EcP7zgEafN/UJLCqMmARkzRNnLMMmw0lA47WRgZI/ixxe61QFnBK1Ix1w2zQoeVBcoabg11xg4YU/WTMh9kqWMjUN4JO645YtOSq0vDwU6ICjGTuECkgZIQJqxQ==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(39860400002)(136003)(346002)(376002)(36840700001)(46966006)(107886003)(5660300002)(7696005)(316002)(86362001)(70586007)(70206006)(2616005)(54906003)(2906002)(7416002)(110136005)(36756003)(7636003)(82740400003)(8936002)(426003)(336012)(6666004)(36860700001)(47076005)(82310400003)(26005)(478600001)(4326008)(356005)(83380400001)(8676002)(186003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Sep 2021 05:54:03.9148
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 53d77e1b-a011-45f2-84b1-08d96dd611e3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT059.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5317
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following are the changes:
  - Add json-schema for 'sound-name-prefix' documentation under
    'name-perfix.yaml'
  - Use schema references wherever needed.
  - Remove txt based doc


Changelog
=========

v1 -> v2
--------
 * Provide top reference to name-prefix.yaml as suggested by Rob
   for patch 2/3
 * Dropped couple of unreachable email ids from Cc list in commit
   message of patch 2/3
 * No changes in remaining patches
  

Sameer Pujar (3):
  ASoC: Add json-schema documentation for sound-name-prefix
  ASoC: Use schema reference for sound-name-prefix
  ASoC: Remove name-prefix.txt

 .../devicetree/bindings/sound/name-prefix.txt      | 24 ---------------
 .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  9 ++----
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  9 ++----
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |  9 ++----
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |  9 ++----
 Documentation/devicetree/bindings/sound/rt5659.txt |  2 +-
 .../bindings/sound/simple-audio-mux.yaml           |  9 ++----
 8 files changed, 51 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

-- 
2.7.4

