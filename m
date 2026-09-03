Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011005.outbound.protection.outlook.com [40.93.194.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC9B336C0CD;
	Thu,  3 Sep 2026 18:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788459989; cv=fail; b=FLWfZbB0bzdKBmtrTWu3q18rJFiSWyA4dsY8Pxf+IvzsjM0U2KrYCqxhA+Jt8RmhAqbXaqT0LNY+nDlgpJz2SgC1IXkRVo1cpCbNyRKuekiKCiKQtfvK0xj5IBBOZAsmZMFwt0mHTvIakqbmfEOdEGikMxNak3PRbIF7s6/JVQk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788459989; c=relaxed/simple;
	bh=hR0T9yyFW/GDgaTMPBcQiVPdbFMg8HlFzowdxLmTUhA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gx/OyFFZoetcNdHrrn/jTkKDy3fYH/jtckiR1TMqrW+1FrCSz31cyT6LJfahJgdm/ebyshsIcwOYGoKZY6dsjpqvr+nMgTQ/ZU2w7oY3Ogh2cNVFpobw7onQcOMtkUvV3M87y9uAfUC5sdSlpv/9QCCreOcYkgrECbaxI4yPh58=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YEHy9Z5h; arc=fail smtp.client-ip=40.93.194.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YEHy9Z5h"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdDDumZW6IrcDdL2XCCb/OLaQ833+c14SwcGf52bal126RB6wv8S/fvuyk2XxHzeRpfzporZPFDBeUSsIGnpUGNVg6JJEVSGYOdb9Lhz2B1LTgVYYi/GQsL46zRg5oQST9+yNQe6WIEPd6LASpHYDH8+9Klk5ksIMB5u7qByvUmvQOsWYtwlW8E2O+SF6IHM8tb8FV6M4qXHgBLvIdbUQmtLaO2NPlE7eobeNnibZX+gdq/fLRTzULIYkVEowYTPKG+aQAREEeFObokA+I5DjaP6hNxXJ36Vz3QsKTfEFP9dtzT9d4V+J6RArNuq2rmyXE1omGejBMfZMeG7zjOVrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pTdgYVbn7EujNVYNvCzYcHOoVjqAaCMiZrxaSFsE7d0=;
 b=Vl27Bxq3X0RSwDmDDDvZf4lXGzXHuPn2J4FsIhpk5Atd90be743EWt+S885+o9lBG8QGDDDyn5okfjTigmWu0RXfEbNhBSC9AgnGohmnXD/nRKLjp6nOKLO1rzwEdBRx9ZdjRQT11zRyqg2uTNgIYVwDd9p9f07oo2PUanMPVWpionV8OC5Z9A/lwZwab1JtnLNAwZawHYqyiQ0jDyuYSfUd3PBZXElgVrb8dQkhXx9X8Msh7c3ezn5u6tWkBrzxigQaSz/zR9LwGnJhZM+t1G3htaqnhlDWyJPJp3Ltlt8ze3L/ZjQzqsO+2l5Bfwc34Sjyv+bxBkrGdbiQdQkpKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pTdgYVbn7EujNVYNvCzYcHOoVjqAaCMiZrxaSFsE7d0=;
 b=YEHy9Z5hEj8qFWXV9HZ7BOANJUArg+kxMPO+B8QnJ/7z3Unf7lNB83S//HQBjd53PTvMsfRfBlgFgdlkVJdzQv8eOjQjy8qaKAmQrlZABDeao+Tk9+rmG3gmThf7SYh9Y3av9rq+Vplx3j2M5Ok1MVJO7P+8QU2azcM4FYc/rz6uaWgwAFSnJWD457WJS7FqiFDny6eGKmn0z4pcYyt0xvzSa2JH4ETcuGVrDoNbibkuVLQWUn9remSllzd8bQgGoO7VHELRFEJE8OHiCrbk0W9Uy+XdHe/OtVTwPiTcc6pD8ON7okhILagGi5Bs+l38CJadml0yE9rbHQij0Ba74g==
Received: from PH8PR05CA0013.namprd05.prod.outlook.com (2603:10b6:510:2cc::13)
 by DSVPR12MB999307.namprd12.prod.outlook.com (2603:10b6:8:41a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.13; Thu, 3 Sep
 2026 18:26:22 +0000
Received: from CY4PEPF0000EE3A.namprd03.prod.outlook.com
 (2603:10b6:510:2cc:cafe::8) by PH8PR05CA0013.outlook.office365.com
 (2603:10b6:510:2cc::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.4 via Frontend Transport; Thu, 3
 Sep 2026 18:26:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EE3A.mail.protection.outlook.com (10.167.242.12) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.382.8 via Frontend Transport; Thu, 3 Sep 2026 18:26:21 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:56 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.46; Thu, 3 Sep
 2026 11:25:55 -0700
Received: from build-ketanp-noble-20260630.internal (10.127.8.10) by
 mail.nvidia.com (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.46 via
 Frontend Transport; Thu, 3 Sep 2026 11:25:55 -0700
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH 2/3] memory: tegra: Parameterise Tegra264 MCF slice bound
Date: Thu, 3 Sep 2026 18:25:19 +0000
Message-ID: <20260903182520.950555-3-ketanp@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903182520.950555-1-ketanp@nvidia.com>
References: <20260903182520.950555-1-ketanp@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EE3A:EE_|DSVPR12MB999307:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e22303e-3f28-4d0d-5403-08df09e8dae5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|23010399003|36860700016|10067099003|11063799006|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	38ri4h3gbeZOowEQZeSpE1RJEm+bLAim7+M0U3zHI8CGEALX2T8CShcy/XxqfOJ8jEXHtdL++GVW6x6CEAXnYa49DFgXQFBz4ZZ07i9lHlzM5OiOPHYXF5O+CwCtoPS1ZnsbmEI46I/0Io5Ni+edqp6MlzsjiOshdQUyFk6rVG5fE3T7Da88StF+nJPHyZ6aVB2u8w8CjJ4Tu/EbNEtHiLt2b//2glU2ytNoB/1cR1Hy9zjKVioe28u3TzpM+GxqnffLI+JASa+82r43SSL+mbcTZ7fwv0GBwku4zW5vKtgNbFb1S+Qh1lAUAgP4dVYFAVz0Im1azt66MHeg1Oq6EKj1VIOPt4xbgZbJpcWWJEBRyLpdbdOqtnamjjhbZwigQbECCi0Ux1FqK7w/y6UWlYe3F1RpALxA3aTboTSaEkvWLQwM9s6KZvZOjMTsCs8l+/kn7I5ZuZ018+XaOMUKs/JYwd7NS2ViG5uvbZg9XIAfXPkVqKb3e4CulbZEwaG83TSbfUu6uDIVEjUVqnGKumeTMsYEaNSPOEvA/mxBlsItujA41MieZwcmwS1LWWPyRlr0sLSR6fSZSMvMdK+w2TfeSkiMyEQpE6hpbC4rmHvr4oUslc/s+SZCjDtabM4jhn4TyZluKP1xx2uNr5IOLjHFSmbvwnL6YsrlJZLddiq/rB+Rx0b43OZnF/LUvZv8VpFHN8SFpGyvW0ruJ3Dsqg==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(23010399003)(36860700016)(10067099003)(11063799006)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	g8BT6u1hWZHGOtrr64kKzJzEv4MCKWUmw5IbMxEqOkIBYqfAc0U2p2GdOyqOKVgvHiyqbMJQ1JMDmh4jRykTEX7ygqtianbL1KUTfKSVs5ObHqO9Tlq+d68MvRCGrYNxZajzkxcYeZFqUjB/S0fsqKb+ou7NZKEl1W49w5US+WpYhALqXTLgbvmucODx2iAskhiEg0FEgkoz+1tG0WdotacKgFPeWTGXp4XztD0mMlSUCp2lPQibphM9yzzNHr3Rl4Sm2JMrpcsooHLQf7eeS3q6wtVd25ETO1N1c6YMRFAHvRQkKn3wz4oNMTQGZeKlvwhhrNoTrHoCvPj4Fzb3iCfUNAyoQa3fZHKnnvZaR7Nr7B0U9Ob1vnrErGLX+2cV/7JM+wKUAqiFM1KtutB57VdfMaL0aP0U//t2KHjEdDfFQDOeV7akduy5Yekdf3gh
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2026 18:26:21.8135
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e22303e-3f28-4d0d-5403-08df09e8dae5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CY4PEPF0000EE3A.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR12MB999307

Replace the hard-coded slice bound check in handle_mcf_irq() with a
TEGRA264_MC_NUM_SLICES define, so the number of MCF slices is named
rather than being an unexplained literal.

Note that although the existing logic is correct, the actual number of
MCF slices for Tegra264 is 5 and not 4. So define TEGRA264_MC_NUM_SLICES
as 5 and update the logic accordingly.

No functional change intended.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/tegra264.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/memory/tegra/tegra264.c b/drivers/memory/tegra/tegra264.c
index 56e55269eed7..b40275ae382e 100644
--- a/drivers/memory/tegra/tegra264.c
+++ b/drivers/memory/tegra/tegra264.c
@@ -727,6 +727,9 @@ static const char *const tegra264_rt_error_names[16] = {
 #define TEGRA264_MC_APERTURE_UPHY	10
 #define TEGRA264_MC_APERTURE_TOP	11
 
+/* Tegra264 splits the MCF common interrupt status across five slices. */
+#define TEGRA264_MC_NUM_SLICES 5
+
 /*
  * tegra264_mc_icc_set() - Pass MC client info to the BPMP-FW
  * @src: ICC node for Memory Controller's (MC) Client
@@ -941,7 +944,7 @@ static irqreturn_t handle_mcf_irq(int irq, void *data)
 
 	for_each_set_bit(slice, &common_intstat, 32) {
 		/* Find out the slice number on which interrupt occurred */
-		if (slice > 4) {
+		if (slice >= TEGRA264_MC_NUM_SLICES) {
 			dev_err(mc->dev, "Slice index out of bounds: %u\n", slice);
 			return IRQ_NONE;
 		}
-- 
2.43.0

