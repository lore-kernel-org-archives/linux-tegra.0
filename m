Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7C43C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB5DC61250
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 14:35:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346879AbhIXOhO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 10:37:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346896AbhIXOhN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 10:37:13 -0400
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C5F5C061571
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 07:35:40 -0700 (PDT)
Received: by mail-wr1-x42f.google.com with SMTP id w17so28071547wrv.10
        for <linux-tegra@vger.kernel.org>; Fri, 24 Sep 2021 07:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTOLvQ4I78zt6RY+lCR1Ik1AuZ7YtbNQ7u/8e2kSZ0A=;
        b=c1FQ2nVbCdDuu/5xwxCwl3icusEtLU09Egiz3FewB8G0JHWzcBkgPi6gAo9Di+dlKO
         l3e2jzaRKP1JnDZLnsKoAzeY6MLXW7zg7xjqYAkDB01cPzGWDZYjNDVZ0cu9K6M3ekFY
         GMMeLOWzNtEU5nfmUWNX8cuFA6493aTdssxPdYF6dafD10xe8BNORDlUQMpSnxWWc83j
         28gmUHxIFyMKMUHTzfE5n5g+74VAbIKgqARjxQcVy3QOAUDxnbBWRFfLOtIy2vTf78i/
         +dG0TAjkdyMmQ8efcBbd/GoXqxrtpRMgxOiqKKloCORoYPNjE7/9z96itOyw2E9Gtv0h
         v83g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=MTOLvQ4I78zt6RY+lCR1Ik1AuZ7YtbNQ7u/8e2kSZ0A=;
        b=M3p6LCzTznrL+QGn1ZnUNOIh9cnrWADSG1THDKFTApExkUZ4B3Y7qd8K1Eg9Pfhr/P
         GzEaMALVe3dKTIYiKEvQTYtn58/YUTv2y7jm+B1MY6hUGndvrQGf8uX5kB45hPNZk908
         RRw52KT2/sQZYmR2yJ7jBkjoHnQGai2grbpgwRubZI3rZIiL+pOd7bhdvrCFPVAY/y8B
         MiF/kYyhybeJ/ELJ1i5kebNzwC6gtXnMUshYkdV61Ie5XuYjSDOME7tXsqnV3wKvtCKl
         y0TYTvVjpIxxQSkWuvvx7Ky6BJE2ZnYE6CZBhsJR/OcbnXeYEKDpVhCde+AY3EXNStZx
         52og==
X-Gm-Message-State: AOAM533GGtym39Ej47lBv8ukMbCrOXtiW/SfYJLKDL3iW4E45ld5WRtf
        fMrH1+8YDSuKgQkiFo7/4+cqvATyNFk=
X-Google-Smtp-Source: ABdhPJxpiQSzILkoGbsFPQV4lat9txI3cXGHbPnfRf1EBuTkMpOTFQkBL0b06XBhIYKC//RxrTZjZg==
X-Received: by 2002:a1c:e90a:: with SMTP id q10mr2585021wmc.108.1632494139010;
        Fri, 24 Sep 2021 07:35:39 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id c30sm8393016wrb.74.2021.09.24.07.35.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 07:35:38 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.15-rc3
Date:   Fri, 24 Sep 2021 16:35:37 +0200
Message-Id: <20210924143537.1341882-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave,

The following changes since commit 6880fa6c56601bb8ed59df6c30fd390cc5f6dd8f:

  Linux 5.15-rc1 (2021-09-12 16:28:37 -0700)

are available in the Git repository at:

  ssh://git.freedesktop.org/git/tegra/linux.git tags/drm/tegra/for-5.15-rc3

for you to fetch changes up to c3dbfb9c49eef7d07904e5fd5e158dd6688bbab3:

  gpu: host1x: Plug potential memory leak (2021-09-16 18:06:52 +0200)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.15-rc3

This contains a fix for an UAPI error that happens when no IOMMU is
enabled, as well as a few build warning fixes and plugs a potential
memory leak.

----------------------------------------------------------------
Dmitry Osipenko (3):
      drm/tegra: dc: Remove unused variables
      drm/tegra: uapi: Fix wrong mapping end address in case of disabled IOMMU
      gpu/host1x: fence: Make spinlock static

Thierry Reding (1):
      gpu: host1x: Plug potential memory leak

 drivers/gpu/drm/tegra/dc.c   | 3 ---
 drivers/gpu/drm/tegra/dc.h   | 6 ------
 drivers/gpu/drm/tegra/uapi.c | 2 +-
 drivers/gpu/host1x/fence.c   | 6 ++++--
 4 files changed, 5 insertions(+), 12 deletions(-)
