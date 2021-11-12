Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DFD90C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 11:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AE14E604AC
	for <linux-tegra@archiver.kernel.org>; Fri, 12 Nov 2021 11:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234144AbhKLLaN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 12 Nov 2021 06:30:13 -0500
Received: from mail-dm6nam08on2075.outbound.protection.outlook.com ([40.107.102.75]:18432
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233883AbhKLLaM (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 12 Nov 2021 06:30:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eIG8O9pND/l+Zydho84Ge++6aADhiVxR7QLKHsy0ZlvxaO2GjtV1xNbDdiwk7jJii4R0EYOsLe1eUuux37tRQNP9BmJBwQpfgZuVKKjIoiX2kUKukcytzApz1vz2yAJYh+M+FrXyzOsMDU5AIQzRjem4yuiKqsIxDXsE0HasGVKj8OPXnCU1GOynqCPy6ID7D68oHt4sgJRLjZjWIBSWLRm6M2QWSIElce/S6DH+ceZSeJXUAeYA+LyZvXkO9DuzKPsm8MIvkTA+il84CWFbNQJ1t5pb19X7LfpCidDZB0sQTj+mF+a++QUcyKM01NvfsTXtrpUA3NzB3vzOHdoB7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7StyRgFxb0S2BWfe3n4zRAzjeWcQ8Fjbc18iAhY0wRg=;
 b=nKf3a749pFkYSgjurt9JbYP2zQ7eyQFZHWk0hRL2XQnuRZ4kZG8WcCFvKPDGjgAawOAdGIc4tOei51XvgHwFKtcGcyyG0ZweSV+sG1GPMJbfH3osI3WlmdzB0sNURt9MI8gwwCSnk8zZ/y/1VtcAQI9CYu4sLehkXDwjwwvcKIhd2CkaiIW1svnf+gSnWoniS1yJipzXoEICbGZwV/+DthkpjzVV0uiavq5fayYq0/AM11YewWm1Z+RutTGaRIEQlJCks3hQJg59mc6f4lvmr2mhFlrN+R5x8nCBiZEZW2MIo5ZLm99EnsJBFy6IPFM5QUekUQpNyNbbDgrZJyNcrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.35) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7StyRgFxb0S2BWfe3n4zRAzjeWcQ8Fjbc18iAhY0wRg=;
 b=ugigoE7Q3n6MK8jZHXuEcGqCZdGtg5E54T9P+V2LSV3ZB6+Zo0Qeu5m/wE9otWBqQ54juhElyRcvban4Vrq6r2M3KAxLW/l4Leb2H2hkNOi24/IRdRQ577l/Yawi22qCkx4NW8YetJKlclbgguVvXMefNTOLFHgT2q3bp14sxEAijdvpqxxLnCieWl1z8oG0yKa/9YJlopFfLmsyupDeHo0/xv7MgebQ+NjLtQXzvS81XiWxZ7R+BlkqZU9OQZcYAICveq6L4dWwI2FjNQJt19F5P7w0ZQM/SSru7Z7bmJLLEHzlquvYPr0rdYgRQnD9zHUhd8R5AIfrBpG2KNhOwg==
Received: from DM5PR13CA0033.namprd13.prod.outlook.com (2603:10b6:3:7b::19) by
 SN1PR12MB2479.namprd12.prod.outlook.com (2603:10b6:802:29::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4669.10; Fri, 12 Nov 2021 11:27:19 +0000
Received: from DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
 (2603:10b6:3:7b:cafe::2e) by DM5PR13CA0033.outlook.office365.com
 (2603:10b6:3:7b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.14 via Frontend
 Transport; Fri, 12 Nov 2021 11:27:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.35)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.35 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.35; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.35) by
 DM6NAM11FT025.mail.protection.outlook.com (10.13.172.197) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4690.19 via Frontend Transport; Fri, 12 Nov 2021 11:27:19 +0000
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Fri, 12 Nov
 2021 11:27:18 +0000
Received: from moonraker.nvidia.com (172.20.187.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1497.18 via Frontend
 Transport; Fri, 12 Nov 2021 11:27:16 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Philipp Zabel <p.zabel@pengutronix.de>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     Mikko Perttunen <mperttunen@nvidia.com>,
        <linux-tegra@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] reset: tegra-bpmp: Revert Handle errors in BPMP response
Date:   Fri, 12 Nov 2021 11:27:12 +0000
Message-ID: <20211112112712.21587-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3efc7103-1cb0-4cdd-f565-08d9a5cf636d
X-MS-TrafficTypeDiagnostic: SN1PR12MB2479:
X-Microsoft-Antispam-PRVS: <SN1PR12MB24792883BB4D025F0CF30E67D9959@SN1PR12MB2479.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:773;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ij60eO6wRl+8RqHJ6YAYf0Jx0MmuxpMjJKM5PWVWHa69SnwLhzM+SYQRKQzSoR8Jd2JCwHtbc3qEQfoT2jcNdZoxcooaixQIme/w+CyXbM8KjvY24O/ot9xH2KNxy4QsdawsrCt3xvQEsSX/kmXeCdbUVPzzqi53AclOxJFRMuvQTMD5bDuFZeb6hxPjItJvBsfF/D5+34E66LM9EZwOB7S41GzaJxWCEfGCYoNqyFxFgHCV5zfD/mk4YWML7K2zOr4iUNjnsSjEau9gmmLP2JvdC1yB3qYJzQ+K+NaoC+UWC3GM5Qb65Q1qYkx5MkfDyh8YKz3TGRd1tqcOEYPRSwYpTmYGVeOm82L0C6iNLOTBoaQzkPgJZUdQSagsBY2TNoMLOB5Ter4mPWz8MPKSG2rYMsBoENvPNRwSE4iG0107NCMybmWo05vouH04XKTIpZgfIhyBHKc+JoGyzxIDtHV4LGd3P0HvLbT6IKIaMD4a3kBeht4djRvI2cyJoKO83gqe7HOXp6PnewSrUH06Nlnk1lDVUHuTjVzBKKDl/dMazRi5H5KnBL/OFkZqv5pi2LPlI8mRm23ixYshzPWmj5LtOd0AVGqr/7BjzRbGPKLLLE14sIJuwyUlan98e58ZwUXeoM7JwqdhGjnPJm3dMOpOnwLSFJ7JcZzjzP/9w2nXlAAQobN3T0fYdr6/eHVIdqIkmnj5pHxL7iNPfhSNBQ==
X-Forefront-Antispam-Report: CIP:216.228.112.35;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid02.nvidia.com;CAT:NONE;SFS:(4636009)(36840700001)(46966006)(1076003)(356005)(7636003)(110136005)(107886003)(54906003)(508600001)(8676002)(426003)(186003)(82310400003)(70586007)(36756003)(5660300002)(336012)(4326008)(70206006)(47076005)(36860700001)(26005)(7696005)(36906005)(2616005)(86362001)(2906002)(316002)(8936002)(83380400001)(6666004);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2021 11:27:19.3600
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3efc7103-1cb0-4cdd-f565-08d9a5cf636d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.35];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT025.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2479
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP
response") fixed an issue in the Tegra BPMP error handling but has
exposed an issue in the Tegra194 HDA driver and now resetting the
Tegra194 HDA controller is failing. For now revert the commit
c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
while a fix for the Tegra HDA driver is created.

Fixes: c045ceb5a145 ("reset: tegra-bpmp: Handle errors in BPMP response")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/reset/tegra/reset-bpmp.c | 9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

diff --git a/drivers/reset/tegra/reset-bpmp.c b/drivers/reset/tegra/reset-bpmp.c
index 4c5bba52b105..24d3395964cc 100644
--- a/drivers/reset/tegra/reset-bpmp.c
+++ b/drivers/reset/tegra/reset-bpmp.c
@@ -20,7 +20,6 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
 	struct tegra_bpmp *bpmp = to_tegra_bpmp(rstc);
 	struct mrq_reset_request request;
 	struct tegra_bpmp_message msg;
-	int err;
 
 	memset(&request, 0, sizeof(request));
 	request.cmd = command;
@@ -31,13 +30,7 @@ static int tegra_bpmp_reset_common(struct reset_controller_dev *rstc,
 	msg.tx.data = &request;
 	msg.tx.size = sizeof(request);
 
-	err = tegra_bpmp_transfer(bpmp, &msg);
-	if (err)
-		return err;
-	if (msg.rx.ret)
-		return -EINVAL;
-
-	return 0;
+	return tegra_bpmp_transfer(bpmp, &msg);
 }
 
 static int tegra_bpmp_reset_module(struct reset_controller_dev *rstc,
-- 
2.25.1

