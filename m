Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9935FEE49A6
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Aug 2023 16:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344053AbjHYQnv (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 25 Aug 2023 12:43:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34714 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344100AbjHYQne (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 25 Aug 2023 12:43:34 -0400
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 328C526AF;
        Fri, 25 Aug 2023 09:43:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JBswCa2z5p3+B8xA60kmTdOaukK8qzaAN97NCMq/FiVmTe/mxsAQyPCI6sRPcYbYM/BR8GO0Xhld3cfg834yaEj7+DCRBQaRv8InXMxsAtbeSpMEmBziABO6NLK5O2iKPXZ6Z0fFYnWetw9f1qSAcJ8Fg1vfw4MmtjHksbDFdcsIZ7hfCH/l3V/PDEulYNFRMJJLDjWE3bq1uf1Wt+2ose6BRDYatZedAnsmget3qYRgv3UtulcDLF9KTdaJ3+gGevuzu2naBLKNKaJtI55vvoMZIaIyut54004GIJ6FR/zhfUyusQMwlEPnvFn93aV7CXlYrwy0Nxq6P9DwCIZa3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fKPlg9BqjPcPP3zg1I1aEPGcieKY9YGo3NeK3I/tO1Q=;
 b=fftM7yd5fAmzzcHXYEaKe+0e4RR5HjLr1rnewe66w6d5MQvjflujp57Dkc40WqtDdHIBxFiA+HnSqxhL0+aKk9dkRfRp/NI9xTkYIuprjCBZrJxAkYbiOqMGC0YvnT4GpYA9SoZXqjGqUSVKZjf6ZwZElrttFeWEAbQmuSIoQA1IXMcNxq04hmfGPh5QHId+vyWdh1MfiGZm2o2VMcCqY9YoQcqcsw28friBJyeUNRI4Gpj3q04A/V01UBD6iiUeAo2j15GtiQuiTUM9VmrLvycp+Sg867Mk/J5MKteZwoTVxnxQQ+mHHc1YdDeUrZ1bsDB4jYKywPkkmo8isnKQuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=suse.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fKPlg9BqjPcPP3zg1I1aEPGcieKY9YGo3NeK3I/tO1Q=;
 b=EXZAB1+zfZZ1udeaYo4S+0N1rkZ6wVnrNUnqwF0lzQL3HiH2AnqYMAwvF3qaiHkVn5cqYG1/+AcBX5B0YYHW7JpjNztv/OsMUoxiJmtwSaFUfWXvbwwLNzuxGOEiCN19WYsMWHjsDcSwNfaOTVZXPOklpXMiPGXfZVxilO4NhDaZzzBB2pFyiFxmraxG4zpjgL3yBhpjH0xGXTm0rcf+tnaLk4xE0yc6o+BbIlbvxDjzgXiGdlEHs4IS26cD/rOh6dfRjdsZZxhqBD08hyZELdGaqX8nhRa1+gXBsjDYqsunBlu3TZMH0msJnrT2/CSG3Qvt8u+gMWZYpL94ue2sig==
Received: from PH8PR22CA0006.namprd22.prod.outlook.com (2603:10b6:510:2d1::10)
 by BY5PR12MB4854.namprd12.prod.outlook.com (2603:10b6:a03:1d1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.30; Fri, 25 Aug
 2023 16:43:07 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:510:2d1:cafe::96) by PH8PR22CA0006.outlook.office365.com
 (2603:10b6:510:2d1::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.27 via Frontend
 Transport; Fri, 25 Aug 2023 16:43:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6699.14 via Frontend Transport; Fri, 25 Aug 2023 16:43:06 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.5; Fri, 25 Aug 2023
 09:42:55 -0700
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.37; Fri, 25 Aug
 2023 09:42:54 -0700
Received: from nmalwade-dt.nvidia.com (10.127.8.9) by mail.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server id 15.2.986.37 via Frontend
 Transport; Fri, 25 Aug 2023 09:42:52 -0700
From:   Ninad Malwade <nmalwade@nvidia.com>
To:     <jdelvare@suse.com>, <linux@roeck-us.net>, <robh+dt@kernel.org>,
        <krzysztof.kozlowski+dt@linaro.org>, <conor+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>
CC:     Ninad Malwade <nmalwade@nvidia.com>
Subject: [PATCH V2 0/4] hwmon: ina3221: Add selective summation support
Date:   Sat, 26 Aug 2023 00:42:45 +0800
Message-ID: <20230825164249.22860-1-nmalwade@nvidia.com>
X-Mailer: git-send-email 2.17.1
X-NVConfidentiality: public
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|BY5PR12MB4854:EE_
X-MS-Office365-Filtering-Correlation-Id: 8a1861b6-5897-4d6c-f920-08dba58a5beb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 77JkQ3vb/NSWCxNFkI1GXtD+kM066nuAX8W9X957XMN7+R+jlkEGo+XIKIY1CnLUAixwSmfcY/Gv59Gm+4/qgrMTZudNodw2UvJIJlju3jVj03YbDyGb1T70FZxRl7epnGXuojEsjyiTVbrJ/CgNg95TCFcBP3WSIwrDBB9rrNLJHV6XnxcdzjQ2DbUuW41DQMC0/+UX5RZgGntSoJqiZuZMBVKL0aJzbtcP7pANDLp2ciVxLRO72YUfzXxXLv3qzSpJ+CLV14v7+IgzJHqobOc70+8wpjl18h7SlCkQYHOH2IeH5gi7abE2SCVkBNQY6EkcEvHgAnYOEJ97bFpqj0VmxpkfrAu8FHG4h361BYYCSJ+QL0xclPiMnAqZgiSpklAisorHA5PkozNRIREu5kk4x0HIuFQc7xVS8JKMZ48IYZrzpLv24OHwqo2GgosYWOH/v58cz4dDxS/j/WYiME5MVOe0mDiwzJ9jcg4m6wqhWRXXNSQDOIjOuYo12XXMQFrUJ3ycEEjDKcTecv+Fp0O9I/AXcoAXl5NKUZo9fwHckSzRjCWaY7Q1/JmxCYBbG/WW9cSzIJD/o7ZA6uS3susRjPMkyst1N5LnavAnrlFh3W5qvZ3+scUNQa54oxyoM6BBe+fmacOlkas4thJkE6hqItxp3UVZN1k670Kj1u182daXMcO/arwwz8ustXFuJYhjiSOrKph0fKCDq2S2ZUcA2X+Q+08Buf/8DvrQ3BBm2nmgI8YjMQV+mE6M3IJ2PW/bAmWkHvRRC/X3rbjNYA==
X-Forefront-Antispam-Report: CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230031)(4636009)(396003)(346002)(136003)(376002)(39860400002)(1800799009)(82310400011)(451199024)(186009)(40470700004)(46966006)(36840700001)(1076003)(336012)(36860700001)(83380400001)(478600001)(26005)(47076005)(40480700001)(2616005)(426003)(5660300002)(107886003)(2906002)(8936002)(4326008)(8676002)(921005)(356005)(82740400003)(7636003)(40460700003)(110136005)(70206006)(70586007)(86362001)(41300700001)(7696005)(36756003)(6666004)(316002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Aug 2023 16:43:06.7912
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a1861b6-5897-4d6c-f920-08dba58a5beb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4854
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The current INA3221 driver always sums the shunt voltage for all enabled
channels regardless of the shunt-resistor used for each channel. Summing
the shunt-voltage for channels is only meaningful if the shunt resistor
is the same for each channel. This series adds device-tree support to
allow which channels are summed in device-tree.

Jon Hunter (2):
  dt-bindings: hwmon: ina3221: Add summation-bypass
  arm64: tegra: Populate ina3221 for Tegra234 boards

Ninad Malwade (1):
  hwmon: ina3221: Add selective support for summation channel control

Thierry Reding (1):
  dt-bindings: hwmon: ina3221: Convert to json-schema

 .../devicetree/bindings/hwmon/ina3221.txt     |  54 --------
 .../devicetree/bindings/hwmon/ti,ina3221.yaml | 127 ++++++++++++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3701.dtsi |  53 ++++++++
 .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi |  29 ++++
 drivers/hwmon/ina3221.c                       |  39 +++++-
 5 files changed, 243 insertions(+), 59 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/hwmon/ina3221.txt
 create mode 100644 Documentation/devicetree/bindings/hwmon/ti,ina3221.yaml

-- 
2.17.1

