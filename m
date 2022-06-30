Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27F8C43334
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Jun 2022 02:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230272AbiF3CD7 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 29 Jun 2022 22:03:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229489AbiF3CD7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 29 Jun 2022 22:03:59 -0400
Received: from mail.nfschina.com (unknown [IPv6:2400:dd01:100f:2:72e2:84ff:fe10:5f45])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 0EC8F1FCF0;
        Wed, 29 Jun 2022 19:03:58 -0700 (PDT)
Received: from localhost (unknown [127.0.0.1])
        by mail.nfschina.com (Postfix) with ESMTP id E7B141E80D50;
        Thu, 30 Jun 2022 10:02:39 +0800 (CST)
X-Virus-Scanned: amavisd-new at test.com
Received: from mail.nfschina.com ([127.0.0.1])
        by localhost (mail.nfschina.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id I6jifIcQY5J4; Thu, 30 Jun 2022 10:02:37 +0800 (CST)
Received: from localhost.localdomain (unknown [219.141.250.2])
        (Authenticated sender: kunyu@nfschina.com)
        by mail.nfschina.com (Postfix) with ESMTPA id 453521E80D22;
        Thu, 30 Jun 2022 10:02:37 +0800 (CST)
From:   Li kunyu <kunyu@nfschina.com>
To:     lgirdwood@gmail.com, broonie@kernel.org, perex@perex.cz,
        tiwai@suse.com, thierry.reding@gmail.com, jonathanh@nvidia.com
Cc:     alsa-devel@alsa-project.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, Li kunyu <kunyu@nfschina.com>
Subject: [PATCH] sound: delete a semicolon
Date:   Thu, 30 Jun 2022 10:03:47 +0800
Message-Id: <20220630020347.7148-1-kunyu@nfschina.com>
X-Mailer: git-send-email 2.18.2
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

extra semicolons could be deleted.

Signed-off-by: Li kunyu <kunyu@nfschina.com>
---
 sound/soc/tegra/tegra210_adx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/tegra/tegra210_adx.c b/sound/soc/tegra/tegra210_adx.c
index 3785cade2d9a..49691d2cce50 100644
--- a/sound/soc/tegra/tegra210_adx.c
+++ b/sound/soc/tegra/tegra210_adx.c
@@ -191,7 +191,7 @@ static int tegra210_adx_put_byte_map(struct snd_kcontrol *kcontrol,
 	unsigned char *bytes_map = (unsigned char *)&adx->map;
 	int value = ucontrol->value.integer.value[0];
 	struct soc_mixer_control *mc =
-		(struct soc_mixer_control *)kcontrol->private_value;;
+		(struct soc_mixer_control *)kcontrol->private_value;
 
 	if (value == bytes_map[mc->reg])
 		return 0;
-- 
2.18.2

