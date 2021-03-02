Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC30BC43381
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 84ACB64EEF
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377348AbhCCDaz (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:30:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54076 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344065AbhCBLXe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 06:23:34 -0500
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com [IPv6:2a00:1450:4864:20::229])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4ED7AC06178B;
        Tue,  2 Mar 2021 03:22:07 -0800 (PST)
Received: by mail-lj1-x229.google.com with SMTP id u4so23439525ljh.6;
        Tue, 02 Mar 2021 03:22:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6Pw3GTr/GjOIi01Z3q0PpRjgmUtwICxpPYij6S5wwcI=;
        b=rAeqU7sAJzvubjRxRBvRPb0Xflif2/Ah/bGNEHgWmu+/qMN17futs5w/h0G2v5btvR
         ulRQ7DirUjesXRkGzZfp1Lho3KVLbwvkKQlo+3su/+lWoKp+Zs5L7Bdx/8dLlSBUnPOl
         8wxQV4GfyCy/19GKbdc1SZ1VEYOqAtNT8iUtBaK8pDQramHT1kYhKejtTATwZe1lVaO5
         +CW1jzinKThVdFaH9ZUGdojzZMdg39nlbrJkz/Io/LT+0XHkJ9rZj28tclXXmFyyc0iv
         l87aJSmd2WUZmHX0WYuh+jXeG9hl1Ao+eLoEg6JZp5tSObo5bWGeJbYkARntYkvYVgkd
         FNig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6Pw3GTr/GjOIi01Z3q0PpRjgmUtwICxpPYij6S5wwcI=;
        b=ZzhRQazQhS0O8yuc5P2u+BtDcMALFVebSL3zcj6q7eU3npJ770kaBsahxo9f1z8mnl
         7ZkLDh1hXhmziGTYiTrwwfxJpcrz335CEBImnhLChVLMVBudBsZ2TgvmbyJEH5JK5Ipg
         qib7siFya+3tTXJzaqIzQ9mTWsZSmWHgpXju+kAv22bNBahoXVF6rhIFfN0LQ96vUJxt
         EVqqWiG+YraA6TVdkmo8AGJS+UcGr+7un3FoAjSQyr4MSM7PpdD+owV0FLvXe647pMam
         D+u5pLoXOrx6a0VP7IU4cNYiKSrVnyOvrFvleeZkiBahmjptRllojUeLuSvyWoM238fF
         u1vQ==
X-Gm-Message-State: AOAM532SapOO54adJLTU0VzYjmAsZLt6+2m4JqhANHNXpTjrkk27xvpV
        AK6mXCfVLfHx9NBfLUtGK/A=
X-Google-Smtp-Source: ABdhPJz+HoWgkAqzXnvMEVoBpss7bHPZEO+Q5RCteeV43AIfK/+skRujNOfzl7jNkdQpdps0XG12ng==
X-Received: by 2002:a2e:9f08:: with SMTP id u8mr7152270ljk.50.1614684125824;
        Tue, 02 Mar 2021 03:22:05 -0800 (PST)
Received: from localhost.localdomain (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.gmail.com with ESMTPSA id w7sm2691078lft.0.2021.03.02.03.22.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Mar 2021 03:22:05 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Paul Fertser <fercerpav@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/5] reset: Add devm_reset_control_array_get_exclusive_released()
Date:   Tue,  2 Mar 2021 14:21:20 +0300
Message-Id: <20210302112123.24161-3-digetx@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210302112123.24161-1-digetx@gmail.com>
References: <20210302112123.24161-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add devm_reset_control_array_get_exclusive_released() which is wanted by
NVIDIA Tegra drivers.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 include/linux/reset.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/reset.h b/include/linux/reset.h
index 3bee086f1f06..ab240a8648ee 100644
--- a/include/linux/reset.h
+++ b/include/linux/reset.h
@@ -534,6 +534,12 @@ devm_reset_control_array_get_optional_shared(struct device *dev)
 	return devm_reset_control_array_get(dev, true, true, true);
 }
 
+static inline struct reset_control *
+devm_reset_control_array_get_exclusive_released(struct device *dev)
+{
+	return devm_reset_control_array_get(dev, false, false, false);
+}
+
 static inline struct reset_control *
 of_reset_control_array_get_exclusive(struct device_node *node)
 {
-- 
2.29.2

