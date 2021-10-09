Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B380C433F5
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Oct 2021 08:59:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E6AE060F6B
	for <linux-tegra@archiver.kernel.org>; Sat,  9 Oct 2021 08:59:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231529AbhJIJBC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 9 Oct 2021 05:01:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231344AbhJIJBC (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Sat, 9 Oct 2021 05:01:02 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0295C061570;
        Sat,  9 Oct 2021 01:59:05 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id on6so9319026pjb.5;
        Sat, 09 Oct 2021 01:59:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDrr7TdiWFhRXNfklh2P5Ytp5sq0WIPiHJVWmdRoUSY=;
        b=k3ScpN5dpN+dhQMM0pIrc7oXvc/o1FeI2kKV4CFK53dByztCis7nWBfDtUvXynFJ9L
         5P3ddOrnr6xq4bLTeO8W2V9gdThiTlW3jZ/nEXPyjWXbWTFPD7+xzc1L3GQnaGbgC0XH
         UfPMNRyI6Ey6KbWcqQguDNTIVPF97CMIOl8K5at7lL5gEVG2ysDTXzMwoaelqkFKAghA
         Aj90M0KfxedH6mGDT2AL9InwSkjubDxsL1c5Vt028Q9gZgR7mnUrDL4PcJGm/cQjO3SA
         NakBayhgPzoyA78UoZtXR+IpGzM3eb7cg1Dgxno4QMfRLr9nnV567Did0ojnA6C4fWb0
         FeHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=ZDrr7TdiWFhRXNfklh2P5Ytp5sq0WIPiHJVWmdRoUSY=;
        b=m35Xb7JrN06zSLAjP2RxOc+VWFRgrfr3KNkeqZtHsuolbxAVANJUUIWNFTpb9xs5D+
         umO0aulrbxVogU3fxIietxWGjzxyFglb8JMnxkcq96KWXa+QidQCVCtAg/hs5PKa2iBn
         oeq7QCPzX3/7N9++312AqQC+F0AoAVeD+2/7gTeiScj3sYt60PcrldqLvCXVbJv2RkB1
         O34L2DkxIxTQqp3nwL6V1UwrJ5Ll5+yE3LP3F0+vqNSLN87fHknPwa67PbPapLBw3DNF
         vwbUOdK8RHZQXgPNY6F2iq6eZCl3P6sY8HJwN8uhHtQXxPTJ0t0qM2BmDvvgWJKW+omJ
         wz0g==
X-Gm-Message-State: AOAM531U0khGYAp1COJ4t15aROfQibFjL4MmCF3+dUL0VNVT345VINfL
        yfEl0KolKsgK7MGpsiMqkWdz+MvxldU=
X-Google-Smtp-Source: ABdhPJxuqUZjPYp/MjnAkCx2LgeZuv1nc65LsLTETKpL3ACfbxF8xHaWi5qLoOcabjrdI4ZP5epxTA==
X-Received: by 2002:a17:90b:4f46:: with SMTP id pj6mr17092335pjb.63.1633769945476;
        Sat, 09 Oct 2021 01:59:05 -0700 (PDT)
Received: from localhost.localdomain ([193.203.214.57])
        by smtp.gmail.com with ESMTPSA id x1sm1615401pfp.190.2021.10.09.01.59.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Oct 2021 01:59:05 -0700 (PDT)
From:   cgel.zte@gmail.com
X-Google-Original-From: lv.ruyi@zte.com.cn
To:     thierry.reding@gmail.com
Cc:     jonathanh@nvidia.com, arnd@arndb.de, lv.ruyi@zte.com.cn,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zeal Robot <zealci@zte.com.cn>
Subject: [PATCH V1] firmware: tegra: fix error application of sizeof to pointer
Date:   Sat,  9 Oct 2021 08:59:00 +0000
Message-Id: <20211009085900.509697-1-lv.ruyi@zte.com.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Lv Ruyi <lv.ruyi@zte.com.cn>

Application of sizeof to pointer yields the number of bytes of the pointer,
but it should use the length of buffer in the code.

Reported-by: Zeal Robot <zealci@zte.com.cn>
Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
---
 drivers/firmware/tegra/bpmp-debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/firmware/tegra/bpmp-debugfs.c b/drivers/firmware/tegra/bpmp-debugfs.c
index 6d66fe03fb6a..fd89899aeeed 100644
--- a/drivers/firmware/tegra/bpmp-debugfs.c
+++ b/drivers/firmware/tegra/bpmp-debugfs.c
@@ -77,13 +77,14 @@ static const char *get_filename(struct tegra_bpmp *bpmp,
 	const char *root_path, *filename = NULL;
 	char *root_path_buf;
 	size_t root_len;
+	size_t root_path_buf_len = 512;
 
-	root_path_buf = kzalloc(512, GFP_KERNEL);
+	root_path_buf = kzalloc(root_path_buf_len, GFP_KERNEL);
 	if (!root_path_buf)
 		goto out;
 
 	root_path = dentry_path(bpmp->debugfs_mirror, root_path_buf,
-				sizeof(root_path_buf));
+				root_path_buf_len);
 	if (IS_ERR(root_path))
 		goto out;
 
-- 
2.25.1

