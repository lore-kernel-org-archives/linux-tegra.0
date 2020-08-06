Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90E3BC433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:05:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D665B20786
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 17:05:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N3bnalY4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729458AbgHFREI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 13:04:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729710AbgHFRC7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 13:02:59 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0A797C002152
        for <linux-tegra@vger.kernel.org>; Thu,  6 Aug 2020 08:54:14 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id c2so29648815edx.8
        for <linux-tegra@vger.kernel.org>; Thu, 06 Aug 2020 08:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=5pqsHiVxuyGBu/0tH+qVfNYUFXwSd1VD/tbRJZDzCuM=;
        b=N3bnalY4rOo3OwG/8j8SBbq4MZzrUjNrh90GhJxywE3YKU44SMfEOiEHoXld0c18a0
         s/Gg0aOJQ3cFcQ/Ap2KO71Kecxd1R4OxkcRaXjoPX02kMyKnrLDQZ3DYKMShLa2nP5Cv
         XRQtHmF7f7Sx5a32R++4CxkmLy03gtfaNALT9Ke5z97jBI/lYZGFnmI/UX3f0AG0wntb
         +G0GIz3tDWen7R4VpxKqXxPY9f1+5Cf3pCrvHpqhjU4Iq394/+wLAmwrW/bei6LRtlEh
         9nXemf8stZtvILHHzL7E57QCdYRAO7xmzfUQS3MB2NSG8ZQNzidIPL7KwudmWzmRKvFZ
         IuuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=5pqsHiVxuyGBu/0tH+qVfNYUFXwSd1VD/tbRJZDzCuM=;
        b=l40Ywdl4NM25Rv6UWvGj29mjprT0zc4USbQG9PH1tXVY1eLf3uP7ju33benWkqMqZu
         20UIsR4xmtHP9ZpNpC9sHAEeZ5FDZUgtF8crPeLATFjla93uSD7zZrf02YU9qP6QH7ue
         PAsCiWPhaDDcA3UWKqDx4MPvG/2gDe0EGTCZHc/cfq4Y3erQ5QI/gKkj/sj/ZDM4cK9s
         KBnMycz65TOwDggCGHXBSNqIzdRWz/MvJdACz5bE4DxF+XbwI8JFyPEBRRpq/LFVj7kT
         Wy4h5+Dtv545SxJQXAlFLbhrrZS30MF9bnGj9BauiFbupeElTiy0+3t+XT0dqaMPIElG
         Gskg==
X-Gm-Message-State: AOAM531z+jF+S4SfDUEbaQtmBHYX6AXIl2IirCy1ahvFZuldSSfHxdZl
        FRJA2dHQilTtzmV3Z0xRp4E=
X-Google-Smtp-Source: ABdhPJxbkk+OQPQaekYiTtv/1k6LUn7kBiyDWdKxOIUCH6YCl/8AvW5AiX9ILJ+dfF4n7DH4+OLu9A==
X-Received: by 2002:aa7:dbd9:: with SMTP id v25mr4827342edt.137.1596729250273;
        Thu, 06 Aug 2020 08:54:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p13sm3660700edq.81.2020.08.06.08.54.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 08:54:07 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Joerg Roedel <joro@8bytes.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
Subject: [PATCH 1/3] iommu/tegra-smmu: Set IOMMU group name
Date:   Thu,  6 Aug 2020 17:54:02 +0200
Message-Id: <20200806155404.3936074-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806155404.3936074-1-thierry.reding@gmail.com>
References: <20200806155404.3936074-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

Set the name of static IOMMU groups to help with debugging.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/iommu/tegra-smmu.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/tegra-smmu.c b/drivers/iommu/tegra-smmu.c
index 124c8848ab7e..1ffdafe892d9 100644
--- a/drivers/iommu/tegra-smmu.c
+++ b/drivers/iommu/tegra-smmu.c
@@ -847,6 +847,7 @@ static struct iommu_group *tegra_smmu_group_get(struct tegra_smmu *smmu,
 		return NULL;
 	}
 
+	iommu_group_set_name(group->group, soc->name);
 	list_add_tail(&group->list, &smmu->groups);
 	mutex_unlock(&smmu->lock);
 
-- 
2.27.0

