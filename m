Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEEACC388F9
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:37:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C0A620797
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Nov 2020 10:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nvidia.com header.i=@nvidia.com header.b="pnAWsDCy"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725962AbgKKKhR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Nov 2020 05:37:17 -0500
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3278 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725860AbgKKKhQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Nov 2020 05:37:16 -0500
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
        id <B5fabbed70000>; Wed, 11 Nov 2020 02:37:11 -0800
Received: from HQMAIL111.nvidia.com (172.20.187.18) by HQMAIL105.nvidia.com
 (172.20.187.12) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 11 Nov
 2020 10:37:14 +0000
Received: from moonraker.nvidia.com (10.124.1.5) by mail.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server id 15.0.1473.3 via Frontend
 Transport; Wed, 11 Nov 2020 10:37:12 +0000
From:   Jon Hunter <jonathanh@nvidia.com>
To:     JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@ti.com>,
        "Vinod Koul" <vkoul@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
CC:     <linux-kernel@vger.kernel.org>, <linux-tegra@vger.kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>
Subject: [PATCH] phy: tegra: Don't warn on probe deferral
Date:   Wed, 11 Nov 2020 10:37:08 +0000
Message-ID: <20201111103708.152566-1-jonathanh@nvidia.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1605091031; bh=BvyW3flY3VfWoU/iKHgsKZMEtMA4ZQy5sZEOEeAGGSM=;
        h=From:To:CC:Subject:Date:Message-ID:X-Mailer:MIME-Version:
         X-NVConfidentiality:Content-Transfer-Encoding:Content-Type;
        b=pnAWsDCyXUEKTKvxQxOT4wEhLvQMdi3lT8pOCO53Tvn8wGiSjkgat7FvUUnmhTA49
         e9T9QZXmi13eQwWyjwIaT4RbXh3WUFw39A4lZzCrogWWMZrWSacGAIC8pEvf0C0AQP
         Ezq/4Ldhy3g0qHmbuznXUQj1kWhHUVyLqAk4rt8q2K/W+BsE+FbOVhu765FHmb01Ee
         eQo3zA2BJJtaYKLmPsjmEu6Asowz+kq5JpB2/TwZS3q0sCzviKV6KmCwtd57Cdv2yC
         sCL1rswPEWTko2LSWkYzIns2Dnnfvvk/iRSILbVRl3Ff+rWDO+JS42E90WBX/vd90U
         +uoV6XKqixaZg==
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Deferred probe is an expected return value for devm_regulator_bulk_get().
Given that the driver deals with it properly, there's no need to output a
warning that may potentially confuse users.

Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
---
 drivers/phy/tegra/xusb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/phy/tegra/xusb.c b/drivers/phy/tegra/xusb.c
index ad88d74c1884..2eafb813825b 100644
--- a/drivers/phy/tegra/xusb.c
+++ b/drivers/phy/tegra/xusb.c
@@ -1200,7 +1200,7 @@ static int tegra_xusb_padctl_probe(struct platform_de=
vice *pdev)
 	err =3D devm_regulator_bulk_get(&pdev->dev, padctl->soc->num_supplies,
 				      padctl->supplies);
 	if (err < 0) {
-		dev_err(&pdev->dev, "failed to get regulators: %d\n", err);
+		dev_err_probe(&pdev->dev, err, "failed to get regulators\n");
 		goto remove;
 	}
=20
--=20
2.25.1

