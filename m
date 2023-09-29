Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91C84E7F156
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:28:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233022AbjI2K2E (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:28:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233025AbjI2K2A (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:28:00 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2040.outbound.protection.outlook.com [40.107.236.40])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 797BD199;
        Fri, 29 Sep 2023 03:27:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hNAh5OuI0pZN77thKOc53nVv5RKn82VpwdmgvcZUfzpDHux8BDo+C7UaBXQ6a/qzem/E7kVYXWRaBMDhEnYY4yRFR3W91BTltNzvKJZz1+3gk5wSWD3snpoMUIKswQmckNwDkaD+Y2J1+Z0HUs/Hpeft1XbGlxMa3KCWk9EK6CP7t13Rqn043I574TxeQ5myoxS2V5FnofVFREOybantt9amwOITF9GSrFb+T8Yeu0aPYzWqRb2g6DcfdvU7ObKK+X06YL9F9fXoHASmpQk9SQOBLohLiA8wuqEJk7J9mMvBLUPw5JrNqIxwB1ZSqKKH6cXo+wbGvOK67VQEb/SnjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ncjKeZwLQiI5jrJ/KpsiTvV1g3avejRF0m9tef0zaA4=;
 b=IPkOeZrUnIOCYHEQn/U9qo60twQP128q1aDq5H26O3JoydoQOOXaSX4AdAOtKx/tcyGwkWzB/7oP8d7auCcim175nIndoiukzIpJ7rn+mUMbek8X/PQygCxf4HF8rtpfPOuclnwCwjP+WIvbqYewfv69lPfiurLUtGEweu/TVQAazPXHXYDu805KF4QFFEAiGREHM5ogRk99pxPBQ5RRltMy6HUjgLSbiuEC7ci4ikoXyu2fkwuXqLIeLcxpW5UjGfk5Qd6NocWPvPWY9Uft6xMjEdesBaDCwn/HkO30pz5zBJixdsQDiYenJnAJYyFMUn+eFgdzkOG+evejgl9epw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ncjKeZwLQiI5jrJ/KpsiTvV1g3avejRF0m9tef0zaA4=;
 b=Z/qicF1/9SU7fuYS5jaalPhA8dEag5digV08IwTGDvisvK5FEvmJxjXGi9MInRRNGCbEvFusf3OO7whylG3aHHfPhdHQA6zDmFLDMZ7RgVoDQ3ch4bJSgfyB1mQnroJSRjh2ZTgWtjHL1swBd9ih582Q23UyPgJDMsZHsVSBdyz8ocW8tARQ1qckgx6HnpM9wVScOW0X3D9a5OhyaNFMd6evFSkvNuv9rwQYdksMVvld67szG9XQut19RM9DuX+gShdVOp2al6zwfzZ78uTAvuUdeNqbM7X7fHVfocKc0Nh7blYLyTyOAdq+RRL0ZnsMyPBphB7kkQQsVk84CE27xQ==
Received: from BL0PR1501CA0029.namprd15.prod.outlook.com
 (2603:10b6:207:17::42) by MW4PR12MB7191.namprd12.prod.outlook.com
 (2603:10b6:303:22d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.22; Fri, 29 Sep
 2023 10:27:52 +0000
Received: from BL6PEPF0001AB4A.namprd04.prod.outlook.com
 (2603:10b6:207:17:cafe::4e) by BL0PR1501CA0029.outlook.office365.com
 (2603:10b6:207:17::42) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26 via Frontend
 Transport; Fri, 29 Sep 2023 10:27:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 BL6PEPF0001AB4A.mail.protection.outlook.com (10.167.242.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:27:51 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:27:49 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 29 Sep 2023 03:27:49 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.126.190.180)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:27:47 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V4 0/4] hwmon: ina3221: Add selective summation support
Date:   Fri, 29 Sep 2023 11:27:40 +0100
Message-ID: <20230929102744.84989-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0001AB4A:EE_|MW4PR12MB7191:EE_
X-MS-Office365-Filtering-Correlation-Id: d6601ebc-5865-404d-a1e7-08dbc0d6bc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: kHiSul7QuzFQPMn7jTI+7l/1fiNUM4Yz0r3I+ResLYN2aG/x9rkpQJitE37eVqxKn7zvohknLU6CMYKdLjwjb9BN4S8R4yitit6FvN70MHaIvDapAJvfJi6s/c9PV+CcIAzRkZJr6cIZRRXrpruP7qJdchbJ50Z/+Y1520sZgp2rSjup7yskbjrMAd+bpwEx+w/khaCl8ce6H9Nzgy/TUjJCWfq1MCHlFtD/1dV/SQjXuCu83Ub/3wj/kb8AeOql9k2SEloTK49AiZnqacrdzbUmTF/Ite/DuGoYkXtRpgZyySkBs8qdrGYorCMcf25LfHKcuyZwHCoSzztlbunK7bva6K445yIAFfVIT60a7NH47Y1z5OldXXOpKMTv5fHDmM8hdL7bbQp3rsiNYOgo1+nrfy2SNdXjs/+3LL0D2TppJL5d8lxJZsCAC39kgvkoLnZlyrYKnwibHuhTzgWV8okdfKuZDN/wmKsCk8E4jX1WF1734GK36Z0w6GtthrFpYcEmuTwCDgknr/1I2udkrp9Mye3zmvGmbx6Olf7KmNVGJhqkLwr/Pkpc19w0v7GaFXkXWGhdfZJx/5Y11E/LgDY5ziR6+HjfIbflUTprGUITEYyUXmnmJphN1fMW9RgkvSPqQRM20nTWZfO3CGvJfOPiREgvKjIc+citzKYVftOmmMMJt+yf/sOybxHKLSiFb43JIJ18FcQ4E6337UeFZ6SYI6FW6kDwVwa0k8oxJhP/TkdgoNg/y5fuFPnDW5aT
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(136003)(39860400002)(346002)(396003)(376002)(230922051799003)(64100799003)(186009)(1800799009)(451199024)(82310400011)(46966006)(40470700004)(36840700001)(82740400003)(7636003)(40480700001)(356005)(40460700003)(26005)(1076003)(2616005)(107886003)(8936002)(86362001)(8676002)(5660300002)(4326008)(2906002)(41300700001)(36756003)(70206006)(54906003)(70586007)(110136005)(316002)(6666004)(478600001)(83380400001)(47076005)(36860700001)(426003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:27:51.2618
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d6601ebc-5865-404d-a1e7-08dbc0d6bc1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF0001AB4A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7191
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current INA3221 driver always sums the shunt voltage for all enabled
channels regardless of the shunt-resistor used for each channel. Summing
the shunt-voltage for channels is only meaningful if the shunt resistor
is the same for each channel. This series adds device-tree support to
allow which channels are summed in device-tree.

Changes since V3:
- Added missing descriptions for new structure members that was reported
  by the kernel-test-bot.
- Added comment in the ina3221 dt-binding doc example to explain why we
  need to explicitly disable channels.
- Added more commentary in the commit message for the new DT property
  to explain that this property does not change the behaviour of the
  driver unless it is populated.

Changes since V2:
- Added note to binding-doc to indicate that input channels must be
  explicitly disabled.
- Corrected ordering of properties in the binding-doc
- Updated license for the binding-doc to be dual licensed.
- Changed newly added property from 'summation-bypass' to
  summation-disable'.
- Documented type for the new 'summation-disable' property.
- Corrected spelling and comments as per the feedback received.
- Used debugfs instead of sysfs for exposing the 'summation-disable'
  status for each input channel.
- Populated missing instances for the ina3221 device for Tegra234
  boards.
- Populated ina219 device for the NVIDIA IGX board (not strictly
  related to this series but related to populating all
  power-sensors for Tegra234 boards)

Changes since V1:
- Added yaml conversion patch for binding-doc
- Added binding-doc documentation patch for new property
- Added patch to populate ina3221 devices for Tegra234.

Jon Hunter (2):
  dt-bindings: hwmon: ina3221: Add ti,summation-disable
  arm64: tegra: Add power-sensors for Tegra234 boards

Ninad Malwade (2):
  dt-bindings: hwmon: ina3221: Convert to json-schema
  hwmon: ina3221: Add support for channel summation disable

 .../devicetree/bindings/hwmon/ina3221.txt     |  54 --------
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 121 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  |  33 +++++
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  53 ++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  29 +++++
 drivers/hwmon/ina3221.c                       |  33 ++++-
 6 files changed, 266 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml

-- 
2.34.1

