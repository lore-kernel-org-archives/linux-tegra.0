Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C881C07E96
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:49:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3B4F60FE6
	for <linux-tegra@archiver.kernel.org>; Sun, 11 Jul 2021 23:49:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229793AbhGKXwh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 11 Jul 2021 19:52:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229665AbhGKXwh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 11 Jul 2021 19:52:37 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3AF86C0613DD;
        Sun, 11 Jul 2021 16:49:49 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id j184so16249403qkd.6;
        Sun, 11 Jul 2021 16:49:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xW4jQBvbvUVw8gg3M/LBXb1/rCq2KW812j/E1/gOeak=;
        b=j11jSfND5lIZeQchB5la2gGDTrUyNZn8INL8U/sF2znAEIxm5huKahwI0DUMSnnGDs
         q6f76zPtWIIvo4qrtrimu5zVy/EKW0ZSPWg4iA5lsoX/Vow6V91CA80ePggrLYbp5VbS
         CZ441KOZGMlocvyutwJd5Tl+mYuS9nKAyHEdm/oMpbgbMEHQbLsKQlXiWuSDvLEkwZj9
         3C0GPpx6UGVl4KUv8Wd6KWCtm+FN9rZ/HZr+9vIdWZPAeRZFVm1lmi5wHLXlMClqjWf4
         TjJdmFUyoU4IAv6yEFBdfx/a/90Y+lTx0pLDJKUl3KVxNLtIKDbiWGGmv6o/xtyfgkC1
         VpBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xW4jQBvbvUVw8gg3M/LBXb1/rCq2KW812j/E1/gOeak=;
        b=aHIfFMcgBiN4zYPHqB7GWqjlOa6wiLruLuP60VINIfD16l1IhF2IsGqIx96Cjr+aOQ
         FIUOMQRpSdKpahd1Txyd0tv0DOOeS/mH84K7vJH/TKB4do43E304srUBHfPY+Gw2W3MP
         oad3+O/V+cKkzhpg18FRREVMvQEs2rVjBnbWSsDEcapTxP+4oO6FLCyoL/6sKL1rjmpo
         KibVs2YtUrOTC95M9yV09hpy3cOVmqdoP8aJATTzL3OsvptyM8KCC1osKCF9em0rCjce
         36oQjcU2zozTPt6OgeTIfe4gdDO9y0/9WKMubZsTQ4El+yF61PBjg+sZlsjTT4dhfmfi
         V5tA==
X-Gm-Message-State: AOAM532/FiZHRsbl+qTdcjSfXo/hvNTDhlKCt3ZgLh1rlSoJZwhdtySH
        TCdRplgilUojbU322rx2Njg=
X-Google-Smtp-Source: ABdhPJwHrjMAGnkAB2st8ODKl/lqbNtbZcZaW4exuIA0WpIaAWSrxPoUmQZ60L5/2vbwCJotcQ4VxA==
X-Received: by 2002:a05:620a:1519:: with SMTP id i25mr24839698qkk.228.1626047388333;
        Sun, 11 Jul 2021 16:49:48 -0700 (PDT)
Received: from localhost.localdomain (94-29-37-113.dynamic.spd-mgts.ru. [94.29.37.113])
        by smtp.gmail.com with ESMTPSA id d7sm5003072qth.70.2021.07.11.16.49.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 16:49:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Cc:     linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH v1 0/1] Tegra ARM64 device-tree improvements for 5.15
Date:   Mon, 12 Jul 2021 02:49:38 +0300
Message-Id: <20210711234939.28103-1-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

A single patch here that doesn't fit into the ARM32 series of improvements,
but fixes the same problem that affects the ARM32 boards too.

Dmitry Osipenko (1):
  arm64: tegra194: p2888: Correct interrupt trigger type of temperature
    sensor

 arch/arm64/boot/dts/nvidia/tegra194-p2888.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.32.0

