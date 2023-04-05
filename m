Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58BDFC761A6
	for <linux-tegra@archiver.kernel.org>; Wed,  5 Apr 2023 11:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238001AbjDELpT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 5 Apr 2023 07:45:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58344 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237986AbjDELpQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 5 Apr 2023 07:45:16 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C5B85BB7
        for <linux-tegra@vger.kernel.org>; Wed,  5 Apr 2023 04:44:49 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-92fcb45a2cdso41597666b.0
        for <linux-tegra@vger.kernel.org>; Wed, 05 Apr 2023 04:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680695086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=UJzEmZZc3yqTojp1cCXAx/5ww/J/eKWel2t6QOcpfe0=;
        b=G4sCslsmym4oucAaHVdvrUHqdimpxIj/Aa+2YvsT/1jweJ2Ue8XnN9mCmSMMjoeVyp
         ODEtjqrtSUGrv4/izPx2ejxfSCygkTuDME22ZvG7r/2ZxQBvIholk40wx6Ceq2FyTl66
         UCjkDUGOruBahbeIyKuGZz5EforwLmKDk+2LezVTBvcMFkMI8/+K93AuimHHNbfNMDQl
         Bt8/yo/ZTOZw3hQ1VxBCwTELCNJ/pgAyJqDIdeXS77CFcWtiYGzbJZ+C+ZoDwwp17Fsu
         BRw2hh7LKdsdRi/epdhMytc69/FPADSjHjMHM7qRPhU6SJwN77NZh+qSvAAGaPVu/iv1
         /tAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680695086;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJzEmZZc3yqTojp1cCXAx/5ww/J/eKWel2t6QOcpfe0=;
        b=vkzmNfR6WujgGyNQcd+ZEJPF3JQojj3jcYF7ROgSzaj8/eG71vbpDtvScEdAQkZKea
         24uFXuy9UEWAAK8fNN0Cmg3z739NU9xaOLxQtp31dbBmN0LDTh08JK77CvL5ya2m0hHQ
         hDtAs9w/WNz+0gaSn2i0LOyLBp3JkstzR6ool0Bu31qK4ES8kdgREetj8ER5WOUDHrhn
         XbP2tsh33IdVM2XVQvAsUIGDrHAJThQcJOHD6Ksy0bTfjQ0jOPY3wfQlfGOE2fT1c0C+
         kUSpLm4ve7MZcPVhND/EYQd8XFdppABUc6S4pbjL7lNFPmEdjl1iy3d3cNSZuRMUxhWk
         Rfzg==
X-Gm-Message-State: AAQBX9cSYLnuC+TUgDGU9YzxWZqsEAzcf0LSSpJFHVMQxixnAdCnzKkg
        rbErm/Hl09s+B8Z01Axz0js=
X-Google-Smtp-Source: AKy350Yjb8eektkKM5IxLwH7b7ffwoGZ0mrl7fGph/RUI/lFggIrYlq7NusTJd0mlhbTKQo5ekR1+A==
X-Received: by 2002:aa7:d588:0:b0:4fd:1ff0:2291 with SMTP id r8-20020aa7d588000000b004fd1ff02291mr1512956edq.18.1680695085923;
        Wed, 05 Apr 2023 04:44:45 -0700 (PDT)
Received: from able.fritz.box (p4fc2092b.dip0.t-ipconnect.de. [79.194.9.43])
        by smtp.gmail.com with ESMTPSA id cw23-20020a056402229700b005028e87068fsm5809527edb.73.2023.04.05.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 04:44:45 -0700 (PDT)
From:   "=?UTF-8?q?Christian=20K=C3=B6nig?=" 
        <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
To:     treding@nvidia.com, thierry.reding@gmail.com,
        linux-tegra@vger.kernel.org
Subject: [PATCH] drm/tegra: fix another missing include
Date:   Wed,  5 Apr 2023 13:44:43 +0200
Message-Id: <20230405114443.113834-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Since tegra now compile tests on other platforms the kernel test robot
started to complain that this here is not pulled in under all
conditions.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reported-by: kernel test robot <lkp@intel.com>
Link: https://lore.kernel.org/oe-kbuild-all/202304050946.yGGTKkcr-lkp@intel.com/
---
 drivers/gpu/drm/tegra/fb.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/tegra/fb.c b/drivers/gpu/drm/tegra/fb.c
index bfebe2786d61..35b90fac5a47 100644
--- a/drivers/gpu/drm/tegra/fb.c
+++ b/drivers/gpu/drm/tegra/fb.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/console.h>
+#include <linux/vmalloc.h>
 
 #include <drm/drm_fourcc.h>
 #include <drm/drm_framebuffer.h>
-- 
2.34.1

