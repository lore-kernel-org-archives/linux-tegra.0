Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 300B3C433FE
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 13:47:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1385154AbiBGNq3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 08:46:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1448056AbiBGNKF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 08:10:05 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CA048C043189
        for <linux-tegra@vger.kernel.org>; Mon,  7 Feb 2022 05:10:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644239402;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=V7oC2IbMHxE4ZqZeJwr6Nf58KNDsnfkfT9BMAGpj22k=;
        b=h6lS8Fz4cNwT4AsCAA3RCB1f876IjS2LU4EzXGLDnWeemb3pKyMXudGAGbpRKi+6qkObbO
        OzAhBemRBIBLqeVSWC4LB7oQiU3ZkA1OJL0BtRgkjbm8DcQ+WfNAafs2l6LRWcd/DwgT4o
        QIYNKmaHGaf6h2S8XtdVnT5Zn9apF1M=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-Zd_QT8-1P-6HdpmiyoCpUQ-1; Mon, 07 Feb 2022 08:10:01 -0500
X-MC-Unique: Zd_QT8-1P-6HdpmiyoCpUQ-1
Received: by mail-qv1-f69.google.com with SMTP id 8-20020a0562140d0800b00422bb534680so8622167qvh.7
        for <linux-tegra@vger.kernel.org>; Mon, 07 Feb 2022 05:10:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=V7oC2IbMHxE4ZqZeJwr6Nf58KNDsnfkfT9BMAGpj22k=;
        b=Atxv+QSYiIjXipR82EwQedi3pAYqALWftRoWvo4nK3/5LEOutm3J0ZfqWkRxmKPj8L
         GCN7R8VlXcwYu7pyD8WhcSWTgt7pPfw++osfViyrRaNkZaU4AI0VvT34wcDe7Js3Ykkc
         SrZ+3bzXhbCAm+npJlxc6v+X15uQJ/tfvyDlgeW0Twt4121oa4fg0CDTKQWshYgS006z
         D/DDnyGyLTp1906nTPL98G8HEGJ4vmJgRM16jl+Y2dTkkpkYGxdazkWryMOD3dKc0Jjl
         nwF8VSE8ecOAmeQ9vbW2cNVjj2FN2EAutGQm6L89qu+9206hMlVLvot2eZ97KDrR+0Ih
         MH2Q==
X-Gm-Message-State: AOAM5308rhjV8/3+Y6AAdZ7H9/UieFNJx+qe/wMrnv5zHzwbRKugfWEG
        79i7+kntSmH9RVx6oxvdbVX+z+WhtnzRizdo1bKAQf6rJ49EmvTBArv6CwQP85OCdHFS8GPuwAn
        a+5YYm23IJL77UBefaTvURIc=
X-Received: by 2002:a05:622a:15d2:: with SMTP id d18mr7677807qty.627.1644239401288;
        Mon, 07 Feb 2022 05:10:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy+Acrc8l3BriTnb/PGx/7S9Rqo1TwqYskoIJ3XUtcvnqkF1igAg71HbsgBsm352B5BsBWvPg==
X-Received: by 2002:a05:622a:15d2:: with SMTP id d18mr7677790qty.627.1644239401106;
        Mon, 07 Feb 2022 05:10:01 -0800 (PST)
Received: from localhost.localdomain.com (024-205-208-113.res.spectrum.com. [24.205.208.113])
        by smtp.gmail.com with ESMTPSA id x3sm2937241qkp.54.2022.02.07.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 05:10:00 -0800 (PST)
From:   trix@redhat.com
To:     thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tom Rix <trix@redhat.com>
Subject: [PATCH] soc/tegra: bpmp: cleanup double word in comment
Date:   Mon,  7 Feb 2022 05:09:51 -0800
Message-Id: <20220207130951.2059795-1-trix@redhat.com>
X-Mailer: git-send-email 2.26.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Tom Rix <trix@redhat.com>

Remove the second 'or'.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 include/soc/tegra/bpmp-abi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/soc/tegra/bpmp-abi.h b/include/soc/tegra/bpmp-abi.h
index bff99f23860c3..53171e324d1ce 100644
--- a/include/soc/tegra/bpmp-abi.h
+++ b/include/soc/tegra/bpmp-abi.h
@@ -931,7 +931,7 @@ enum mrq_reset_commands {
  * @brief Request with MRQ_RESET
  *
  * Used by the sender of an #MRQ_RESET message to request BPMP to
- * assert or or deassert a given reset line.
+ * assert or deassert a given reset line.
  */
 struct mrq_reset_request {
 	/** @brief Reset action to perform (@ref mrq_reset_commands) */
-- 
2.26.3

