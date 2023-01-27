Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EEBEC61DA3
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 15:11:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234181AbjA0PLJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 10:11:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233174AbjA0PLI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 10:11:08 -0500
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2076.outbound.protection.outlook.com [40.107.93.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26ED880179;
        Fri, 27 Jan 2023 07:11:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DEDyxl6rT28NQeL99lM1pEmEipZeKLG17ks/awudqAeECDA5Um26eV2L6SeVLFV7/uHK/4ZVOSf4wBD2j0yb7SCap+iY8gJDYnfSQXvM7J9NflHqVYnxkIgp28z+CKs8YglbP0O3DuHxvHGNstVgP02JtGoGwdrEZBuZUFDEUKcqu8yuMglZr6wtWPI3hJPcg4M8VXC8UtLAFT7wQt5uJFjPKz1M4TEveEg4Iz2GiKwVMZp7Ven4dIaVVwaCOzcRBx3YQVGcDKUwhcQ502HJVCN2h3bVGep92kFSvEE+/W73Z8Nv5Yf2F31baGgqS7SF8aWq2NjojhsA9dBnhpGnjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=41N6eLDyLsSDMjjmtopds0A4jlwKNecnL28ds1BFjO4=;
 b=nEHIrhgUpu2g2ZTXXp7Co3XjXXDP9h1ni2cmvMYpJO6jUDE/0e+jmGa53GnrooJAooZas2nhTv3S9pLC66l/t0nXzJWNe1dP7Xxh2f0M92tepuT8XulLH6AJVuAtv82Y45hxxqH7nQpbuj/rlT15LROvJnN+VLQUVVz4qq8dNv34MZZE0NoNEriEJz08T+uQjAEaqmNcy6Ob+1ngH1wqOWaRySoYkbktCT03MT1xyo/sy87UGMvyCHFLy5TPtFgpn5OeUUihkZUlAlYThNby9NiXz1Qg1htL4XuTjepb4jT3MWx792A76IBVf068P581BH4TqfIVkbCduwUO81edfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=41N6eLDyLsSDMjjmtopds0A4jlwKNecnL28ds1BFjO4=;
 b=gyOT3bMq/Dx8EjBX6/QLGmAQWwNFx/QIG9LKe2lQjsctq++UKEQrK/2na+0CL+XO0y/uJ2QUDkGHrffypT7a403rlefLIwgJRw9Iu9DOTPMlq8Oy133MYKpzULHgmkKcFOoPLHsVoU2Dcl5JzEiqW5DRdzXnjmnI4QCqIjNgRkq2Rs3eSSlTDwq4APQYjLChkRhluJfm6nvXxnowZfI4QsiwlTG8TCZXXWtt3IOpbFduqZR2s/HD8ULJO6+CmD2nlNFuHyZ9fR2Fvrglk1SvCktlwFili0ptp6D8Tz25J2gfWN2YvCeRDKfaHy8gA5BlWlklyO13h/P5/CT1sHSUOQ==
Received: from MW4PR04CA0165.namprd04.prod.outlook.com (2603:10b6:303:85::20)
 by IA1PR12MB8240.namprd12.prod.outlook.com (2603:10b6:208:3f2::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Fri, 27 Jan
 2023 15:11:05 +0000
Received: from CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:85:cafe::e8) by MW4PR04CA0165.outlook.office365.com
 (2603:10b6:303:85::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.23 via Frontend
 Transport; Fri, 27 Jan 2023 15:11:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT079.mail.protection.outlook.com (10.13.175.134) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Fri, 27 Jan 2023 15:11:04 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:51 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Fri, 27 Jan
 2023 07:10:50 -0800
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Fri, 27 Jan
 2023 07:10:48 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V9 0/6] Add device-tree support for Cypress CYPD4226
Date:   Fri, 27 Jan 2023 15:10:35 +0000
Message-ID: <20230127151041.65751-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT079:EE_|IA1PR12MB8240:EE_
X-MS-Office365-Filtering-Correlation-Id: 20abf660-0238-4bb9-88cf-08db0078b5d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mOrz0PMr8HEw80DGOzF7MEpQ6gbY/k4u/3KNMIA2qFiaavfBzuIi0DFWuxh33D4DC60AK/PX7AhAKfFKS3qHWF63ePzSJo7hqGY6bR0dg9PAiZA/brLl9rcKg0AO6Q6zcgx/sdarotnDeay40FJxS/vlayogRuQ5qSMAsamUxAATXs9Cm2P/fDalvN/rQLxVTZK2IAyEE6IjnB0XsjYZVr2WMl5FaEYhMFbclDf4owbTsO5jZTlgSaHIU1YCe4FdaR4DH7mYlZl8CUKrnJo4oe4sPVpLwoLcz3+AZuGGUivEj/BtZS4/vPDg9U2Zx2al4TFtEbiTA78VBPzZOzIDQBa+AltWg/lFXidy+z1LmHz+kksy+U/mZn9rgBeSlQgl1VM0KA+z9v5/JQaL7eQkDRcgm1f1cb4iqBSHWTsCgb0EVvURg1RQ8/UyYqJdn2Z7jQOJu8dlFgjWg6AUBWjS50v55K8Zw9Ga8tdQpWo87DkVjPE801+ZuCHLroN7gc0dyN2TfJvGxOMuU4AF3DuA+pRKOMDSPN8sDdOjWFYM71ksMrH8OIIGbRPaVLtX/8xuDwBbXi2CSXRrCit4V8FunJXfR+nj+Wu8JKhWvVwUVo+yjS1DPq0JwGYZWC5yb5qh2tItjrHgcn5Tv4LHT20awkgCE6ctv4l/yV37n6kRMda5FDFgtv4xTdsObx2Zp7bNLZ3WI/PXR0T1AE2bx7OtzE/9sZfMBetqYtQO4eV5utJF0FSVv3eRVEDM/vgY0DtO
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(136003)(396003)(376002)(346002)(39860400002)(451199018)(46966006)(36840700001)(2906002)(83380400001)(86362001)(36860700001)(41300700001)(40480700001)(82740400003)(8936002)(4326008)(356005)(5660300002)(82310400005)(336012)(1076003)(186003)(426003)(54906003)(478600001)(107886003)(7636003)(110136005)(6666004)(316002)(26005)(47076005)(8676002)(966005)(2616005)(70586007)(70206006)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2023 15:11:04.8240
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20abf660-0238-4bb9-88cf-08db0078b5d5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8240
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

 .../bindings/usb/cypress,cypd4226.yaml        | 92 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 arch/arm64/configs/defconfig                  |  2 +
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 22 ++++-
 5 files changed, 128 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

