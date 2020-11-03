Return-Path: <SRS0=iIVP=EJ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF695C2D0A3
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 11:44:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7DAAB216C4
	for <linux-tegra@archiver.kernel.org>; Tue,  3 Nov 2020 11:44:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GzuMlUZR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgKCLob (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 3 Nov 2020 06:44:31 -0500
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:15823 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727988AbgKCLob (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 3 Nov 2020 06:44:31 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa142a10000>; Tue, 03 Nov 2020 03:44:33 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 3 Nov
 2020 11:44:30 +0000
Received: from localhost.localdomain (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Tue, 3 Nov 2020 11:44:28 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] drm/tegra: sor: Don't warn on probe deferral
Date:   Tue, 3 Nov 2020 11:44:26 +0000
Message-ID: <20201103114426.546626-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604403873; bh=rntxA0RjiInWM7/UTBNFjUV2RmVmdlOjNbvWUA83d2k=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=GzuMlUZRznf3zmicrEnhFp66Z3L2nqtM0k2iO74oWhwGqAIK4e9MP8OCn9S97FDBY
         xjosivdSGxtLe2svkx3zLl8NoEmxIu8pmWFug7k0JST6aEIyHPRASGayVM1O8oFENj
         Ea6RqZkpJTvfwzGZ9zXPioLWjIsMy/azDvZX8LvBLPuwbw4tSXZ6tW5Ozgc/VZWTN4
         EHMF2dhMVlwif71tCTsnqxJRZzG268oTyM4eYBwc4vQCUkx2IV4CshYublAk36Gr0Q
         F9wxTQobiFqs4GB7ctFG3v7zwx2TaqKR7JRITffDNW60+bXwfo2ZlkFBjV+i3YDOnw
         DhfO07VVuRYpw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Deferred probe is an expected return value for tegra_output_probe().
Given that the driver deals with it properly, there's no need to output
a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/gpu/drm/tegra/sor.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e88a17c2937f..5a232055b8cc 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3765,7 +3765,7 @@ static int tegra_sor_probe(struct platform_device *pd=
ev)
=20
 	err =3D tegra_output_probe(&sor->output);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
+		dev_err_probe(&pdev->dev, "failed to probe output: %d\n", err);
 		return err;
 	}
=20
--=20
2.25.1

