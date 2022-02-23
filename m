Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976A5C4332F
	for <linux-tegra@archiver.kernel.org>; Wed, 23 Feb 2022 16:21:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242728AbiBWQVt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 23 Feb 2022 11:21:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242761AbiBWQVs (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 23 Feb 2022 11:21:48 -0500
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8AFC6212
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 08:21:19 -0800 (PST)
Received: by mail-wm1-x336.google.com with SMTP id c192so14087679wma.4
        for <linux-tegra@vger.kernel.org>; Wed, 23 Feb 2022 08:21:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVwNHQiSpXBaDORd4lQQJt9AWzBF4ic78fYgBBPQJPo=;
        b=NauvFfpLoCbCxDIbWgtAYUxORV0+Pm9GMMLBBMNQFFa3w7A7dzMoD3EnRZ0ouTVS+R
         Q6JDzZn1fKUvnt1mFj+J0jVy/1HxC7Ui35/+1pA7x+55k40o48CNH2lNMuo/Cc8a7kCm
         BP1EU6Xc33Mku+ovG3A1i5j5P5jSnRzXXsUUfKAjyVwVRoU+gfSrLK05KbSE19A0qW4a
         sCgdYFLW9hPkMMDXc43u+QGql9tTRb9DJJRHii0VArAOlQFOTpScpvpRwgnJZHofkZmT
         CpigxpNJ+N+ErhAzo63UqxQHgm5xM1m/xa8OjnBVuYPxbg1wvdkKj6M+BjmflJn1MlcB
         CSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=fVwNHQiSpXBaDORd4lQQJt9AWzBF4ic78fYgBBPQJPo=;
        b=aYUzNODe6r78BA1GURASJtPBcwyR9cUen2W+z0IqdrNyhcNw7+yrFz/Njtkpmy4mYf
         YwOYZiuHVqx/Shrj1YkwdrGW1e1EMjin4ESgHMrHFFxggM3G2p+LQMCt7KXzxt7P+hFL
         SxxYrJCRk88OwQ/Z3uyq/kohQzMoAr0rOX7D1yFULsjhyaKFHDFXJ3IK5IfFnHjeJ+2z
         /s4uV8HsFA4lWthVGyRKHmsajFMBC0v1VnyIzjquaXfSWgARG88yDMrv/SewWL7yt0LW
         0xDlJiXCHCa4X40b0hThM6bynO1XmW9j3fSYu7DbbvxnFzTiRgKqp/Y+U0bMr5VQzRLB
         AD8A==
X-Gm-Message-State: AOAM530a6ZOaVfYMSoY3YlL2W0m67M154L9rF3bClc+d5mOdiB4cgQut
        IGbESd38L5abmqyJQ8nTec6psEafP50=
X-Google-Smtp-Source: ABdhPJwp5jSP5K1hYmysx536AoQFTu1UPyAZhffySXT1/KlFmWd+MbYWCEd05Im1Uyp0UNs2VcjOEQ==
X-Received: by 2002:a7b:c4cc:0:b0:37d:1e42:4ed5 with SMTP id g12-20020a7bc4cc000000b0037d1e424ed5mr8299912wmk.133.1645633278075;
        Wed, 23 Feb 2022 08:21:18 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id i13sm184128wrp.87.2022.02.23.08.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Feb 2022 08:21:17 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v5.17-rc6
Date:   Wed, 23 Feb 2022 17:19:03 +0100
Message-Id: <20220223161903.293392-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit e783362eb54cd99b2cac8b3a9aeac942e6f6ac07:

  Linux 5.17-rc1 (2022-01-23 10:12:53 +0200)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-5.17-rc6

for you to fetch changes up to 8913e1aea4b32a866343b14e565c62cec54f3f78:

  drm/tegra: dpaux: Populate AUX bus (2022-02-23 13:00:37 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v5.17-rc6

Contains a couple of fixes for Tegra186 suspend/resume, syncpoint
waiting, a build warning and eDP on older Tegra devices.

----------------------------------------------------------------
Dmitry Osipenko (1):
      gpu: host1x: Fix hang on Tegra186+

Jon Hunter (1):
      drm/tegra: Fix cast to restricted __le32

Mikko Perttunen (1):
      gpu: host1x: Always return syncpoint value when waiting

Thierry Reding (1):
      drm/tegra: dpaux: Populate AUX bus

 drivers/gpu/drm/tegra/Kconfig  |  1 +
 drivers/gpu/drm/tegra/dpaux.c  |  7 +++++++
 drivers/gpu/drm/tegra/falcon.c |  2 +-
 drivers/gpu/host1x/syncpt.c    | 35 ++++++++++-------------------------
 4 files changed, 19 insertions(+), 26 deletions(-)
