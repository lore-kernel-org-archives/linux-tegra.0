Return-Path: <SRS0=aGvU=EK=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E035C2D0A3
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 09:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A8A720786
	for <linux-tegra@archiver.kernel.org>; Wed,  4 Nov 2020 09:23:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="GlEKN/B+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726539AbgKDJXl (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 4 Nov 2020 04:23:41 -0500
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:15071 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbgKDJXk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 4 Nov 2020 04:23:40 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fa273200000>; Wed, 04 Nov 2020 01:23:44 -0800
Received: from HQMAIL105.nvidia.com (172.20.187.12) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 4 Nov
 2020 09:23:40 +0000
Received: from localhost.localdomain (10.124.1.5) by mail.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 4 Nov 2020 09:23:38 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     Thierry Reding <thierry.reding@gmail.com>
CC:     David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
        <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH V2] drm/tegra: sor: Don't warn on probe deferral
Date:   Wed, 4 Nov 2020 09:23:28 +0000
Message-ID: <20201104092328.659169-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1604481824; bh=r60uHgnZqlr9l6QYDsoSG53LtdJOyJ+klHDwosPcDnQ=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=GlEKN/B+1SqetmqM+bk/JLQWvScRc/xe4GcBdq35R+5RKQctlWQa3kKJ8BcJGZi9U
         PAdDUSKwAXN09wj2jP0qiK7+iuF92vBrfis09Nj86KunUfpDvfjj7ybJuHhvTPpdrY
         wqyC+Gg/3jT3d7DV370Lvwik8PcyvuCV8t+MckHS4sbNswr7Eib9q9O8+ZIWaGJHxF
         j1w+llMf2vkRa55dop2gMa0VH0Swu6Ixb+JPObVPyUS0YrqoXcdxWOrZVxERMY5TTW
         MGUXGlj+73cDa8OdRBuWxdNmDAlrZ8EuBCWKpp6/uuJhoOkomDnJTcyGbCv9LfWj6f
         cl5MQY0IwhUEw==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Deferred probe is an expected return value for tegra_output_probe().
Given that the driver deals with it properly, there's no need to output
a warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---

Changes since V1:
- This time, I actually validated it!

 drivers/gpu/drm/tegra/sor.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
index e88a17c2937f..898a80ca37fa 100644
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
+				     "failed to probe output: %d\n", err);
=20
 	if (sor->ops && sor->ops->probe) {
 		err =3D sor->ops->probe(sor);
--=20
2.25.1

