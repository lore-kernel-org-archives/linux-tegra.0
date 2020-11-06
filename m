Return-Path: <SRS0=26Yb=EM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54A26C5517A
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 09:14:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DBAD2208B3
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 09:14:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="TjxdrtYp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726503AbgKFJO2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Nov 2020 04:14:28 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19469 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725868AbgKFJO1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Nov 2020 04:14:27 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa513f60001>; Fri, 06 Nov 2020 01:14:30 -0800
Received: from HQMAIL107.nvidia.com (172.20.187.13) by HQMAIL101.nvidia.com
 (172.20.187.10) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 6 Nov
 2020 09:14:26 +0000
Received: from moonraker.nvidia.com (172.20.13.39) by mail.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Fri, 6 Nov 2020 09:14:25 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V3] drm/tegra: sor: Don't warn on probe deferral
Date:   Fri, 6 Nov 2020 09:14:20 +0000
Message-ID: <20201106091420.773062-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604654070; bh=aKTFlrpqLCkiGuH1D+3SmNI+TCihd2e9AeWXjqSfdIQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=TjxdrtYpeRrwSpVHKEE2GTnd4ALHUZOUhGiAaZgWx4a8cutp4FUt09DCSiL2TgwC0
         GQKSTwmHh1ObVWNd/XBHOEXSrqkomKWlccX6WcleeXrSLr1lOFDOB1ydvh3/ZBvGVK
         RJfP7rtgqVMGFc9xQiZD2lG3JU8WAJS/Ma0GE9i0hz3A0xLCRPMsRjWuCR4SZER2VR
         c0Ufgjdah5Jic/zRzKpBnhfWKqjwKiq9XVKqN+Uo5jQD/5CuVn4kWEZei/TrllCrnQ
         PxWPXCGOEnm9Utc3I/Cb9jqUdX0daiTVJ1GbZlUj1vJZ5tVXSVQd4jd77AFOdo/y+g
         hHryeCHzsu5Mw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Deferred probe is an expected return value for tegra_output_probe().
Given that the driver deals with it properly, there's no need to output
a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
Changes since V2:
- Removed duplicate errno print
Changes since V1:
- This time, I actually validated it!

 drivers/gpu/drm/tegra/sor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e88a17c2937f..a5b944dacb35 100644
--- a/drivers/gpu/drm/tegra/sor.c
+++ b/drivers/gpu/drm/tegra/sor.c
@@ -3764,10 +3764,9 @@ static int tegra_sor_probe(struct platform_device *p=
dev)
 		return err;
=20
 	err =3D tegra_output_probe(&sor->output);
-	if (err < 0) {
-		dev_err(&pdev->dev, "failed to probe output: %d\n", err);
-		return err;
-	}
+	if (err < 0)
+		return dev_err_probe(&pdev->dev, err,
+				     "failed to probe output\n");
=20
 	if (sor->ops && sor->ops->probe) {
 		err =3D sor->ops->probe(sor);
--=20
2.25.1

