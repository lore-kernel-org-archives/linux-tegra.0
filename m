Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68A13C43460
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 00:15:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4815661370
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 00:15:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237285AbhERAQV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 May 2021 20:16:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344832AbhERAQU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 May 2021 20:16:20 -0400
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 516FFC061573;
        Mon, 17 May 2021 17:15:03 -0700 (PDT)
Received: by mail-lf1-x12e.google.com with SMTP id j10so11341284lfb.12;
        Mon, 17 May 2021 17:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=lSMTeudjmbqslYZm6BULQgpkK8TB81O41ed4uaKwacM=;
        b=vATPGbMMpoPn7Egs/BRTAKdPALZJMoHc9Ins8ZW4pMvBGzcA1e4Q6eFLnYVuClZmq6
         Zz79YHFfAk68qQRkvcuJ1OR4LmjvNijKU3MTtaF64IfcCgU2u6OSwESBMAvdSDT6E4MA
         8G4z25/Dq7PNKd6NG3X46VmCmXxFZeqmMZ3ckYOgWCh1Ok/oekcN4ixtw2bkWC3+qgfM
         ArFmNhmMctygtBSrf7F2oUV+ikmMlab9czYda6TlabPiDQxxpg2W+uthMz4k6suGmLxe
         stWxB0WHQDh1p3T1Ia7V+reGNXGU0rladR+FERffeaUOLWhqfKrFdPvLfJ+9iJP2eSp9
         841Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=lSMTeudjmbqslYZm6BULQgpkK8TB81O41ed4uaKwacM=;
        b=BMHA2WtSO8K4NDjkI6yrE+0wPb5t9iFJGqLnUnL2/4gS+yoprSWqBxs2SG0w/O3D1v
         0Y02aWX7Z8DXRnztRGAW0K4h46yc5zVGIszzePzz6Z1sNR81lOrSJE8dGgzHOBvq7dez
         3RS/TpY2wgZ9wm3OmOFRJBN7FI1iD2N+BRe/x8B41shrAptunDn/wDd0gtuTCcXgpwcj
         Weq6QLbCLhKXACrUrmZYOlUxfVdJC9GsqZOQoZJEV94vjBUqSxIl80kgeV9X2awQsrr2
         zjN1vZkSV0UIiP3WjLKa5iSDo7VbK923DUUHjgwnr9iLLT/jg4rtw6gl1kao7D76d0S/
         7tBw==
X-Gm-Message-State: AOAM530tVNDXsZBItilYYl6OnjMsPeOdACKYB9jqO8JEmjo10BkXw0C/
        z4VVojIFxkVCiS65ocwuO9k=
X-Google-Smtp-Source: ABdhPJyQ/JQKLMRzRq4CChV/hgp8NZ/kqbg8XtoFu6JyF6Gdy0dFgQvHaPZTbHL0YMQZL/TeCVn3Kw==
X-Received: by 2002:ac2:5cc9:: with SMTP id f9mr1909771lfq.109.1621296901902;
        Mon, 17 May 2021 17:15:01 -0700 (PDT)
Received: from localhost.localdomain (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.gmail.com with ESMTPSA id p4sm2108062lfa.155.2021.05.17.17.15.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 May 2021 17:15:01 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>
Cc:     alsa-devel@alsa-project.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/2] of: base: Export of_device_compatible_match()
Date:   Tue, 18 May 2021 03:13:55 +0300
Message-Id: <20210518001356.19227-2-digetx@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210518001356.19227-1-digetx@gmail.com>
References: <20210518001356.19227-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The of_device_compatible_match() will be used by the updated NVIDIA Tegra
ASoC WM8903 driver which could be build as a loadable module, export the
OF function.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 drivers/of/base.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/of/base.c b/drivers/of/base.c
index 48e941f99558..eeca92467531 100644
--- a/drivers/of/base.c
+++ b/drivers/of/base.c
@@ -556,6 +556,7 @@ int of_device_compatible_match(struct device_node *device,
 
 	return score;
 }
+EXPORT_SYMBOL(of_device_compatible_match);
 
 /**
  * of_machine_is_compatible - Test root of device tree for a given compatible value
-- 
2.30.2

