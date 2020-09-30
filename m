Return-Path: <SRS0=fCh6=DH=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCF8C4727C
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:02:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 05A4E20789
	for <linux-tegra@archiver.kernel.org>; Wed, 30 Sep 2020 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601499763;
	bh=hEW2lfnz94TX8YvGzA25neEhx4sqLqPCJj+osYv0f84=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=tiij6HaFx1qD/QQDST1nwCsyRkHc4Dzd4+gaF6cZDWrLO8H2CvxFliSfT3dBDl55J
	 Bu35H8QRZ2pGXJYT+lXMhO4lVxvg2BTbMPLBrX3zr19LzHCumPXXARsfKoh+cWmJlC
	 Z0xh/Q2ctQ5qtR/l33Pm0GdN+CeuczflT9DisAq8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730009AbgI3VCm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 30 Sep 2020 17:02:42 -0400
Received: from mail.kernel.org ([198.145.29.99]:38918 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725799AbgI3VCm (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 30 Sep 2020 17:02:42 -0400
Received: from embeddedor (187-162-31-110.static.axtel.net [187.162.31.110])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 6A2162071E;
        Wed, 30 Sep 2020 21:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601499761;
        bh=hEW2lfnz94TX8YvGzA25neEhx4sqLqPCJj+osYv0f84=;
        h=Date:From:To:Cc:Subject:From;
        b=kB0qqgz2Qg5kqmagsLjOnmi5VS9A0KdFC8OuKPMCmSb2lPxu2++Ex4nxbEuKwSUnM
         wIn6zAXZkNhnq6dfT7ziW+s9r4bjatfxBsm+TUVSRjvk0De9MdnqQkidBm6zy/HFp1
         QH7/bokmJ01Sqi/yNifloTTQduQJ4nzPjOkHBiIg=
Date:   Wed, 30 Sep 2020 16:08:24 -0500
From:   "Gustavo A. R. Silva" <gustavoars@kernel.org>
To:     Stefan Agner <stefan@agner.ch>, Lucas Stach <dev@lynxeye.de>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-mtd@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        linux-hardening@vger.kernel.org
Subject: [PATCH][next] mtd: rawnand: Replace one-element array with
 flexible-array member
Message-ID: <20200930210824.GA12277@embeddedor>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

There is a regular need in the kernel to provide a way to declare having
a dynamically sized set of trailing elements in a structure. Kernel code
should always use “flexible array members”[1] for these cases. The older
style of one-element or zero-length arrays should no longer be used[2].

Refactor the code according to the use of a flexible-array member
instead of a one-element array. Also, make use of the struct_size()
helper to calculate the size of the allocation for _nand_. In order
to keep the code as maintainable as possible and to keep _cs_ as an
array, add a new macro CS_N to aid in the allocation size calculation,
in case there is a need for more Chip Select IDs in the future. In the
meantime, the macro is set to 1. This also avoids having to use a magic
number '1' as the last argument for struct_size().

[1] https://en.wikipedia.org/wiki/Flexible_array_member
[2] https://www.kernel.org/doc/html/v5.9-rc1/process/deprecated.html#zero-length-and-one-element-arrays

Build-tested-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/lkml/5f7473c0.Vv4h6yzXSga90P04%25lkp@intel.com/
Signed-off-by: Gustavo A. R. Silva <gustavoars@kernel.org>
---
 drivers/mtd/nand/raw/tegra_nand.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/mtd/nand/raw/tegra_nand.c b/drivers/mtd/nand/raw/tegra_nand.c
index fbf67722a049..43b8359dcd85 100644
--- a/drivers/mtd/nand/raw/tegra_nand.c
+++ b/drivers/mtd/nand/raw/tegra_nand.c
@@ -163,6 +163,9 @@
 				HWSTATUS_RBSY_MASK(NAND_STATUS_READY) | \
 				HWSTATUS_RBSY_VALUE(NAND_STATUS_READY))
 
+/* Number of Chip Selects. Currently, only one. */
+#define CS_N			1
+
 struct tegra_nand_controller {
 	struct nand_controller controller;
 	struct device *dev;
@@ -183,7 +186,7 @@ struct tegra_nand_chip {
 	u32 config;
 	u32 config_ecc;
 	u32 bch_config;
-	int cs[1];
+	int cs[];
 };
 
 static inline struct tegra_nand_controller *
@@ -1086,14 +1089,14 @@ static int tegra_nand_chips_init(struct device *dev,
 		return -EINVAL;
 	}
 
-	/* Retrieve CS id, currently only single die NAND supported */
+	/* Retrieve CS id, currently only single-die NAND supported */
 	ret = of_property_read_u32(np_nand, "reg", &cs);
 	if (ret) {
 		dev_err(dev, "could not retrieve reg property: %d\n", ret);
 		return ret;
 	}
 
-	nand = devm_kzalloc(dev, sizeof(*nand), GFP_KERNEL);
+	nand = devm_kzalloc(dev, struct_size(nand, cs, CS_N), GFP_KERNEL);
 	if (!nand)
 		return -ENOMEM;
 
-- 
2.27.0

