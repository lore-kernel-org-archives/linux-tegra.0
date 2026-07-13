Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11013038.outbound.protection.outlook.com [52.101.127.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D14142643B;
	Mon, 13 Jul 2026 13:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.38
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783948799; cv=fail; b=aE9hCV0f0McYDBBBjmgSvkaTPA/87FGERyQOoXD6CB9jwT6BYAQRRFPAPhxknvMZaEMekS5MtgeBpbhcj+lczHHkg80vvaqB/VbtdQ7HuQnzKw2Qal2xqLMIHr/BffzvwFvlyN/UsschXbhXvqlJFiDTkVKK4eSQeE5iXTd53wA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783948799; c=relaxed/simple;
	bh=27opwdCCqoc+cDwPfHlt1BDNvF05UzaWRcSaidLlAvw=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 Content-Type:MIME-Version; b=piBnUXRZbP4mBtfGDw5UseeUKPc5LckwW3/ffazq+hLPT2rmhup7zUeLTqTUUewPdb6VJWOh8iizj+eOzWMSVXerE0lQLeNSglhhHwdN3367yavK7PIdbZQxoK7vsTjECxFqhuVTPYsJshDFN4qR4QK4gZo07CePnncNz5vaE9E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com; spf=pass smtp.mailfrom=vivo.com; dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b=gy1IM8+i; arc=fail smtp.client-ip=52.101.127.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=vivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vivo.com header.i=@vivo.com header.b="gy1IM8+i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AMLDzbtluNQoFJo4zNSq33SSqPaFrikDpUUmsw6nHd05rnpyk5kNYYxVASjV0ibDje+lUVnxtUsTMV4O6pjRzjaCJprxG4iphlxI4y+WdX28fpzbm0ama6xD8jGS5sjuYhztO+4/g6EUux8OLNbXb55Y3l9derBXvIaljtWXtSRGCFPZjC9wKF8bDGJctvTzDCwqEnkHL7c8UYNuY1RmmnJabQ6Z4YL2HvQUsPZvKwjao3IhgoROGww9jpGjQoLA7hHjtMoIJ/Ua8FydsWKLXIUDsk1LNGogDFjoa+j75F1ttVaEdrtCorWiK7P3krAVjgHd5PxNBArPE2YjzRXsNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dCK1zgvZ+o+3osNUuLCPcVzePQxqKV4fz/hRBBVLZKY=;
 b=dbqEOFrGaKcKNvb/l3K+HSO6mRSAcbry2/ojEjVWGZUfs/RldEG6TxvlcXWOOnvM9Xx2U/jJmsQENgyFhYlpj51LOMcoyzxV+D75UdkoZ+ZSzGnQzKqAzA+EHCNQ6LQBFOANevSLCTEVgMHbZFW2sp/2/3aLooKKJwXg+FFXxGZqsGHxb+XFQV98cY1HCTFOAxjdTcmhv94pM0o8BhNR4Y1B37NwuPsKCxJ+OS7p1A3LmrhrQcpgW7+0OqPXa/LhuZsDITqknhy+shsfwWWvP1UconNl+6tS2PFB4/gBjHJAQx9ZLvvsMbXq9mRG+vK9x3ya9JKxehEnehg56es0Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dCK1zgvZ+o+3osNUuLCPcVzePQxqKV4fz/hRBBVLZKY=;
 b=gy1IM8+iIdVdE/nTMyqu6B2oBRney5RLYNVRgqJC2wwhmsjG4AdAinkjFnKWv9JYiJycc95kT+Bj+DkOy9zLgczVyrthRJ1Cfrn9DhpsoHuRo6khVNXBOo8kgWoUV5U8fPCe8EzCC4q0oHipdNC9v1jPtP46uijizAmvdF4hiMJiNANEyWOCKx3bTAqTCN2apUnIcECq3sR0G10JIsVAg992xDdp0IMHDIY+9lPF/kj3PktBvebTIAncHlj1OvHyl0C1K/wPcZ9kqgs4MwUW3ObBaOtt0dWgkkcfhgic4+qGi0t4D5TktiPvVvYKjb2kwSZrOAIJlzcfOraar4qnKg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com (2603:1096:101:c8::12)
 by TYNPR06MB9248.apcprd06.prod.outlook.com (2603:1096:405:3d5::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.22; Mon, 13 Jul
 2026 13:19:56 +0000
Received: from SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b]) by SEZPR06MB5832.apcprd06.prod.outlook.com
 ([fe80::f98:5e32:4ccb:d07b%6]) with mapi id 15.21.0202.014; Mon, 13 Jul 2026
 13:19:56 +0000
From: Pan Chuang <panchuang@vivo.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Pan Chuang <panchuang@vivo.com>,
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] firmware: tegra: Remove redundant dev_err()
Date: Mon, 13 Jul 2026 21:19:40 +0800
Message-Id: <20260713131940.355559-2-panchuang@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260713131940.355559-1-panchuang@vivo.com>
References: <20260713131940.355559-1-panchuang@vivo.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TP0P295CA0019.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:5::13) To SEZPR06MB5832.apcprd06.prod.outlook.com
 (2603:1096:101:c8::12)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5832:EE_|TYNPR06MB9248:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d146f7-4eec-453b-3097-08dee0e16e7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|376014|23010399003|1800799024|38350700014|11063799006|56012099006|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	sz0kiusxe5S1UjGlVFIuIdzqTH3R4G1kgmVeiYxsxe12e1Iz9HpiEwKs/Z72NzzDih/Z78NNU8kF4xIvhfSt20ttKrMeddS0Plav8ccmj8PouHOuspOGBrmGuFFkFdoAakkBHdt+DeZRQBHbHxnVuhfD66cQJuUAsE3xK/QpLavngz/lDir3miOwyMqj0UHqVykGPk3QIJoqyDwbDwSaKiJoPkF7/HB7Rt+6EJ174aW8ZsgG2A2pQgOZKhiluxxVm0EFYdcWVhUL9Px86f1gQ2x9nxJUjRFdLoybg75Yd9c3xE3A7mRKjHd6NVICn2BXfP7BPIEtdTtiO+Pn7tAQhMgKy5IgJ7dfbvm7QP8CfIMpvCTLKQG0JmSwKQgzUcd8e6aVwMdJappqb/1Q8Qn2LkwW0rrplCop5SL5sf3RfkWljsgrqqjggixj9rQTwBFpXxLPwlOBpQ99VetHAFRh1uzknIX/un0b0Z8lG5F7gerbQGKnxLIcHyzKkxPSraq6RpizjkWrIYWImwuf4a1doFiRKDWLzTCVdcfbCDpC6b6cZrDe5e41o3XKmZhYl5GEhKzkJeMt3vWBEvQh4wXCI+YB2uHQn17uJ2JvB2sV8ET00uz4hrzDGF0tyOefGxQbpg1fwHSrmk1Dh5oFtIab5XU8Z4VTrYpgKQF36MGGNm615KW9tgN20mrOtv2PZl14p712pefWPYZvTiwQaDAjOVENwVGTxujLWjDBEch1uJ4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SEZPR06MB5832.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(376014)(23010399003)(1800799024)(38350700014)(11063799006)(56012099006)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?DuSf6NvwIkU/68IR7LEEsLaXaN9IbtJgg9dnQRK5U90U56m4NmQAWdf0aQ7G?=
 =?us-ascii?Q?4WPNz63ScJxknO45WcbdliUz6ecvEaBTl2umosXwc5BX4QZh3TNzNvFEB68s?=
 =?us-ascii?Q?PAXsj3eHTzuWx9VN01a29hdfUQLOzDtz9b8N9iAJYA7g6riyZCFWR14g5wHF?=
 =?us-ascii?Q?kMGYtvVxYQ4GWOViy1vmDClpnXEmKfgeW8RuF+4EZ9iS05/F4cOxuz7I/lMy?=
 =?us-ascii?Q?JloMra7bq36vY4NARU6KgQfEkwayLndhGgM7BMXAPIfw8aH7inxfLnPG3J7G?=
 =?us-ascii?Q?JQ/AuXGdnIr2KOq5/VPPSEefhBvvPlVai3QmixCNZN6ptzL5tAohBzyeIXUs?=
 =?us-ascii?Q?PTkJ/tzl6vqY79kTIrThsVAk4V28tqVktQyrxgY348ZATrPsMnN0ujvIEq/B?=
 =?us-ascii?Q?V9EWm+U/GZswO9gsGWTv7Fn8FeXdrWvfTkMVzRwbpmp6jelUt2Z3E1VcTeUa?=
 =?us-ascii?Q?gErdC46/EzOtW4LK2NhLNlBCj6Zmwq52MxYu2iIIUXcrlAIOaSfo0cDl/1lI?=
 =?us-ascii?Q?r37B2RE/444/QdYDyR7VR+Knd9NKbwPo/NJuXv/AP7bXDdBOF6fRnHEfY8Mx?=
 =?us-ascii?Q?PEv7JMNF+QYJilrE9g4TL5tbDi2sNavC20glJdUwWQ5R8AHWnBkaYjNmMifk?=
 =?us-ascii?Q?dHW4FC/w3JsvRsdpEchLQ8MD+Enh8OcB7vydThuPpeIcaUQiJrN2xY5sirS0?=
 =?us-ascii?Q?9bCk8m9C8ihXmA5xR+yq8F9zS5O1sQBsUWa8JvH/0Ite49ECVbVhbkr0RoUh?=
 =?us-ascii?Q?Sh1M8snPAPl5DS1Txt6YV4Q1OTp4BmVmn0dNr06V79nvua3460z3ijh8Oc2p?=
 =?us-ascii?Q?jt3Mj0RNnl6vDGTdXijSu5EuOTFmE4wd0ggMIHZMPCGtyRpIAX7VaLN9Z8qV?=
 =?us-ascii?Q?JXcPj4iAFDxQTp/Cot9dhtyzQZ1kH01EGFnd6fEPtJukt9DNNrNvcaxyeIDe?=
 =?us-ascii?Q?PCMK0nB0kbE4kJ7kqyR9hdGd10HSAtETZvd69LkjBUiQ9IOwhmYTJ529ddmh?=
 =?us-ascii?Q?JZuEMQ+J+wu2ZYAnrdAALvgBbwvf2bpwIu0v0SqTuWwq7zq9EPHtUMKkj6sL?=
 =?us-ascii?Q?3fLogGbahngkrW6yKSx33kUMtXsx51rJItxlDy4y02P7vJLKNt18MXs2/5mz?=
 =?us-ascii?Q?kMX/FM8jA/acEOtEAsA9wQQ7Bh9tg2Ip03QJyPVIHDe/xViES01mo4PVvLW0?=
 =?us-ascii?Q?ErYKmS8jPXApPQtlRqkFBHj9N9Otxx88ycx9g6T5DC46OSAkNnkoY6D+4sXA?=
 =?us-ascii?Q?1zk5VSfX78AbUOVWprSCA2l7czY4LvAzpN5OEtjno6vbYhZdLWvo09sKE0Y1?=
 =?us-ascii?Q?mvPbenLo2EWLtq+eG9oii/6xYG19sQ9PBGqksLOFbSsE0euJIdQ//0l5HITC?=
 =?us-ascii?Q?qqipfnbnJJ/P3edq3RGi49ssYbQbFzUeD2+Tc3Y+J24Qvb1I2yUUHx/8BeUw?=
 =?us-ascii?Q?jo8eVHLBKUbw4lWic2KhtPszaScAiipVtOkancmaJ8wl716NwpIZ+3wcl+Jm?=
 =?us-ascii?Q?Az2d17raw613S0KSy+sxe3UeZsENOtiP4zy9KHyAYK9UTNMefGHGLeSoG/FY?=
 =?us-ascii?Q?k6asboWcRS2NrUMYPFMk3/wAudv7ayV5XG0Z18EOVpJ3Si1oqGSpKH2x5vQ1?=
 =?us-ascii?Q?240VAYZJxmaolV06olh1qbCwc6xV/UHF8iX4sJ9D+eJEK1jzQYL3m8sRXUsw?=
 =?us-ascii?Q?hbkRWK4zw2mC6RkfQmjU/Oq9jGE3D0T3j/Jl0pQfwyPvg14+d31gRbjUwMcZ?=
 =?us-ascii?Q?nV6ET/QsHg=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d146f7-4eec-453b-3097-08dee0e16e7c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5832.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jul 2026 13:19:56.0874
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mzEmBqMdCjR2PDNKPQIAWQ6AEwqx7bI42uRP+gch9bRXQoeMadJKsAmHwz4AFCKF0SlzgugLlC+0BpLHqVE9IQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYNPR06MB9248

Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
devm_request_*_irq()"), devm_request_irq() automatically logs
detailed error messages on failure. Remove the now-redundant
driver-specific dev_err() calls.

Signed-off-by: Pan Chuang <panchuang@vivo.com>
---
 drivers/firmware/tegra/bpmp-tegra210.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-tegra210.c b/drivers/firmware/tegra/bpmp-tegra210.c
index 6295f5640c15..643068a8b3b8 100644
--- a/drivers/firmware/tegra/bpmp-tegra210.c
+++ b/drivers/firmware/tegra/bpmp-tegra210.c
@@ -215,10 +215,8 @@ static int tegra210_bpmp_init(struct tegra_bpmp *bpmp)
 
 	err = devm_request_irq(&pdev->dev, err, rx_irq,
 			       IRQF_NO_SUSPEND, dev_name(&pdev->dev), bpmp);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to request IRQ: %d\n", err);
+	if (err < 0)
 		return err;
-	}
 
 	return 0;
 }
-- 
2.34.1

