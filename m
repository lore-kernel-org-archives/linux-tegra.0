Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D041AC27C76
	for <linux-tegra@archiver.kernel.org>; Wed, 25 Jan 2023 20:43:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235896AbjAYUnC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 25 Jan 2023 15:43:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235121AbjAYUnB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 25 Jan 2023 15:43:01 -0500
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2060.outbound.protection.outlook.com [40.107.243.60])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F8682711;
        Wed, 25 Jan 2023 12:42:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ftOzarcwVMlQbMMUW7tWNOaPl/+peXlwj6y4rNxGw8+OwK8PG6EjpLAZE0rj7sLwvqIubs8vZD+kAuca1zFSy8G4EYc0nMygxgVBax0G+EaYCE/np/IL6+eYNNi/OkHSwKa9DziWwJQsvl+AclXiv3rfpy5jM3+9lo/OEdQVp6YTa+kT7bU7gnru9BkB/YESFPMHrt+AJlOEU7dWJto8rTwjLu4HkJOFItx5brqKXSTZG56AfWu8yIXKVsT62SIWGDgGspXpb1PbiTSB0Bq1o5/9pF/GQ/aCVSBAqjN7SQWddNaY3Ldb3/Pq0Q9VdRTGIhCVw02iqHxhMldd/3NRZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=spAF42ufekjiEdcgO3qw82xW+yxI5f6+kELdIMr5ne0=;
 b=Wm8v229gGplhuhlhNrh6ws+ZgufQ9Pl5A5HkmQbB4PLp2/9VTCoRkYnuF+O1v9N2MENdVcvK9kZtBFxzff/7BZkncB7yMOnItl9B81dly1zcGbC7t0QmroORuXhJyNC5Z+yATbeRVuwP6ZPyB2XSdimxjdBagtRDkj/5PSXabNMIhJm3qQdHy35iR0mm346C8LOctbiywZpJls+SKfc5xhaVeYXLlwXAyXI1y4Qnpkpj2YRE7+nkH3bvNNprxLsY4Q42DFskBp0n9aqELhRuZe0QsVOjTIFCQAAIPi6w/wPXv3P4jtVsvUHKug65ESlRUsxuzXMPITQ3l9aAo7JcTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=spAF42ufekjiEdcgO3qw82xW+yxI5f6+kELdIMr5ne0=;
 b=SnDqdEYizer5N2E51gDRfxQS4C7/eiC5CMPd63GhY8WBbrD0hckt9ThgGyCi6VK8+rmLrSRWsb+CQzr5rfX5f3wPxW+b+vQvZK3FeLDTpPX5Yb9rD1zJIKoh9xb+uplvP3MP0OGf2M3+hP5IF+g1zUYtVBXwssspHSn0lniCWvUK6m+B/cZ3g8Pf6IespsegZX8tBDfQFZiGxjIqGhfT1TJoc07J9CczpSaEVufTxqhdrpeH4vjP2nJM9dtNKvYLHciuG+EVF/4rtcxF3ly+hJmCoryxXOveEOP6ESOy97KkeBVOXnABE6HrkWqje5nwOd1VQLZbui8+wGaqAyj+Dw==
Received: from BN9P221CA0023.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::11)
 by CY8PR12MB7514.namprd12.prod.outlook.com (2603:10b6:930:92::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Wed, 25 Jan
 2023 20:42:42 +0000
Received: from BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::6e) by BN9P221CA0023.outlook.office365.com
 (2603:10b6:408:10a::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.21 via Frontend
 Transport; Wed, 25 Jan 2023 20:42:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN8NAM11FT113.mail.protection.outlook.com (10.13.176.163) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.17 via Frontend Transport; Wed, 25 Jan 2023 20:42:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:24 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 25 Jan
 2023 12:42:23 -0800
Received: from moonraker.nvidia.com (10.127.8.14) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Wed, 25 Jan 2023 12:42:21 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V8 0/6] Add device-tree support for Cypress CYPD4226
Date:   Wed, 25 Jan 2023 20:42:05 +0000
Message-ID: <20230125204211.63680-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT113:EE_|CY8PR12MB7514:EE_
X-MS-Office365-Filtering-Correlation-Id: fbe6410e-71b7-4156-9c89-08daff14b47b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cRUh0+UBZh1dckRv3rFsAjQYaCFvBTHWrGi6f8YYqOrAE5gr/PIFQP8mFPcmy1hklwLPit2HjZIvawMjdaxG6GAfWsazE7IazuqXzAgwLiP3ExEAhdwhowFDLkta3lklAo8jYlQLZ+iQgb4XTB4IzVX4Jh1S7mcBVA9jI/fbJIo2D+y56E5UqQBE+QJwxDWml/fYpaUxVNkBJJlRlSzrIbP3iqiydcGvrkhbSJY28/D+2B1MmZCVc8JLiGdBCH3PjVl1pcwvA8zqTFeCo8TRSW7utbBlMQsZGQROlLbipmCRNtYgf7MS6N013dWQkEliE/760njc6WLWGt7ZxT08kI0B+QaZ9x/5WNf9QcmQMzI9dUKd7OtbmyTCtRBgzgJuhJ4afaLaqbWxAcL/9U8cCitJCmn9zH368aj6ftntNe38Cd/dmYXwc34lNK8mZxEIsqk1E6YwZPxk84S2r+tOje3PJb3KwRBAVv/nJpRLuYJtX2PdzzO2w/0JFhyEV226bXL5eP38m0LNOzQ7tJ6PD/+fhJcBkGVJSL3QscY7sfaWsUdFBxwM4FP+88ATLmYwXRgw8ttqsNT3yJMIRLHZaBWgBvWGmZXsaOobuRyW2xwWjhtMYOsghqoxNb1WbLtNTErjNkc/pKNQfIOegTM5Ljtkt7q6OhHohaTwC7ILhZZE0G7zZ0PhM6/YPlbi6cRUS8VdX5zwa/jPKJ5o6NLL/MghH9pMXTigmA7O/Exrpxmv41Evp+aqTF374bwdJOs/m2oxcu9Wj1tsBBVspnZwi5AKocLC+xG2rawRTnRRw44=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(376002)(39860400002)(396003)(136003)(346002)(451199018)(36840700001)(46966006)(40470700004)(36756003)(82310400005)(4326008)(82740400003)(356005)(86362001)(2906002)(7636003)(8676002)(40460700003)(70586007)(966005)(186003)(110136005)(26005)(47076005)(107886003)(40480700001)(336012)(54906003)(426003)(1076003)(6666004)(41300700001)(36860700001)(5660300002)(8936002)(83380400001)(2616005)(70206006)(478600001)(7696005)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jan 2023 20:42:41.6587
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fbe6410e-71b7-4156-9c89-08daff14b47b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT113.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7514
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add device-tree support for Cypress CYPD4226 Type-C controller and
enable for the Jetson AGX Orin board. This series is derived from the
series to enable USB host and device support for Jetson AGX Orin [0].
I have split this out from that series because it was getting quite
big.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (2):
  arm64: tegra: Populate USB Type-C Controller for Jetson AGX Orin
  arm64: defconfig: Enable UCSI support

Wayne Chang (4):
  dt-bindings: usb: Add Cypress cypd4226 Type-C controller
  i2c: nvidia-gpu: Add ACPI property to align with device-tree
  usb: typec: ucsi_ccg: Add OF support
  i2c: nvidia-gpu: Remove ccgx,firmware-build property

 .../bindings/usb/cypress,cypd4226.yaml        | 86 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 arch/arm64/configs/defconfig                  |  2 +
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 22 ++++-
 5 files changed, 122 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

