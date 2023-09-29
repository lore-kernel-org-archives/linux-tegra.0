Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CEC1E732D0
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 10:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232630AbjI2Kh2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 06:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57506 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232964AbjI2KhO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 06:37:14 -0400
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2043.outbound.protection.outlook.com [40.107.244.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E651A8;
        Fri, 29 Sep 2023 03:37:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JwjIYK51/eCWzz3c0+vqiQeSGXhbEQ9OoW3m6chmsmoasBv0wL2voxDirrukdwiCl7bjl9RJNYk4vJ+UvlNBZq//3o7JN3V08ZuOTa1+P7HrlWTkqpWVj9wNhADDbc0UwenC0OqyoE8fwWJmd6lz+sR1qgEzuvWAUTP0B8/voeZcUed4fD/TMxG9Fb/vVGsZ/7TE4nCIU0PGNJSqmMXnWg88CFmv1d9ZXTnL75ThxOjmo2CVczRYL7NL0MzGs+4NqYF7lLetwUCw+hZnoOTgPNDqESUzSvKBr/NZlJCwWmowcsNn7Xb+qWcR3bzaFUZb+E5kV+AW+Dv8lPFDed8z6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HzmBytGlssEAXo6TZTmJ28Dxvt+KMLHHoqDjokA3bQ8=;
 b=lhZAHvaD7Akuy6XtZWcvN5wYtqCM9UMMMCI5BWZzIezJxUmGT0t07vsRIbAYsD7xFXADgfzDGqqvsgzNOkHinqBxLFWC/AJ5q2K/ADuT58+y+iG3PggJSCiA20qrXIhY9gtAcuKuNfT/IQ8YL11QK+QiABHX1xVHbtWfV6c+foUKuef9fXk+8dWFZFTwHY3mQYBifywpI5xc9yzBly0El+rDzuS0JqtmRF0Kjp+XjbSZbU3TN3qKtmbLPIOE92SEU13o/16CKMJZBEVSfgDbwWIXGEpIRFQXHGGg5jxEJkFhhPg8Aw3Xn2+uUDai/j3Y+BDvpAXvoM9vcrXOoI7vMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HzmBytGlssEAXo6TZTmJ28Dxvt+KMLHHoqDjokA3bQ8=;
 b=jMpb+ceVRwpxs8njQOQJWKkN1HQgCY643b1MuqB+wSSceEndaqP1iROCdxhlhXjh+3WJ3tG85LXEogwFaLOCkbA2HF0lKN49qtFgRrFnpmamKsi5JkOXaaTJLSG/SJY+LZAl/POxOUtHP/kXRfwDDW9dD+cyU3GHxPyUeC4p0lerHsyRHd6dcX7vRvHUH3Bi7/f3fR+zAOPVlBpbXOHGgXwhFFhiGT9Hr8iFJXgAOS2BVPx3GjJ9LPg1EqoKJ9xfELrpRKxPQsqRH+1lq5YVvuH/stOoODUzVcIR6agSIgHPBgRv95P/F7k0FmRhGwSQvEd+eSGIz8ebGwpf/k+c3Q==
Received: from CH0PR13CA0045.namprd13.prod.outlook.com (2603:10b6:610:b2::20)
 by SN7PR12MB7178.namprd12.prod.outlook.com (2603:10b6:806:2a6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.26; Fri, 29 Sep
 2023 10:37:06 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:610:b2:cafe::c0) by CH0PR13CA0045.outlook.office365.com
 (2603:10b6:610:b2::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.13 via Frontend
 Transport; Fri, 29 Sep 2023 10:37:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.76) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6838.14 via Frontend Transport; Fri, 29 Sep 2023 10:37:05 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:36:55 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 29 Sep
 2023 03:36:54 -0700
Received: from moonraker.home (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport; Fri, 29 Sep
 2023 03:36:52 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        "Rob Herring" <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 0/4] hwmon: ina3221: Add selective summation support
Date:   Fri, 29 Sep 2023 11:36:46 +0100
Message-ID: <20230929103650.86074-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|SN7PR12MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: c8ab3ab1-07c9-4823-249a-08dbc0d8066b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3gZGaK8SsaT7STBq5L20JM7GyV3cqUm1BF0fLeaTQLqbi/LDwsYa1D3abKMV3TykMI1yikQ4T3PVnaQ0tb2yU/Dy65P9Fok4+zId8FDPNbCKmusOKAlGIoRD4LoQxPCt3BRcbz5rbBF2vmklEFdiIa0KbFw4ILq2/QhVTdTDJg0586zUF18F+wRdKcN6oB/sWr+E07fGEeV7BXTc8BNR22dFvpLvhrIDcsYzQieEW6EqcfvdeDwGM0acAra+J6pRt9qeGPiy9YhMG/0mtqgozYl0yc4e74u+lo6ze4ugGnSF0rPkdrAbQjuTxXsZgO74Uw2es8ko43SRu/qj3gcN9psoYHI9vZawTxji/yzRHop98b2x+Z7OVZLfNLj8zduT71aXRXJN5ZARiHyG9je2O04FCSHejOOrfmCfRRADfiL1DuQdPgysuKM8pbfDgtjArrRdlYdLayEy+dQ0N9syFC/Li1FSGaRFAmzpQwPbKRa6Grg5dswJAH1/NZqRsO6SEKeyeBQs/ab31RoeC25uJ4kF+G8va79FDoBoY2wCtGxOUTv28O7ugB4U3HtqTeA8bXzn2mAmvj9WtPK5FJrOpv2r4PYIex+Z4EG1th/e3TsUBZVPnl9Psvh6jcDYqW/ceBy4RF8h5RhGU/PsQU28w7Wyr5gcCxZAoiGYmVJyRWKy9nTG7SGib5yvJgTwfoUvBecmE1LADSUdxjI/9XMfkqImDoloCfa469DCpyQWjabfz//3c2ApUtXLLI4aRk0U
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(346002)(39860400002)(136003)(396003)(376002)(230922051799003)(64100799003)(451199024)(82310400011)(1800799009)(186009)(40470700004)(36840700001)(46966006)(316002)(54906003)(8676002)(4326008)(8936002)(41300700001)(107886003)(36756003)(40480700001)(26005)(2616005)(1076003)(83380400001)(70586007)(70206006)(426003)(336012)(478600001)(6666004)(356005)(82740400003)(86362001)(7636003)(47076005)(36860700001)(40460700003)(110136005)(2906002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2023 10:37:05.5117
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c8ab3ab1-07c9-4823-249a-08dbc0d8066b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7178
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current INA3221 driver always sums the shunt voltage for all enabled
channels regardless of the shunt-resistor used for each channel. Summing
the shunt-voltage for channels is only meaningful if the shunt resistor
is the same for each channel. This series adds device-tree support to
allow which channels are summed in device-tree.

Changes since V4:
- Moved dt-binding comment added in V4 from patch #2 to patch #1.

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

