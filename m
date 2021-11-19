Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB23C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 07:27:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B5AF2617E3
	for <linux-tegra@archiver.kernel.org>; Fri, 19 Nov 2021 07:27:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233851AbhKSHam (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 19 Nov 2021 02:30:42 -0500
Received: from mail-mw2nam10on2057.outbound.protection.outlook.com ([40.107.94.57]:30656
        "EHLO NAM10-MW2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233781AbhKSHal (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 19 Nov 2021 02:30:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G/j5Iqx7g68fF5rid2KIwtTqimGczVlv+iRhJ/5tL//n+61U+g/pPYjuVwkg58G+t6mIGtcex/VEqVOq4OLU3Y7e2EheII217gBRlxdNZuMHjeEEe2bzLbJuOxUpTAXlVEANbFPzVaPGMj+p9oQdWvlXHDdL8Ces7Q201Lrdu3ZkzubxWVyRAAgonh4wVcHuHiqwMYJtpLHx3SGAI6lGMxLFEL+bWnrQdp0Pz8pwRDn6/gzqvB9E1g6HfkLBnPuvgonHWR90XrnBUkdVNzx6GszyrMqpkIC/wP9ru/7PFrP1aP35JYQaNCZRJmhroOyL8q2KdUzddMifV22DHzkcmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4XM/SMHbpcfnyG0wHt/paBnIrOeOrrhmXyTrFonwutw=;
 b=BuGfPrfBgtz7GnMez2gbljODaEDD/RIlmHwx+XEPnR0MDyeGHol33ECRyUqWRQP0QfAsYGpUdPQokr1N89onvW9hnGNEBV5MrUD4Ngos+5X7EgrOAesQZhsorFqzRqOLwWIN6ifs+Am4HOSMlbYrk/WFbis2r2WgsTFSTFIp8ZzeDtJ4dlmG3blcM+I0OyCPM1OhYh4nD8AedB4iDiIPgKNlvqt7swIdJ3Q0tmLo4jExKlTmefYk2Ue6IYv7rh1IsRPRgtIdtc6nj9lWXlApBGhEnBz17niJOBfnczVUNivRS1/ZbEmCCXnPIk+V5Z5J2W23aOy3fMo6lj4wTH2U4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=huawei.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4XM/SMHbpcfnyG0wHt/paBnIrOeOrrhmXyTrFonwutw=;
 b=Oqy9B+EG0LJLV6jHPMeb3aaY1mgTFRl72KFg28jItdYPmb51zSp+P66Qs5S/2CXIRZZGUqoVk0SAPz3luAiMlTqSs60WcZyi+g8wuM6dYUws/u5A58NxhOH6EVINC5ui1s0IGCrb7ea5Oeh72RgsGfdAzocUN6okqV0VgOjXjE6mtyv/P8aazgmKrUNIEqCQCrz1gk5JPz0K79cj9D4EQIPDJAYCyc7e9HZp3NJPx7cANk2q8n/16fx5vxbNJQ4fTKCmbQe6Xf1cTKzGnjEK9yyGj0SNApjrmu4CyCJ/eddD3swt9CaA4NuoBhdKyWJh44aFZlts2Pvub2OCxCTKeA==
Received: from DM5PR18CA0074.namprd18.prod.outlook.com (2603:10b6:3:3::12) by
 BN8PR12MB3089.namprd12.prod.outlook.com (2603:10b6:408:40::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4713.22; Fri, 19 Nov 2021 07:27:37 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:3:cafe::33) by DM5PR18CA0074.outlook.office365.com
 (2603:10b6:3:3::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Fri, 19 Nov 2021 07:27:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4713.20 via Frontend Transport; Fri, 19 Nov 2021 07:27:36 +0000
Received: from HQMAIL101.nvidia.com (172.20.187.10) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Thu, 18 Nov
 2021 23:27:35 -0800
Received: from Asurada-Nvidia.nvidia.com (172.20.187.6) by mail.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 19 Nov 2021 07:27:35 +0000
From:   Nicolin Chen <nicolinc@nvidia.com>
To:     <joro@8bytes.org>, <will@kernel.org>, <robin.murphy@arm.com>
CC:     <nicoleotsuka@gmail.com>, <thierry.reding@gmail.com>,
        <vdumpa@nvidia.com>, <nwatterson@nvidia.com>,
        <jean-philippe@linaro.org>, <thunder.leizhen@huawei.com>,
        <chenxiang66@hisilicon.com>, <Jonathan.Cameron@huawei.com>,
        <yuzenghui@huawei.com>, <linux-kernel@vger.kernel.org>,
        <iommu@lists.linux-foundation.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, <jgg@nvidia.com>
Subject: [PATCH v3 0/5] iommu/arm-smmu-v3: Add NVIDIA Grace CMDQ-V Support
Date:   Thu, 18 Nov 2021 23:19:54 -0800
Message-ID: <20211119071959.16706-1-nicolinc@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 46d7681f-15fd-4775-8a59-08d9ab2e0fc1
X-MS-TrafficTypeDiagnostic: BN8PR12MB3089:
X-Microsoft-Antispam-PRVS: <BN8PR12MB3089ADE0B6BA75F1006A38D1AB9C9@BN8PR12MB3089.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NiSxiOTuj9ScafHG2ODEEZvomuJgB5wn5KClhtjWS3JGEe/m24ET9W3VC3VN0GRcU1IS2TDOKHGWj+jZX9250JT/Iuo/gDEQCvyvHnf4EHPdd5V4p2hxVy4w7oRhtokj2aVgh8f58h2wjQ8zOjvmj51Ru2QIrE6n/i9Apzk1aOaWEBe8ZVtlXpWF6UtC23PhRidwKCoqcNypCX4EXXvk28fNgwzrBniszX450hTYmGq5pTocKfx1qvRDV6jPjC1auijSc58Ngnw1hwdzqGWTVqj1VFYeib+BJe7O2YEIxdoD2blWjKd30CXwsViyDtbnjJEqnf6dYT1ustEw11C/wQfN9DqWv4MQ+5m4e/LilMPvuvfERCCs+5DhSr82yML8qCOnpOrZJGGXl6CD1xlMJW7Q7KxyyHNjsDr9Kb2w7/+0xohaNiuTJ1s0rt8wlvNNmplUAv3dm2znjL69SEZ4Kb63nixp/82+LyMKaqjhepaDd+mJ9/wDvsltezb8bQwg8urb2S6hbmVCsbGo6LtDa3HEdIid7bkCIfYrMhGi0XpUCrW+N9VYpn6P9xQrvRz6Ks+cvSIjo/CBiPL+erwS2JKDZPkf5yfbtarw2Y1OFRUBWYiM5/Pgt6CEwlkQhzjdBCRLrrlkFUiGy+RANtqvB9CwzDjuEHDD6tU1M2mFWQoDg4/7BiM1Ofj+dynxzUNFyPOJF5J3M1/JCkGIcoJcd3N4cdUitn4tR0co2Ozj00NuMgeZpypJcrRVWa9Qj8G/6HFJJCS6J88Pmm1SkKPN54Eu/yeRyXebMvSS/diq6V1q5J9Nvh++OQjbFqnu6R6GjDgyJJZf9fueuFNccoh+0w==
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(36756003)(7636003)(82310400003)(356005)(70586007)(70206006)(7416002)(8936002)(1076003)(47076005)(4326008)(86362001)(26005)(83380400001)(186003)(8676002)(36860700001)(2906002)(336012)(107886003)(316002)(54906003)(966005)(5660300002)(6666004)(426003)(7696005)(110136005)(508600001)(2616005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2021 07:27:36.9374
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 46d7681f-15fd-4775-8a59-08d9ab2e0fc1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR12MB3089
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Nicolin Chen <nicoleotsuka@gmail.com>

NVIDIA's Grace SoC has a CMDQ-Virtualization (CMDQV) hardware that
extends standard ARM SMMUv3 to support multiple command queues with
virtualization capabilities. Though this is similar to the ECMDQ in
SMMUv3.3, CMDQV provides additional V-Interfaces that allow VMs to
have their own interfaces and command queues, and these queues are
able to execute a limited set of commands, mainly TLB invalidation
commands when running in the guest mode, comparing to the standard
SMMUv3 CMDQ.

This patch series extends the SMMUv3 driver to support NVIDIA CMDQV
and implements it first for in-kernel use. Upon kernel boot some of
the vcmdqs will be setup for kernel driver to use, by selecting one
of the command queues based on the CPU currently executing to avoid
lock contention hot spots with a single queue.

Although HW is able to securely expose the additional V-Interfaces
and command queues to guest VMs for fast TLB invalidations without
a hypervisor trap, due to the ongoing proposal of IOMMUFD [0], we
have to postpone the virtualization support that were available in
v2, suggested by Alex and Jason [1]. And we envision that it will
be added back via IOMMUFD in the months ahead.

Thank you!

[0] https://lore.kernel.org/lkml/20210919063848.1476776-1-yi.l.liu@intel.com/
[1] https://lore.kernel.org/kvm/20210831101549.237151fa.alex.williamson@redhat.com/T/#ma07dcfce69fa3f9d59e8b16579f694a0e10798d9

Changelog (details available in PATCH)
v2->v3:
 * Dropped VMID and mdev patches to redesign later based on IOMMUFD.
 * Separated HYP_OWN part for guest support into a new patch
 * Added new preparational changes
v1->v2:
 * Added mdev interface support for hypervisor and VMs.
 * Added preparational changes for mdev interface implementation.
 * PATCH-12 Changed ->issue_cmdlist() to ->get_cmdq() for a better
   integration with recently merged ECMDQ-related changes.

Nate Watterson (1):
  iommu/arm-smmu-v3: Add host support for NVIDIA Grace CMDQ-V

Nicolin Chen (4):
  iommu/arm-smmu-v3: Add CS_NONE quirk
  iommu/arm-smmu-v3: Make arm_smmu_cmdq_init reusable
  iommu/arm-smmu-v3: Pass cmdq pointer in arm_smmu_cmdq_issue_cmdlist()
  iommu/nvidia-grace-cmdqv: Limit CMDs for guest owned VINTF

 MAINTAINERS                                   |   1 +
 drivers/iommu/Kconfig                         |  12 +
 drivers/iommu/arm/arm-smmu-v3/Makefile        |   1 +
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c   |  53 ++-
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h   |  48 ++
 .../arm/arm-smmu-v3/nvidia-grace-cmdqv.c      | 446 ++++++++++++++++++
 6 files changed, 542 insertions(+), 19 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/nvidia-grace-cmdqv.c

-- 
2.17.1

