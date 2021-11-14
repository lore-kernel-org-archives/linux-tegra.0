Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE221C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AFB5461152
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:05:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236036AbhKNUHs (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:07:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231469AbhKNUHo (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:07:44 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 199B1C061746;
        Sun, 14 Nov 2021 12:04:49 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id e9so30802546ljl.5;
        Sun, 14 Nov 2021 12:04:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McOiS/Q0CFO6uwemy53qifQP3mC9vDonaeYr2NzuA14=;
        b=URyDiCvf5kN1pLBxwuj/DOsEWXm3s7PlS6sTafNgjKH+ktnvoqAplLPWskoD/ZKgez
         WSiAiARt1Drp0Sfd8wXjpfzqTd/tCoeldnrn/UiHUwPT29g3HXB/KuUL7QrUr+2dBB3q
         PaEZPXHe58MEcEzrZpfDAfIdJH4G1XDpxCeNMZ9pLHfKvdlzfOTQnHxNLCDYR9sX9SCd
         /IhO3vKZqjSF+W42ADM1/bgD9OlRlkxBli0RMI0qAxhtpxM0lCADzJISbsylnInEWlSc
         /qkUNv2os3SdBSwiE0ISwO2GbupYIM9auJ3oywIFpzjpcpWptEyjCReJvfp4e0HB7XgP
         cDgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=McOiS/Q0CFO6uwemy53qifQP3mC9vDonaeYr2NzuA14=;
        b=2+vyppYJ44ALPJjNUm8xtt9dIkCqoLYq93Vh3f3mAFbc+8cWuTnYnfVjgrBAxuV9v2
         s1hmFHEtOuWKToQOZACJvygIWpMvxLOHkBGADZK8JiLp7WXFb7/NX4Vp02cZz5o/qIHg
         wv5N3tZI+8NqCLkJQQPDFNoXMhX+rrnzvny7QuPmNlkUiNkZFhHxCEsFezEP5AvREVms
         DkKmwp1JoMeVDa5k5Kwr1JSdfJik9p1bn5Vy+Jd3wagLrCquTE/Zo+EYz4Bmu0Iz7VYA
         SRMVPjPNRTlj6qfmvDEYES8AZeUEFxw8P1Tq7Mr3J7LWyy1nkNeXXKf3s8zBdjHBjV+K
         p2wg==
X-Gm-Message-State: AOAM5322ZqXGAKktz6DV/8gU0jmYLJoVCQK6zZa5jRtowPSvZGxmo2eC
        BS3GNaV5raZbNVFR+GDgF2k=
X-Google-Smtp-Source: ABdhPJxxL1WqMIAul+o3bZ58Im+ZHiPvwoqlenuOM6pTc/79qVsFAir5bH4M6ujqa4zF5rDn5okzJw==
X-Received: by 2002:a2e:a882:: with SMTP id m2mr34863256ljq.416.1636920287459;
        Sun, 14 Nov 2021 12:04:47 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id g4sm1193914lfv.288.2021.11.14.12.04.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:04:47 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Support HannStar HSD101PWW2 display panel
Date:   Sun, 14 Nov 2021 23:04:29 +0300
Message-Id: <20211114200431.28484-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for HannStar HSD101PWW2 display panel used by ASUS Transformer
TF201T tablet device.

Svyatoslav Ryhel (2):
  dt-bindings: display: simple: Add HannStar HSD101PWW2
  drm/panel: simple: Add support for HannStar HSD101PWW2 panel

 .../bindings/display/panel/panel-simple.yaml  |  2 ++
 drivers/gpu/drm/panel/panel-simple.c          | 28 +++++++++++++++++++
 2 files changed, 30 insertions(+)

-- 
2.33.1

