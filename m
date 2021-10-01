Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9F01C433EF
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 11:45:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA23B61AA4
	for <linux-tegra@archiver.kernel.org>; Fri,  1 Oct 2021 11:45:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353764AbhJALrN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 1 Oct 2021 07:47:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1353771AbhJALrN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 1 Oct 2021 07:47:13 -0400
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09D27C061775;
        Fri,  1 Oct 2021 04:45:29 -0700 (PDT)
Received: by mail-lf1-x12c.google.com with SMTP id y26so37888664lfa.11;
        Fri, 01 Oct 2021 04:45:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teiDv15/wzLe/Wf0K1qlBSWOTN//zgsH/sxmryk5zmo=;
        b=c5pnifb84S3cmH+v6CwyiCpgvnYoIn2qTma9lJrQG/5u3N4pvO/6mEaebzk5ODZ+8/
         T5ilDAGNMAarZMJBsPb0WzWmZqiz6zrVP8amb0v4FjmPuU7Ya5IStGoAevd3FiveOQRo
         fFqfxGUkJyhDiibsC7NzARCE5ReDri7f5s1F2f9uZEMsSAuxtWBRCwX/iH9GGq2gP1JM
         bSQ51+djagI9hzzhdLbhcMD+HUszZEknVeZAuPP4ZFIK5sX8SEC5Ro99S8ptusxHouBQ
         VtkDE/8uC3hQ6CcT3wb4xeAiq+hugvd8gonTzORNtgrfLEoUPoqxvRhYN/K/Yr14CW79
         akkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=teiDv15/wzLe/Wf0K1qlBSWOTN//zgsH/sxmryk5zmo=;
        b=TSBvLmw/DsCzoh4CHt5Y+u+ogYSeMn7TSzwDqzdm+Bn9C4IZw2EDJqjDH1PJO5L2ij
         bKUPWgSG1Cy5lsIwXRqu8jKR90yk/a2t5PCs9n9cetYaevJ/COinVKud0hc1LJ/mV4w2
         8zIR9aQf4f2b6xncnBhYHRMEhp2h7E9mOcqF9LAjZ7cKqW3FFWz/74L8CbSvan/0gHW1
         QCINAh/pUCWVAJ/OQgDr/u8LlKnzBYvcFlkzPrQ90BfAulPLDrJyYYyeo9lZ1pBxw5eQ
         U2eoRlvTOnSdaCq23Rp64E/lo4jiGKQbRHQ9ePMm33IUZ5hqvj3OOTcm/BI54Mof0xOH
         Bl4A==
X-Gm-Message-State: AOAM530SM8y2YulpU8oMaIBr4GZ6P+vh3jSGvmEhLythmwgWl1FXr5Bl
        bLI8CKCnT4Dkt9Wdlb2xZT4=
X-Google-Smtp-Source: ABdhPJxtcbH1EXrolybxconjeDFwJnpNlfjqcarbu5zs4BQ+iGKIMEQhjRDzclxuvWBcQ7oOU6nNSw==
X-Received: by 2002:a2e:bf0d:: with SMTP id c13mr11747222ljr.150.1633088727328;
        Fri, 01 Oct 2021 04:45:27 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-228-193.NA.cust.bahnhof.se. [98.128.228.193])
        by smtp.gmail.com with ESMTPSA id v27sm710990lfd.127.2021.10.01.04.45.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 04:45:26 -0700 (PDT)
From:   Rikard Falkeborn <rikard.falkeborn@gmail.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
Cc:     Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Rikard Falkeborn <rikard.falkeborn@gmail.com>
Subject: [PATCH] ASoC: tegra: Constify static snd_soc_ops
Date:   Fri,  1 Oct 2021 13:45:17 +0200
Message-Id: <20211001114517.6752-1-rikard.falkeborn@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

The struct tegra_machine_snd_ops is only assigned to the ops field in the
snd_soc_dai_link struct which is a pointer to const struct snd_soc_ops.
Make it const to allow the compiler to put it in read-only memory.

Signed-off-by: Rikard Falkeborn <rikard.falkeborn@gmail.com>
---
 sound/soc/tegra/tegra_asoc_machine.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra_asoc_machine.c b/sound/soc/tegra/tegra_asoc_machine.c
index 735909310a26..3cbe6ef1cf9f 100644
--- a/sound/soc/tegra/tegra_asoc_machine.c
+++ b/sound/soc/tegra/tegra_asoc_machine.c
@@ -313,7 +313,7 @@ static int tegra_machine_hw_params(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static struct snd_soc_ops tegra_machine_snd_ops = {
+static const struct snd_soc_ops tegra_machine_snd_ops = {
 	.hw_params = tegra_machine_hw_params,
 };
 
-- 
2.33.0

