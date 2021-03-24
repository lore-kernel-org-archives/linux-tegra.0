Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F8CEC433C1
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 00:28:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C42E9619E5
	for <linux-tegra@archiver.kernel.org>; Wed, 24 Mar 2021 00:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234497AbhCXA11 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Mar 2021 20:27:27 -0400
Received: from mail-co1nam11on2089.outbound.protection.outlook.com ([40.107.220.89]:18656
        "EHLO NAM11-CO1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231374AbhCXA0w (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Mar 2021 20:26:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QUkDSoXpxI3SgqGvt0CxCW4z36gH4CwhUUG1M3id4mkk1H8kG8/fo4+to/VHP0AyfI3k1eOzIqV97uEewJqprGynhfLg5FIQvwShuU3Ad+sqoCuCzduHCUenrFMTUQNGIQr2W6NuRNMQX/zcsB/0M5Cyp1w8nNN/TWmOT/Oqyjw6y5w6phjQ92QPsHq+kdVroHsQHSgvo25ck1WK5DN5MVP9vzBIwh1YBwFynfJEXzREUhQrd2RAfJBEpmE2vhxqLs/rREbVrIeoFlP1JF+Y5IZKQUVJeRhz+Y0YRe2UOfmM8nclJaE7y0QSx2CnNT2gZq8NN5CzZ5jGEqqWGh+HrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/dDyMcUDg1HjV3Ac2lYJGZaONay3zArrvyViZWF+f8=;
 b=B2uMW5bYv9R7qfwfhmPPZMNGbXr2S4lDmmINlVdfFgk3IaxCU88vI9QYqaaLtvz+m5Iyoj5EL61AodfKxfKcnuEI9NJhs7/j7AC+q1hfTatLnzW4TrmBNhj07ICcaYD1TsRMIdRZ7hgOT9I0BweToEbkI6aYpq6+YOgVd8ztH7RD4PzN7YMRfuPh3JiQp/3Xu205hR4MK25MuHKWOK80LLK1K0oJsNT03CI0K6GZ6UPNut9mnKKCSbaap+H00E8CErJSM8LCLQUvuFprdEsI0EtBd7z0ko2+RmzqiFrUVYuAFXN8U11M5KUczRaKAomQWes9Kg78CRBn8W5PjjTMVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U/dDyMcUDg1HjV3Ac2lYJGZaONay3zArrvyViZWF+f8=;
 b=tV1N8t832KB4JXyQlZNDVfa7USFdAdIdE90E4uuyUl79v3U/5udfW+Z+y7vj+pqmz/+S8GRMS8zyM54x0C/bL6Y0+R00psyPRSN84YfXB3cXqTbCxqUC1qrFO4Zusj8b3T+EI6fFqPVuM1Huy/nqZD0pEk14QWDED3DiodHCYottzf94Z7cb1q9QZdeqY3j/B5T/hOGPvusTEMoMv89TJCNN2NeQf+uGtkfo8tn+V7CI3BY8aKF1CKRkeGSfDTCkwB40SYX8QZavCA0cQkfxsoY+JSnU+yPban+ARoMbx8H+f8mcaUb6jmUebkCFzGtEftiK6TZ+MdF66GshH0VhrA==
Received: from BN9PR03CA0067.namprd03.prod.outlook.com (2603:10b6:408:fc::12)
 by SN6PR12MB2672.namprd12.prod.outlook.com (2603:10b6:805:6f::25) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Wed, 24 Mar
 2021 00:26:48 +0000
Received: from BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:fc:cafe::3c) by BN9PR03CA0067.outlook.office365.com
 (2603:10b6:408:fc::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18 via Frontend
 Transport; Wed, 24 Mar 2021 00:26:48 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 BN8NAM11FT033.mail.protection.outlook.com (10.13.177.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.3955.18 via Frontend Transport; Wed, 24 Mar 2021 00:26:48 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 24 Mar
 2021 00:26:47 +0000
Received: from rwileyLinux.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 24 Mar 2021 00:26:47 +0000
From:   Rich Wiley <rwiley@nvidia.com>
To:     <catalin.marinas@arm.com>, <will@kernel.org>
CC:     <linux-arm-kernel@lists.infradead.org>,
        <linux-tegra@vger.kernel.org>, Rich Wiley <rwiley@nvidia.com>
Subject: [PATCH V2] arm64: kernel: disable CNP on Carmel
Date:   Tue, 23 Mar 2021 17:28:09 -0700
Message-ID: <20210324002809.30271-1-rwiley@nvidia.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dbf9822a-acf1-420f-ddb5-08d8ee5b831b
X-MS-TrafficTypeDiagnostic: SN6PR12MB2672:
X-Microsoft-Antispam-PRVS: <SN6PR12MB2672C9CAE1851D34C5D8BFA9B4639@SN6PR12MB2672.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XMDCGqnjDr2FwWizeIgwVTbXQyv1zX+jk+ZGxcZ644J5yxhxUdGA+i87z5+VgrfvStTZP3saK35mv2c6zafFgpmNwADVaV695vh9LGKqgG6jwRd1OYQomMrMLWLDniaJ4OG8OxKwl8PheaVeVqy4zV6Lj/8URwCD02bgJ6QnB9i2fhOXTqyqF3VrVvteZm2ZgBUYC/xPpxS1RTbJvXyiW2zCrmjbLJKuhf9D78TNl62No9to/DkpDbbOHIXVElVn+qVR6zk6+2F5EOdBgNJ1/c3GbotlxkMYaTOSdpHiEKbnfgiTXhZap9XzC7uFWqyvqEa7onS+bcYom2c2DUhcRv1YygsSH95JmZGl3kqCfDvtjTUCOClxU41x+r74LJxmNchFOptz7Va5hmKvISqCfwtZuifmiguwnl+ZQzbe25Ec4wPE3AwKPPft2gMTrmImgEQLF22Pxa573MQXccApVEFCzMFzjRiMn2P9NoG26dF9SpL0vxPeOL1cPoTP7fzltRM2/lqywe1HzBJod5hRTQUPjPqZgOShksCfQYLM97RBd9P9kBi+peqiZB7RReN9tbi+lbuXBKG8SjQvbW9Vm3+Jv3P5ke4IrFW7rBGi9BEfrCZu2mInRlz+imnuui1hrgVBSqrkj0Fr4fL1HsqPYngA9QgPiHv7BabMxgwkYJQ=
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(396003)(376002)(39860400002)(346002)(136003)(36840700001)(46966006)(70586007)(2906002)(82740400003)(36906005)(83380400001)(2616005)(36756003)(4326008)(8676002)(36860700001)(336012)(426003)(70206006)(86362001)(26005)(356005)(1076003)(7696005)(47076005)(6666004)(478600001)(8936002)(186003)(54906003)(110136005)(7636003)(82310400003)(107886003)(316002)(5660300002);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2021 00:26:48.0382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dbf9822a-acf1-420f-ddb5-08d8ee5b831b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT033.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR12MB2672
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On NVIDIA Carmel cores, CNP behaves differently than it does on standard
ARM cores. On Carmel, if two cores have CNP enabled and share an L2 TLB
entry created by core0 for a specific ASID, a non-shareable TLBI from
core1 may still see the shared entry. On standard ARM cores, that TLBI
will invalidate the shared entry as well.

This causes issues with patchsets that attempt to do local TLBIs based
on cpumasks instead of broadcast TLBIs. Avoid these issues by disabling
CNP support for NVIDIA Carmel cores.

Signed-off-by: Rich Wiley <rwiley@nvidia.com>
---
 Documentation/arm64/silicon-errata.rst |  3 +++
 arch/arm64/Kconfig                     | 10 ++++++++++
 arch/arm64/include/asm/cpucaps.h       |  3 ++-
 arch/arm64/kernel/cpu_errata.c         |  8 ++++++++
 arch/arm64/kernel/cpufeature.c         |  3 +++
 5 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/Documentation/arm64/silicon-errata.rst b/Documentation/arm64/silicon-errata.rst
index 719510247292..d410a47ffa57 100644
--- a/Documentation/arm64/silicon-errata.rst
+++ b/Documentation/arm64/silicon-errata.rst
@@ -130,6 +130,9 @@ stable kernels.
 | Marvell        | ARM-MMU-500     | #582743         | N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
+| NVIDIA         | Carmel Core     | N/A             | NVIDIA_CARMEL_CNP_ERRATUM   |
++----------------+-----------------+-----------------+-----------------------------+
++----------------+-----------------+-----------------+-----------------------------+
 | Freescale/NXP  | LS2080A/LS1043A | A-008585        | FSL_ERRATUM_A008585         |
 +----------------+-----------------+-----------------+-----------------------------+
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 5656e7aacd69..e4e1b6550115 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -810,6 +810,16 @@ config QCOM_FALKOR_ERRATUM_E1041
 
 	  If unsure, say Y.
 
+config NVIDIA_CARMEL_CNP_ERRATUM
+	bool "NVIDIA Carmel CNP: CNP on Carmel semantically different than ARM cores"
+	default y
+	help
+	  If CNP is enabled on Carmel cores, non-sharable TLBIs on a core will not
+	  invalidate shared TLB entries installed by a different core, as it would
+	  on standard ARM cores.
+
+	  If unsure, say Y.
+
 config SOCIONEXT_SYNQUACER_PREITS
 	bool "Socionext Synquacer: Workaround for GICv3 pre-ITS"
 	default y
diff --git a/arch/arm64/include/asm/cpucaps.h b/arch/arm64/include/asm/cpucaps.h
index b77d997b173b..c40f2490cd7b 100644
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,7 +66,8 @@
 #define ARM64_WORKAROUND_1508412		58
 #define ARM64_HAS_LDAPR				59
 #define ARM64_KVM_PROTECTED_MODE		60
+#define ARM64_WORKAROUND_NVIDIA_CARMEL_CNP	61
 
-#define ARM64_NCAPS				61
+#define ARM64_NCAPS				62
 
 #endif /* __ASM_CPUCAPS_H */
diff --git a/arch/arm64/kernel/cpu_errata.c b/arch/arm64/kernel/cpu_errata.c
index 506a1cd37973..e2c20c036442 100644
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -525,6 +525,14 @@ const struct arm64_cpu_capabilities arm64_errata[] = {
 				  0, 0,
 				  1, 0),
 	},
+#endif
+#ifdef CONFIG_NVIDIA_CARMEL_CNP_ERRATUM
+	{
+		/* NVIDIA Carmel */
+		.desc = "NVIDIA Carmel CNP erratum",
+		.capability = ARM64_WORKAROUND_NVIDIA_CARMEL_CNP,
+		ERRATA_MIDR_ALL_VERSIONS(MIDR_NVIDIA_CARMEL),
+	},
 #endif
 	{
 	}
diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
index 066030717a4c..424d5aa07fd8 100644
--- a/arch/arm64/kernel/cpufeature.c
+++ b/arch/arm64/kernel/cpufeature.c
@@ -1324,6 +1324,9 @@ has_useable_cnp(const struct arm64_cpu_capabilities *entry, int scope)
 	 if (is_kdump_kernel())
 		return false;
 
+	if (cpus_have_const_cap(ARM64_WORKAROUND_NVIDIA_CARMEL_CNP))
+		return false;
+
 	return has_cpuid_feature(entry, scope);
 }
 
-- 
2.17.1

