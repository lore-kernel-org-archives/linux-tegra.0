Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59500C46467
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Jan 2023 10:42:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229811AbjASKmp (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:42:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229459AbjASKme (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Jan 2023 05:42:34 -0500
Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on20619.outbound.protection.outlook.com [IPv6:2a01:111:f400:7e8d::619])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C3AC611F2;
        Thu, 19 Jan 2023 02:42:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DNIkkn70p1MkV6nhg2B+cnOa4JTqiJt7VWFUun2M3w/G6001Y7XjihERe8088a/tBvs6e4BUmk9ZbiTdcsGp6wRCznIhZiWcF7UPR9hvpKPmNGsviJyENxNQMssVt/qEECoj6XRJa5miS2zq4S6IVVUwvJH+iKnMz8tVyRZf+P8EnCP44tHMKM4fTKb891NqbSb1qyIngA2ieYuV/j5gx2rsO8VA4b5CxBRdlzpImDJB5s+wpr1ytirkJjIFt6GABWbdblnoUTrW8dVLju2EGipunV4DNyRn3u8MTu1mHsqjiVNo3rlHIfDVacYsE5oXOsJHFI0ObQ7O3CepzeRbTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=NsXRchQkT7073XgSde2ePghlCGeQbz5umAFakiHuhdbb+a9boN9gqe9BsUseVt0KSDwPm+EqTq91k7E3XCNPcWnJ6TVvmPQZdaYM1geyFs6414/LlWHDJhpt+KJv4p60TvWYjgfB/taTgxOCWaWu1jLNQOQZ/OnkwhHyZK3g+WsV+XgPYhnPPFJ4wxtLmqiF4fCM7BDOBJ0YRymOz32tWV1EUnueb1/aOLVRes00OyrNqeoWs7B17pTfICLDZKBSyM39QcwAyI7L//HXZajHOcCzlqXXqFZBtVCHi9EwvAiRebuIawjwRgtuAHW8IFsMT2/dIO7PYCMPrPJyKHJhRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=linuxfoundation.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ecWzoeOs6X4p9mO25Pz0CXxnWnudYcZJzDQ2irCds28=;
 b=R9CYLbKAJ0wuNNtMijWJ7mm+qOouTXRmokYAC1iRkDpEK/H6FY4QFAlUUPe3Ce+rXWrl1q+3jh30QMB2mBKW6Qcg3whv2MI1nyRdoHkk0oNomhJgc7F70afrptwWaRYeoUxdVxS3VclDZxq9UD1j3i/e65cRsVA/QHG/9+lqD9UMqFmS4+H9sWJjrpDi0yr5gx3diLn0GaCx7PwxJmFev6EqfqPhs9MMdYCjYlMv0MUtFZmD/kw4a2iiCixlkh1qRI/iGWf19GxMkDhrhPZxpzm4ouGVKwfhcFly9NWRiMTO/6L5zsTY3mNPL6hgWhH8w8ML4MnSVSnyR9mT3SCjPg==
Received: from CY5P221CA0053.NAMP221.PROD.OUTLOOK.COM (2603:10b6:930:4::23) by
 CH3PR12MB7763.namprd12.prod.outlook.com (2603:10b6:610:145::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 19 Jan
 2023 10:42:26 +0000
Received: from CY4PEPF0000C985.namprd02.prod.outlook.com
 (2603:10b6:930:4:cafe::d6) by CY5P221CA0053.outlook.office365.com
 (2603:10b6:930:4::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.25 via Frontend
 Transport; Thu, 19 Jan 2023 10:42:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000C985.mail.protection.outlook.com (10.167.241.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 19 Jan 2023 10:42:26 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:17 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 19 Jan
 2023 02:42:17 -0800
Received: from moonraker.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.986.36 via Frontend
 Transport; Thu, 19 Jan 2023 02:42:15 -0800
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V5 0/5] Tegra USB device support updates
Date:   Thu, 19 Jan 2023 10:42:03 +0000
Message-ID: <20230119104208.28726-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000C985:EE_|CH3PR12MB7763:EE_
X-MS-Office365-Filtering-Correlation-Id: acb17721-aa81-43dd-fb16-08dafa09db17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZeMw5AE55LfsKe7mCTVlzICxKxgKusjpKfLB2yvQNJHGz/YyG091OtRwuCXKCD/IdLyyZiqbxVzg0i8m+xhfQwzTmGTG+GQus00JmruDR2A8D1fgSJPK8olJRwHVwX6cp0PlIYuIEV9dpPF2DBn4YmbTwMbVjRSGvqGzrQHyh+v1AvUXMrmg16UvB9VQ+jL08kVupn79QfV8TMpCf5Cn5mCekYDcsq3uDvTCby9YWJraoWtf57E23GWghLxVANUj8TmYtyFKbZcr6IZguWHAFL7JjBlS6KdGZAmZfyJgMYSTp3HMRUXxT6Hq/iykmdvQEG1Gxc8zR1G1OU3VSweSgscYRn36opg83dopWv5qZ16g0oSZ12InYJi4R7kdrPZk6hwvI0QQZxTGWhvMjtVawNioSl7j2rI2mWkZxQ8s+3JJz4xBwu8kXyW2KQ6Jd0ADyI9ziUzBynGjKqKxHMWh5B7FbokqnVRelBUOoBhOn12UTJbpUvO7Y8CGrdRGXYnc9fSvdCTNhi1gZG5tM8VjOw+o73+dVoRG2YFQP/NTGIUe4ibG6VD1uvmk5b858VTJjy6foJd78gvUi3OrcmL2I1LRwbRUZJBLf/1WsJ1mLAJZj7lCVTTgN2enSwLXi9SBbHGpo+1rpzLxWdASftFS4Z3seqVy4wHkcERwsK/bRld4m96oh6fNapOKNmWfGU8xTQTX2titxTA/rQ8RSdHhBeTA2ghDEhreEqHv9Tj9fXxAbQxd/ftk0e60w4NKvDyEeQ98Bu2w2nB3s6e5N2+r2QqgT0s/3ltRNg9wjPCE5zA=
X-Forefront-Antispam-Report: CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(346002)(376002)(39860400002)(136003)(396003)(451199015)(46966006)(36840700001)(40470700004)(7636003)(36860700001)(82740400003)(4326008)(86362001)(356005)(2906002)(5660300002)(70206006)(70586007)(8676002)(8936002)(41300700001)(2616005)(40480700001)(82310400005)(186003)(26005)(1076003)(47076005)(336012)(107886003)(40460700003)(7696005)(426003)(110136005)(966005)(316002)(6666004)(478600001)(54906003)(36756003);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2023 10:42:26.2528
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: acb17721-aa81-43dd-fb16-08dafa09db17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000C985.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7763
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This series adds USB device support for Tegra234. 3/5 patches were
originally part of the series to add both USB host and device support
for Tegra234 [0]. However, the series was getting quite large and so I
have split this into a separate series but calling it 'V4' to indicate
that this is not completely new either.

I have added two more patches in this version to fix DMA coherency for
Tegra194.

[0] https://lore.kernel.org/linux-tegra/20221114124053.1873316-1-waynec@nvidia.com/

Jon Hunter (3):
  dt-bindings: usb: tegra-xudc: Add dma-coherent for Tegra194
  arm64: tegra: Add dma-coherent property for Tegra194 XUDC
  arm64: tegra: Populate the XUDC node for Tegra234

Sing-Han Chen (1):
  usb: gadget: tegra-xudc: Add Tegra234 support

Wayne Chang (1):
  dt-bindings: usb: tegra-xudc: Add Tegra234 XUDC support

 .../bindings/usb/nvidia,tegra-xudc.yaml       | 15 ++++++++++++
 arch/arm64/boot/dts/nvidia/tegra194.dtsi      |  1 +
 arch/arm64/boot/dts/nvidia/tegra234.dtsi      | 23 +++++++++++++++++++
 drivers/usb/gadget/udc/tegra-xudc.c           | 17 ++++++++++++++
 4 files changed, 56 insertions(+)

-- 
2.25.1

