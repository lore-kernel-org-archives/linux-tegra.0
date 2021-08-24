Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44DEDC4338F
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21E9161183
	for <linux-tegra@archiver.kernel.org>; Tue, 24 Aug 2021 12:57:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236931AbhHXM62 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 24 Aug 2021 08:58:28 -0400
Received: from mail-co1nam11on2086.outbound.protection.outlook.com ([40.107.220.86]:35809
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233952AbhHXM62 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 24 Aug 2021 08:58:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ig+eiJ9fv3egirfl0Tug2kQgaveaEbYf+sBe6X6F/XT4qar01dL7S8Ho3ts1fD002bMEYML1hOUgz07iFf1iHkWGa+qE00Nj/vonklPthqQuHAAKkHDrHMaNXpwbQoK+BYrSlV9PNrdrArZj/C+OXVSQdkF6JQvbiHuArWkFZ5ns6LJsecRODKxt/EqzdVwlD7N+KSsJ00+TRfDHsuej8mZGBFcHIGtz0O3AARncNtyqhahi+P58/F62fE0rT3WIiR0KJcysaX/IQ2XnCxZxz6b54K8OB9wILN4C0mcVLkd5yv/kynyiW9MiGvhOrq1HhgmD9H35eoA8G2B7olBhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7+u+9aQOuUeykUnOsaZQgTi0BZgeVvireuPbcCektY=;
 b=abFZbXSgWumh1ktT6/z/wn0jwQ4jVqlRiR9cAdV42oI6JrrqTBJNtSxNK/Qzfml9DjASy1VFmgXGwPJj2YSY0he7rRIi/XsBCjs4VU8dov3cbpOVPX7FtJwjvzyyJUzOSJip5Lbk/6rGslrMUE143JasS1EaCKI4zRzTKaDhY8JMme1dGxoNiDTuup86Sgj6S+Id3p+TlwRKxLt7ke2y84Mbo6X//tsFPo/VcLSGuoIJmA/2JbKM5J1S3+O2W0SFwMGkx0QABcOI3D6otmo0zwf+QOeA7JiW6QfJf4YC7QwIye84fv0wVnL2CYAGRe7XejR4cRkP3U8OSA77dykkZg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.36) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f7+u+9aQOuUeykUnOsaZQgTi0BZgeVvireuPbcCektY=;
 b=XUwy1GIWMEvtQ5yZaM6d/NCvBAnWCZjEgqOoBCEIB1YsRBGNkUxajLoOzgGB08swokyMz9j9iqTzAgPF5QptDo+sYViwNQ47n7+4pLsCSJ60epfL8dfcuPGCeCVfXCHSiq2GG+fqWWl3a/yXmTPr2UQU3s3s3NBp7IqDe/iOd2kz9zmjiTB5Rnpb8yvUgsOb3TlSPTGGhvgEOddbZBkkI61sIwLXvjtNH3Y8TTKqcOQw0fMTuJ+d/lRVkdYA5LKGGon+uFon4REiUhy1UFxs8S0oppuU770wu7QA5ATV54FepdRuczXDmwENAJiUz7WOLKIoHeXZ6ERA8AJf34KvMw==
Received: from DM6PR07CA0086.namprd07.prod.outlook.com (2603:10b6:5:337::19)
 by CH0PR12MB5267.namprd12.prod.outlook.com (2603:10b6:610:d2::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Tue, 24 Aug
 2021 12:57:42 +0000
Received: from DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:337:cafe::f6) by DM6PR07CA0086.outlook.office365.com
 (2603:10b6:5:337::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.36)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.36 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.36; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.36) by
 DM6NAM11FT033.mail.protection.outlook.com (10.13.172.221) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4436.19 via Frontend Transport; Tue, 24 Aug 2021 12:57:42 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 24 Aug
 2021 12:57:41 +0000
Received: from audio.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 24 Aug 2021 12:57:39 +0000
From:   Sameer Pujar <spujar@nvidia.com>
To:     <thierry.reding@gmail.com>, <robh+dt@kernel.org>,
        <jonathanh@nvidia.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Sameer Pujar <spujar@nvidia.com>
Subject: [PATCH 0/2] Audio support on Jetson TX2 NX
Date:   Tue, 24 Aug 2021 18:26:08 +0530
Message-ID: <1629809770-7456-1-git-send-email-spujar@nvidia.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 620fac79-2f99-4d89-ea25-08d966fec292
X-MS-TrafficTypeDiagnostic: CH0PR12MB5267:
X-Microsoft-Antispam-PRVS: <CH0PR12MB5267EE493EFE46F1424B461FA7C59@CH0PR12MB5267.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6108;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: l/qnLvpyUSsOdGP6xZimx5qJlgbQHU27kbfg2tj/Lk6NJSaoFIS9bjqa9cHjvJK+utjPG4a0C/QpyzNsn+vdC0o1IlnktS1BdRP/xhTYrYnyahODtU7U+x2VMkpTsznTzULwYDoYQlys0OPSaoEItuUyNdBKLqWrm4LfCtaUp3JsAan5Fn/3p9EMVVfgFISp6VRrDiSIUojnsuJDZNj0YpIbgJtItmSdzoaWiaC5+rpw9i0weLmhCnUdyxU7IrDl6bpUbbutqaG/itW5jMraI/QQJYXfKUIb3b0VA42GWS5oO2Qi+PiRXOaEr65mOgMYOEjcA4zhTi9pIDsAE7SsU0ppinenLCQ3pqpK2Jl9T3ICEqj7GuRFrPzWiZsA6YewUeSUtWiGsPPW0j1eEk8d9Y+kq1MiESq9F89GX/1pw1BGP/xwF/F+Bjz0Wzt3C8mDznkZBW7UdgfySt9d25wtwX5iEYH9tc8RE7PRrhkob/zF7eN0gYVQO/nLdHo9QCu78b+e/b/AGKDc8JfXbsb8kZIyxrbs4vnkXASlHjZq2vVAKiBWrT2nx1V1hf03R5Fou91wfri0S3nwo/3kWAZsz2UyplUKKiCzxG+E3T7TfqWJYhPVjIwbiZT+zDbiMwMHiHWZygLekMBUGpNm9xRh94oRR4QRNurqteUef9kqnQGWSO3nJGbctO5hPkpEYKNt3O+aUTp5/vRs+4X5T3pyqQ==
X-Forefront-Antispam-Report: CIP:216.228.112.36;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid05.nvidia.com;CAT:NONE;SFS:(4636009)(136003)(376002)(346002)(396003)(39860400002)(46966006)(36840700001)(26005)(107886003)(110136005)(83380400001)(36906005)(5660300002)(54906003)(316002)(70586007)(2616005)(186003)(36756003)(2906002)(6636002)(70206006)(426003)(7636003)(478600001)(82740400003)(36860700001)(356005)(4326008)(47076005)(4744005)(6666004)(7696005)(86362001)(8936002)(336012)(8676002)(82310400003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Aug 2021 12:57:42.0720
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 620fac79-2f99-4d89-ea25-08d966fec292
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.36];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5267
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for APE (Audio Processing Engine) audio on Jetson TX2 NX.
As part of this exposed I/O interfaces of I2S and DMIC are enabled.
Similar to previous generations of Jetson platforms, audio-graph based
sound card driver is used.

HDA sound card is already enaled. Update the sound card name as part
of this series to be consistent with other Jetson platforms.

Sameer Pujar (2):
  arm64: tegra: Audio graph sound card for Jetson TX2 NX
  arm64: tegra: Update HDA card name on TX2 NX

 .../dts/nvidia/tegra186-p3509-0000+p3636-0001.dts  | 506 ++++++++++++++++++++-
 1 file changed, 505 insertions(+), 1 deletion(-)

-- 
2.7.4

