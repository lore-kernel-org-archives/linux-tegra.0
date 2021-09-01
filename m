Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D89BCC432BE
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C374461027
	for <linux-tegra@archiver.kernel.org>; Wed,  1 Sep 2021 16:19:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245130AbhIAQUb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 1 Sep 2021 12:20:31 -0400
Received: from mail-dm6nam08on2066.outbound.protection.outlook.com ([40.107.102.66]:11296
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S234245AbhIAQUa (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 1 Sep 2021 12:20:30 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D3LQ4zF3c4+pMFBWLa8ea5z28ikLjUavvO6k1lc3t62TkztjyQIvSJBg5UZYSep7MEJfXy4t0NZLkoRZrLbubAgZJNaVGKopvKzdlz5J2+txmaAiZM7yoLTlXR9fD3AUDigHHWjHSJIEdVzChifG/gvDIGEHF4WLIqBD/KS/UahjE5igYf5Ufwy2v+REbuG+AqNj5ZQb1hxhHzvz8Ozt7uZs3jSeFWK1VDC9JcdvTYRBOXe+Edyot5ChShuj0iegjrv9Rick9Cd/IpDny1NkWIQyUt1vvQrRIqLIh7NoL6ti/3E1QO1pUJxNsTWdiQU/BbgbqppXyzaYJC38gPKySg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39gy2c2raIcnF4r2Yto1C+/uXXeJYaLopbp4uHcVvHc=;
 b=mW6TmBY5y+pGNsZx1r6QjxqtgoHJvRt2rZfE/2JjElE5fzefA0i99K1kTizU9dgpt0c/jzxC3a27SSadR5k19uYKB0s4k6/h1avb9I5IkGKYJpKOoj/nc+jGEg4wPI3bu11QUN97IzhgLEtMMcavSL3mwKdi7tQVQBzCVcd57EfcgneBJaCQdUHlLDPDAiuVBVtCBVxCMTjgRsq9NAWTfu97zH5j2U0rDpo+qYKRqoVJuM50q/dXldrFFILcsST0kPzi84q9vqp7bT2hJVcMisBHsHrRGpF2+wb7aVbAwP4ZMjlWju+PrJP86S6WfTIklCkK11yD/snL7hdZPtXWxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=39gy2c2raIcnF4r2Yto1C+/uXXeJYaLopbp4uHcVvHc=;
 b=HEk63Q0VPbW7/wogOFRkfABRRViWa5tyWage7npJgLAZ863y5fp1hXe/zqEu6JCo2jQPt9Fh5yqwi3ID5ehgsXp9/RW1GulwAJwF3PZAjp6LJhDazhFy4sYH2d1xQUnOYr3jg28XX31yg5KRSg7LnuM/f0VoL5Y9CkfgZIqRUjQwsabAD7LPZz6euwPoyKiFF0lvuEXM1aMHACUf2l5Ql6ONyw9u+5HbV+d11SZzBF+V+rCMwyXMVtU5TG0HbuQz49qQeBjAX0k2I3vqUlaY+/MY4du4/hUZheJAA18BOFL6TNui4U2Y8EE2zrs3qwaBPnuHUi1v0+khn1R90Bpg6g==
Received: from BN8PR04CA0052.namprd04.prod.outlook.com (2603:10b6:408:d4::26)
 by DM6PR12MB2842.namprd12.prod.outlook.com (2603:10b6:5:4c::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.24; Wed, 1 Sep
 2021 16:19:31 +0000
Received: from BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:d4:cafe::47) by BN8PR04CA0052.outlook.office365.com
 (2603:10b6:408:d4::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 BN8NAM11FT034.mail.protection.outlook.com (10.13.176.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Wed, 1 Sep 2021 16:19:30 +0000
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 1 Sep
 2021 16:19:27 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 1 Sep 2021 16:19:24 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <aleandre.belloni@bootlin.com>,
        <alsa-devel@alsa-project.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/3] Convert name-prefix doc to json-schema
Date:   Wed, 1 Sep 2021 21:48:28 +0530
Message-ID: <1630513111-18776-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 276c4a7a-4cce-47d3-a008-08d96d64472d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2842:
X-Microsoft-Antispam-PRVS: <DM6PR12MB284293C08322CAF40FD6B78AA7CD9@DM6PR12MB2842.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lsHWwoEmVvggnDMVhkKCac5vToZ9FMXVbHI2Mi3ryxsf9AROZHvW/KzSqUe81Mpdqy0/aAx7UdBqZNCgkFwgtA588ZSoerbmJttGOUysd1OZyUJr8cV2caHCRaGdZipvbHwC71VwWRu4MT8eJNdB0H1uSuX9fr5ccLoOsLBCfLSAtvf60Cf/GAWhgZZi2/TRRfIm+6fNfe+yFRubWOATDNAtt27PwSXgOFXW6pm7c0JG5ye+wBZJPiIxgBFOVZ9923PzQnVi2dIbiz557VKC0t2mzqAZbHFfZpjbt5LzNXhexTmBeuF2qBpekuEOsYYf0yLw12Gzsz5inSFYO8tTCOn6bePmzAHhdxLivnLb5zspr4RaGNJEM9Wqbkt506TEjcci6mHth08wE8yluCvZHziyJsI8gNZ6BxRK+TP88gAypscLSMMzPDDiFwYfYTIPu7xViNxhTs5HuAJ7Z/hQOwFY9tGG+wweF/hmzAdo5D+4hrvEDmn6LnOSozqNWAnIUMqAmm/ovSZHsrofRH44HRb6dxBiChMesBUH5NK588c79IGswz6+YFkEB6kVmeL2yLTBmIhXxF47Ze6seEKXZ6EH5KyANZ/k+qv4gAi7ZmQ0A3uTYp/iXH/ByZ8CzNwivFbtGroz+dvU1Sm3/B/Tk/AYPs/tUvzZDycYdRKpp+49ECI7VYlSObYR5yIuTaH5P4y396R/GSOq9RjF1PS0+Q==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(376002)(346002)(136003)(39860400002)(396003)(36840700001)(46966006)(356005)(36906005)(36860700001)(26005)(70206006)(70586007)(47076005)(8936002)(316002)(54906003)(4326008)(7416002)(110136005)(7636003)(336012)(83380400001)(107886003)(2906002)(186003)(82740400003)(5660300002)(426003)(8676002)(82310400003)(36756003)(86362001)(2616005)(7696005)(478600001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Sep 2021 16:19:30.6296
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 276c4a7a-4cce-47d3-a008-08d96d64472d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2842
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following are the changes:
  - Add json-schema for 'sound-name-prefix' documentation under
    'name-perfix.yaml'
  - Use schema references wherever needed.
  - Remove txt based doc

Sameer Pujar (3):
  ASoC: Add json-schema documentation for sound-name-prefix
  ASoC: Use schema reference for sound-name-prefix
  ASoC: Remove name-prefix.txt

 .../devicetree/bindings/sound/name-prefix.txt      | 24 ---------------
 .../devicetree/bindings/sound/name-prefix.yaml     | 35 ++++++++++++++++++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  7 +----
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  7 +----
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |  7 +----
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |  5 +---
 Documentation/devicetree/bindings/sound/rt5659.txt |  2 +-
 .../bindings/sound/simple-audio-mux.yaml           |  5 +---
 8 files changed, 41 insertions(+), 51 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

-- 
2.7.4

