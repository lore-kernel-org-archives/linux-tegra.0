Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF8A5C4361A
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DABA64E6F
	for <linux-tegra@archiver.kernel.org>; Wed,  3 Mar 2021 03:36:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352176AbhCCD2h (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 2 Mar 2021 22:28:37 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:13759 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1838106AbhCBJ2P (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 2 Mar 2021 04:28:15 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603e05070000>; Tue, 02 Mar 2021 01:27:35 -0800
Received: from HQMAIL109.nvidia.com (172.20.187.15) by HQMAIL109.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Tue, 2 Mar
 2021 09:27:34 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.15) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Tue, 2 Mar 2021 09:27:32 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>
CC:     <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] ASoC: soc-core: Prevent warning if no DMI table is present
Date:   Tue, 2 Mar 2021 09:27:12 +0000
Message-ID: <20210302092712.310705-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614677255; bh=zevSqHxMC5QGrkWCFYq/EsEdVzaCU5yAoPM8ypRlfpc=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=PwzcV7EQg1C4LN4dDshBu7voQLeGRdGDb6knwc3i0aY7pbulXizZEPzlimEwg7Auz
         VyCtp7G0k4NgkqvA8LdSckC+FiRgJZzf8v6n+GdryuQo+zooc5z/05b0HG1WeM2Zv6
         KWxbt/lVD4psbsSinv2GrJHw/PxDccMzTpgyDAvK62w1jsa7YlXbA8cpkPYV+ArgPS
         DHZrLuhn1zkEGvAATCWeTk2ZoG6WA+JiFp1SfBhig/pn9squbzWLKsuAT8KzkqjJ5S
         Y3vu4l5jGPPFoaJpzyAStdtikSWK7J5ZLpepSTbc+4XwxN/Pny1TRaCIXB+8HoS9Jo
         wmxINcR98iacw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Many systems do not provide a DMI table and on these systems a warning,
such as the following, is printed on boot ...

 WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!

If DMI support is enabled in the kernel, there is no simple way to
detect if a DMI table is table or not. Note that the variable
'dmi_available' is not exported and so cannot be used by kernel modules.
It could be possible to have every ASoC sound card driver set the long
name to avoid the above message, but it might be intentional for the
long name, that we fall back to using the sound card name. Therefore,
make this a debug print by default to avoid the warning.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 sound/soc/soc-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f6d4e99b590c..f1189e7c1fcc 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -1576,7 +1576,7 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, c=
onst char *flavour)
 	/* make up dmi long name as: vendor-product-version-board */
 	vendor =3D dmi_get_system_info(DMI_BOARD_VENDOR);
 	if (!vendor || !is_dmi_valid(vendor)) {
-		dev_warn(card->dev, "ASoC: no DMI vendor name!\n");
+		dev_dbg(card->dev, "ASoC: no DMI vendor name!\n");
 		return 0;
 	}
=20
--=20
2.25.1

