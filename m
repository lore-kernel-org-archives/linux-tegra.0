Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 378BFC55ABD
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 20:42:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C89FF20B80
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Nov 2020 20:42:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jvk/YXKG"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726092AbgKMUmE (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Nov 2020 15:42:04 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726003AbgKMUmE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Nov 2020 15:42:04 -0500
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com [IPv6:2a00:1450:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D067C0613D1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2020 12:42:04 -0800 (PST)
Received: by mail-wr1-x443.google.com with SMTP id c17so11513180wrc.11
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2020 12:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nrD3nY8cJDaosn3p5aLHlRB3L6tK9xLqGeExQ6Gq7M8=;
        b=Jvk/YXKG6HcLZi5edX2PZXUDYYh5g3oyEpBcmCbz+7TdHNH1WlRw5BIu5reFz+McTL
         6nHkQTmU9WV5dXtgvrLCoPrmEjCQ9FNPz4YSzB4hz91J80xMPSkVudbIKljdSNXic8hG
         vgM3Z6WEX1QKClGqWaVNCGhWw6oBNHrEBiPUUMgRpvObaSSvr30ThxaelbA6mrUeiT1K
         x2c+mbq0eCA/0Pmk7crSL4POzZ+GveFicHwPhHd+Cji7HEGjey/DN79pRewc1y1034+a
         H4FYlR5kmcDb+MdjSy/BXSLxvmaroR8veo/0ZaOxlWLEdzT36SwxFG3bn+DgilqO84cG
         HCkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=nrD3nY8cJDaosn3p5aLHlRB3L6tK9xLqGeExQ6Gq7M8=;
        b=qDT22eLC8jBVeCwbaTCLb7c0EoUJ61kKhN0ua9nWWIYQvD4y+eNzPaJkqlUhIgFu/N
         2LxHxp/WeEp/OXeeVnWzqkj++cJ8wpEuYjlNOuTfo4xfz1ZvHMtVSn0U4ftJQsyctnfk
         qBybX5SvM4cK96Ztgr6FTm9G1r7Wf8oO99XoyK8a+UM5/k06Euzzw4AjXWUoqUA+DROL
         Qfok+sW6VdEZazatU9FI4lbFNdVaGnj/zavEVfXQwSxLbHdEjQDhzjtN5ArFJcAdS3Gb
         shSZZxS0MfhJBt89MXVoEiUejAhj7Wvh8YchFVQKxxRgiOBglg3zMNypVwn+9llpDKz+
         xziQ==
X-Gm-Message-State: AOAM530qG+wImlxmVvHsWEp4aulGW6Kf2paijc8lWyDCc8v+2O8GSOO2
        cKTkq9UbAXoCHTBVg2HQjbU=
X-Google-Smtp-Source: ABdhPJw3pD+6yjxQh8vumZTgEOtHwkIgj8jf/FSLiFAcA0TAhQI6qnKz/rR5d4NMekYEiWTzZtNhKQ==
X-Received: by 2002:a5d:4ec2:: with SMTP id s2mr5660666wrv.258.1605300122845;
        Fri, 13 Nov 2020 12:42:02 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id b8sm10940750wmj.9.2020.11.13.12.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2020 12:42:01 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Dmitry Osipenko <digetx@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: output: Do not put OF node twice
Date:   Fri, 13 Nov 2020 21:41:57 +0100
Message-Id: <20201113204157.1942919-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The original patch for commit 3d2e7aec7013 ("drm/tegra: output: Don't
leak OF node on error") contained this hunk, but it was accidentally
dropped during conflict resolution. This causes use-after-free errors
on devices that use an I2C controller for HDMI DDC/CI on Tegra210 and
later.

Fixes: 3d2e7aec7013 ("drm/tegra: output: Don't leak OF node on error")
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/tegra/output.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index 5a4fd0dbf4cf..47d26b5d9945 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -129,7 +129,6 @@ int tegra_output_probe(struct tegra_output *output)
 
 		if (!output->ddc) {
 			err = -EPROBE_DEFER;
-			of_node_put(ddc);
 			return err;
 		}
 	}
-- 
2.29.2

