Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57A15C636D7
	for <linux-tegra@archiver.kernel.org>; Tue, 31 Jan 2023 17:59:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230238AbjAaR7D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 31 Jan 2023 12:59:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229504AbjAaR7B (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 31 Jan 2023 12:59:01 -0500
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2054.outbound.protection.outlook.com [40.107.102.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B08A459ED;
        Tue, 31 Jan 2023 09:59:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bcTYSK5SUM9lt1vsRdznOtQnxzN0Ir9pZC1wvhaZT8U9lA6No0+n289Z/tIirM/9DhsNQxZdTvLJl5yWjnELzn71Cs64X9u4kr7L8GXoOOCjQr99tBx/nVcPRmkRAAgOedoa5LvsYOn29PFq/JZNjkRJg3z3kBE4xXrVHUT1X1/0nZr9I+MDnfCVa4UYJRGPdbQe1YQDi//6SV3AxfIcEo00YdDdgOOH9/NNiozSXIOJUB6UjeBz5R0vLwlpoX5r33FZKFrM7VoxArvmCAqRVMaTEJW89rc3YhwXxMv4l0iM/2aZFHeK52q2GWulGQBBjAXpAduO9ZzNfmfzK38k3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GdaxQY+iAqen9DcZs0anLyxTgGq6FDDOAUDcOP+UF9s=;
 b=M6cYHm0Y3tdfENtiSXOAYLGt7V3tlHZi5siZxbeU+2+cGkTJmbaDcCXLz5E3f6Stu/2/+FigjU34jfGXVUW9o21WzJN9O4YJqMGGmaEsC30VPxPSn9nq02shAn8BZqJpVY+p+FRc5J2gFARLoljCvHCMitvEXs/brjdnefe0Q6fn+Eezu095qGCyDVicw6hqkbX0Z3NRxRHlMWlerabh9UeVRw8Fd1IbTw6MK6DZUjINebG/M0evY6XmF7SROHj68obT6XZic2Gf9XVR/mU0PxyVOt0dHqO9oOls/0ZtE/ZNVEYXCJ1pqZyiI8rlvlnlKwA68pnmvMGuefxJ7zIyfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdaxQY+iAqen9DcZs0anLyxTgGq6FDDOAUDcOP+UF9s=;
 b=Ca3wjRN80oSRBCAi/jgIy8J4ALh96sJd+ca6SgKg8gk+Qdxy1GVjrCLj71cFAVPGmyazbFeuRQmN4bP3UzF5oBTL+zplDzK/MetUVEVKfTWDXxd2Ldf6pD1lAvQi/Gs5RZ0zv/oW/tivuIblKILJzgAcwwkCbAsU/PFe1oQU9s4zSX9XyJ2D1z5qRmEautxK/lgWbPGF+uSXDHjH7sTInwUqig7RBNsf6vId29ThSpoWkbM2kjwHf7l9oCLgSLD0RUi8lat/jidNLYG6FkkbtNII7Xz4OKmZ73tiwfycqwDd0m3RVSWqaSgNqHXNqiL/1SEY0L6ESiv0wYwiHRWSiw==
Received: from MW4PR04CA0306.namprd04.prod.outlook.com (2603:10b6:303:82::11)
 by DM6PR12MB4497.namprd12.prod.outlook.com (2603:10b6:5:2a5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.38; Tue, 31 Jan
 2023 17:58:58 +0000
Received: from CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:82:cafe::52) by MW4PR04CA0306.outlook.office365.com
 (2603:10b6:303:82::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.36 via Frontend
 Transport; Tue, 31 Jan 2023 17:58:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CO1NAM11FT054.mail.protection.outlook.com (10.13.174.70) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36 via Frontend Transport; Tue, 31 Jan 2023 17:58:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:49 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Tue, 31 Jan
 2023 09:58:49 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Tue, 31 Jan 2023 09:58:47 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        "Krzysztof Kozlowski" <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Wayne Chang <waynec@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V10 0/6] Add device-tree support for Cypress CYPD4226
Date:   Tue, 31 Jan 2023 17:57:42 +0000
Message-ID: <20230131175748.256423-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT054:EE_|DM6PR12MB4497:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b83ce31-84c3-4f94-b56c-08db03b4d369
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FOgB9Zocz6JQBvKMW5987m//kZU2WkKZKrcF7OpCPMXPCadktncg9eKRjXtAnmagceGjWuvOTNuT27QsbIy87+MOMIvnJiG6PKPtaNET/UU8F8zYvTd7TRA0SXWVfH4NSls6vtlf/EyGlIorPa8W+DwOiWaWCNGbavmy1BQT6rB+26Q9hRbEdtkrRvaFw1qYsP8bEJc9O9QBLkV2LDo0zuo5mFRe7ZN4Yyi27SCsQ9+ntV++ljWrGRygcwU1D1Q+aMPAhBCM/lPW1wyaOeY0AmszTNHwWbGcIz8lMeC1mE1r/nAf5KC4ImIhBK8oPJBQPjpA/8wRDd0YAbLloM/L1hWmYIlgTZK9aMg2mxBiwEarGLlpsKNAcUNfUV6VweeXLQ872xEZL7F3GRDbAGxscRyGehp51yWb8Ao3uqcFMfE4pIakaXgYWUTpzCOT2xucz4xAhZqwv2Wf4Ro8yGpHhys+XuIAhL4ibEEtKrQbtW4mU7Z/gPAIlBRtIA53Lf8HJKBVpgFKh1gqeSEZvov8s5rT1ltVtK7KXUAOhTaYiAovcZEyoLeeg//hCi0zAz0HmNhLZU+40aqjHQWGyLQ4jO6+PNyTMGmVjlmKoUoMP1q/EU4CbmRQ7x2en3EUty0rFHzN3yoICzKmlxGepAskWJYh6Qz8NZkrloFUa4GejPN12nys8vdycItc12tAOtqhMziPUKYdefbgnQnAqGCSTEtGe629BvGuEmSQNH4Ry2kFINVJ1kGKtp/ELYDrIPZo8jzIdY/7GFRvZXeU2UX+n6jO4N684FkGSjbmddgheuY=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(46966006)(36840700001)(40470700004)(7696005)(2616005)(336012)(7636003)(36860700001)(36756003)(82310400005)(82740400003)(40460700003)(8936002)(86362001)(5660300002)(110136005)(54906003)(40480700001)(356005)(316002)(41300700001)(426003)(47076005)(2906002)(83380400001)(1076003)(8676002)(26005)(4326008)(186003)(478600001)(6666004)(107886003)(70206006)(966005)(70586007);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2023 17:58:57.8036
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b83ce31-84c3-4f94-b56c-08db03b4d369
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT054.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4497
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

 .../bindings/usb/cypress,cypd4226.yaml        | 98 +++++++++++++++++++
 .../nvidia/tegra234-p3737-0000+p3701-0000.dts | 78 +++++++++++++++
 arch/arm64/configs/defconfig                  |  2 +
 drivers/i2c/busses/i2c-nvidia-gpu.c           |  4 +-
 drivers/usb/typec/ucsi/ucsi_ccg.c             | 22 ++++-
 5 files changed, 198 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/usb/cypress,cypd4226.yaml

-- 
2.34.1

