Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1F62C433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:55:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BE5C861261
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 18:55:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240469AbhERS43 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 May 2021 14:56:29 -0400
Received: from mail-dm6nam08on2083.outbound.protection.outlook.com ([40.107.102.83]:8993
        "EHLO NAM04-DM6-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S237510AbhERS42 (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 14:56:28 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aJncXj1CEyf3pASzZth5TJ4w8Oy1pw9ggCACsKSmotQTEMmnpJn4A/fVWKEXE9GaVFU1MtQm5hgkoV5wvpFuQSkrcOihA2ZM1o5BmzWG5pT0zPSxncycelO5jjly3litkAn95xVrIUHqXnjYPFg7Yb97TdvXlUpEsr1hDQ58kohBObhGGCo/GSD1p6paaZaLbdItEFDcwg+xZaKaWOc3HLUcoWxT1czOp5Je3YzWafQUjZmqjBS9V1hbRuZOWeuNXkmq7L7HRTNFfyBvBQ/MVcYJhRNkBQU32U26Szwjc29rtnAILDEzPpvS8JFDQfm6UGM67nRpBWGQtV8vOrac0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFPfzftfgom4LKiDxQpPgFr8fNpeT49MFz683MiwM/c=;
 b=F4BeG3X+G4ybFnePbx88+UTtxDJs5Vs2IP8q92lGubZt51zB9yjpZi0JLTjU0oCAPaF7KbBNvy9vEOhiEifl8Mnar9wGMzMh3eszLGhZSYRdysXzCkomN0Gj5W8BdCzDmZYpyK/OOwMPNBE6OfFw8GEW8t/T8AtF8WsjqIfDqz2yLqmUqziDbDkjn/9qg3hYxih5FR3OzlYYeRBBzyk6Tbb9X6bg3VLxUSEoW6sT/ZEiPvsNzafTmUOE4913+xwWpqwmgYNsjMxccls5mmLLBcleO3WU71MZQjSg/J/QIIiEiIGuxlOVzegarxdZM9zKPfix+dhEF7L9/a62RSonwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.32) smtp.rcpttodomain=lists.infradead.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=none sp=none pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NFPfzftfgom4LKiDxQpPgFr8fNpeT49MFz683MiwM/c=;
 b=nK005fhelR01WQGDZSKuCzi71iTcBxx3td7c9EIRH7RnXxHvD2/G29sYnXw5dLM+lu9yPG8aSmpQFjs7TD7UEneeOJJM0ddZ/s/o3oXbQzyWZkzq7vF4nuhFuJOsV159/uRsenLi+AThYxx/YMJAzwl71/v9bG9Y7fddqAYXO6axwQupVoeZt6rB9/2IbeOZ6eC0XNuGPyhvxu60Lo/ayVyOZPvP1LeAgN9gX62jnfgPB1pMql47hfp3EKN9Q2/N9aPgwe8i6INPUpyOnBy8LkaGzKHgRhcSD8s3hBPhEymAgjqnXtSRBZzVS+liLhBxoiGkeUrmTHKAMZ+xZbQAyQ==
Received: from DM6PR03CA0077.namprd03.prod.outlook.com (2603:10b6:5:333::10)
 by CH2PR12MB4906.namprd12.prod.outlook.com (2603:10b6:610:6a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.31; Tue, 18 May
 2021 18:55:09 +0000
Received: from DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::d5) by DM6PR03CA0077.outlook.office365.com
 (2603:10b6:5:333::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4129.25 via Frontend
 Transport; Tue, 18 May 2021 18:55:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.32)
 smtp.mailfrom=nvidia.com; lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=pass action=none
 header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.32 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.32; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.32) by
 DM6NAM11FT011.mail.protection.outlook.com (10.13.172.108) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4129.25 via Frontend Transport; Tue, 18 May 2021 18:55:08 +0000
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 18 May
 2021 11:55:08 -0700
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 18 May 2021 11:55:06 -0700
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Michael Walle <michael@walle.cc>
CC:     <linux-mtd@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] mtd: core: Fix freeing of otp_info buffer
Date:   Tue, 18 May 2021 19:55:03 +0100
Message-ID: <20210518185503.162787-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210424110608.15748-6-michael@walle.cc>
References: <20210424110608.15748-6-michael@walle.cc>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6332e9ca-b442-493c-b83f-08d91a2e7563
X-MS-TrafficTypeDiagnostic: CH2PR12MB4906:
X-Microsoft-Antispam-PRVS: <CH2PR12MB49063C86F7044C6DE93634B4D92C9@CH2PR12MB4906.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ng/XUosqEKEc2dbnSQ1blk0L11ttwj7mogkaafONt9Fx1+lmpZh4JAzH2gXmtnyMKoO45Ru/P+I41zhuqxYF5JWK9k57tA7VeuzkO/hkqh2Ndd8UfDCVANijdwEihWnudEU2qOKtnZDD0d7kpNT4AYkLa12qLAuRBPPqbJTuRHPxSTs8Z0FHz8FGpTKJz/UJkQ5SA2EnY15nWPpV0Dx3UBn51ePoIprd/FhQ5Iwn3JOQWdpUs8esHnp29u4Xb2I1FALp5ewix3k5AiTDoC7H4IONcnMtCj8qBBn219qoh8Kfby2HHvvUlvf/wJHaEA6NqSHRh2S8WmtnPDaOaotSL0BLfqG1XkPQpSsu+qBFhisOAN8u7QedeDRBmydHC4KAMHWlu917xdNQ+iuot073GNMBviDXWG7olkWCe+kaz9hAS7nfbPlRCJ12BnydPwBVbY92X4v6JV120R9m3/X3ggpXjqfPmY30NkrIq61Ddy+lSkEsJ8SgtfNZsMPFTRmD1PDG/8jiY7unIgKSLiriXUxRS/s6M3JlRSDoTg2ocdX1FnfWG4Og7a1TZvHwLouUFO0ffuPWuiVIJIQODmnfetv2+m2aHCorRPNORgGWYraD5WHYJ+WpFtnzS2vWv8mSaOyICZ7feqaaYsiczRicpfMezPTumk5UOmAyqVRFIvg=
X-Forefront-Antispam-Report: CIP:216.228.112.32;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:schybrid01.nvidia.com;CAT:NONE;SFS:(4636009)(39860400002)(346002)(376002)(396003)(136003)(36840700001)(46966006)(316002)(36756003)(336012)(2616005)(26005)(478600001)(45080400002)(426003)(47076005)(2906002)(186003)(107886003)(5660300002)(82740400003)(36860700001)(110136005)(1076003)(54906003)(8936002)(83380400001)(82310400003)(70206006)(4326008)(7636003)(70586007)(8676002)(356005)(7696005)(6666004)(86362001);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 May 2021 18:55:08.8893
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6332e9ca-b442-493c-b83f-08d91a2e7563
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.112.32];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT011.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4906
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Commit 4b361cfa8624 ("mtd: core: add OTP nvmem provider support") is
causing the following panic ...

 ------------[ cut here ]------------
 kernel BUG at /local/workdir/tegra/linux_next/kernel/mm/slab.c:2730!
 Internal error: Oops - BUG: 0 [#1] PREEMPT SMP ARM
 Modules linked in:
 CPU: 3 PID: 1 Comm: swapper/0 Not tainted 5.13.0-rc2-next-20210518 #1
 Hardware name: NVIDIA Tegra SoC (Flattened Device Tree)
 PC is at ___cache_free+0x3f8/0x51c
 ...
 [<c029bb1c>] (___cache_free) from [<c029c658>] (kfree+0xac/0x1bc)
 [<c029c658>] (kfree) from [<c06da094>] (mtd_otp_size+0xc4/0x108)
 [<c06da094>] (mtd_otp_size) from [<c06dc864>] (mtd_device_parse_register+0xe4/0x2b4)
 [<c06dc864>] (mtd_device_parse_register) from [<c06e3ccc>] (spi_nor_probe+0x210/0x2c0)
 [<c06e3ccc>] (spi_nor_probe) from [<c06e9578>] (spi_probe+0x88/0xac)
 [<c06e9578>] (spi_probe) from [<c066891c>] (really_probe+0x214/0x3a4)
 [<c066891c>] (really_probe) from [<c0668b14>] (driver_probe_device+0x68/0xc0)
 [<c0668b14>] (driver_probe_device) from [<c0666cf8>] (bus_for_each_drv+0x5c/0xbc)
 [<c0666cf8>] (bus_for_each_drv) from [<c0668694>] (__device_attach+0xe4/0x150)
 [<c0668694>] (__device_attach) from [<c06679e0>] (bus_probe_device+0x84/0x8c)
 [<c06679e0>] (bus_probe_device) from [<c06657f8>] (device_add+0x48c/0x868)
 [<c06657f8>] (device_add) from [<c06eb784>] (spi_add_device+0xa0/0x168)
 [<c06eb784>] (spi_add_device) from [<c06ec9a8>] (spi_register_controller+0x8b8/0xb38)
 [<c06ec9a8>] (spi_register_controller) from [<c06ecc3c>] (devm_spi_register_controller+0x14/0x50)
 [<c06ecc3c>] (devm_spi_register_controller) from [<c06f0510>] (tegra_spi_probe+0x33c/0x450)
 [<c06f0510>] (tegra_spi_probe) from [<c066abec>] (platform_probe+0x5c/0xb8)
 [<c066abec>] (platform_probe) from [<c066891c>] (really_probe+0x214/0x3a4)
 [<c066891c>] (really_probe) from [<c0668b14>] (driver_probe_device+0x68/0xc0)
 [<c0668b14>] (driver_probe_device) from [<c0668e30>] (device_driver_attach+0x58/0x60)
 [<c0668e30>] (device_driver_attach) from [<c0668eb8>] (__driver_attach+0x80/0xc8)
 [<c0668eb8>] (__driver_attach) from [<c0666c48>] (bus_for_each_dev+0x78/0xb8)
 [<c0666c48>] (bus_for_each_dev) from [<c0667c44>] (bus_add_driver+0x164/0x1e8)
 [<c0667c44>] (bus_add_driver) from [<c066997c>] (driver_register+0x7c/0x114)
 [<c066997c>] (driver_register) from [<c010223c>] (do_one_initcall+0x50/0x2b0)
 [<c010223c>] (do_one_initcall) from [<c11011f0>] (kernel_init_freeable+0x1a8/0x1fc)
 [<c11011f0>] (kernel_init_freeable) from [<c0c09190>] (kernel_init+0x8/0x118)
 [<c0c09190>] (kernel_init) from [<c01001b0>] (ret_from_fork+0x14/0x24)
 ...
 ---[ end trace 0f652dd222de75d7 ]---

In the function mtd_otp_size() a buffer is allocated by calling
kmalloc() and a pointer to the buffer is stored in a variable 'info'.
The pointer 'info' may then be incremented depending on the length
returned from mtd_get_user/fact_prot_info(). If 'info' is incremented,
when kfree() is called to free the buffer the above panic occurs because
we are no longer passing the original address of the buffer allocated.
Fix this by indexing through the buffer allocated to avoid incrementing
the pointer.

Fixes: 4b361cfa8624 ("mtd: core: add OTP nvmem provider support")
Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/mtd/mtdcore.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/mtdcore.c b/drivers/mtd/mtdcore.c
index 3ae261661eea..ffa46ccea0cf 100644
--- a/drivers/mtd/mtdcore.c
+++ b/drivers/mtd/mtdcore.c
@@ -792,10 +792,8 @@ static ssize_t mtd_otp_size(struct mtd_info *mtd, bool is_user)
 	if (ret)
 		goto err;
 
-	for (i = 0; i < retlen / sizeof(*info); i++) {
-		size += info->length;
-		info++;
-	}
+	for (i = 0; i < retlen / sizeof(*info); i++)
+		size += info[i].length;
 
 	kfree(info);
 	return size;
-- 
2.7.4

