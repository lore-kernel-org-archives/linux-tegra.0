Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6882C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B06AB611ED
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Sep 2021 17:45:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231280AbhIURq3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Sep 2021 13:46:29 -0400
Received: from mail-mw2nam10on2073.outbound.protection.outlook.com ([40.107.94.73]:54689
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231211AbhIURq2 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Sep 2021 13:46:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DyuMfmSJlvv6YX2zJRLY40U8RKc1tPL0EceD1f28JMY499gmKrgxmJKKG+xetIoBK6HZtDsHM1xShCj13jKF0bERc2RHsne8N9T9JUZd1qZAKKAQ8bUPBnBRv47sZJXw/nj3zd6MR4aUeHd0ZXi5muMfyfKFDMPIlwrXskD3XITjVKAfbFVTH5A+YPlo/z06XUrBUTgkhm4KARHzgKmxhnmyumU/kjBTKKYWWzibrT1xxeGrgxitBd3Ib6fJpFnBkFlpMdD2DvHuu42fMJPj2SY8h9Vaqf/jRaDdCEH9aybor10JouhTpGvdL2UpqirjegOpSZ/WgDqW8ekn8UXvOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=AI3grDt18tGgWSMpZ0tLv5weebQt9EIAQL3YRi6Mo/wvAB5Lve9typDJQC76JVeWsM02fZdpGM8XrJU9WgWoZcnNsLcbNNozienfT6VfjUwzixmQejXgWzxnCltNfH7AsQmohRyy/i5/aJHEHY4v6++EW+/wUMZRVIlPgFdek00OEHjwPzwtw3CyOB9fgx+t4ZstKSB8b0XCX/NP6F6ahv3mhIhyUMgvg02R+HYT5yyQx7CQamiZduZoU1hIka45EfiwxhvtHJfe4t2P/pMe54SkYJS7uCzRE1liEG7ZdNLK1bpWpYN4u9Jxkqi1Kxk1/6okGD5M+9FJnKHk+JvBig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gLgBtsa3wJ8t/xKjueaEyvy68Tw8OHCzmqn1dq+7GDE=;
 b=b+TmODI0C4ej1nzmmsmejAZMoLt+RW6MUyimGJ4cA6L8cD1KfjcQrtWylQOGzCRdfyOIRfIo1nnypF5Z0QksNx7opb8qiJhGIooLBnW8DWBV73UO1avwhnD+v+AswuG5jF33aD3dy2RUQMr6AY35rAFvApSAz2Y25UWcSH0WA9tpUKqxeoagQpWqxt6eGAps/ncetyW/jgT3TyTZjKgq6MtUorfa7Hd61usqd+bIcDk6awOf2rkHNpiFP3FikRN2g+p0DwqKv1ZBSLjiKXLci2i6qeNeaBAk9m68a2lBXz+s5TBWtMFRrTELkczouCemfoItVjH7ay03G78P12u6wg==
Received: from MWHPR17CA0065.namprd17.prod.outlook.com (2603:10b6:300:93::27)
 by DM4PR12MB5279.namprd12.prod.outlook.com (2603:10b6:5:39f::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13; Tue, 21 Sep
 2021 17:44:59 +0000
Received: from CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
 (2603:10b6:300:93:cafe::97) by MWHPR17CA0065.outlook.office365.com
 (2603:10b6:300:93::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Tue, 21 Sep 2021 17:44:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; linaro.org; dkim=none (message not signed)
 header.d=none;linaro.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 CO1NAM11FT032.mail.protection.outlook.com (10.13.174.218) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4523.14 via Frontend Transport; Tue, 21 Sep 2021 17:44:58 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 21 Sep
 2021 10:44:57 -0700
Received: from dhcp-10-19-66-63.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Tue, 21 Sep 2021 17:44:54 +0000
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
Date:   Tue, 21 Sep 2021 10:44:31 -0700
Message-ID: <20210921174434.4839-1-bbiswas@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 7a97b79f-a021-495d-0587-08d97d2787fd
X-MS-TrafficTypeDiagnostic: DM4PR12MB5279:
X-Microsoft-Antispam-PRVS: <DM4PR12MB5279C1FA8C7456A7F49CAFB6D7A19@DM4PR12MB5279.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: M3seCnN7ER57PWC1vJr4WdVdzVQf9zFnco1bg4XEM08wzckgH8HvRwLCblJnNlfm/CrwiBGq1lEbfGF0ZNIvnLLD6/xznlJJ1KG5Gz8oEvNwcTvJUiG6CF7VavmjPyjB3GwmM5y9hhWOlVhcmV8DsusuwcTMm2sNTnawvgm+s2orFNn+4L7k/y62pGB7PMDHNGsoT7VH0Hstigt0r3ckD39mQeWeIGLWKB9SyU2JX+3x4qLK8c1QTL5eJwHm6bOy27i8jWoqkPyOcCI5YsOjCPe6WabgEe72VuCT4c7pKUL9hR6J+qvEwWtgbGxtRzViocKHF/em+HqBnMrmRjVyVrGP58JO5sSU0sLSxy2NiG4YfhObS2B36d/IrutWWeDQ2cYYtHcPxL/cTI+57WMLAQDuhKVOTOWytP61uh9bs/bvD2M+F392o2g74m9IrLlj/a22oE0E18NuTDJ6PhhkWVeWz4xUENb1cr1o4bjdc2AdPpWK8Qbyn1qoMURl1bH+Mi62RGH8NgEYolpR6j4iu+StoizNt3LfR3BHRwQy1h+FzK7rEyg1WLucb6OBrCHP1upto9/A4LC2XQ/CGWo+vA2STWw+gm6grWUjDrEO95Jcsb+TGX6T8oRIi+5TzyOdx3hWTs80hIVKn9mLvktcHaQQkJ5jYSfbNfhUJFcXaGgkkQwdqEabO6p5hYL7RPJ7X4zoqCQLpc5GSeYmNbfzTw==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(5660300002)(7416002)(26005)(7636003)(186003)(316002)(70206006)(54906003)(110136005)(70586007)(7696005)(107886003)(8936002)(356005)(508600001)(36860700001)(86362001)(4326008)(36756003)(2616005)(426003)(336012)(82310400003)(6666004)(2906002)(83380400001)(8676002)(47076005)(1076003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Sep 2021 17:44:58.5710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a97b79f-a021-495d-0587-08d97d2787fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT032.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5279
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

