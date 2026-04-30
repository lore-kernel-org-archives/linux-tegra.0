Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11011005.outbound.protection.outlook.com [40.107.208.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5198539C629;
	Thu, 30 Apr 2026 07:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777533044; cv=fail; b=qI66D8NkSyB9hraLCYuCGiXjPbZ/xdS2YbN2EjT/GbdxE6blwdSkhQUrM5gMnnCgxdZ9HkQANGMyDuVn5mq/c8TtXIbPCjyibCBE5ZwNRHTvqsoMegZmlEksVuaHyI6xYQBVIjs0542vlT38hvVZNyiavfAJfzyLfyQwYetffTg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777533044; c=relaxed/simple;
	bh=5enuGkJ1K8akBZnxnMzsU8r0C8FGYgz1oKaap28T3no=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=eDHpke/REQZd65gzKN2StUfhtHMpSOrlL3stYwdTW3qrRNKHfopxCvWztAZx99DkskKsoy6BYCQXfhPsBrHa+oosMl6ma6RoqGc3oTV0ZGHC6F9d7e11YrguIOamUZyObYdqS1mliFjDSVYbNQYOXPPlR+RKhTCA34g6wl+W9DY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=YuWpP1/v; arc=fail smtp.client-ip=40.107.208.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="YuWpP1/v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRiusUfHYaAaA1Mb9lqZ0fD0LMpX4zKZQyBd5S7jFVBf9B2Q2Z31eHxIIv9tB23TNGRKfYpY4GnvU9qQ8Zr5cw0VygNQenrVygdSH1dRSCFI4oZxMLBTrHyH7Sp0JiYM20SdBfi4HoBTq673gN5YL479XGXY27Aq8tomcYHAvRgyD4Br6ooVD2r3ERRdPoRobNYYz3YJ/PhF1av7xP1EXhskd5vjBE9DwVUb740oRg07HWUnS67LrrO1DS4TE584eMsUHrSJ26yUy6xVDnPv9e9bDCaZCQ2EZtY5x0mA+XWRCcSJtRdtAvHHE6YjDdotjjkpeCkkQZouAweN5SmH/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nN60RZSnh8vr7y4rZ3xf8aVcQA+1GAJE803x/03wzAo=;
 b=oRmWCL/R3bmJo+PcgtaU+Q/vnXIAMyIAVAk9MTjTPB0SRNHigZEoeXh86RSPbgwhINIk7rERo2jtyXHrfsSRIKJp4yYwYiDDzNtPkIqHnuky/linOZuhHLfHRsy1NYiJ8W/gkmLvpT2vEY0sKYzhi99TjV1fw6mKH0v9pNh8d9KeEPIMwf/tguCPNfFPOdFtBrzDXwTzgD8dBfn/uW+C3WIHNSAnFRsyqgSWAZd0wtRMax2JbZxtkmEW8uONdXt67yYTrEV1h4Plu3+uzMcLCnaefwRRQFAUkK6pNkSMf06WV9jgoCAEPjQYN+cyGIjfz2piA7n4VNHzPVSqz+gl4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nN60RZSnh8vr7y4rZ3xf8aVcQA+1GAJE803x/03wzAo=;
 b=YuWpP1/vqwRkAbTjPLiB2wAJNWZk1aPixysFzaKeXYFRHjqrVg4WCUkX5tzfIhMj53Glkk4IxYx1GFB0zVaGo+PYIgECY0QqaVyBYzZ1d4e1G0kAEkXXKZGlZGKkWvMa2MPh8ELuglQgs3oO70uvOlHRO68jjY+dcjoZaXRz5bqisNsGzNQjL2/9gIlBIYt+yvFv4d0B91vMy9tSaw8rU8as3UGQmaGd+cDtx+ojBtAIFCAzOHjrNLUTSuaRILsRKWFVS5nXUNPTZxGG4ODxx1Kr5GAhRmUeQxk4vKs4GMpPhY4F3DSFDXrIqn+ofuzwIVJ7gNtYnJ9154e8ISbpuQ==
Received: from CH0PR03CA0424.namprd03.prod.outlook.com (2603:10b6:610:10e::21)
 by IA1PR12MB8334.namprd12.prod.outlook.com (2603:10b6:208:3ff::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.20; Thu, 30 Apr
 2026 07:10:32 +0000
Received: from DS2PEPF00003443.namprd04.prod.outlook.com
 (2603:10b6:610:10e:cafe::a8) by CH0PR03CA0424.outlook.office365.com
 (2603:10b6:610:10e::21) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.30 via Frontend Transport; Thu,
 30 Apr 2026 07:10:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS2PEPF00003443.mail.protection.outlook.com (10.167.17.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Thu, 30 Apr 2026 07:10:31 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:16 -0700
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 30 Apr
 2026 00:10:15 -0700
Received: from build-amhetre-focal-20250829.internal (10.127.8.12) by
 mail.nvidia.com (10.129.68.9) with Microsoft SMTP Server id 15.2.2562.20 via
 Frontend Transport; Thu, 30 Apr 2026 00:10:15 -0700
From: Ashish Mhetre <amhetre@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@kernel.org>, <jonathanh@nvidia.com>
CC: <ketanp@nvidia.com>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>, Ashish Mhetre <amhetre@nvidia.com>
Subject: [PATCH V2 2/2] memory: tegra: Restore MC interrupt masks on resume
Date: Thu, 30 Apr 2026 07:09:54 +0000
Message-ID: <20260430070954.1005564-3-amhetre@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260430070954.1005564-1-amhetre@nvidia.com>
References: <20260430070954.1005564-1-amhetre@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003443:EE_|IA1PR12MB8334:EE_
X-MS-Office365-Filtering-Correlation-Id: aba4362c-a621-451c-bf3c-08dea6879106
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|82310400026|1800799024|22082099003|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	uTr9AdD7EY4+sy1aNWzfBQr4hb6D9JHRXQ2/ze6JOFe9b9xAhcInkMIhzRcmjHdV+MuF5IHOOsbIYuJmbUERprRp5SUXmDW+NzKG6OyrB8aQKqukrDV9infG89eclHCK89VJWjlYxh8etor8PBJY/QDRQoTpDcCVvsSStva3rwtqhlxL6tPZKI7IoM4WmncrKgbIP5JlAq53CD024UdceydxRbGg25SKw6EfSzX8zENCVMF0d6X5NA0XIW6dNyjthprLUu5u4DAvEE/lBZGdF20d5bpNE9N9ab0z/KS5oasPbTABpF+G2qNqAVjYy4UKsMK2NZtYaoWPpOnuWleC3NPbxiNQUdX9ZMd1FCljdzSJPREDObLx8dT7n1bi7wclLVx6MZ7EfS15/tthw11Rfsj7zuZYOASJxuXpxuTObNbtdyKrF78X8Zj+CPpL8702lK6nxjGKSYsOxRofdmx0wKElMomAC3FAJ43wPbJLs8hkGz1U9Xo9z+shvtAuFj9TvUJHcwraPjh8AQzwOKw2kjbvcTjbl3yEyEjDSCLM56/OeXQn4BkmBaGeTbRzFBfXgvr+P3UfF3S9yHAJpym0nFlFv846SL7eoW29WWgfXYjIdW/YAnGMC70auiZSAyYX2+npplBlqhWhSRSXg7O0PpRPDffpK3RP6rtGJxUZ5MEijpVCGWfSxzesD5+dKsYjlQwB9ENOZxxCKi/SRJbl4GgMrDqGQY5WccoUaQNllcrHZhkOk0SQC6T+HK5pBXNFY2rZSJsfJfsYXbwtkqMHiw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700016)(376014)(82310400026)(1800799024)(22082099003)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Bvzt7caBThGu4ZdDVO3LY/RHqJj04hM/WjwGXg9j0nXyLe3Mw08y2gKH+dMQUWzBP0fpUBabj/GFhtklk+7hgOAE6Q9BmqQpxg7loyfA4Ia00oS1Xp2eSXwAnxJJlTv9tDeS5rIAeKPCYi0iJmPIQHp0piblkdURyMhiQvYmMtmDjdG/33NMPMV+5DNANnrLHVFECOxiJGYm1SB+NfARrDheYyFaJZPXFafridTQWaRxMtzvO1+IgUzdg+TsvjGztwfh7chaZPf5EOJBQ1mX4MbrPgg/fk2N4+6/okbNOdc49am7dc54Qsak9GKnbJruSudZWfkjRIYJEp5nN96nie5czdMEI3NjLUCEe4NXgSfs5Xjl79hj6/FpRVP9JKu3MyxbgGCKsh9YjQRzusIWfrlND3Yw2HzVT3OT5b5TygkIK4o1tb0tfanN6+V4Lz3C
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2026 07:10:31.5577
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aba4362c-a621-451c-bf3c-08dea6879106
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	DS2PEPF00003443.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8334

The MC interrupt mask registers lose their state across SC7. Without
re-applying them on resume, MC interrupts that were enabled at probe
remain masked after wake, so any post-resume MC error goes unreported.

Factor the existing intmask programming out of tegra_mc_probe() into
tegra_mc_setup_intmask() and reuse it from the system resume callback
so the mask state is restored on wake.

Signed-off-by: Ashish Mhetre <amhetre@nvidia.com>
---
 drivers/memory/tegra/mc.c | 31 ++++++++++++++++++++++---------
 1 file changed, 22 insertions(+), 9 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 343ac0018eba..ea7b489d666b 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -911,6 +911,19 @@ static void tegra_mc_num_channel_enabled(struct tegra_mc *mc)
 	}
 }
 
+static void tegra_mc_setup_intmask(struct tegra_mc *mc)
+{
+	unsigned int i;
+
+	for (i = 0; i < mc->soc->num_intmasks; i++) {
+		if (mc->soc->num_channels)
+			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
+				     mc->soc->intmasks[i].reg);
+		else
+			mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
+	}
+}
+
 static int tegra_mc_probe(struct platform_device *pdev)
 {
 	struct tegra_mc *mc;
@@ -971,13 +984,7 @@ static int tegra_mc_probe(struct platform_device *pdev)
 			}
 		}
 
-		for (i = 0; i < mc->soc->num_intmasks; i++) {
-			if (mc->soc->num_channels)
-				mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmasks[i].mask,
-					     mc->soc->intmasks[i].reg);
-			else
-				mc_writel(mc, mc->soc->intmasks[i].mask, mc->soc->intmasks[i].reg);
-		}
+		tegra_mc_setup_intmask(mc);
 	}
 
 	if (mc->soc->reset_ops) {
@@ -1014,9 +1021,15 @@ static void tegra_mc_sync_state(struct device *dev)
 static int tegra_mc_resume(struct device *dev)
 {
 	struct tegra_mc *mc = dev_get_drvdata(dev);
+	int err;
+
+	if (mc->soc->ops && mc->soc->ops->resume) {
+		err = mc->soc->ops->resume(mc);
+		if (err)
+			return err;
+	}
 
-	if (mc->soc->ops && mc->soc->ops->resume)
-		return mc->soc->ops->resume(mc);
+	tegra_mc_setup_intmask(mc);
 
 	return 0;
 }
-- 
2.50.1

