Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51DFDC25B4E
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Jan 2023 11:43:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233100AbjAXLnn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Jan 2023 06:43:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233440AbjAXLnm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Jan 2023 06:43:42 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2046.outbound.protection.outlook.com [40.107.100.46])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C6C23D0BC;
        Tue, 24 Jan 2023 03:43:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nUzX6cb05s2RjRCVD1wNcHVn9D1e2xQngWFslJ82FKV/1GDFKMFLnN1nLPA1/dgAOUJrBhB+TYgJZZawEDTfis4yRXR9ks+F7udGoQ7UF5/0X3+GoBcPCFWNTDGzTrWt+sadDwQPEZHsLFmRJL2v7nV5/vOhTgKjhyrqx+riTsg8rX1mfQ+o5Ah8DUIqhzca2Yu7nqSOOy4fUsaR3LEiuHpeB4dnO03Q0jJSkZNdG7zrD+19lec0FTt0An8t6nDw5CIG3JI4REyfsOgeML9GR4w/vOi0nKCEZhUQKFl4CTSNTbOfnKmK9lHK6M7k4I5JNbyrYQ8jBM6JbjrSDxiA3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gl66FkZPawlvIiOMPJr4OXjwnrcuicJTmWFsOj0JQtg=;
 b=WTJAe+Y2uVops2LBS803cHJxcCXw1i031Zr6fiUvf2l1h+7s2e66wK2kxGJAvEdW47C7rRz9XD7Ah/z4cs4QO65Z8FykpGjrepV0g18URZQr/5/9mXAFuyXFCFBbcZf31HEUylthrpF5U43b3b1M6BplGsbVwQ8zu79SNPupphY223a9dcy12pLXh6xh61apgbI9UMHRFkK4JBzejNXH4lRykg1v5ZDr5r8WGylHQ0AJ4vri5EgRkn3Otj5WH/jCLXrDNMQnCtlw4NCZB70DTejMcm51Sk063quhi2+veZ+VrZ5SZUpQf0Y5wRB5Mk8O78MemnZGlbI3iJOJMopGVw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gl66FkZPawlvIiOMPJr4OXjwnrcuicJTmWFsOj0JQtg=;
 b=r1kqRt3ZfrtXHs2OdNiDEwwtMj/wfonBZg8UMOs7UYTGDrlPsgcMtm5O+PBQAd0rN37+dl4xXHljX5e2gF+Z6OYPVJqbz6kTMyoO3yWxDOHW/cenoZuzlfbpag7bW8X8VlueiCjElcmTOA5Xu63tUPrTg3GauAmW+GkA9b+CXLlDOwoLfNm87onZSljJdJUPKbvqsEO3axm41jwUKv3e8B2z30Qcv6gKEMgsQCx8IE2D4d71Y4l8CP/5gALTMnOBV5UbxZ67GWvzODXiMBufnTxEgW8NxNZjnal90YOBw1mIIG1YSsD/iwjKax1PUUQ/e+5CotP42F7HXO5hxcZW1Q==
Received: from DS7PR06CA0035.namprd06.prod.outlook.com (2603:10b6:8:54::9) by
 BY5PR12MB4100.namprd12.prod.outlook.com (2603:10b6:a03:200::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33; Tue, 24 Jan
 2023 11:43:38 +0000
Received: from DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:54:cafe::c7) by DS7PR06CA0035.outlook.office365.com
 (2603:10b6:8:54::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.33 via Frontend
 Transport; Tue, 24 Jan 2023 11:43:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT021.mail.protection.outlook.com (10.13.173.76) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6023.16 via Frontend Transport; Tue, 24 Jan 2023 11:43:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:25 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 24 Jan
 2023 03:43:25 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 24 Jan 2023 03:43:23 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V7 0/6] Add device-tree support for Cypress CYPD4226
Date:   Tue, 24 Jan 2023 11:43:12 +0000
Message-ID: <20230124114318.18345-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT021:EE_|BY5PR12MB4100:EE_
X-MS-Office365-Filtering-Correlation-Id: 1705fa15-937c-4a10-9149-08dafe003bc8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: if4VBPS4uci9qKUBNRCF0V1SDaASr1NH1F5VUuwHfmNoyj0KUFSWY+OoG21YEj+cAyVJodVbNNvJkvLXV47kzfIezYsTAzBTTZZY1V9ZdjxBD7fpSaAgunsDB48VSOcMOaXfGicxp3AKk0IIs1Y1ItnmZY1f9VjVGO9BHvPv4ykHIsCuseC8eaEZ2FYD+LRoTWgh99b+vxsvKXafVsgQMNY9ELAlPXiI0dQ1BnWf0XcDDqwLr7t8asuVmBXI8ZdNms1wXJpyCucOCQsP1yyuBy8ssm1KZsteUBiThch0wO9HIKCJOrJ5bCShyoZGULEq3070zNMBO+YInnYRsvXGiOEk6OGYIRWC56nloZ2WyNf9ZykjJxJx96oRzAhcqupLLLusDTsj+eN5a/LpNP5JtSQorlcFO0IQA6Bet7HwB6LstvgoTxeHxykofP2sKku32UEMbt/7OcAu9SFZ5/vnIXPo6oAgjq78hLq8a798coqkWfPjrDJFN6IRJOqVw1koq4atu0WKYfJPqCbsuBSa/qBXnmuYEZhLKQaLj4BK6GzafLlfDVV/fmddQ/80KAcSfSgS3WjeBP7iAfjjIgWg9LkJecY7Mn/C4wszpQpX40oi6k3WmJn2x34rWynhHFknVrPYQ6OsscT3VHzSxfA5sw7cDF8fstbFWzGRqd+VTaWZwBVwYhsCTlaNZa7dHF4meDUwMGECKOR6c0zJQo/yw4UWjxKaGNktKZ+6vyQ7z0nptX0/BOqy8XoAqJ6JF/OkNOzaWsKn0KW5tWwIByRBz3Fgmg9np23cEpoFVteA7Y0=
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(40470700004)(46966006)(36840700001)(83380400001)(36860700001)(82740400003)(5660300002)(7636003)(356005)(86362001)(2906002)(41300700001)(4326008)(82310400005)(8936002)(40460700003)(186003)(26005)(40480700001)(8676002)(426003)(47076005)(6666004)(336012)(107886003)(70586007)(316002)(70206006)(2616005)(1076003)(54906003)(966005)(478600001)(7696005)(110136005)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2023 11:43:38.1239
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1705fa15-937c-4a10-9149-08dafe003bc8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT021.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4100
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

 .../bindings/usb/cypress,cypd4226.yaml        | 88 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 14 +++
 arch/arm64/configs/defconfig                  |  2 +
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 23 ++++-
 5 files changed, 125 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.25.1

