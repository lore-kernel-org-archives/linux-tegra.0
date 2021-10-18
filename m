Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FE7AC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 08:00:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 01B1B60F12
	for <linux-tegra@archiver.kernel.org>; Mon, 18 Oct 2021 07:59:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230469AbhJRICJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 18 Oct 2021 04:02:09 -0400
Received: from mail-eopbgr1310128.outbound.protection.outlook.com ([40.107.131.128]:35640
        "EHLO APC01-SG2-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229820AbhJRICJ (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 18 Oct 2021 04:02:09 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jkwkrvp64lx3j12AHDqvbRpGWUonGv657T6MdZ0aANJ8CoitJR78mNabihMwPZthapiev9D5yzoyDneFEkQyJdvghnIA/AdSpNLJyYUOdvv613kRckvuMBTyiDcPopXaPGvU4r3TOb0QONu710rv1sA1I8q5YOXivg/cxriHr/TKVQLM2VeEf5LtwKIf3ZwGjPyJX4YgcUrwPr4y36ScX2hg9eHpJgkFv0pi0jP9ZOCGAUBWywD0wFf3lG8dfFFQuJO2cTgnIF0fmn3qmr3uC7F8sP+qzEWBAc9nL+NQl6I6Ue+PRI8IrULmOwOyqOeaFk+gQAVMjmL/NRBkshAUxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MnP54lWjMBAghSEObwyj7hMFN9gEE7hFBj7dXDJtVRk=;
 b=X9I1R7DQC1k9cKp2Q0Vk6HHS/q4XAnVUMgmgizRK8aztewR3jIRCA1Q3zMVlDboNcLOLDoAqdvlPx15De58tVwZLiWojzsh1qGZrdV/a9VumPSfjGgv0eVdWwmBgdS1XhM5Kp5xZFT6RgSVrjI90Qyu9Y/jISxc2SvpShAe4qiwBeNtGXrqSOiJ4eLhsMsSUHTVIcFnF54cdVL2DOBsWDhFAmRveDXIGeq0Z83Q2BvU+YdZtsNs7040FIutS8S5c/t0JJi1tQRLLntNoiZLW/7FWi/ZUhcGIVxIfaJBCQJxuhseJjDjmDB9+K2AwgVor26KeGIk0KGxeuO7FQ2WKVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com;
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MnP54lWjMBAghSEObwyj7hMFN9gEE7hFBj7dXDJtVRk=;
 b=imus8emoy7afjDwgdKVOf1o8OQrBW9COmU2Ze0FAejk6wfnxqGx+OgIHokyPCO2riSTpPGQIToSmFP7Xqdg90NjgsQFjy1w2nvHl8Nu3imnzYiDT/xPLv3vFTaJhBbQ+LaPyUNcZB/cCULEvZFbHozKmOL7xxvhMM4kFJpSy3PU=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com (2603:1096:100:37::17)
 by SL2PR06MB3387.apcprd06.prod.outlook.com (2603:1096:100:3d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.14; Mon, 18 Oct
 2021 07:59:56 +0000
Received: from SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414]) by SL2PR06MB3082.apcprd06.prod.outlook.com
 ([fe80::4c9b:b71f:fb67:6414%6]) with mapi id 15.20.4608.018; Mon, 18 Oct 2021
 07:59:56 +0000
From:   Qing Wang <wangqing@vivo.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Qing Wang <wangqing@vivo.com>
Subject: [PATCH] firmware: tegra: switch over to memdup_user()
Date:   Mon, 18 Oct 2021 00:59:40 -0700
Message-Id: <1634543982-36727-1-git-send-email-wangqing@vivo.com>
X-Mailer: git-send-email 2.7.4
Content-Type: text/plain
X-ClientProxiedBy: HK2PR0401CA0006.apcprd04.prod.outlook.com
 (2603:1096:202:2::16) To SL2PR06MB3082.apcprd06.prod.outlook.com
 (2603:1096:100:37::17)
MIME-Version: 1.0
Received: from ubuntu.localdomain (103.220.76.181) by HK2PR0401CA0006.apcprd04.prod.outlook.com (2603:1096:202:2::16) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id 15.20.4608.15 via Frontend Transport; Mon, 18 Oct 2021 07:59:55 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 595c9da1-c02e-4663-c5f3-08d9920d4615
X-MS-TrafficTypeDiagnostic: SL2PR06MB3387:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SL2PR06MB3387B7AE50FD15DFC4F201E7BDBC9@SL2PR06MB3387.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2657;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bKmCi2PfL38S7aPCcOmSeqjo+eIrt7nvGlYAFffyYk0zqZ2FTi/dW2e2FUf9ZP32PI1xc4rBelKV1mdi0I2a0Y891ytiuOvmcx1kwSE9rynRchcVQzQ9VQuvCthPKkcvXlOu4E3AD0GejGYXPRJm9U8z7UtvVShb2K8QkulhJbsuOzEfUaQYY2Fj5QsoC+hdylXZqdnJfVKNLQE7QXSzxjpiTlIlf8IIqs0wV7hjvfUIoCmb8z9b7bhJGrMnPKLvweRPqe4aoURBb9jVBclUaI7MOFKec0RsxLmCQiAUD+ku3H4LUPHA989PjHAQmtq8dKLYaAYntjV0r2GdUOGtkbNnYY5SxpsxAinFlE8MNJXbKQhfgg+6MtLPIcjmu0OxnJ7PLZIWRzsTW0JDTXXGRCKhcfaEF4eAS5hi6ZaPXX9qXhgIqYMxfVZROgw1bxDUjaMQsrWcEA1EX6v0+k8E9D6GD2MhLF9WYBJs1dTrU40NwD1t+yR52GMs/turi6s6I1dbmbyg1OjzdSZLCtdPCD5gfjpDSih4/R9KgMGd9R/MjEwXRHdCAyLAatoabXv69bTKiy/ZfeezaUvjOM00jPxUhI5CzOebFKkWh42IXieb7QnWJ6G2v25bongtwU13SJSi9TH2n1yI03QRAemH76+bx2ebyh+CdEUyNBvyryydbyE/F3f864/8YfSZqGH++yGnGlC3CYsTwqOLVHatdQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SL2PR06MB3082.apcprd06.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(508600001)(6512007)(6506007)(26005)(6486002)(86362001)(8936002)(66556008)(66476007)(66946007)(107886003)(2616005)(956004)(6666004)(316002)(5660300002)(110136005)(2906002)(36756003)(83380400001)(52116002)(38100700002)(4326008)(38350700002)(8676002)(186003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?k+7MDV7zG4s30TDAG/EjCZ3+XupCTUMyM4xs8ra7hpVbfgoVtD63nOXWToeC?=
 =?us-ascii?Q?5wWlw2lt9uo1OAmQrygUe7HuzBIawdcPwvx5dhgDV1N1S0O5LoFas4ER3vGf?=
 =?us-ascii?Q?GONQBPgMRBQsoEMbcdWk5+d8oXVBPO6gDZMtAYyryzF7sDsH9U6n/qzvkinZ?=
 =?us-ascii?Q?wuGQlCV49e4wM8v0otNirB9tJg9VQ+WspfqBofKDB1mbVrdQpLKaKu8wDDvf?=
 =?us-ascii?Q?Llev90a2xp1A4qUxqN+dQ4DCxw0WK8LtL5SszBj20eZCjCfDnxlMq7kSgN30?=
 =?us-ascii?Q?nUqHDwJ3vnVyDmtpkAUcraHvISZJ88czkLL42yx7uGREa/W2qGn5yzqMHXZZ?=
 =?us-ascii?Q?IRmQ/nEpBkjdKTTIQCN7oW2AVQ8s8Y+aAUhTaLQ43EOc+4dZM6JtOEx+HgDs?=
 =?us-ascii?Q?nvuRZZLCw6DwHiUuUsOOwysqGAAEUvoU0g54yOKOoV391iiKPkC5NhRBPtsJ?=
 =?us-ascii?Q?OORmtg3tWB9732uFW7bfy8F8Fjl5NhsXSH08KTOToz6Btr7IztBY5MrxMSlL?=
 =?us-ascii?Q?u7fRw6ZULjLs093+O/XXIYU9TBFS2V4NQfJbEbsQ42m6aZooivKr9jAmWQ5E?=
 =?us-ascii?Q?wXqyDDtupdLU8WIvPzLOXBls3t8qDdbtThu2PYJGkmccqTzDHHMChQRi3PU7?=
 =?us-ascii?Q?UkB51DdbTQnSkVG8ROQ3uIhMcONZtETsr14FW2VdmE8Q45Zpyo4bUDbSENyR?=
 =?us-ascii?Q?DFqDB3Hn2VnRtkFfLoN64KhgoDoZnmDxr+Iq+Umx/73HijAvBOC2nl/+CNr6?=
 =?us-ascii?Q?sA2atnox0lAxKuezDQnJYAw2n1ovKTwK2SRkbtETsAQTfwaKmI2H8h/KsOqe?=
 =?us-ascii?Q?FTK71/oP+MsHaXsyPskJMXPfENEoLULYkZ1XIoGZ7jRggR5aJLmko1ehT1rO?=
 =?us-ascii?Q?oqC4I0/ifNRqpLvWGMqXk1dTPvUygH6kpkkUPZ3TlRB9gSJW60awso8na8GK?=
 =?us-ascii?Q?i6FWJ4+8AQ+Cnq/X3p5KxeuN2yv6L8KIsb/4QNL52vptEJsPIBNw0N1RiySl?=
 =?us-ascii?Q?cA6l8zB0LvBQoGwTHh8fbpMl2y6ThM5WcopHFVp4iES5HCl3xG0HCrLKEKJJ?=
 =?us-ascii?Q?IyY7HAD1wg8TPLjc4IO4MsVYCdvN4hiHy2R2T2MiOweWyd2f8TyBa9alnQoA?=
 =?us-ascii?Q?+8zj5uvDBd95xBR2I4pYxXufe+FcE/KiavyBreQlK1d2qRCkOLfTG41pTUG9?=
 =?us-ascii?Q?8Vv6M9gb6xOTO/3UsijSFXKpP7VALDwVPxmblm54Dw+LaZKOJhJQ1l1RwhBp?=
 =?us-ascii?Q?wVmunLFRU5p1qifz6XpYp4RbgL6V5ce0GxPlKgzmwTfhNuyo0f/va7SRNke8?=
 =?us-ascii?Q?2UE2KTeVgjb33IzsnbuwIqR6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 595c9da1-c02e-4663-c5f3-08d9920d4615
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3082.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Oct 2021 07:59:55.9736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bwJaCXa/P3I7SWgvQkq8jqFZz+hhbhDFNE9Csx+ZPo56k0EBF2p4YANge3Loxw3HbyjcGwSFkM7ij9+rUZX3Jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SL2PR06MB3387
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
+		return ERR_PTR(PTR_ERR(databuf));
 
 	err = mrq_debug_write(bpmp, filename, databuf, count);
-
-free_ret:
 	kfree(databuf);
 
 	return err ?: count;
-- 
2.7.4

