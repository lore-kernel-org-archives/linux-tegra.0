Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2902DC77B6E
	for <linux-tegra@archiver.kernel.org>; Thu, 13 Apr 2023 08:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230193AbjDMIWT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 13 Apr 2023 04:22:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjDMIWS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 13 Apr 2023 04:22:18 -0400
Received: from mail.kapsi.fi (mail.kapsi.fi [IPv6:2001:67c:1be8::25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD2FD8695;
        Thu, 13 Apr 2023 01:22:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
        s=20161220; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:
        Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:Content-Description:
        Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
        In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
        List-Post:List-Owner:List-Archive;
        bh=KKG30S28GcImO9fjjiMWJCrRczwA06I44fh0HArJMdw=; b=cFxLsR4NhRubxrLXp8YIRnE+ty
        EaYZ+AUsoa+HvlKjdoHKeOOoIWGllAe2t4mW7TN2rs0sCcY1z0E7GgARvD29MNZ0Phb/4L3oW0cD5
        kCNvHprgvJthYCVCv7ejDkx7snyOuCp2F+PtZO7Vym6s9V3lFjGUZNkf/IFOrvE/6nqX715LSmUt/
        +jKYmqmU7S/pSPBMoyijhVaBGeWKdfuWsckjjOfwK1ru9w+tCVP+hjYjoLNBIl5aDFiyd787WARJE
        FCxOEZnWn4bE5eHHky4DyxZq188/LHvEFbrJ6t7ACkFOAeWHuUB8p6MoQLg7mTqZB9+g0wT1aD5Zl
        JLzm3FNw==;
Received: from 91-158-25-70.elisa-laajakaista.fi ([91.158.25.70] helo=toshino.localdomain)
        by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <cyndis@kapsi.fi>)
        id 1pmsDc-008oPu-3l; Thu, 13 Apr 2023 11:22:12 +0300
From:   Mikko Perttunen <cyndis@kapsi.fi>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Mikko Perttunen <mperttunen@nvidia.com>,
        Dan Carpenter <error27@gmail.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] drm/tegra: Add error check for NVDEC firmware memory allocation
Date:   Thu, 13 Apr 2023 11:22:01 +0300
Message-Id: <20230413082202.114721-1-cyndis@kapsi.fi>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 91.158.25.70
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Mikko Perttunen <mperttunen@nvidia.com>

The return value for tegra_drm_alloc was missing an error check.
Add one.

Reported-by: Dan Carpenter <error27@gmail.com>
Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 drivers/gpu/drm/tegra/nvdec.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/tegra/nvdec.c b/drivers/gpu/drm/tegra/nvdec.c
index ae78a81e5eef..15ce5e89fad4 100644
--- a/drivers/gpu/drm/tegra/nvdec.c
+++ b/drivers/gpu/drm/tegra/nvdec.c
@@ -276,6 +276,8 @@ static int nvdec_load_falcon_firmware(struct nvdec *nvdec)
 			return err;
 	} else {
 		virt = tegra_drm_alloc(tegra, size, &iova);
+		if (IS_ERR(virt))
+			return PTR_ERR(virt);
 	}
 
 	nvdec->falcon.firmware.virt = virt;
-- 
2.39.2

