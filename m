Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3896C433EF
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 11:32:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9BE9C61077
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 11:32:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229519AbhJRLeN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Oct 2021 07:34:13 -0400
Received: from mail-eopbgr1320133.outbound.protection.outlook.com ([40.107.132.133]:16544
        "EHLO APC01-PU1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231295AbhJRLeN (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Oct 2021 07:34:13 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NvXVHepxleBtm6jXRNZzNy5q86Vz6VmpqbrhztFNDNGZGd2lC1vehZvbk1gD46udz+r55RxcS/k6ybJiDhDauL3Z9XtPhn6SvgKSbMSH608tgCdOj7OXyJFWuSJA1tFfCbKr6yU7Ka5b23qEqWjn8cg6+AYPvWY6vdOy4K4G87Uoy885SD2W84yxtG4xt4TdG/7DC47bp4JlSXb+4gNPAGJg49BnWad6KLBDiGk0cx6a+x0U1U5OvfRF+0h1QGNGbVcLYULvZG1YDDtSyJO9s+WnZlIKrvBAYBMcWsDtn6yPkMayqq72sE5/yZK0KfxC0s5PiIsghERJvD23Ymmtxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HwRWRQuXGEWztIpC/0Gp12P2+H+occ4TX9qPQXjR3Ik=;
 b=Giv7RDto8D6XB5BjURPVXVtQSrLJ9KOsq3TsO6cu3FkkoqlFHhyJmHQsPApVf5tcFnXRgGK180cldAKimYYW/ZAAybrYBBy/ki6KoezBHo4HFN7K8QCSr9PXtah9/xdRG7SoXU6NiYyHAxz5YbBaxjpwSwoZSOw+MeAyW657SxeKgujdZKpYeLDZBt/AOqRM+h2NMJTA7RysmaCND9PoaB1H6UftF6Zx84rODij1weyNCIwLILKRYdyWpqqEUO17HIVh92IqGmezAX9i3iE0lMfTQGRHzdx65M/rYcaMolKmMENQ2gx6fN5oZY/HcPOFciAno4CWOjWE3T2I3vGEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HwRWRQuXGEWztIpC/0Gp12P2+H+occ4TX9qPQXjR3Ik=;
 b=m8BNqNazeFqdhHzob7TJ5cgqvATYXIwkBS0c/0fbmfvjGIy2U9jAAo+544Sx5Tyy9AZZYBFjeJuCBI5Jwq7qkHXboprvvKqJ9iGPFG2AKbIyQM+cRkViddzDsuxWQ+m1gycvWWyBS1x3RN+nQQk7uQuaoKxLy7MOUjyR9l/OdWI=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3034.apcprd06.prod.outlook.com (2603:1096:100:31::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16; Mon, 18 Oct
 2021 11:32:00 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 11:32:00 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH] firmware: tegra: switch over to memdup_user()
Date:   Mon, 18 Oct 2021 04:31:52 -0700
Message-Id: <1634556712-38938-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR02CA0141.apcprd02.prod.outlook.com
 (2603:1096:202:16::25) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (218.213.202.189) by HK2PR02CA0141.apcprd02.prod.outlook.com (2603:1096:202:16::25) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 11:31:59 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d8bb75b2-eca5-440a-d067-08d9922ae69d
X-MS-TrafficTypeDiagnostic: SL2PR06MB3034:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3034C35E3392F0A3654676BBBDBC9@SL2PR06MB3034.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fTHlIWX7H0D+zOik1LzC096YRjG2qLS1FbBYnIYVy0O94joF+YsLOOtR6UuasLcHPYjgmsgVvfktIurb20ZFANLYhb23GmTgAv/46B354N6am8PzorxY0xuZf4lmighbOYPpbEYtahblE6Ks7rkIdlyuQ3u7+H1j8pVz+LEqw1OttF2dq3ggcVvUYInQlcVDGm31cL/BQZ+93Nmq45gYxV5OO3YgLtpO1NvrElaE3ZStWHceN3WQ31SVYZ0XBPjnEPCy1JcZUWDePov5nGUHkGh2LrXZThvHsVvAtE5CtiYy5pYJWd2+a69tT7nAQG3/nGVti3RgR+yL5bdaa9h15MQv5/gDMoJ9c1cOi6nx5dWWXU4wcq7OXSrRKh/CCWuPU4Ex8h/drpwpIPwEOXkGH6gxqoE19E4atHGMYLPYpX54B6hJ9OuHSLAjK8sHHzYB4VQjlrlKfHPEIouI9vuuH0cBrYTxfJ5zggeStLRm1bDdBMcXm9wMnukSv71lJzfItqbrMdiuMBLln8dmikU22neQnl1v6LKgof0J5Qs+dV+2mugIU5M2p3X10RI7xC9HmYD8N/uS36P0FocBnMRW2F5IJcdES5eRL+yKbXBSxSb76zDt94lF54nOqQyQ5KibLdVmrQE+u+FAY1xIOpndsZ/54MjCjL6QUxpgrIkNjnhzCr0iUZZ2ofnxFcb6FEYuBGigUozhMS5lJUm7K6AL2w==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(8936002)(6486002)(52116002)(8676002)(66476007)(2906002)(6666004)(186003)(6512007)(4326008)(6506007)(26005)(66946007)(66556008)(36756003)(107886003)(316002)(83380400001)(956004)(5660300002)(110136005)(2616005)(86362001)(508600001)(38350700002)(38100700002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i7f2BdbGsN4VDaNViBgSZKmx2rj4RiwCS7BiEXdo53NtoIUEhZkPefCcroXD?=
 =?us-ascii?Q?kg9U5VsMH+7V3M6oyXZ/oNGnA9nIPCAPXA1gxeacH0/6s5kDKLD0yvrxfAdc?=
 =?us-ascii?Q?osHvGfPvaR4Zl7SXPTXAOBqXwPJ1E/ijFonuGXMcFWG7PGG3o9m3riDWDa3t?=
 =?us-ascii?Q?YK4fcvb1BEGayQqXW26K1uTDtRdzb0c73uWwcD/wD5TSKyJQyYx1V4en/cjw?=
 =?us-ascii?Q?ZfDyNqrfhKLQYbIMTSGhi8L/wx4h1J8/dr2VkhuIlNPHNwwQ1DVyKDSb4yDI?=
 =?us-ascii?Q?s4Nf+TpFRL7pOH1j7scWSu0ZO9rp+cH2n/JMqxIdKDwp1de/EciNVWyKpChd?=
 =?us-ascii?Q?BStf9GgE0Z0aPXJDdCuhPVO7CIdMeuVo9tRFXzACOEOWHgUU5/ix2QOjSdhG?=
 =?us-ascii?Q?MOWrKQIvG3M8ZYOxy7JEKDqR6ZMHryoborzwk95CLbnXkWe0u0HdLvRkYtyX?=
 =?us-ascii?Q?ss6ZwxS84SfvGaNz6XGnYimYhnyH0Synr+wnN1Lr/tsLFbFyv7+0TAY5svvU?=
 =?us-ascii?Q?z2W6oaBBC6iGSPs3m9BByDdrN4C0NcJdctkv/sc5/lrRc/XS3sY+wUZtvAax?=
 =?us-ascii?Q?+uMuCZTah4XOJcn6TkQ1bvxfRV3TVmqUyMwXTnyUB/kB58FgGFk12UbJHrgP?=
 =?us-ascii?Q?mRRfAH4m+t3VWaWeDFQfYNu4qQcSyBiHwWmyb0YNEXxkHEjINp35Iqwqa9AR?=
 =?us-ascii?Q?gniaHBQqMXfAPs8YN2jHlvLzy9w8izQaprkfqlrs8DxtUGqo6tZy9QGBgmsK?=
 =?us-ascii?Q?d9Mm2k3IgfMOUINGyp8FfGReHVX4jK5GAlHlt1FCOVDNXT2IGV2E/5qsHWX3?=
 =?us-ascii?Q?o+xzAmJGiBenqSasZNH2YInsy3QVWcUNBrdYId6JR47HaqdUIGo2uY1ZNrnP?=
 =?us-ascii?Q?bpUzF3arsDR1fIBOGuBHpdswakAgMxWYxVYI2XEgvbIwOl/O1kSn3Hd9WiBn?=
 =?us-ascii?Q?g5wl2vh7hsCJl07BxlEgs01UTqM2EytEvwS+f6IpqnHBKY3ZjVm2fnbTfQCO?=
 =?us-ascii?Q?jTloBIvFmRTshSi2LutbPwYre6SbI+oQitpCPkhylW3Tu0pUXA0542+h3vLZ?=
 =?us-ascii?Q?sSwgFxDPcJmRKEoCEYjgep5GW/Z9qL5xmZ4K8kLy5/g3SwPBNJtb3MSc979A?=
 =?us-ascii?Q?WpPyYin6RBC3boBRGknbZKbWhnTZEJQiI+SaIxdz7rX3QFAagzcvjQEuUQvA?=
 =?us-ascii?Q?7T+A99OO0tAGjR01krUMwvyIOkBIAFOTo8l6j2z93tQDddWfVfuDiSeXdcuJ?=
 =?us-ascii?Q?wqCVCx35iMvlebJw9rRwNo3f9elLnF+cf9qloiOeS0FRQyj1wwRj0plo/BNG?=
 =?us-ascii?Q?/JG8EYWQPe6j+Glaw75SogLN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8bb75b2-eca5-440a-d067-08d9922ae69d
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 11:32:00.6678
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qPto1Y4r1l8ausPDzAjp03F0v8myH3TRpz9BQwrLwmbuoaHv2QM3GSeaA4E+dorXEkJbeZwbmOFse+JCONt1ng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3034
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

This patch fixes the following Coccinelle warning:

drivers/firmware/tegra/bpmp-debugfs.c:379: WARNING opportunity for memdup_user

Use memdup_user rather than duplicating its implementation
This is a little bit restricted to reduce false positives

Signed-off-by: Qing Wang <wangqing@vivo.com>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 6d66fe0..0435709
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -376,18 +376,11 @@ static ssize_t bpmp_debug_store(struct file *file, const char __user *buf,
 	if (!filename)
 		return -ENOENT;
 
-	databuf = kmalloc(count, GFP_KERNEL);
-	if (!databuf)
-		return -ENOMEM;
-
-	if (copy_from_user(databuf, buf, count)) {
-		err = -EFAULT;
-		goto free_ret;
-	}
+	databuf = memdup_user(buf, count);
+	if (IS_ERR(databuf))
+		return PTR_ERR(databuf);
 
 	err = mrq_debug_write(bpmp, filename, databuf, count);
-
-free_ret:
 	kfree(databuf);
 
 	return err ?: count;
-- 
2.7.4

