Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7A3C6FD18
	for <linux-tegra@archiver.kernel.org>; Wed, 19 Apr 2023 14:30:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233156AbjDSOaQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 19 Apr 2023 10:30:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232979AbjDSOaI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 19 Apr 2023 10:30:08 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2AC01E5A
        for <linux-tegra@vger.kernel.org>; Wed, 19 Apr 2023 07:30:06 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-3f0a0c4e1ebso34250015e9.3
        for <linux-tegra@vger.kernel.org>; Wed, 19 Apr 2023 07:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681914604; x=1684506604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ni3+BhGYpUbFRLKSCJqNygsIimCAcxR5gLGgrVw7e5Y=;
        b=CXPBEw0jSq4hLVUup1BH+bXbOdblxen/0Nmgo9d+wVtMjzfm5mrO4Tx82gJgDsQoix
         q2OwenCNBTNgQDaJvOh+Jy+As5fnRv2BFsFUOeOk28xMqHOf4DGvQ3jRHPtzQp22RRoz
         Lv6DYWcGaG9Zy9xuSy9B9ucAHaexitfm39gB+e4WA07+XD2aP0ab/ZWNVwYmNlU0X0d/
         pTuVrqqs88Q2j53Ck4q5AxAs4MuyVnXJinzV9RMUi7C+GUyFLRNzkvv1YA0glDWVgktM
         bx/ckxPGDJtwzk3zMurSWJPRKZsl91BDJLlvxm22AVVcnxSWBDmoNMx/yDKC7BoNvPnm
         HfRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681914604; x=1684506604;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ni3+BhGYpUbFRLKSCJqNygsIimCAcxR5gLGgrVw7e5Y=;
        b=JpCGQqadIDLUtGuJ3QwLo07RK6ioyoZjFBb97Ululmqts7iwTzSQDR/dc49VdV4oy+
         wwuiladwKqd0RRCuwKNHNOWpWoOCK6ZjCo4FtWVpZLl9y2sDBqOYqJUpXobOchrvq+oU
         b5ce8nLdNSWtvhrfPfc9LbPpSsyNMNNFYnrYy4FOoCScgdXPOCnAjUvnA8Zxrf077UJ+
         pXVZrRYHiY8ZJpEWuetY67FdvbY54Bqhu/VhkV2vInO51nBFyXt6mgS02w0qmeRCa/AY
         tUFFQnLh4rKddc/VdEGahtTj/a3KtA59Xw9nbVe20TEPFNe7fkRpgOzhu+9pYTLFD6vf
         wZ3Q==
X-Gm-Message-State: AAQBX9dSPRKWUgFkEqlOC3INnPc96Db3H5ffaqhXm6Qkcf7EpvqApRvn
        0yKDLv0Ss9DX50YaHZ69oAqkaA==
X-Google-Smtp-Source: AKy350a0yvlTT83g+7iqiTCqHfdCC1SzQdzwZOvoQsgpaLJ3j6dmKiiBhArK+tmSfLfIAjo8yrowvQ==
X-Received: by 2002:adf:f184:0:b0:2f8:96f5:cb0f with SMTP id h4-20020adff184000000b002f896f5cb0fmr5038874wro.23.1681914604353;
        Wed, 19 Apr 2023 07:30:04 -0700 (PDT)
Received: from localhost ([102.36.222.112])
        by smtp.gmail.com with ESMTPSA id h12-20020a5d4fcc000000b002f22c44e974sm15925157wrw.102.2023.04.19.07.30.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 07:30:03 -0700 (PDT)
Date:   Wed, 19 Apr 2023 17:30:00 +0300
From:   Dan Carpenter <dan.carpenter@linaro.org>
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] hte: tegra-194: Fix off by one in tegra_hte_map_to_line_id()
Message-ID: <92a6a5cb-3a89-4c06-a91e-438cfda76fae@kili.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The "map_sz" is the number of elements in the "m" array so the >
comparison needs to be changed to >= to prevent an out of bounds
read.

Fixes: 09574cca6ad6 ("hte: Add Tegra194 HTE kernel provider")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
I think map is tegra194_aon_gpio_map and map_sz is
ARRAY_SIZE(tegra194_aon_gpio_map) but I wasn't able to follow the code
all the way through.  Untested.

 drivers/hte/hte-tegra194.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hte/hte-tegra194.c b/drivers/hte/hte-tegra194.c
index 49a27af22742..d1b579c82279 100644
--- a/drivers/hte/hte-tegra194.c
+++ b/drivers/hte/hte-tegra194.c
@@ -251,7 +251,7 @@ static int tegra_hte_map_to_line_id(u32 eid,
 {
 
 	if (m) {
-		if (eid > map_sz)
+		if (eid >= map_sz)
 			return -EINVAL;
 		if (m[eid].slice == NV_AON_SLICE_INVALID)
 			return -EINVAL;
-- 
2.39.2

