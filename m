Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD7C8C433C1
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 18:07:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7EEC2619D0
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 18:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232552AbhC3SGn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 14:06:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232543AbhC3SGh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 14:06:37 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8672C061574
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 11:06:36 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id l18so19274264edc.9
        for <linux-tegra@vger.kernel.org>; Tue, 30 Mar 2021 11:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pgwGo5U4+mVpvBAlIW3XDhY6OzMGVQRD+8FoU11geg=;
        b=KILBfA6bAgwhgbaqL+MGXZDaxNFo9Jr5AheRhcv2NtJHd7OqaEXycAb+llcDIJT8Y8
         nNJQQ6wSIieG4jv4njYkeNg95rE5S2gnYCU5I2FU+WLJvNLTHrlC6Jx6CZhC5+0G9nZc
         KZU38T4duNWkfLotY+9ZUoGOojL6pQWNVLQTZdJ9TUkHGeROZhYjptk6zjrNzjyprDDS
         IlDAlQWedrdBDjHXssZGbt0ab2CeMRdKDxzUNPqO32B9EP4B/6iBMb0t8/mMn/kjbUhO
         p2vgVUSj/LlYP0Q6bsCia+bSG82MeSGXyzI+MhdnSrwgGsViSEod9Qq6koWteg5PskON
         PVHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0pgwGo5U4+mVpvBAlIW3XDhY6OzMGVQRD+8FoU11geg=;
        b=GrsyPJTUPb2IsLDgydbh7V+M0IlDkJbvnllVb5jSraeoll17FVjy0HeVNFa4UfW5Ff
         47iE6wruGzkYMhzpROLizL4Ap0CKg/QCqjkuHbX25p9mq0f+b8lJ+hruO2nLmi13YItT
         3IzgkQWbb5L5Fkg7R7JJjxCCGVKVRwFCMCkDkUEmiR9Ue/sgugM82Ix7fFJtvjLA+5Xz
         Kg2SoF3170qKdjUvKlDy558ZR3XFu9M4kmxxJgroIE9vq27FkIMWGjLkFmoywXNJCQ+C
         G+pjFatp/8YaTBgXNJRpPNgWMmS3KT1flEgsuthCfzkqN9WiZk11IFtfvi4ri5i1awb+
         0U2g==
X-Gm-Message-State: AOAM533rYNN6YApzFV/7TOa3eKoA/fidL/6aINFEf5DYXMWZpzS8UASG
        AumIRSaucxkKdbRy/wiR/Cc=
X-Google-Smtp-Source: ABdhPJxcmA+mJu9zdZY6GgDUziWNePTkeU423wGspKbNdxgH6BOtT/Uk4a7w/ccx0pA9XK354RQ4vg==
X-Received: by 2002:a50:ed96:: with SMTP id h22mr34653915edr.39.1617127595723;
        Tue, 30 Mar 2021 11:06:35 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id l12sm11597884edb.39.2021.03.30.11.06.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 11:06:34 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org
Subject: [PATCH] ASoC: tegra: Set driver name explicitly
Date:   Tue, 30 Mar 2021 20:06:57 +0200
Message-Id: <20210330180657.1867971-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The SoC sound core will generate a driver name by normalizing the card
name. However, most of the time that name does not tell anything about
the driver and is therefore useless for this purpose.

Make the driver name more useful by setting it explicitly during card
initialization.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 sound/soc/tegra/tegra_audio_graph_card.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/sound/soc/tegra/tegra_audio_graph_card.c b/sound/soc/tegra/tegra_audio_graph_card.c
index ddedf18adde1..47b319504c8c 100644
--- a/sound/soc/tegra/tegra_audio_graph_card.c
+++ b/sound/soc/tegra/tegra_audio_graph_card.c
@@ -198,6 +198,7 @@ static int tegra_audio_graph_probe(struct platform_device *pdev)
 		return -ENOMEM;
 
 	card = simple_priv_to_card(&priv->simple);
+	card->driver_name = "tegra-ape";
 
 	card->probe = tegra_audio_graph_card_probe;
 
-- 
2.30.2

