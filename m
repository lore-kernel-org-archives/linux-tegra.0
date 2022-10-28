Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A149ECAAA1
	for <linux-tegra@archiver.kernel.org>; Fri, 28 Oct 2022 12:38:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229544AbiJ1MiC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 28 Oct 2022 08:38:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33274 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229441AbiJ1MiB (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 28 Oct 2022 08:38:01 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D5E41CCCE2;
        Fri, 28 Oct 2022 05:38:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iZP8bMyJt3jCF54+KQ5XtZWKfZ4yfj98bjEOtE3CGox9YSi/DktMM9gRm02BqVpsEaoj9cQcl1IKh8jAiC6kcnqZUTD4uY+QstDnw5XJu266xTl4rzBlSQqeJNvQvr8SRtnUINMShE7NaquBQt3tvCUrh0ju7MMpvZoy6vpqjMhyhx/V7D634+XCR2yFUHqziX0IIFcXihBfPakLVtLnMVRTjN0JFDHzg8/U0m0Rnyvu/65j9T4w1L4jS/+oTYo71lUjusAPmEGeqocc/cBZeaSZlFP4GEkcfhrHbmy1kWka9zP+3/4GNpS0iUcpzu9+Nf7idtou4PawfYkziv4Qkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HWLYXXOK9Mtkl4yzrJ4NsCb7B90u9sn9lcGn1HaGH7Y=;
 b=hsui4M7QARimLLNz8pweYPxbljZnbwR6hJTkyP7H5ZZ9/NLj0gCXZ2lGBNOVP33TeJrenNtenf6Szv+eqX0fY5i4I4K+4GgsVN8iExcf/IB+xAbqBskefyEAMnFE2wRlP5yc+zXwyCCTgKk/gLXtRmEagX5UvIrtbWtdC4MAMDkIxQ6GieMZqZrz5AeIIHXDG4YeWgQeZfu+BNC+XrfvhD3yebQzSnbaU5hdwbCQSoGfx7BFfp6uVwcs+RJwG36jGM8C6pZi1bt/VsZbbjS4w4A7y719sJAXhe62903ArsZIdVuDZrrPCYSpOou/mTNKdv8fMXUAJziDXgWbQ8+fUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=linaro.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HWLYXXOK9Mtkl4yzrJ4NsCb7B90u9sn9lcGn1HaGH7Y=;
 b=YVBQLDKxaTtBF0pnj1H6S/mtsEd300rN0CNRZWmxIoYzka+skGyVqfUBD8hXQ8hrRnWLEEsPV4eMseaBEUV3q+utzBUiU5pMQdE6+oVL5/MyFigG3ApIfux12k5vgqSdfPAFcPqLROmwnNNi24Io4SqJAqwtO93JBgNVflh94BhIda3k4HgXK6lseBWDf8L/7XcAn4UbcHphwIC87zUg/or1mkKCQcQ58qX0NAsqFxLM+GQJWNMdbp7CeC7V+8BHv0eJts8RpwNOCWIgYPnjdJygaoAD8dCHdCzeLvuYiTsssCpMOE/g0+n3z70JsySnx7UkkkC2Eu5JPrR41atx9Q==
Received: from DS7PR05CA0034.namprd05.prod.outlook.com (2603:10b6:8:2f::35) by
 BY5PR12MB4243.namprd12.prod.outlook.com (2603:10b6:a03:20f::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 12:37:59 +0000
Received: from DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::bc) by DS7PR05CA0034.outlook.office365.com
 (2603:10b6:8:2f::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.12 via Frontend
 Transport; Fri, 28 Oct 2022 12:37:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DM6NAM11FT084.mail.protection.outlook.com (10.13.172.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5769.14 via Frontend Transport; Fri, 28 Oct 2022 12:37:58 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Fri, 28 Oct
 2022 05:37:54 -0700
Received: from drhqmail201.nvidia.com (10.126.190.180) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Fri, 28 Oct 2022 05:37:53 -0700
Received: from moonraker.home (10.127.8.14) by mail.nvidia.com
 (10.126.190.180) with Microsoft SMTP Server id 15.2.986.29 via Frontend
 Transport; Fri, 28 Oct 2022 05:37:52 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <devicetree@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH 2/2] memory: tegra: Add DLA clients for Tegra234
Date:   Fri, 28 Oct 2022 13:37:41 +0100
Message-ID: <20221028123741.134880-2-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028123741.134880-1-jonathanh@nvidia.com>
References: <20221028123741.134880-1-jonathanh@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT084:EE_|BY5PR12MB4243:EE_
X-MS-Office365-Filtering-Correlation-Id: f028c642-3b05-4ced-88df-08dab8e13f09
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eKkjEqOCUeIb+Z+bQH4SNgGu6X4MVJyuGBjh/rkD9YWb4Ekn19HXw1CbsOyl6Jmv2KuY7zG8e5gLEWge9pNoCjo0f5h951GxtmAF+DUNkswzUFHvKAfHuzuJ2/tcK1B9Ae7qYKuonHQyQVH24CQn4xzaQ2hpu3Judoe/16jNowCwKznDy4F//eEKAadu6URkJUOyq2S78A/3sfp7tAS6897MGM1il8gYO0P8rtLsPjkWXiq+iuMFMy3ynCQUvF4X1C6FhFyFGdoXq+84/dL1TrlAlSqR21jgOEIPQMZ1l15iG17/0NiEIkZ94kEf5M3sQMs6Iq62FfHoWzSeyJDZBg9ywfB/jtiqaCEQo6gC5X3Ey0Mp9CHUlJtIpwbU/O+Y0xHp/ez0ZwsBSFI2fhNP7xG3Qzdeg0NMrXZcS2ijK8VK4m00RxqtzYS33Dz70DaYlDd92n1fH8CPAB6cuuMd7Ausuo3DFRdmK8xEGnSWBBNqKgs/SwIAUvPvqzR6AksHbElltIAaxb68xygOhiuK/RTqovtsDTTDsO+sU3bGZPMS7LFhyvOnR9qjjCwBjXloYFXc+pzAlBu9CXKD7cx/xv3p6jn1Qf6k8gTlq4HSuIpSbgH3tC+diTNF7kVE2TgATTT7HquL3HUsKs3tY+bUQOdrUX0L54t2cLNCpk78fPIzBc5iS/bY9lRTF2usEoroejCplAdqliGzBs723UItpKRVesoQpFuHyzpyL0D3F2R2DebFD27PQryN5kTV63B5HKm66q8TqdV8aRcXyMWhLw==
X-Forefront-Antispam-Report: CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(451199015)(40470700004)(36840700001)(46966006)(36756003)(40480700001)(82740400003)(36860700001)(2906002)(5660300002)(7636003)(356005)(426003)(47076005)(83380400001)(40460700003)(86362001)(336012)(2616005)(186003)(6666004)(26005)(107886003)(478600001)(316002)(110136005)(54906003)(1076003)(41300700001)(70206006)(8936002)(4326008)(8676002)(70586007)(82310400005);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 12:37:58.9682
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f028c642-3b05-4ced-88df-08dab8e13f09
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4243
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add the memory clients on Tegra234 which are needed for initialising the
SMMU for the Deep Learning Accelerator (DLA).

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/memory/tegra/tegra234.c | 160 ++++++++++++++++++++++++++++++++
 1 file changed, 160 insertions(+)

diff --git a/drivers/memory/tegra/tegra234.c b/drivers/memory/tegra/tegra234.c
index a9e8fd99730f..9bdaf8af8c97 100644
--- a/drivers/memory/tegra/tegra234.c
+++ b/drivers/memory/tegra/tegra234.c
@@ -170,6 +170,166 @@ static const struct tegra_mc_client tegra234_mc_clients[] = {
 				.security = 0x504,
 			},
 		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA,
+		.name = "dla0rda",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x5f0,
+				.security = 0x5f4,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0FALRDB,
+		.name = "dla0falrdb",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x5f8,
+				.security = 0x5fc,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0WRA,
+		.name = "dla0wra",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x600,
+				.security = 0x604,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0RDB,
+		.name = "dla0rdb",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x160,
+				.security = 0x164,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0RDA1,
+		.name = "dla0rda1",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x748,
+				.security = 0x74c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0FALWRB,
+		.name = "dla0falwrb",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x608,
+				.security = 0x60c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0RDB1,
+		.name = "dla0rdb1",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x168,
+				.security = 0x16c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA0WRB,
+		.name = "dla0wrb",
+		.sid = TEGRA234_SID_NVDLA0,
+		.regs = {
+			.sid = {
+				.override = 0x170,
+				.security = 0x174,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA,
+		.name = "dla0rda",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x610,
+				.security = 0x614,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1FALRDB,
+		.name = "dla0falrdb",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x618,
+				.security = 0x61c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1WRA,
+		.name = "dla0wra",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x620,
+				.security = 0x624,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB,
+		.name = "dla0rdb",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x178,
+				.security = 0x17c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1RDA1,
+		.name = "dla0rda1",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x750,
+				.security = 0x754,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1FALWRB,
+		.name = "dla0falwrb",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x628,
+				.security = 0x62c,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1RDB1,
+		.name = "dla0rdb1",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x370,
+				.security = 0x374,
+			},
+		},
+	}, {
+		.id = TEGRA234_MEMORY_CLIENT_DLA1WRB,
+		.name = "dla0wrb",
+		.sid = TEGRA234_SID_NVDLA1,
+		.regs = {
+			.sid = {
+				.override = 0x378,
+				.security = 0x37c,
+			},
+		},
 	},
 };
 
-- 
2.25.1

