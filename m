Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4173C761AF
	for <linux-tegra@archiver.kernel.org>; Thu, 30 Mar 2023 08:36:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229895AbjC3IgR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 30 Mar 2023 04:36:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54748 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230210AbjC3IgM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 30 Mar 2023 04:36:12 -0400
Received: from smtp-out1.suse.de (smtp-out1.suse.de [IPv6:2001:67c:2178:6::1c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8A8C15FF7
        for <linux-tegra@vger.kernel.org>; Thu, 30 Mar 2023 01:36:10 -0700 (PDT)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out1.suse.de (Postfix) with ESMTPS id 2A00B21A7A;
        Thu, 30 Mar 2023 08:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1680165369; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nk+nWx0KuXQrQdvYfALbavBeBHQWRBm/i1IoakkJR4Q=;
        b=PXxBjEoMcwcZsmfNzzwkpRm/A3jNRQHanWsQSAHWnXCkMJa8d0AF2uOPYzS11xgfe1dm8+
        FHCGSejDQsGXRpPHbm2Khy/cEVRxfdKpF/vfYXfXGrK3HQ9sP3E5izFJYkXSr4H5cXeSsB
        KPq8VQJ/BNf/VxeVifcEGWfYgBPzAcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1680165369;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=nk+nWx0KuXQrQdvYfALbavBeBHQWRBm/i1IoakkJR4Q=;
        b=Z3x6Y2nWqE7BC+lcELM6IJKxxXZI3CLYvaH7vDwnMjwxYpZeNMmhvtSmgNEsECdVf3iWbK
        gM7CUi5iu1JEeRCg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id E2424138FF;
        Thu, 30 Mar 2023 08:36:08 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap2.suse-dmz.suse.de with ESMTPSA
        id MENlNvhJJWQHHAAAMHmgww
        (envelope-from <tzimmermann@suse.de>); Thu, 30 Mar 2023 08:36:08 +0000
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com, javierm@redhat.com,
        airlied@gmail.com, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/7] drm/tegra: Include <linux/i2c.h>
Date:   Thu, 30 Mar 2023 10:36:02 +0200
Message-Id: <20230330083607.12834-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230330083607.12834-1-tzimmermann@suse.de>
References: <20230330083607.12834-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Include <linux/i2c.h> to get the contained declarations. No functional
changes.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/tegra/output.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/output.c b/drivers/gpu/drm/tegra/output.c
index d31c87f48da0..dc2dcb5ca1c8 100644
--- a/drivers/gpu/drm/tegra/output.c
+++ b/drivers/gpu/drm/tegra/output.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2012 NVIDIA CORPORATION.  All rights reserved.
  */
 
+#include <linux/i2c.h>
 #include <linux/of.h>
 
 #include <drm/drm_atomic_helper.h>
-- 
2.40.0

