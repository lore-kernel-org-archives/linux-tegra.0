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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DDFBC433E0
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 60D9364F8F
	for <linux-tegra@archiver.kernel.org>; Thu,  4 Mar 2021 00:08:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234979AbhCCX7y (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 3 Mar 2021 18:59:54 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:9212 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358161AbhCCL4W (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 3 Mar 2021 06:56:22 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B603f79370000>; Wed, 03 Mar 2021 03:55:35 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 3 Mar
 2021 11:55:34 +0000
Received: from moonraker.nvidia.com (172.20.145.6) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1497.2 via Frontend
 Transport; Wed, 3 Mar 2021 11:55:32 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>
CC:     <alsa-devel@alsa-project.org>, <linux-kernel@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] ASoC: soc-core: Prevent warning if no DMI table is present
Date:   Wed, 3 Mar 2021 11:55:26 +0000
Message-ID: <20210303115526.419458-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1614772535; bh=4m4/54FIMd3nVyRMq6v7JqGzyu918YBQawVTaUMBx8I=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=TPCLIFKcv+wAz90NoF7wDd+GzlkGxwrcf/fCzuJ6d7VOED5nzc7bOwHPEgT12p8FM
         5HunMahXtxxTrRmPhv9QUA1qVbnS4VZ+0Fz2blC2l05vzZG6OkA9OMl5i+5PbB2DDV
         zXD6804I0dgUExmdoaeRTln+uE0cPZ4VIH9V0ayG4lT1Fke39YZzgBtcbe+wV309Mb
         dyQj4BG0Sa5UlLhSHmnoTyQW2PPNc3lvphUqikiTiUhk+WIEC8dNcDaiDhj8OFVYNT
         MH7lVhc8fJwI8Ei8CJT9LMghh7lR+Hypvt9a7A0UvdNokt5d7n4KvGYfGnu2TQ7wws
         kF3aomKs1YqmA==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Many systems do not use ACPI and hence do not provide a DMI table. On
non-ACPI systems a warning, such as the following, is printed on boot.

 WARNING KERN tegra-audio-graph-card sound: ASoC: no DMI vendor name!

The variable 'dmi_available' is not exported and so currently cannot be
used by kernel modules without adding an accessor. However, it is
possible to use the function is_acpi_device_node() to determine if the
sound card is an ACPI device and hence indicate if we expect a DMI table
to be present. Therefore, call is_acpi_device_node() to see if we are
using ACPI and only parse the DMI table if we are booting with ACPI.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V1:
- Use is_acpi_device_node() to determine if we expect the DMI table to
  be present.

 sound/soc/soc-core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/sound/soc/soc-core.c b/sound/soc/soc-core.c
index f6d4e99b590c..0cffc9527e28 100644
--- a/sound/soc/soc-core.c
+++ b/sound/soc/soc-core.c
@@ -31,6 +31,7 @@
 #include <linux/of.h>
 #include <linux/of_graph.h>
 #include <linux/dmi.h>
+#include <linux/acpi.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -1573,6 +1574,9 @@ int snd_soc_set_dmi_name(struct snd_soc_card *card, c=
onst char *flavour)
 	if (card->long_name)
 		return 0; /* long name already set by driver or from DMI */
=20
+	if (!is_acpi_device_node(card->dev->fwnode))
+		return 0;
+
 	/* make up dmi long name as: vendor-product-version-board */
 	vendor =3D dmi_get_system_info(DMI_BOARD_VENDOR);
 	if (!vendor || !is_dmi_valid(vendor)) {
--=20
2.25.1

