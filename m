Received: from CH1PR05CU001.outbound.protection.outlook.com (mail-northcentralusazon11010018.outbound.protection.outlook.com [52.101.193.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A72BB3644D1;
	Fri, 30 Jan 2026 17:31:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.193.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769794303; cv=fail; b=rLGd+Tb3eMoPYjdh2o7sOVNRgHYEKIymAg8JkQpWUHCMfS2FJwGVoXsmAxu5gFGGblQEn7hbOJEX+Dr5ODlhAV8j84f1NXuQJwgKIlAO/nKcDCpS+rs5c9oXWFvPt1UZyU5ht2P8hAJQlJqVXLpNZM51CbYDxD+KGJ2WtQEeAb4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769794303; c=relaxed/simple;
	bh=tOQiR992wMNl8OOu5U6Q/Q0VWeYktcEV8ahANf02u/k=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kKy926ydn8/N/98mWUI249XFYIkIutmBDHGkXIh6R+EL7+qB4M0171GLRkcRDJDSkNvn4lh2jDxpa8YAZGL6zOXYepngNJpbC7DWft4nKxgpXcthr8q+2MBPaDro3yt6qc7h1qRaYEMKeVBsiUR4h3s3W7oJ72Z6Zn1zI37E+kc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=QYwpk+fS; arc=fail smtp.client-ip=52.101.193.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="QYwpk+fS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QL/HY/k1wKkUL6n/r3jiwBiFFEIHUHroYblnFm5ZHjeQ/keSFBKUZUX6Jn7JnzUueXc+94iNKzOkSaFAdhI7307r42rMDJXhfx+3XX2sjvtZ3JYp2iXmzhJ6fd3OA+FQMy5qow0fsL47uOIvoPwsPuuW3c+FW4Eur1gWycbEE0ilyl0XDLDp9BoWkJsTUB6gKeh02OFFjUqpuE43eabLhzZ18T3ho4yCAeQZYotdlnRMhtyXn2PDa7yqi2/ktme2XM3TABj/CHF5c7p8KITQTJ0SN/cAiJV9QSxUtLAs4VAcqsaKbCt33HwNICl5sV/TNjfmWgNeXv/28CkagV+9Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeY5L0XjHXFxwDiI3iQhXBBwvU3JRt2MedP5gikfN7Q=;
 b=l9h2NoVm55rA2VKzipWI3aJGOymp+UW+mqZK8/5cz1EZCIGLgxCMg8Vb8z8EDH1K/3XH5RVvBQJfz9NOxQ/mydN00mKMxEhBaQL1d1pvw+7BPmfvf+MKxyxlsvLyP/OP0eptVgu1zH0xw+59PEP6AcZ5WOXTq+id7NAqsf09zBNs6jIZocW4TeZNGmpk1+g6mnKn9Roie5koskhbNWz46waTfxJhoJKRYszdYOb9jursMMuWxbye0pVt1Mfknhwd8d1q4+sxJVPQGehRjboqr7TWalGqpxIxsGGQLXm+X482dFicydzeShAGQTGtozgo4r8mKMGob5pgSG9m85tC+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeY5L0XjHXFxwDiI3iQhXBBwvU3JRt2MedP5gikfN7Q=;
 b=QYwpk+fS1JLZ3zqLeoENsXfr2gq5NhBog6xNXekVMMn4Octx0J0/RAi09VVcIlvTHgV9wpg2EScbx542kd7YUSjXWq7vaHHitCc5IUmiH7gdo0F+ZdFNBCNYT3cZbdOVu+lA6i1ga69EgS3fD7X1F3+GhsdpWC+Q7nxzUokdVzEPc+w+3qkdmYR/wY4uSXUPg1wERZ8a9hYDxQ0U2IRZca2kEumjRS/HZyQQTXHeOY7jZiCwbtB10org8DwvztF20cM6vRti/7Q1wBlyXbJXRgDoJEPYYtr1AYo5nZ6xNCA8inAp9AF1cjA2O1nmpz5dUuhHGmmlaxWyqqIAXpsqvw==
Received: from SA0PR12CA0023.namprd12.prod.outlook.com (2603:10b6:806:6f::28)
 by DS2PR12MB9614.namprd12.prod.outlook.com (2603:10b6:8:276::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.8; Fri, 30 Jan
 2026 17:31:35 +0000
Received: from SA2PEPF0000150A.namprd04.prod.outlook.com
 (2603:10b6:806:6f:cafe::a3) by SA0PR12CA0023.outlook.office365.com
 (2603:10b6:806:6f::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9564.11 via Frontend Transport; Fri,
 30 Jan 2026 17:31:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 SA2PEPF0000150A.mail.protection.outlook.com (10.167.242.42) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9564.3 via Frontend Transport; Fri, 30 Jan 2026 17:31:35 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 30 Jan
 2026 09:31:19 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.20; Fri, 30 Jan 2026 09:31:18 -0800
Received: from build-ketanp-bionic-20250813.nvidia.com (10.127.8.10) by
 mail.nvidia.com (10.126.190.182) with Microsoft SMTP Server id 15.2.2562.20
 via Frontend Transport; Fri, 30 Jan 2026 09:31:18 -0800
From: Ketan Patil <ketanp@nvidia.com>
To: <krzk@kernel.org>, <thierry.reding@gmail.com>, <jonathanh@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>, Ketan Patil
	<ketanp@nvidia.com>
Subject: [PATCH v6 3/4] memory: tegra: Add support for multiple IRQs
Date: Fri, 30 Jan 2026 17:30:54 +0000
Message-ID: <20260130173055.151255-4-ketanp@nvidia.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260130173055.151255-1-ketanp@nvidia.com>
References: <20260130173055.151255-1-ketanp@nvidia.com>
X-NVConfidentiality: public
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA2PEPF0000150A:EE_|DS2PR12MB9614:EE_
X-MS-Office365-Filtering-Correlation-Id: 5fe19993-3e9d-4e0c-3c82-08de60256afa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?oalGcfzPKYtn2H3VgoRT1w8pSReJIXYhTucvnt7o6/0LLOKKYEA5+26wvPTJ?=
 =?us-ascii?Q?BylrkeXmph8ET9NRfUJ/oGfJYU+HzvCs5+AK2BJmtB8ZcS6LPVoGrLa2zuP6?=
 =?us-ascii?Q?7xWwxpbkEQxiq8UBfG4HiuyVf8jn8j5Jg8xCXvm0eUFtjiBeRAYuuAN0ftPh?=
 =?us-ascii?Q?+GguSxPHZBMziL5rkwSF57z/s7KmEcuyfDudjXOJR7mFnXOLrIAXkr1OSU0A?=
 =?us-ascii?Q?214Wbp5cFu/mYb2KEC4Z3AUO0tJxr1TgbJU3FWrjsFuOb0TBGsO8B7mXG4lO?=
 =?us-ascii?Q?ZBDaspWQP41DyZfqujP+82jqIKtU+1F6yOGHpJ81efuUVQjCdemK9LAzID3t?=
 =?us-ascii?Q?dLAl2afuGSv6o+OdpBl9EewvKK2eBhNDhu9loFDfOqGzIs3dgQRE8SKva8p2?=
 =?us-ascii?Q?B21yG6VOoMVESrSTgUMd2HvTDdqcqEPbJgkyHJ+xYwpVaJAOa5Ccjvad5c3x?=
 =?us-ascii?Q?MBrfOyNBhcw8MeCPeQmMPLV5wR9zPbexgB8UP3hqRlNcDXBccYLxGXuNQ71t?=
 =?us-ascii?Q?Hf1vuo4GFHcf9TaKWkbRkm7yKALKtW8CxFM4A2T9uq91ocbADaOxuDIzegLU?=
 =?us-ascii?Q?TinCPE6T/Adup38TYa3SmbsGiXqNjkhzL6INw0n7k5J9jPuEU2KqeoME5OR8?=
 =?us-ascii?Q?6lEvNdW1/k20LM3XmhxYkaGeocjlP8+7HvmZdHBh7SY89o1lvUSPBOuajULx?=
 =?us-ascii?Q?bOSoWiP/Tw3uG9kiYu40Vjipha5VZFk7Ul4d0fj5siMtdvUuKfXvyCzMpA4K?=
 =?us-ascii?Q?gW4bvaeFxHbG0Cc3SxV28/tf0z7h1UysC0ULR8uPreBm6UHSh22UKVmI1+Hv?=
 =?us-ascii?Q?/96wbO/kieJpb1Va6wO+HOcWrQa3nM0DzIqEAI5YXziMWlJHj4dGcXC8bhH1?=
 =?us-ascii?Q?hTgxw8FQAFX5AEwgJ9vM0YS8XJq8h9Zt3wUth2rtls8qCk5dfZcd6z9/H5OR?=
 =?us-ascii?Q?bSXBXTM8QvXIItGtkZLcADql6rPiclZ+C7qxbRk0md4KQ2iNBYFYJKLJSeCU?=
 =?us-ascii?Q?7Zu4xd6cjWc7TPcTxzbnp7LQfWTbcQk93fm/HMpCyyjGkBcsshPn3wIGc+KQ?=
 =?us-ascii?Q?zTHQ7NQJaKGFNYxWs8wLG0bWUBfDjRZlk/1f+dDsvyM+50Cal9MF0mNnzXRF?=
 =?us-ascii?Q?Dfl70bKKm/yJ65qqtv7OKx0s/JM2WQIyCtShYDYrfeegJAYjNMSD8Q8VzXRH?=
 =?us-ascii?Q?jGSYjKpqqeldn+xiU0yxGTBBhok9NLXK35SiiV+tfqxZwI35m4As6DEysaMH?=
 =?us-ascii?Q?U9Ou7QRZ6Jlw4sCBMQQ1JxBbev1F0aoZQHtmsi4frTT4+NwscGpoiF2Y/UFj?=
 =?us-ascii?Q?CLHcnkk4a8wAl0ihP5yQXjJukyddmiNOBIxwhE/dwAeV0N2EeBmNjbjpBetr?=
 =?us-ascii?Q?lks8D7wiS9q9cgv6k3qD/rOhyhRXKWIF5B13MLJ4PuPjJgpvWd8J+oWHE1IS?=
 =?us-ascii?Q?lrsQIrZbd9IcQc7MNco+b6Y1NNk+AnTJK0h0m6AcuMoYywF5ywf+eIu2wiK9?=
 =?us-ascii?Q?05INylsiDrOdps7DKh4lry/0IBHmacja+TLcrlsPjaoVn6sFxnrjSXxF8FWM?=
 =?us-ascii?Q?xKHW8LfqQ+zvF9M0cRacfI34oGqulfKZy3vqG8Re84y0o824BsklM6r2UsvF?=
 =?us-ascii?Q?Bln6WZsGRqJ1Pxr5UfZwspQK396Z786nlHc2J5f5GDiu7epD0p3mbm6KlRFp?=
 =?us-ascii?Q?Sd5qyg=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:216.228.118.233;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc7edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	2uyPfsKvPszGSK+qAkr70naoahpEDExRhoV4/URwPlbaa/GyyQ71TWFi/mTwOtEYSWI5/MIKsHrPfDvC5fREhGoxZEYPYK5y2zCg5LgJS2494fGK2+1EYcDpQKMa7oeua8zhDu0EQ0/3m9dipw/gui6CP8bcDfAnWdlwmegMMZLgCug89CjQAq4vnUP1HbsNUWyXQnEu8XlMYVUlDcfFHDR0sMEAW0yV7fATC35hzw3REDZDa/Wkq7HV55ML8w6W5gKr6RjkcIKiDQQV8nuIumynkSj5PPUdqMzeow5neg0i4LPn+hFa99owJSZCtbJnS1XqLuqS9UYS2SJIr6+P+mtR/KQwEj5e2WNyNIoyysspzW/ZyCZXjTItEvDyIK4ahB5UKYuz3MlyK2DIHntlW3pXtO0utDMtqIPHHEAIqGocBuGYzJ7Yxx7imvWKJBUz
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 17:31:35.6867
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fe19993-3e9d-4e0c-3c82-08de60256afa
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.118.233];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SA2PEPF0000150A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9614

Add support to handle multiple MC interrupts lines, as supported by
Tegra264. Turn the single IRQ handler callback into a counted array to
allow specifying a separate handler for each interrupt.

Signed-off-by: Ketan Patil <ketanp@nvidia.com>
---
 drivers/memory/tegra/mc.c       | 34 +++++++++++++++++++++------------
 drivers/memory/tegra/mc.h       |  1 +
 drivers/memory/tegra/tegra186.c |  3 ++-
 drivers/memory/tegra/tegra20.c  |  7 ++++++-
 include/soc/tegra/mc.h          |  6 ++++--
 5 files changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/memory/tegra/mc.c b/drivers/memory/tegra/mc.c
index 1dacbe2aba4e..49c470f7b1f7 100644
--- a/drivers/memory/tegra/mc.c
+++ b/drivers/memory/tegra/mc.c
@@ -398,6 +398,10 @@ unsigned int tegra_mc_get_emem_device_count(struct tegra_mc *mc)
 }
 EXPORT_SYMBOL_GPL(tegra_mc_get_emem_device_count);
 
+const irq_handler_t tegra30_mc_irq_handlers[] = {
+	tegra30_mc_handle_irq
+};
+
 #if defined(CONFIG_ARCH_TEGRA_3x_SOC) || \
     defined(CONFIG_ARCH_TEGRA_114_SOC) || \
     defined(CONFIG_ARCH_TEGRA_124_SOC) || \
@@ -551,7 +555,8 @@ int tegra30_mc_probe(struct tegra_mc *mc)
 
 const struct tegra_mc_ops tegra30_mc_ops = {
 	.probe = tegra30_mc_probe,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra30_mc_irq_handlers),
 };
 #endif
 
@@ -953,25 +958,30 @@ static int tegra_mc_probe(struct platform_device *pdev)
 	tegra_mc_num_channel_enabled(mc);
 
 	if (mc->soc->ops && mc->soc->ops->handle_irq) {
-		mc->irq = platform_get_irq(pdev, 0);
-		if (mc->irq < 0)
-			return mc->irq;
+		unsigned int i;
 
 		WARN(!mc->soc->client_id_mask, "missing client ID mask for this SoC\n");
 
+		for (i = 0; i < mc->soc->ops->num_interrupts; i++) {
+			int irq;
+
+			irq = platform_get_irq(pdev, i);
+			if (irq < 0)
+				return irq;
+
+			err = devm_request_irq(&pdev->dev, irq, mc->soc->ops->handle_irq[i], 0,
+					       dev_name(&pdev->dev), mc);
+			if (err < 0) {
+				dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", irq, err);
+				return err;
+			}
+		}
+
 		if (mc->soc->num_channels)
 			mc_ch_writel(mc, MC_BROADCAST_CHANNEL, mc->soc->intmask,
 				     MC_INTMASK);
 		else
 			mc_writel(mc, mc->soc->intmask, MC_INTMASK);
-
-		err = devm_request_irq(&pdev->dev, mc->irq, mc->soc->ops->handle_irq, 0,
-				       dev_name(&pdev->dev), mc);
-		if (err < 0) {
-			dev_err(&pdev->dev, "failed to request IRQ#%u: %d\n", mc->irq,
-				err);
-			return err;
-		}
 	}
 
 	if (mc->soc->reset_ops) {
diff --git a/drivers/memory/tegra/mc.h b/drivers/memory/tegra/mc.h
index 5f816d703d81..464cf75ccadc 100644
--- a/drivers/memory/tegra/mc.h
+++ b/drivers/memory/tegra/mc.h
@@ -193,6 +193,7 @@ extern const struct tegra_mc_ops tegra186_mc_ops;
 #endif
 
 irqreturn_t tegra30_mc_handle_irq(int irq, void *data);
+extern const irq_handler_t tegra30_mc_irq_handlers[];
 extern const char * const tegra_mc_status_names[32];
 extern const char * const tegra_mc_error_names[8];
 
diff --git a/drivers/memory/tegra/tegra186.c b/drivers/memory/tegra/tegra186.c
index 51e2dd628fb4..23ec433f0f92 100644
--- a/drivers/memory/tegra/tegra186.c
+++ b/drivers/memory/tegra/tegra186.c
@@ -174,7 +174,8 @@ const struct tegra_mc_ops tegra186_mc_ops = {
 	.remove = tegra186_mc_remove,
 	.resume = tegra186_mc_resume,
 	.probe_device = tegra186_mc_probe_device,
-	.handle_irq = tegra30_mc_handle_irq,
+	.handle_irq = tegra30_mc_irq_handlers,
+	.num_interrupts = 1,
 };
 
 #if defined(CONFIG_ARCH_TEGRA_186_SOC)
diff --git a/drivers/memory/tegra/tegra20.c b/drivers/memory/tegra/tegra20.c
index 227c3336974d..794255914f2e 100644
--- a/drivers/memory/tegra/tegra20.c
+++ b/drivers/memory/tegra/tegra20.c
@@ -761,9 +761,14 @@ static irqreturn_t tegra20_mc_handle_irq(int irq, void *data)
 	return IRQ_HANDLED;
 }
 
+static const irq_handler_t tegra20_mc_irq_handlers[] = {
+	tegra20_mc_handle_irq
+};
+
 static const struct tegra_mc_ops tegra20_mc_ops = {
 	.probe = tegra20_mc_probe,
-	.handle_irq = tegra20_mc_handle_irq,
+	.handle_irq = tegra20_mc_irq_handlers,
+	.num_interrupts = ARRAY_SIZE(tegra20_mc_irq_handlers),
 };
 
 const struct tegra_mc_soc tegra20_mc_soc = {
diff --git a/include/soc/tegra/mc.h b/include/soc/tegra/mc.h
index 372f47e824d5..89f94abfaada 100644
--- a/include/soc/tegra/mc.h
+++ b/include/soc/tegra/mc.h
@@ -10,10 +10,11 @@
 #include <linux/debugfs.h>
 #include <linux/err.h>
 #include <linux/interconnect-provider.h>
+#include <linux/interrupt.h>
 #include <linux/irq.h>
 #include <linux/reset-controller.h>
-#include <linux/types.h>
 #include <linux/tegra-icc.h>
+#include <linux/types.h>
 
 struct clk;
 struct device;
@@ -164,8 +165,9 @@ struct tegra_mc_ops {
 	int (*probe)(struct tegra_mc *mc);
 	void (*remove)(struct tegra_mc *mc);
 	int (*resume)(struct tegra_mc *mc);
-	irqreturn_t (*handle_irq)(int irq, void *data);
 	int (*probe_device)(struct tegra_mc *mc, struct device *dev);
+	const irq_handler_t *handle_irq;
+	unsigned int num_interrupts;
 };
 
 struct tegra_mc_regs {
-- 
2.17.1

