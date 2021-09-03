Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04C79C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E13C4610CC
	for <linux-tegra@archiver.kernel.org>; Fri,  3 Sep 2021 16:35:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350075AbhICQga (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 3 Sep 2021 12:36:30 -0400
Received: from mail-dm6nam12on2054.outbound.protection.outlook.com ([40.107.243.54]:63471
        "EHLO NAM12-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1350064AbhICQg3 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 3 Sep 2021 12:36:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O0EDL4O0TlbyxV8vm3RNaeLNFae5W2cEJmn4deyW4c4clgJUcrfnF2YqES5a3L2IuPpwWUCSUNpKlbIobZf/BmqudPqCDLr46HELl+IYX+eutJojED+RvEehxuzpq3WQFHJPwzXw0z0xFU07HJEYM1oRxpZl7sd82Vq2nxS8002XZJ+2aBEmIiDyXfvRYFrcRgxgJCVv5OvND9UNbuXn0pZTP7aCBZpVIa27zTPv8dHlplxJYE8FKtG32SZKRwHvrPNXx6DZJkd3YrN1KMtxLmBEg6zXT0CJ3O9W81ADr5Kt/j7LSGK2YfqG6L74mlGptNKqpYv4XuOwHxl/r0TRaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901; h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
 bh=w3EAKekqlAIXO6f4d37b+ln6sV3L0DPJhnwcU73/5LE=;
 b=Pc8XegzSDJLWvD7ddEMDq/vgqRAe5qBu3fJwSXkCQRpY4t1g5EkjY9tWOz99S01kS67YrTGrDalZ6O61YxAKswsZTaqo308mfBYbtQRepavBk0IUwifgHXhazCpyB5xwDwvhtpWIAj8guXIyiVkZ7/yuOGfzfAylRtve5Bk3vzqztnt5tP1vDgbCbnEtuDdjWmllPLAohAiBU5VSmQSaJytEG4MqqFxgeLG+nYovG+yaQAevLXXQnHieZHISxEExVMMn0LGjQf97novmmDIGWsWh7gc3uRvsAOeTv+pPL+AOYnKLywGSF8mKoEOSE5B3XY82g4U7l5ufl74ObWa3/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=alsa-project.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w3EAKekqlAIXO6f4d37b+ln6sV3L0DPJhnwcU73/5LE=;
 b=Xzt4sstGkDI/vc7+93icthQfWKUqkEdvwS5LRcfnfBqL27yUhaSGzivODizt5eq96iQisDsn4JaFlZlLGQRS9dV+N7ZPg299ZMlLB2WguNV6vy5+PxU87Z+GN9iUeRt0zPn5BMMihjOCPuygtHhw79qr5DavsQ9PZ3au3fhoZ3YHC2jakUoRpCrviczv4oDuVni4nXmv2J7iaEvaFNUaVPE97wgAaq7/ZZKaeUyXXo0zaArm8JBmsJzmBnJNFhoZrU49huQJMiQ2SM50QltuShdy5/e7L0TQe4du0rHUHwuBsIHNKhm8t+DCU4ZEIXD0R5cOk/Lo/w8IMHYFbViAXA==
Received: from DM5PR07CA0049.namprd07.prod.outlook.com (2603:10b6:4:ad::14) by
 MWHPR1201MB0094.namprd12.prod.outlook.com (2603:10b6:301:5a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4478.19; Fri, 3 Sep
 2021 16:35:28 +0000
Received: from DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::9d) by DM5PR07CA0049.outlook.office365.com
 (2603:10b6:4:ad::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.20 via Frontend
 Transport; Fri, 3 Sep 2021 16:35:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; alsa-project.org; dkim=none (message not signed)
 header.d=none;alsa-project.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT016.mail.protection.outlook.com (10.13.173.139) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4478.19 via Frontend Transport; Fri, 3 Sep 2021 16:35:26 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 3 Sep
 2021 16:35:25 +0000
Received: from audio.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 3 Sep 2021 09:35:22 -0700
From:   Sameer Pujar <spujar@nvidia.com>
To:     <broonie@kernel.org>, <lgirdwood@gmail.com>, <robh+dt@kernel.org>,
        <thierry.reding@gmail.com>
CC:     <jonathanh@nvidia.com>, <stephan@gerhold.net>,
        <jbrunet@baylibre.com>, <alsa-devel@alsa-project.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH v3 0/3] Convert name-prefix doc to json-schema
Date:   Fri, 3 Sep 2021 22:05:16 +0530
Message-ID: <1630686919-19495-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fd6ae5fd-3a1d-4f86-ad55-08d96ef8d5a3
X-MS-TrafficTypeDiagnostic: MWHPR1201MB0094:
X-Microsoft-Antispam-PRVS: <MWHPR1201MB009425C0B67EF448B8FE7391A7CF9@MWHPR1201MB0094.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:923;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NH/S414ifzg8yfnVD9BLNjncFoByu105DJKLaG7yN4hqfACF6KZsYZ9kYqf7Y52hnJWCBVJxkMfgUSQLddYTg/V5nPHlfCWcM26TD+IVHAayM5xawb6R5AoAeStmMfzOILmw5zA8iBZFVF1rNilCb+KvsE+uuEFPKffRXn5wdbOIIG9RI+FjU30tc6QPa6PDIkxJlMBVBx4epACveXZVP71wZ3hhJMvtjvONzYn+P1iJieqEYDPj9TeXb063Ikhlt74uZhC31EfIbMxW0+2G5Mux1bxNwdZFClELkDe82SQbxRNzDM++WDTyZSxOwjfJ8It1KXPW1Jx/4TZk1XxdcLDTLMBH4mqOUTA7S1d1PnjUzHXN5Kvm2/uAby168vp7U0AThLubrdTMi7eW92tAjxZbE85etlxka8K1BP3ACmqMvnAO/XIQCQ/hYVoqkCfrGl3MtI/5kAhy0Ay40ka0dLv3qs0uMMzZQAezuwg5IJ5QSl1Is5AQ12JdYFOrLAf1nHHdFW3c1bEEeJ7olMZsOBG4fwl+QTQx5Y5bdc6STTrCe/PHamWJhjK4xiCKbIbFVswTm0vESHLFmpBk5ciOP1gNsE3W3o8FhS2wTj0vcrgxciQ5OF8hBL18n0XLFJeaxJ49VP7iM9zAW2mLR6nKmJz6G16amIeik3PgqsWPAKD99YJjC5HJwzxp9vKOrk0Sdw3j2NdBMw7HoAzFtwMSvA==
X-Forefront-Antispam-Report: CIP:216.228.112.34;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid03.nvidia.com;CAT:NONE;SFS:(4636009)(46966006)(36840700001)(6666004)(186003)(7696005)(508600001)(356005)(26005)(336012)(7636003)(36756003)(70586007)(70206006)(7416002)(8936002)(107886003)(8676002)(82310400003)(2906002)(83380400001)(4326008)(36860700001)(86362001)(2616005)(5660300002)(110136005)(47076005)(316002)(54906003)(426003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2021 16:35:26.3811
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fd6ae5fd-3a1d-4f86-ad55-08d96ef8d5a3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.34];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT016.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1201MB0094
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Following are the changes:
  - Add json-schema for 'sound-name-prefix' documentation under
    'name-perfix.yaml'
  - Use schema references wherever needed.
  - Remove txt based doc


Changelog
=========

v2 -> v3
--------
 * Removed examples in patch 1/3 as suggested by Rob
 * Added reviewed tag from Jerome for the series
 * Added reviewed tag from Rob for patch 2/3

v1 -> v2
--------
 * Provide top reference to name-prefix.yaml as suggested by Rob
   for patch 2/3
 * Dropped couple of unreachable email ids from Cc list in commit
   message of patch 2/3
 * No changes in remaining patches

Sameer Pujar (3):
  ASoC: Add json-schema documentation for sound-name-prefix
  ASoC: Use schema reference for sound-name-prefix
  ASoC: Remove name-prefix.txt

 .../devicetree/bindings/sound/name-prefix.txt      | 24 ----------------------
 .../devicetree/bindings/sound/name-prefix.yaml     | 21 +++++++++++++++++++
 .../bindings/sound/nvidia,tegra186-dspk.yaml       |  9 +++-----
 .../bindings/sound/nvidia,tegra210-dmic.yaml       |  9 +++-----
 .../bindings/sound/nvidia,tegra210-i2s.yaml        |  9 +++-----
 .../devicetree/bindings/sound/nxp,tfa989x.yaml     |  9 +++-----
 Documentation/devicetree/bindings/sound/rt5659.txt |  2 +-
 .../bindings/sound/simple-audio-mux.yaml           |  9 +++-----
 8 files changed, 37 insertions(+), 55 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/sound/name-prefix.txt
 create mode 100644 Documentation/devicetree/bindings/sound/name-prefix.yaml

-- 
2.7.4

