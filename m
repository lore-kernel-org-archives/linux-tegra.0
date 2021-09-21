Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0E88C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74E4261175
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 09:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231301AbhIUJoA (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 05:44:00 -0400
Received: from mail-dm6nam11on2042.outbound.protection.outlook.com ([40.107.223.42]:38817
        "EHLO NAM11-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229894AbhIUJoA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 05:44:00 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bzSbIsaI4qVH3FhCPHfgv/A9iDKXpX4CnwsSVHzUreOD47l+BLS5VdmCmpN6wqh0kswKEF+r9uUpSEL0H/vRbz57sTikmtQTv+zrRof2+J5KQXg596VOIC9sMDmBluy7xzLAJuoyaVRcBrbbCFHxRVeo2xPdgE/wx7XcREbMlP5WfCw8J2LgJXT9xeuaOwh8RsLKqp2bxPrPHCGcN7vk7wlwv2ZjYpUctpfcc26KmePTxL5yM/1x5bxbtleXonVpNrgHrRtFjoNnQyLCANrtmoLmgVhkdzNBgT/NLmeG1BlDNcvh0dAhsU/vcGcj7iMrO3YDKPFbmqN+9Pxa5a+IMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=n6oX3CP7VMpHWubYChUSkDdTsdhhgmPG0KguI7BbfzriBUJTm4nEgQrePK2yA27te7n7N4uJ2Xqz3NNP+/6A+vsyXOpEeAe8x3J0Zj0TjXaUYaGNzB5gfoDga89sVkIsS1l4YmcdNism1RzELNUYMJQ7O4/J5A7V2GUbglDTdyhutuDIoXjevQj+DOnI5figCC2TW6ZgZ5iJaLRrp3iwxzJVNulhw02QSXo8qLBjxI0Xa2roLD8b440m6lIf7n5nvJSOravkL0ADbR3CNxIsntSQOpzuuSMhdTncViZWcZbjEsytTWY76HMP/5Ye+6UVXNJZDJzpKV0lL+i8iMfT5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=ClNAI+o1K+QWJ9BQVVznSrfFuVdEC/ThOAdr3zPsSVt4BzZkbbn8QGTtwL4UarNHRpgE/6jFtH0ggHdzj2kDXLUD/NsdVZyF6fZn5/vJEWs1xdN7kPyiLxE8IwKbBSPUYS3sBetaSSndXOqrRgzeICQo+KfkdctCXTmy2RpkIOzZ7+zdgLUMBKwzIMQbAprMkUcvRuJjffwuByEsYJ31zjnq/swmFmWyZemKMSYDNJI9PgFnKm0p+7AETUiUzUszwEuxsvgU3nrL/bxbhRRQuNQSLsHKRX/nsaINMvnNZ9XMnf5XUg8xtxzGNk0TF1Z3iZBIYh3/9uFzzR64l9nPkQ==
Received: from DM6PR06CA0024.namprd06.prod.outlook.com (2603:10b6:5:120::37)
 by BY5PR12MB5541.namprd12.prod.outlook.com (2603:10b6:a03:1c6::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Tue, 21 Sep
 2021 09:42:29 +0000
Received: from DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:120:cafe::ff) by DM6PR06CA0024.outlook.office365.com
 (2603:10b6:5:120::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT038.mail.protection.outlook.com (10.13.173.137) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 09:42:29 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 09:42:29 +0000
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 09:42:25 +0000
From:   Bitan Biswas <bbiswas@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        "Jonathan Hunter" <jonathanh@nvidia.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        "Ingo Molnar" <mingo@redhat.com>,
        Jassi Brar <jassisinghbrar@gmail.com>,
        "Philipp Zabel" <p.zabel@pengutronix.de>
CC:     Sowjanya Komatineni <skomatineni@nvidia.com>,
        Mark Brown <broonie@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Bitan Biswas <bbiswas@nvidia.com>
Subject: [PATCH V1 0/3] Add tegra header license and dt-bindings Copyright
Date:   Tue, 21 Sep 2021 02:42:03 -0700
Message-ID: <20210921094206.2632-1-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e6f7d421-1af9-4224-6188-08d97ce42102
X-MS-TrafficTypeDiagnostic: BY5PR12MB5541:
X-Microsoft-Antispam-PRVS: <BY5PR12MB55415F312B546B36651F9CCED7A19@BY5PR12MB5541.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6hMQLreX30COxM3N4mJtcDDvjyzgHYK4We4SvB4orro3KcZQZFVzd8VxlxdAzic548sABBn57+dIJWsQZF6EQ0801O7Ea70OMT/aNL/4H0KUuHvK+q556i+aTzwvRypV8yJZmuObfwuTYKkkWijaJVCHKk25etwxL1BjBjGzWmKXC8bDC4KNAEs6UY3f96WKnEsekX7UFdw/XjKb2BG7zCOyazmHSOlfBKKddjvWaaucabsD/I9EkrGr4taJ10CZPZ+eGMHPuVlS0lgdf+sQgzUInRf7jrW1jDYFT/ZtVHyhmGCsPUWo0kOMLcZTMusJmcghc+AWP/9RhjrDYAmnLBCK5CMn4WWPJmpZ99wcmL2BS5dnyaucq+gqVGdZBkGKjhqk3eanqFWXWY/kX7sCOUH4Riy0JHIwx8/yPFuV4QNrwss6vBZvQujXgkHZgxxRSTiBNvmwdDaDDSzwWcn9owlmT2d4b1Q1cCXqgtQmhvPVDc40j7Iz8uVFags0vhdwlXeGJ76C+GCKFpYKW/DRHD5XVkOGm9inPbNgn7f3/ioPBJJbVmiYnud5UMsWuQ7D0a9Y8v1aFVwnOjcXEhLHuqIoTaxBX3T7lYyQKYuGSfwnoZcX0Idk6R01h1vlMJJxTCJHMrFNgjRH30C3/9GRx7UTViQ7euIytQIENNZ1m6D3UNmUW5NBrpqihgBRlQUDoberhDIfrJ1I2NW+EJLPtA==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(508600001)(36756003)(186003)(7636003)(47076005)(70206006)(54906003)(2616005)(107886003)(6666004)(1076003)(2906002)(36906005)(7696005)(82310400003)(4326008)(110136005)(83380400001)(70586007)(26005)(316002)(86362001)(36860700001)(8936002)(7416002)(356005)(8676002)(426003)(336012);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 09:42:29.6588
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e6f7d421-1af9-4224-6188-08d97ce42102
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT038.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB5541
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

