Return-Path: <SRS0=qFEE=EE=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2D9C55178
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 07:45:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 07963214DB
	for <linux-tegra@archiver.kernel.org>; Thu, 29 Oct 2020 07:45:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwP+WbU5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727352AbgJ2Hpi (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 29 Oct 2020 03:45:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732734AbgJ2HoQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 29 Oct 2020 03:44:16 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 27A99C0613CF;
        Thu, 29 Oct 2020 00:44:16 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id w65so1659757pfd.3;
        Thu, 29 Oct 2020 00:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=n4P04Jz1B6kfqdzGvKKnIFdWyM97aAtPxWHOKKsnz2Y=;
        b=SwP+WbU5kj9ZjusDCDsz3ZrX0Ik+OmEpx2GDCA69DDTslUYaPNIdgDmcJRuoboL1yo
         7+BWeUfR73uuYwyux3tYrR+5De4Twxwtf/dAo5zq5r8vFGd/mFs6zZ0Hw9oWv/qmnkYe
         MD78lkd92G/nc/9d7C4t+HvIqaehcdB42mLPPau6x/IQ8yMg72uJWTIg7o/KrVnR22UP
         v018yQvxEL7kiqfjn28Nmz9WTFHYmuC134PWZ7UoHEQNVEkGHRhsSRFP7bqciw0nUdbW
         3WYoR7wd2Yu6su1PLbIx+T+71nLe2xsGURJQfrslhaMysBSLJaYsEqN4w/i00Dnybaer
         UOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=n4P04Jz1B6kfqdzGvKKnIFdWyM97aAtPxWHOKKsnz2Y=;
        b=piiVLg+kZE4D0gzrOdld5I3p2pv2UYXtbOqJSszMlJlKu+qQne1On+D27YHrEEVqjl
         zAM50oOi8ka+I4vHGjSWuyPzZ2SG6SHYDWVqgQfPf70C2CYsGds+MA/RZiN6J2N+H0Gr
         H8ObgqBjTPKF/AiXMEdt3bxjmQ2dzqdJuwgCjj+tMJJ05B/LNbBjJ+vGuXeMxcsyYjpy
         ocDVNRpgBTLcRKewBq7M3p1kjQOox9g1md2s2hoekWrAVdY+C7wjEvJ0Q8NdIMuHqCbl
         TzaMDwE/AS7lcgAx5prdAgj7YVCPpV9aiGYkiaf9hUJwSU9dN4pHP3/3RmLms0Vp2dGE
         bXaA==
X-Gm-Message-State: AOAM531YFvOLTH4rXIdZm1R1h2b79aP4o+2aSPgq+gnQ27AOPQwGAOnj
        llHXh8uPFuqWIS/S9pbv6Yg=
X-Google-Smtp-Source: ABdhPJzg83GKBxj/nfpn2Awb2i2RRcM4xIGJAMQ0oCHK8V1W4pzXTmHcNuYFDx78raqWaXw7CRWDeg==
X-Received: by 2002:a17:90a:4684:: with SMTP id z4mr2976899pjf.97.1603957455791;
        Thu, 29 Oct 2020 00:44:15 -0700 (PDT)
Received: from localhost ([2409:8a28:3c42:6840:9efc:e8ff:fef2:1cdc])
        by smtp.gmail.com with ESMTPSA id i17sm1827132pfa.183.2020.10.29.00.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2020 00:44:15 -0700 (PDT)
From:   Coiby Xu <coiby.xu@gmail.com>
To:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        alsa-devel@alsa-project.org (moderated list:SOUND - SOC LAYER / DYNAMIC
        AUDIO POWER MANAGEM...),
        linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
        linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 10/25] ASoC: tegra: remove unnecessary CONFIG_PM_SLEEP
Date:   Thu, 29 Oct 2020 15:42:46 +0800
Message-Id: <20201029074301.226644-10-coiby.xu@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201029074301.226644-1-coiby.xu@gmail.com>
References: <20201029074301.226644-1-coiby.xu@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

SET_SYSTEM_SLEEP_PM_OPS has already took good care of CONFIG_PM_CONFIG.

Signed-off-by: Coiby Xu <coiby.xu@gmail.com>
---
 sound/soc/tegra/tegra30_i2s.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/sound/soc/tegra/tegra30_i2s.c b/sound/soc/tegra/tegra30_i2s.c
index db5a8587bfa4..df55b90c3cf4 100644
--- a/sound/soc/tegra/tegra30_i2s.c
+++ b/sound/soc/tegra/tegra30_i2s.c
@@ -551,7 +551,6 @@ static int tegra30_i2s_platform_remove(struct platform_device *pdev)
 	return 0;
 }
 
-#ifdef CONFIG_PM_SLEEP
 static int tegra30_i2s_suspend(struct device *dev)
 {
 	struct tegra30_i2s *i2s = dev_get_drvdata(dev);
@@ -576,7 +575,6 @@ static int tegra30_i2s_resume(struct device *dev)
 
 	return ret;
 }
-#endif
 
 static const struct dev_pm_ops tegra30_i2s_pm_ops = {
 	SET_RUNTIME_PM_OPS(tegra30_i2s_runtime_suspend,
-- 
2.28.0

