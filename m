Received: from BN8PR05CU002.outbound.protection.outlook.com (mail-eastus2azon11011056.outbound.protection.outlook.com [52.101.57.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D32E1A8F97;
	Fri, 24 Apr 2026 09:59:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.57.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777024751; cv=fail; b=EvSNQiXrHEFl7fD7vm5q6crwMUNi1gzb8wL1XAh3UGa/ziDv329F7EISIeyneSLG0f4NnDAEEXJ95PRs3jfkwqw0FW/md7kQi0Mq82fc+/mqWFVtyxj+rUxuSG1jnedZH16yW7477jOq2eRzjg1HL7ABPYhbnMvMCbws7s0Bd24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777024751; c=relaxed/simple;
	bh=vIKrhFWnBtzv39LgzHwzXeJ3q6nvIknNmq86K2/UToM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=eGv0Q7mq4cmTjXV2A84tXeEXof5GEwXQWGashnXlUmx6GqUz7iv4Uk84AKRsXwB2GC63b9WXkpeKlQ+vRgF8bbXK+S0y6D2YG6oHfmVOXgSImykRJgMpGXqJKuYLDkZ4GfuCbE1tl/T8D3MVjuQku1KnknJmcfNyo+B4ajGp8FI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=jAcnT1mp; arc=fail smtp.client-ip=52.101.57.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="jAcnT1mp"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fh10YBddFOG7C8eDXK/HlQ9/cCHmGhRCUjy4ZiKYdlRmGRTlm3MNzpDvCwKFHCKBcCMr0UPgh09lMLSh5ELGynO8kHfHTgwnxmjHniwTGmme45tZAfkoGaWQmXniFcx3iqAL5SPQWx9eGd1PpC9ROgag2wyUQDA2ASWhbUQme3Q5uNs6Q376fVVkGT+WmhgCB4MIHwCitlDiSR6QvXOpqVuKJHambjO/dysLhp2t0fVh63rELqKw1PMvhFOEjOG5cwgBJ8zy5XZ0O/49VMDOF6hqyIXRLqi5mNwBlWldyWU0VLt4vFMQ44Z49y5H+vIP6qRNh7wVhiIlK1+dv5buXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fkYP3bzm2HO5YSQ4cRQ7K8FRk4rMZNdd6Ex7qA00jWM=;
 b=iSdUbTa+/ha5depMTdgL5SMkSj205bzUZCRoe+Sv3TgPAuGNpC/SRPtYO9jBxk8GIe3WY2l3Q/hSXHj61S5kyApH2D84268FgPWnUs0058olekPNZZ0uGQKr0urjY9qMRs9zuM2HCkBuRaGcIN0RSCGbWQ/TLVczt6WEz0IRLCIf4faWXJuz6WmSBPOlPYtuFyNJovhyx8MtozAt0UhmJFP3joFlJyyzOcWCZKt5VipGB0F561XKOeFNGY/w4HKurnHwBU1rY7aEDfodIDQO7cyM0yij1//lHG/MarX8ImfZhMvrBlIWKr/qlSLMLjWIbkKTzyUhJlEbshx3Hrb1Hg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fkYP3bzm2HO5YSQ4cRQ7K8FRk4rMZNdd6Ex7qA00jWM=;
 b=jAcnT1mpzIfNVIx/QOpg6kNdQSM9dtpsYaJPDFrQsN/NnBBR5DJJpjrsmq96SFjnVOx06WtilErsUSU/z8qnx4p/3S0TPgYUMBm3t6eT6ZExwDsW3K6UYEdpT51RdFeWrDJUAZCvktyMqUXGhGAytaAOj1+hFw/uAC1bhSmXJ/1rD+mnqeDY4WsF9Humd1YXZdz61+w8u3r5six2eYBXtwVg2pSJLnvDHSla3ZUSEDnKhV/Ilvb7yqekufptjU9fAV433fwgIum6Efo80gX3hg+81vGB2R8jpKRD+tl2eEWogV32UWl03fOIL4maQXTEXe+aE2UbgVec0LWetonl8g==
Received: from BN9PR03CA0216.namprd03.prod.outlook.com (2603:10b6:408:f8::11)
 by MW4PR12MB7288.namprd12.prod.outlook.com (2603:10b6:303:223::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.22; Fri, 24 Apr
 2026 09:59:02 +0000
Received: from BN3PEPF0000B075.namprd04.prod.outlook.com
 (2603:10b6:408:f8:cafe::d9) by BN9PR03CA0216.outlook.office365.com
 (2603:10b6:408:f8::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9846.22 via Frontend Transport; Fri,
 24 Apr 2026 09:59:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B075.mail.protection.outlook.com (10.167.243.120) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9846.18 via Frontend Transport; Fri, 24 Apr 2026 09:59:01 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 02:58:42 -0700
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 24 Apr
 2026 02:58:42 -0700
Received: from kkartik-desktop.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server id 15.2.2562.20 via Frontend
 Transport; Fri, 24 Apr 2026 02:58:39 -0700
From: Kartik Rajput <kkartik@nvidia.com>
To: Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, "Guilherme G
 . Piccoli" <gpiccoli@igalia.com>, Jon Hunter <jonathanh@nvidia.com>, "Thierry
 Reding" <thierry.reding@kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-tegra@vger.kernel.org>
CC: Kartik Rajput <kkartik@nvidia.com>
Subject: [PATCH] pstore/zone: Emit registration message as a single pr_info()
Date: Fri, 24 Apr 2026 15:28:20 +0530
Message-ID: <20260424095820.1433700-1-kkartik@nvidia.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B075:EE_|MW4PR12MB7288:EE_
X-MS-Office365-Filtering-Correlation-Id: ffafa5fe-a984-4701-4272-08dea1e81cb3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700016|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info:
	nBX62fSrZq/CW6OX8w5cOACYTH/hO8UeyeDpBKPoTShI0pECLtwX7lVSD43wbjHT/ehCNPrUH2fqp3oLC/t/0l5TDgAwmHcsiDwF4TUsaCQOWSkiJIMr6w4+daAfmInjV0Pz07eNsWn28xCapCxQRKwal3xnxc3nZZpIOrHxS1Wif08AuRTS0+VETpTrn/TSLhRNZfbWHeqaDHAZzK+WaD71ccLlKKCADS7k833wnqEvCwpDMcC2kguop66JsP3HL/wk7suTaIy2EzLXK9VTel6fllKhrn3e2qMFzbOp821QNqUJJZM9tjraNUYNCJTG2ZkoMgDP1ZpLf4wT9hBW4YCPBtbkDme3rDyNXJCZCgGKEcYVeTLkn0AGE3qGWKLHfrmGIRg6LmUIrxb+7Sq+N/aOlNkn7YafRbov3pFc0gPodVAXYTQTzBynJP+M76vmSGz1MfJrC0/swbiW4R7do55c0qnGzOpzCw+lmHxhgIKshl9U+s8g923wRDEg4+Y7BgywlAQVmqH1qht/nUK9ogGdIHL1Ygw2DKs0RmNE+kmRXr3I2VsREuBDz0r2WXqFdNgirHH8LgxwqD9tHPtImfl4vd5KGfo1qnvQgO2GtneqDJdAQOladUT9ovfS4AdiXbqCSZMLwAMNC7KVrP0L4gufEbLSFPoE0y5j21umZBNHX96+p9G9fQgte4oWK8gtHb9omBm5ihBn7ZvyACcilTmmD+fwctzFM8MYFcdUAYnd0NjfIvHOMhYkWx3am0Ydj0l6P370y9b+5uYA/W+zvw==
X-Forefront-Antispam-Report:
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700016)(18002099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	Fti2HeDnH/SRoyq6pAJJLD1+hlUWqSG3Vcd99LFpvayR6fGp2AuI0wpgq4O+EOMJ7y9Q/ajmZO1CIv5aOlpbmmaZshaIxpREY6CXYvupzQxqwzqX3YIa5fw2OZqeNi7JXE5Qak0fG48llIZTG0ht8gqJnsN/+QJd1g9TzltvbOqEUognMScxR1P4jvxT2hpCaioilc+XeW2Lt5hHju7AqRGBqeLUA6rrVIg1BANFTFCq5RiMB8+qadiDecDxHtoOdyx2x7J6tpHbkZ8yZ93a3B7sG67Tr/a8X7DQ+R3qHiNagKPZXy2jetJVL5jMCynslXJ7VObKyLHnAoPg/e0a49bzL5+ORAJrC7aKVL9JA2oEufQWWCzmSplKPpaEgh65wYHxa2YxGRveK7o4CsnRtIFeztBbU7wqWStjmJBqPFISSBs/anX5GXPauO6Z4Q1c
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Apr 2026 09:59:01.7260
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ffafa5fe-a984-4701-4272-08dea1e81cb3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN3PEPF0000B075.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7288

register_pstore_zone() prints its "registered ... as backend for ..."
summary as a pr_info() followed by several pr_cont() calls.

pr_cont() is not atomic and has no log level of its own. It appends
to whichever line was most recently opened by a printk(). If a
pr_err() or pr_warn() from another CPU or an interrupt handler
preempts the pr_info() / pr_cont() sequence, it closes the
continuation between the fragments. This can cause parts of the
pstore registration message to appear at the wrong log level and be
interleaved with other messages.

Furthermore, this causes the detection of new warning and error
messages in the kernel log to be unreliable.

Format the registration line in a small local buffer using
scnprintf() and emit it with a single pr_info() call, making the
line atomic with respect to concurrent printk() callers.  No
functional change to registration.

Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
---
 fs/pstore/zone.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/fs/pstore/zone.c b/fs/pstore/zone.c
index a3b003f9a3a0..fbe0a252dd2a 100644
--- a/fs/pstore/zone.c
+++ b/fs/pstore/zone.c
@@ -1301,6 +1301,8 @@ int register_pstore_zone(struct pstore_zone_info *info)
 {
 	int err = -EINVAL;
 	struct psz_context *cxt = &pstore_zone_cxt;
+	char buf[256] = "";
+	size_t len = 0;
 
 	if (info->total_size < 4096) {
 		pr_warn("total_size must be >= 4096\n");
@@ -1383,30 +1385,28 @@ int register_pstore_zone(struct pstore_zone_info *info)
 	}
 	cxt->pstore.data = cxt;
 
-	pr_info("registered %s as backend for", info->name);
 	cxt->pstore.max_reason = info->max_reason;
 	cxt->pstore.name = info->name;
 	if (info->kmsg_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_DMESG;
-		pr_cont(" kmsg(%s",
-			kmsg_dump_reason_str(cxt->pstore.max_reason));
-		if (cxt->pstore_zone_info->panic_write)
-			pr_cont(",panic_write");
-		pr_cont(")");
+		len += scnprintf(buf + len, sizeof(buf) - len, " kmsg(%s%s)",
+			       kmsg_dump_reason_str(cxt->pstore.max_reason),
+			       cxt->pstore_zone_info->panic_write ? ",panic_write" : "");
 	}
 	if (info->pmsg_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_PMSG;
-		pr_cont(" pmsg");
+		len += scnprintf(buf + len, sizeof(buf) - len, " pmsg");
 	}
 	if (info->console_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_CONSOLE;
-		pr_cont(" console");
+		len += scnprintf(buf + len, sizeof(buf) - len, " console");
 	}
 	if (info->ftrace_size) {
 		cxt->pstore.flags |= PSTORE_FLAGS_FTRACE;
-		pr_cont(" ftrace");
+		len += scnprintf(buf + len, sizeof(buf) - len, " ftrace");
 	}
-	pr_cont("\n");
+
+	pr_info("registered %s as backend for%s\n", info->name, buf);
 
 	err = pstore_register(&cxt->pstore);
 	if (err) {
-- 
2.43.0

