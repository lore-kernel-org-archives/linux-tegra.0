Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C82BE7D0A0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Sep 2023 17:27:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230020AbjIUR1o (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Sep 2023 13:27:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230090AbjIUR1J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Sep 2023 13:27:09 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on20603.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e89::603])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C41119AC;
        Thu, 21 Sep 2023 10:02:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UtqY1PC8AeKKFOxZ9nQRkHk6R3pCZf1WQAsQaD/3SxsGuKnKQfrZ11FboZkvCjhw0HQWI9xkZhlGnpi3jlXoJiTgGdkli4DMsZq4c+fg0d3psGaS9+v1kqHpgJebNbt8S3kw5jXO+lysBNKMBrop2gV6RwrGmRVFUr6ZViLGVhCMyiVJhUgVf/sjwU0UNm00cW2K1yS/fghTLT0gFqO1Bq9AMjWJumilr16mUlSJIFm6t3NSJrP+jNBAWRpMGK2OpQwLNkISEmVuNjzSvO19FjWqX2Z4LiVeE/gM+nFXX15KECzY7tjGMEsPZkjczuhHsSfmnYFLMMpkE0kloffJgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wc0r/elJ4ch61SNrDZj4Q+lGDrvlTpYAGek6Kp7Mowo=;
 b=cu5V7I632UY+Pmdg1k8OBMzrXMpI1s75A0FCim6lBuoPE/06mMg/lqbAkZ6vimBOEvwLeOhiYj8ZbRXBeqidJevL44BAoVFxFlepKghtMXejfZGeTxoFpaNcVprUaTaeITjOczKZ/wVJPacJDE5EHHjgZsWlxo//TGZYqDD40JV/Cr/vf7jALSalSzkjh/wOY2CO9ucZsyJPjiwFGdPUSdxbUMQF48TLtOYCZxWwPzvA9sXY4uvfFYmnNxJeLVbezR9GpWPQ4gg+/C4Ls9aM/mZwsmD66Y5jiZGo2Ct1gczYEO3HA0UFpDi3fXez+qU2T5XQGU7cBRaof+H8Qs64Fw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Wc0r/elJ4ch61SNrDZj4Q+lGDrvlTpYAGek6Kp7Mowo=;
 b=KiW+9CCiov27xOMZomdh/gwJRtFK66nMRD61lzgKyLXFrlFVOVtHfLrjWPkA+aovDqk4m8/w6visxBHxokTusBzmoz8FXzWIKlprDEAAcOOdfj34Nr2aUTeA6gfAX7OcIcb1Fgnw2KH9bvyVLFIV3OH4hoRr9Jqp6WIO4i33H01b+nl3cJhv6dx0mu0dsFR5hdvjrCOkIlahK2VPVAe2CxVd5ssuqbMPlEsvxcRZrQcc0z1ddWgxe271Ev94DeoC4ng+6DQ3AFKhWSSPdS+q8u3fWrvWtgzq8lFysDw4mbTPn7qy0L30PNUBIKjKMKLHSW1dVLrp1DRMO4cZdvY6TQ==
Received: from PR3P251CA0021.EURP251.PROD.OUTLOOK.COM (2603:10a6:102:b5::20)
 by CY8PR12MB7415.namprd12.prod.outlook.com (2603:10b6:930:5d::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.27; Thu, 21 Sep
 2023 13:12:07 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10a6:102:b5:cafe::c6) by PR3P251CA0021.outlook.office365.com
 (2603:10a6:102:b5::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.31 via Frontend
 Transport; Thu, 21 Sep 2023 13:12:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6792.20 via Frontend Transport; Thu, 21 Sep 2023 13:12:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:33 -0700
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Thu, 21 Sep
 2023 06:11:32 -0700
Received: from moonraker.nvidia.com (10.127.8.10) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.41 via Frontend
 Transport; Thu, 21 Sep 2023 06:11:31 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3 0/4] hwmon: ina3221: Add selective summation support
Date:   Thu, 21 Sep 2023 14:08:14 +0100
Message-ID: <20230921130818.21247-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|CY8PR12MB7415:EE_
X-MS-Office365-Filtering-Correlation-Id: ebb4948f-82cf-4b44-39be-08dbbaa45a91
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7iGxtZzsqbBZTO+6Kjf0lKVMSRZ2qQygZk2dYrQBexK7xCHw+x8BU60BTzqh4XvUXiSgMwVD6u5cO2y1yR7n7wLOZhzCfKGjA0KCxnYu0K3BEtqQXVsjRI2Ci6ddZm/PTZoSBbyIDhOIZGgcHdKbzOevAI5Vu8ieqOH1Lz7e+PpMW0dOvuvJWAHOCyLM0rBIzXSsm0wkZUTFSj5trQSRgwqdxFdy72I4vNl1YnEKl4KJFonizfn7BnmToiYdw/gHVw1Fhk6g4TkNmKpzjM+faDIjGug5FyCryXNnxBW6f92RkqY005NB64dISH8Yb0iZatdWNtC2qiQTyP08bXY3iMl+yCo6tkGeCpzTDWLJn5mXRkWLxAxTMCGlQOty8HAuiangSmyLD3RGTb/qiz4q/JCtJQKtqlenlD2o5V4aG1UZ2EGCfVrLYdq3sZm9q8r/xzYzOEHroempi97e3qur9Vz+CxOliVeR0QRKtxl+tpMVhY0aBNXeWVo7wMigQU11OkBFIlyyQhwqSPJhzaTmEBYyn2qmATGCgNU6YNJ+ssnPoSgDAuZBxnjVwT6bbcpxwiJjdmI9V2TkSgki0wK3zhm91M7zhzynKztAI3gFu9KxDi99JdNFxuV+c/VOCSlCZt1afXb6P8h3DH7EuqGhsotZeAB3HJjhzoFoLKHm3dqHOxB8adljBJm9/oPIw4EqG31tz9bwiiD1vjYHMz3Nu6HqpxxHoX1wpabuHX5KGHGLXizYYx8B4tY44LCV1aO6
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(136003)(346002)(39860400002)(376002)(82310400011)(186009)(451199024)(1800799009)(46966006)(40470700004)(36840700001)(54906003)(316002)(70586007)(86362001)(6666004)(110136005)(7636003)(2906002)(82740400003)(356005)(41300700001)(36756003)(36860700001)(5660300002)(47076005)(478600001)(70206006)(7696005)(40460700003)(4326008)(1076003)(8936002)(8676002)(107886003)(83380400001)(426003)(26005)(2616005)(336012)(40480700001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2023 13:12:05.8520
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebb4948f-82cf-4b44-39be-08dbbaa45a91
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7415
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current INA3221 driver always sums the shunt voltage for all enabled
channels regardless of the shunt-resistor used for each channel. Summing
the shunt-voltage for channels is only meaningful if the shunt resistor
is the same for each channel. This series adds device-tree support to
allow which channels are summed in device-tree.

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
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 117 ++++++++++++++++++
 .../boot/dts/nvidia/tegra234-p3701-0008.dtsi  |  33 +++++
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  53 ++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  29 +++++
 drivers/hwmon/ina3221.c                       |  30 ++++-
 6 files changed, 259 insertions(+), 57 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml

-- 
2.34.1

