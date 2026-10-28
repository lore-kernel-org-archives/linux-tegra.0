Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.4
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793203562;
	b=v+Fl6yzoKbzHQvmhPszZUBrlF5MeJ2prsRQhm5wWz1avFpZFlMX8QwLUzfC5D2Oj7mGH
	 /eMqwvaVF9pz66VxpFsNqstV+ytmImTmg8gPrEFC7BR1W09noqV4VCOW/HFd0ynDmLM/c
	 2/TIqZNfw6kmnN5/Kw5paDESr6yQ9x5Vyi65elZdEXcuFdnieIZUY6pndwczR3fJE2kFQ
	 PxBbrdjUKU/XvkHXT5N3qGoPRGOyhhwcJzvCgK2xbesbEfygBqomdWME0LeCZUFJLd9n9
	 HaaQOidzEMfVz+hUpNRDD5CUeRWUNWySEF4mcmz1EU7s1qDwn9Vmke5N3THwLH443zQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793203562;
	h=DMARC-Filter:DKIM-Signature:Received:Received:
	 X-MS-Exchange-Authentication-Results:Received-SPF:Received:Received:
	 Received:From:To:CC:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-NVConfidentiality:Content-Transfer-Encoding:
	 Content-Type:X-Originating-IP:X-ClientProxiedBy:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
	b=mFAvSu8wZIS3dFTTx0vX1mrmY1H/qCZ5lh3RyK5kbQ8ZnZOUsxpqyDiFQ9A5ihCJscxw
	 tcLnkFnK8qT+tSXK9M6hWHp6yS9aMdWMoa4w4xAcqTteV2dqrOO4Phsg3mI4mbnJWrIpP
	 AjPvZdCkpFmsGwd3Tm45seyslIGFJwqJvvbFjUILSdOarUUJysOs5CdeaGxXYia6pd3C1
	 hMHInLO9SnfHycgKLiTAoIrosXjF8P64Mhtj7PsmupDSlOxJ6EbfJWpN8yZeBho1FMeF5
	 6ToQQNvvRwTXaatgfzbnbJhP7zeaXMNqhek5ijY1SfVosGAkeWQ9fgunjnC5JY2FNjg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nvidia.com;
	spf=fail smtp.mailfrom=nvidia.com;
	dkim=pass header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kD2iOYqN;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.46.4
Received: from CO1PR03CU002.outbound.protection.outlook.com (mail-westus2azon11010004.outbound.protection.outlook.com [52.101.46.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C779B606A331;
	Wed, 28 Oct 2026 16:06:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C779B606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.a=rsa-sha256 header.s=selector2 header.b=kD2iOYqN
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bzw3LInDENqwgBJlayIVI1eH83qYSK2i4jCtscKDnRMApIvNxRwt/zr7Nuqw1ZpnfbYD3d1IaaTYiG7hRPSNTU4I0eCKikA4XrL2ZTw5f5OktAEm5tVRUiSQ+wSgJfI/jA4Oehlf/QtWT+SIR6e+0EaePI2/EIDxl540nHc0y5lTttUkNNen+rjhOvNZkVCLMkq/JMYVYNe1d1ZMfkFXPgOuM0uRL6LA19mfcVLnEe9YWl2WCVItgAa9dZVy5K89SfPDzY6IP6iBbfb1e/V3gmVG41muwKuYk78fRrQObM2DmXkQtVKLhieM7GbxwtScsOtCzeg52hUqS7ikVtlOhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
 b=OrKc0NPSPTZLjoM8AvuvdraGy2X8u29OIt15PFV1Q70lNoGAa+2jGzUQr5rzmANEouyyyCqfV+UXRzWv/hm4KlBABiKXlsN/MmOOUHsqZzMpccRwCcKwuUrPYCuzHHx8CszpILS2FNrb8YeCN1CjaqT4uSKaDIdvMmNwB/C0LJmATEQdLFZ9Cj5o+8rFVsieBKgqvS/nGHntpQiOPIG+D2u7rGXeqYwEROPUgaIPHW+HsJhKuYuE28k/YRgD+1FpiK800BQw0GqwQbD7qhlAbK6rlxzAJHzL6uyEe0XywCP2ggBCUYuhB9Gi8nqqr8ZybBRX/Rfq5ZhnwQnA5fr1RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZyO9lmQ5T/qLTNEnlq3IawD2R1eRroM0j2e0TMZa2A4=;
 b=kD2iOYqN8P3kPVa/H7NhXpen5N4iKTx46Oz7tUHf9bWPUPMb9iE0pPUwxlEvEdKslw8zdiOmy39MM5/9Mef2x8axzMrY6nWLVrfHMFKndPzOV0PGxU2Hndp8OQ7zJIM149+nwkEFur3PyafjJ416Pap0xJm/HwvJLjcOCSV9gAJgnWL4c3XESVm6rtvsCWW1bn0X/3lcw2SXrHDVyej8TQtsgrKPEZKcriVtluUVh84UG1f9ONDHsbDqLsDnne5dkBU2AXmf47REenVii8WO8DxCJyL5fB9jPiWerxPyFi46fMy/cTteRoLe/6G6X2shB/oa8TUWjlYSnhjpsGddfA==
Received: from DS1PR03CA0028.namprd03.prod.outlook.com (2603:10b6:8:233::12)
 by SJ2PR12MB8953.namprd12.prod.outlook.com (2603:10b6:a03:544::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.8; Wed, 28 Oct
 2026 16:05:58 +0000
Received: from CH01EPF000BE942.namprd02.prod.outlook.com
 (2603:10b6:8:233:cafe::2a) by DS1PR03CA0028.outlook.office365.com
 (2603:10b6:8:233::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.546.22 via Frontend Transport; Wed,
 28 Oct 2026 16:05:58 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 216.228.117.161) smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH01EPF000BE942.mail.protection.outlook.com (10.167.244.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.4 via Frontend Transport; Wed, 28 Oct 2026 16:05:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Wed, 28 Oct
 2026 08:50:30 -0700
Received: from build-johnliu-noble-20261009.internal (10.126.230.37) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Wed, 28 Oct 2026 08:50:28 -0700
From: Johnny Liu <johnliu@nvidia.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding
	<thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>,
	"Prashant Gaikwad" <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, "Douglas Anderson" <dianders@chromium.org>,
	Aniruddha Rao <anrao@nvidia.com>, <devicetree@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-clk@vger.kernel.org>
CC: Johnny Liu <johnliu@nvidia.com>
Subject: [PATCH v2 3/4] firmware: tegra: bpmp: Add per-SoC EMC clock ID
Date: Wed, 28 Oct 2026 15:49:59 +0000
Message-ID: <20261028155000.1205739-4-johnliu@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028155000.1205739-1-johnliu@nvidia.com>
References: <20261028155000.1205739-1-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH01EPF000BE942:EE_|SJ2PR12MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 6849fab2-02ec-4289-aa64-08df350d5ab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|36860700016|82310400026|1800799024|23010399003|22082099003|18002099003|921020|11063799006|56012099006|261021121427099003|10067099003|261009223027099003;
X-Microsoft-Antispam-Message-Info:
	14zyG3PECWSXk8PFL4tvuN1lmcOta7peipw2dLG7h82YFLiwSDp+XPvjeTUlr6RgLsQJxMDQ/Zac22B5URa1IHMfILnRFvR9loZfJhWddWBkRfbkLo7RUXV10rLUlHy2I50zQP7XNQUbGsti3jrkv0G1o+gH16/OiVE2Z/xmSHauU8jF8tD+qYFXdhWV7Jkxqr7gfeYqka/Vn+0bfWnj7DJOMSgxQRNR/bUTsdwdJeYA/ZyWB4RISJiW1iiwG8p2RwzkIKbW7jsRiueqIEOU3wq62y2o1+7jMH7f6E5e9nHzFkBoT+cFHpYuP5WrvUzw4dnQlOo2O6ssskQ83toJdWgQbbLu7fFSP2sTGJH2WF0vW5637pxskodqgZ8oZr/oK5qnVU+7Y99IcBcIR2HY6HiGdCFcdOT/wGpjJXbd09CliMYCWvUUgFB9fOxmzGYiTpWW0TruZwn1icBOPh13cy33jQSTAuLJcH7szzusF8ascw0ID/gNhi5DHXot0cAtWBHZjtNri9C7NPS7XbKLZJadDIfBmnJoBM9/9yRNHeMOSJKNNPY8mtRDAKaczcohkeAey26AYAL06QYM1hoqQMAi7pldLJ408DcOVj2OzIphcYDPt1jhHR1P4+0rRKd0mpADldt10+xfGkyYB0h0r++Iajrb3FF+a5kGQge/0t43goKcHG1dKhROtNTmov+f6bCOx0YA+JmXgdbGPtDzRaFN+qQ8OezGDesjm0VcedgWk5gSV2U3+rS8Ptyj+wfk
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(7416014)(36860700016)(82310400026)(1800799024)(23010399003)(22082099003)(18002099003)(921020)(11063799006)(56012099006)(261021121427099003)(10067099003)(261009223027099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	SitDHgo5IbIE+FHL1xVgN5Ao9+RADGFve9pr/7JSsztMkCrilRln2tFhJDUbshDbnw7XlExr/vcwcivuhl6YnGeq2gg3+JRskSnSGrEaHEwUFwxVqKULg+q0AOdJn9NNfAZ2ObDhoyLbZCD8nCqvjKTyi5YzgUVuS6IIhCTPpnHiTenUlCCYLx3nqnDm1ff8Y21eORXfzyCsfalyXyzAESu9wjK2QQg7DOBsjEO5W4DxxW8CSqt7fPZoOb/QdGmI14ix+UBlQ6Iyff4x3rgCrzYD3sS4A4ZlVpp9pst/8NBSRrzFmGvUEwMOyuKeAtqW0yEf6kWL+4rVjaz2+8CmtYD9VKxTOwC/dxRwJ9ONqp35XrtLEBHW27VcrW4a555aW9QOcaa4TbU0hq1RSue/eXgLms8CnaeH9/ciAxKoDeCIsrEMhXrfDXCoEw2uMHgg
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 16:05:58.1228
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6849fab2-02ec-4289-aa64-08df350d5ab7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH01EPF000BE942.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8953

The EMC clock ID differs per chip (TEGRA234_CLK_EMC=31,
TEGRA238_CLK_EMC=43, TEGRA264_CLK_EMC=290).

Add an emc_clk_id field to struct tegra_bpmp_soc and set it for
Tegra234, Tegra238 and Tegra264. Tegra186 and Tegra194 have no EMC clock
ID and leave it unset.

Signed-off-by: Johnny Liu <johnliu@nvidia.com>
---
 drivers/firmware/tegra/bpmp.c | 7 +++++++
 include/soc/tegra/bpmp.h      | 1 +
 2 files changed, 8 insertions(+)

diff --git a/drivers/firmware/tegra/bpmp.c b/drivers/firmware/tegra/bpmp.c
index beeb385870f5..06da888535dc 100644
--- a/drivers/firmware/tegra/bpmp.c
+++ b/drivers/firmware/tegra/bpmp.c
@@ -21,6 +21,10 @@
 #include <soc/tegra/bpmp-abi.h>
 #include <soc/tegra/ivc.h>
 
+#include <dt-bindings/clock/nvidia,tegra238.h>
+#include <dt-bindings/clock/nvidia,tegra264.h>
+#include <dt-bindings/clock/tegra234-clock.h>
+
 #include "bpmp-private.h"
 
 #define MSG_ACK		BIT(0)
@@ -1158,14 +1162,17 @@ static const struct tegra_bpmp_soc tegra186_soc = {
 
 static const struct tegra_bpmp_soc tegra234_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA234_CLK_EMC,
 };
 
 static const struct tegra_bpmp_soc tegra238_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA238_CLK_EMC,
 };
 
 static const struct tegra_bpmp_soc tegra264_soc = {
 	TEGRA186_BPMP_SOC_COMMON,
+	.emc_clk_id = TEGRA264_CLK_EMC,
 };
 #endif
 
diff --git a/include/soc/tegra/bpmp.h b/include/soc/tegra/bpmp.h
index f55db918ccb1..40e2db8e69cc 100644
--- a/include/soc/tegra/bpmp.h
+++ b/include/soc/tegra/bpmp.h
@@ -31,6 +31,7 @@ struct tegra_bpmp_soc {
 	const struct tegra_bpmp_ops *ops;
 	const struct tegra_bpmp_mbwt_soc *mbwt;
 	unsigned int num_resets;
+	unsigned int emc_clk_id;
 };
 
 struct tegra_bpmp_mb_data {
-- 
2.43.0

