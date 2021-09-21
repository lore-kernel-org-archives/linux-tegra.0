Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7695DC433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:27:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 599A46115A
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 11:27:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbhIUL3G (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 07:29:06 -0400
Received: from mail-dm6nam11on2049.outbound.protection.outlook.com ([40.107.223.49]:49889
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229474AbhIUL3G (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 07:29:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ivV1drM9VHDq8T1c26PElO0Thdp+YFZ1l/Nzd5hZzePtaEzsUonhTHZTvCMeiei0UAywOMz03a28OfKE0UFDi72t6sPQW2gfPXZ8gIlG2YN6bLrfjVO28Rb9DU0zw8CeQNQJfrOFEEAGdM4Tb3c3kHsW88vOBBemuzh9Oyar33OhqNSNAA678CaJYVuPT5UHEm6xSzldtKBOf7lX9lau/lhp2o0qc/g5mHqfvpMkFYWwD0d4AC8Ud5Ea3EDcQJb/SRjSlKd9e/rnQRzO+QcVXjFzOG1htZTO4qJo8pyWw05SyQaluAb0J4Z5QXN0CEKXktTk4wkl/6bpV8fKm4xxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=lC6L9B30HcYRYp+LSqFiUntXfZxnbouwRmoaqDDIYE8k1ak1/Jxt3lCSQQGmPrDfJLfHQn3SCZVtRVavxLTAmcVXoLPT2Z3rthVrwN1g7WJAmlR+1VjDn2WL+WiG3ZJgVrf2AVZT6R7A4R/ROUcvzmSNgn7W/2CHdduYkl98ROldyxVZfhfXFiJ53+QUUxzNSRERAOUxtecZSwCIEu88tPIzPBRiop2bvLh+cKFEAmOrzJ823vcCXOwMDtITh5NCOIz76CDADQq57Qt3rJAqeNO9wrwHAEiJ7YVq9RhIfOC+JmrSXR7AvIEuAzNxDDDe8bro/PQxczyqu8CFIPONEA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=k8Uj26192tY6fnDLQv2D4MeuhA2y7qCd+qGVX7CIA1n08nPrRxXeI8h7EBUWq8dJFX7le2r7SrFDy6g/TE7o2TUTulKNa5WkiUWa1/aLmtXeRH6VagpFzIV2DKItYPqO+31nEQMKt3H2kprFKliK+4O4OizsZEVuhDJir8G5sbdr6xDuLViBqIz7sNrf/W2/93eT6bTaz89YPH4CXP6eHCA/pFzvzCLokCjLPfMqU+pz4EzOOu/gFmwXHAimXDd9fscwUffiE8EDfT9gp+OWNJpfUqpkB+0NGQpcPA6tMnDyG8i2s4qE7TXzqwZ4ykcZeQEWZs2Q8xrZE24ge9qkMg==
Received: from DM6PR11CA0056.namprd11.prod.outlook.com (2603:10b6:5:14c::33)
 by DM4PR12MB5246.namprd12.prod.outlook.com (2603:10b6:5:399::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 11:27:36 +0000
Received: from DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:14c:cafe::24) by DM6PR11CA0056.outlook.office365.com
 (2603:10b6:5:14c::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 11:27:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT031.mail.protection.outlook.com (10.13.172.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 11:27:35 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 11:27:35 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 04:27:31 -0700
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     <krzysztof.kozlowski@canonical.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>, <jonathanh@nvidia.com>,
        <rostedt@goodmis.org>, <mingo@redhat.com>,
        <jassisinghbrar@gmail.com>, <p.zabel@pengutronix.de>
CC:     <skomatineni@nvidia.com>, <broonie@kernel.org>,
        <linus.walleij@linaro.org>, <linux-kernel@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 0/3] Add tegra header license and dt-bindings Copyright
Date:   Tue, 21 Sep 2021 04:27:13 -0700
Message-ID: <20210921112716.3007-1-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56a16d45-63bb-41d8-d7e5-08d97cf2cfc7
X-MS-TrafficTypeDiagnostic: DM4PR12MB5246:
X-Microsoft-Antispam-PRVS: <DM4PR12MB524635BB54471BC503DF5543D7A19@DM4PR12MB5246.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tItkWY0gTYxbOdV7/TMI+/eYS0M5SHDpIdxACaam5+5OsMtrDHlsZ0bYNDgwg8tXvZfbACau8hUW4gfw+r7hJ9NmkIKlQp1lDCOK6RtyLKNorprTlQ56btbXOc7EhDvtbrWVEai8awAbEAuFGwSpub65VR6Yrk7PUavUilJH5XazEb3s5GMrSZE5QlRIXpR/LRWfG/4KxqDSUvpwIRx9LOICMm6zbZItpNisCMwn/ZUNqXfgCzlHOMT+BP+RSzxfvb3LoybQ2yq8V8zr5xQV2i9tU3Fqh8y/NeVCoFaV+X9BIs3aN2M+ICuLhFV4cymc/OP5XpeaW+eG9TH2FWTB5ho9ij6hWkFk4Vvpi1VMUuty82YO1zK1pE7E5Nuj2CkAD20w4Amk+0NYDigDOKuG0nIBobuGV/HOE+rSUd2A1DTqJDW5PjmgnUfmurK1XHNTJh38IGRTt8mX5fUXK7A+zFbr84CTXkJ2+9HvdeozlRMECz5kf/ow9a8QhMSn51yjSReD7jhQCHDWNm1MBkDTn4n5cEY/uEnMdq5DmZci1GWMLQP+aY8ELiH8Y/TZkI89EquL38VxZJBzN8CCPwZuE+cVRwrXOEAtAOdltLYpvWtCHwxcL3C03w0N1tQBGLxdLvGwuhSc/EM+wt+rUEpzUzLITZJhAwmui+w32Udq//Dk5RFo4gV9vec5SP/roidVmpse5yISU0nXfiW4MSGydA==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid04.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(336012)(70206006)(47076005)(5660300002)(356005)(8936002)(83380400001)(508600001)(1076003)(70586007)(7696005)(426003)(82310400003)(36860700001)(36756003)(36906005)(186003)(54906003)(110136005)(26005)(316002)(2906002)(107886003)(7636003)(4326008)(8676002)(6666004)(2616005)(86362001)(7416002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 11:27:35.8466
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 56a16d45-63bb-41d8-d7e5-08d97cf2cfc7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT031.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5246
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Few Tegra header file are missing license text.
Some Tegra dt-bindings header do not have Copyright.
Add license and Copyright for such Tegra header files.

Bitan Biswas (3):
  dt-bindings: tegra: memory,bpmp-thermal: add SPDX license
  trace: events: tegra_apb_dma: add SPDX license identifier
  dt-bindings: tegra: clock,memory,thermal: add header Copyright

 include/dt-bindings/clock/tegra114-car.h            | 4 ++++
 include/dt-bindings/clock/tegra124-car-common.h     | 4 ++++
 include/dt-bindings/clock/tegra124-car.h            | 4 ++++
 include/dt-bindings/clock/tegra186-clock.h          | 6 ++++++
 include/dt-bindings/clock/tegra20-car.h             | 4 ++++
 include/dt-bindings/clock/tegra210-car.h            | 4 ++++
 include/dt-bindings/clock/tegra30-car.h             | 4 ++++
 include/dt-bindings/gpio/tegra-gpio.h               | 4 ++++
 include/dt-bindings/gpio/tegra186-gpio.h            | 4 ++++
 include/dt-bindings/mailbox/tegra186-hsp.h          | 4 ++++
 include/dt-bindings/memory/tegra114-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra124-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra186-mc.h            | 7 +++++++
 include/dt-bindings/memory/tegra194-mc.h            | 7 +++++++
 include/dt-bindings/memory/tegra210-mc.h            | 6 ++++++
 include/dt-bindings/memory/tegra30-mc.h             | 6 ++++++
 include/dt-bindings/pinctrl/pinctrl-tegra-xusb.h    | 6 ++++++
 include/dt-bindings/reset/tegra124-car.h            | 4 ++++
 include/dt-bindings/reset/tegra210-car.h            | 4 ++++
 include/dt-bindings/thermal/tegra124-soctherm.h     | 4 ++++
 include/dt-bindings/thermal/tegra186-bpmp-thermal.h | 5 +++++
 include/dt-bindings/thermal/tegra194-bpmp-thermal.h | 5 +++++
 include/trace/events/tegra_apb_dma.h                | 1 +
 23 files changed, 109 insertions(+)

-- 
2.17.1

