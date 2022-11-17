Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4EE3C4332F
	for <linux-tegra@archiver.kernel.org>; Thu, 17 Nov 2022 22:44:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233679AbiKQWoS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 17 Nov 2022 17:44:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231274AbiKQWoR (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 17 Nov 2022 17:44:17 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8C34D1759F
        for <linux-tegra@vger.kernel.org>; Thu, 17 Nov 2022 14:44:16 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id k2so8850297ejr.2
        for <linux-tegra@vger.kernel.org>; Thu, 17 Nov 2022 14:44:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7quD5Hy3ZWcPrpDWeaqeNjMDNzDYEXAy9NXdrwbcOnU=;
        b=q5WrBnSlx8pHrOHphw4/YZQmXS5GKpMW+DHOD9fthYRsK3Au0XWJoNEYppEhTj9KPB
         yQyzs5oJt8v9rPvjIwj+bYhfl1thHAfjSRrkf3BLVkF7CQv+F1l18LJbk1ozk9cb4/Sb
         HjvozOA78Aj52/Dvy9NmNdlUYYubAP73NvB3jKp33EHlWHXIDEbTsN5Zgjw7I+i0oeYN
         cuiQkqeVlzW+25nA8lmazGRvWdc1A/sVBYB7hg+kIhj2FJ75zpaG8dSsBuv7oPcR79gu
         3O1iIc6am6YVyI/SeuLalHuoirB0YNpQrbtg4ofD8IPhIGAaE0S/uHG+PyStlFXk4+rs
         8Iug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7quD5Hy3ZWcPrpDWeaqeNjMDNzDYEXAy9NXdrwbcOnU=;
        b=cgKV9jR3Zfev5MT1LgGKLvtdRqKFWS0uVU/pQkT8ES/crzwaqm/f9Kkcp1NaksAxfm
         OkDCObb5H7GCI9oimTBlxyxTnpp2bf0y773Q22Sqf+lwMx+FVGDgPpqPto1uAxqAAlhx
         lM2YEi7I7oSV9YoWwXpGJnKpzPtpJrWf5kELgHd8917Id2C7XiWZCt3w1tg8vvRuG9Oe
         aErB9V1iCOK49qwcycpmAB/fiNBDvpQ7nId0K+m8Zr6cTbIMC4c+nMlk2KvrjuNtcvLX
         kmhUEpkNBDVNynDXCleY31YV4rJdufgtcaxXLmvvbcxlwO6WjiZR5egk8PR41i28w+h8
         dp/w==
X-Gm-Message-State: ANoB5pkDnrMSVU1vZR5S7x0Ck7hbg7ybkPZgErGVdNutP3kNlhHByxzS
        X2aU4o994k5+QjwvlHSeLzg=
X-Google-Smtp-Source: AA0mqf7E8OF8jcneLd9IXB70pKLdrySUW/wxBnItA+wIiC3LDnosCm8PfPWWL4m3U3hrUroVHfT49Q==
X-Received: by 2002:a17:906:19d7:b0:7b2:b782:e1df with SMTP id h23-20020a17090619d700b007b2b782e1dfmr130068ejd.308.1668725055059;
        Thu, 17 Nov 2022 14:44:15 -0800 (PST)
Received: from localhost (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id eo14-20020a056402530e00b004588ef795easm1060882edb.34.2022.11.17.14.44.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Nov 2022 14:44:14 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dave Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL] drm/tegra: Fixes for v6.1-rc6
Date:   Thu, 17 Nov 2022 23:44:14 +0100
Message-Id: <20221117224414.2374127-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi Dave, Daniel,

The following changes since commit 9abf2313adc1ca1b6180c508c25f22f9395cc780:

  Linux 6.1-rc1 (2022-10-16 15:36:24 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/drm/tegra.git tags/drm/tegra/for-6.1-rc6

for you to fetch changes up to ce071fc9ceafd339b74631d4907d77f2e9ef1b0c:

  gpu: host1x: Avoid trying to use GART on Tegra20 (2022-11-10 11:21:18 +0100)

Thanks,
Thierry

----------------------------------------------------------------
drm/tegra: Fixes for v6.1-rc6

This contains a single fix that avoids using the GART on Tegra20 because
it doesn't work well with the way the Tegra DRM driver tries to use it.

----------------------------------------------------------------
Robin Murphy (1):
      gpu: host1x: Avoid trying to use GART on Tegra20

 drivers/gpu/drm/tegra/drm.c | 4 ++++
 drivers/gpu/host1x/dev.c    | 4 ++++
 2 files changed, 8 insertions(+)
