Return-Path: <SRS0=WNzV=BQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 700DBC433E3
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:59:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C451423119
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Aug 2020 16:59:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1PLwnz5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728970AbgHFQ7c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Aug 2020 12:59:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729000AbgHFQkk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Aug 2020 12:40:40 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 283EBC00215F;
        Thu,  6 Aug 2020 09:02:55 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id v22so24751828edy.0;
        Thu, 06 Aug 2020 09:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CECQrTdPbGjVPX2RCRIk8am23VvwhZ+qTSo0hSxBl3o=;
        b=Z1PLwnz5/fx/Z6dzRP3Qg8AStjfCJB6bxY4Q5BbC/Wgxs6E3gpE97VG8FbsJpxuY2M
         zVCfl8kTqJRQXVsI3XcAbbohpxUXhB2pQ7arkm8ajmV6xCaMGQ7S+gD+MhJ034iLfQf9
         MqVmtVLiytju3ZSHmh5wEFSn7QcM67A+xj5w+xe0sZe42IwZZjUIy0jto/NFTWpOQJZn
         ndREU01ar4OvfUT0osHmTkDB3zXoCxiNdboAkApDBwcsJbBBjCYTjIPm0oFlIsJZiPYz
         kz6HqUpuaFjwe/lhWxNOpTSoOyhVVNjQ3Jx0FU8vg/cVAzvmJUj8jEXNpYz68nzZhXQQ
         qOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CECQrTdPbGjVPX2RCRIk8am23VvwhZ+qTSo0hSxBl3o=;
        b=HBCbEhqRFfnYDLTioCYQ/yRIbj/fME6zlxKeKBuxxIkh8anpNciiNIUNdvrp9rr6T9
         +BMWLsp6864ET5jKZAmk4bcMxG+tgUiAd2bIXNe9NyZjMcs/6MsjkYgSgW0gzoYLdlk7
         yUaGsCLENbLPa9QZE9IFqS57A98gmERqwNNXnqdb1w414KKDerUfVwgo1fnVp8TZblnt
         4cizhUHKTv0HbxLQxqyhYr099WyCtl8sS+f+UUJvsnkhWZekybGApVvkZxPvENxJtKSw
         80tIq6z5r6Bb9CJE9qBb2du5HJGx9dfwmzDr2QE7c5PP5fRcU/kBIJaEJh2FGPX0FVvi
         SIYA==
X-Gm-Message-State: AOAM531pZA0ujs3RHll8khEMbBl8UgCx77ASJ7IaHlk+hJyaCDt2Z2FU
        PtDE0GMa/0161y8KNKiPUOA=
X-Google-Smtp-Source: ABdhPJyjP6Tg6vGResi/PT4q25in8ESFmnFaAbhMRGP9vNUEC8yre8RyUHGTeEb31y1gXCLySX9zDQ==
X-Received: by 2002:a50:d908:: with SMTP id t8mr4558574edj.373.1596729773914;
        Thu, 06 Aug 2020 09:02:53 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id a16sm4011063ejy.78.2020.08.06.09.02.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2020 09:02:52 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     linux-usb@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [PATCH 2/2] usb: common: usb-conn-gpio: Print error on failure to get VBUS
Date:   Thu,  6 Aug 2020 18:02:48 +0200
Message-Id: <20200806160248.3936771-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200806160248.3936771-1-thierry.reding@gmail.com>
References: <20200806160248.3936771-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-tegra-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The exact error that happened trying to get the VBUS supply can be
useful to troubleshoot what's going on.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/usb/common/usb-conn-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/common/usb-conn-gpio.c b/drivers/usb/common/usb-conn-gpio.c
index c5b516d327c7..6c4e3a19f42c 100644
--- a/drivers/usb/common/usb-conn-gpio.c
+++ b/drivers/usb/common/usb-conn-gpio.c
@@ -206,7 +206,7 @@ static int usb_conn_probe(struct platform_device *pdev)
 
 	if (IS_ERR(info->vbus)) {
 		if (PTR_ERR(info->vbus) != -EPROBE_DEFER)
-			dev_err(dev, "failed to get vbus\n");
+			dev_err(dev, "failed to get vbus: %ld\n", PTR_ERR(info->vbus));
 		return PTR_ERR(info->vbus);
 	}
 
-- 
2.27.0

