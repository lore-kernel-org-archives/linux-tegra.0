Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC15C433EF
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 130E261105
	for <linux-tegra@archiver.kernel.org>; Sun, 14 Nov 2021 20:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236157AbhKNUKn (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 14 Nov 2021 15:10:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233998AbhKNUKm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 14 Nov 2021 15:10:42 -0500
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91FDFC061746;
        Sun, 14 Nov 2021 12:07:43 -0800 (PST)
Received: by mail-lj1-x233.google.com with SMTP id k23so2720514lje.1;
        Sun, 14 Nov 2021 12:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RU5xQBUXxAeOsUcVaTk34EpclecVINBtsFN9IeNqsuo=;
        b=NpYYTlu7BX++Go6BCjD6CgDjUxAaCvoDImAAVO7yqyhvPBDBZdWGxPwMm9nFsOrrJ0
         g2IwkSTGrldOrGj6q+vbr5gXMEyteOjPp+uS/q+DJiJ4Pw3nUwJWGuCIgASE/iKfzyMe
         4B0jzNLv2slniVlPWRcx3PXDqvYP8+sOh0ujsFfaZkQBGdlmAUIo36H8NXSXCcHBXW8e
         S0LF1tfX9sNOuniDjLDITbFWGERFHSx0eOK/S8mEEcIVOXB9JwsUIstWLyHpN8rCPPyH
         QDFEv3HinBEvc21V21MBLi7fAS6D2N55JBAom47xmMdAWWaovYHVijW+zlXbds41mNJ0
         8iKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RU5xQBUXxAeOsUcVaTk34EpclecVINBtsFN9IeNqsuo=;
        b=3ZVSwN1j1mArX9QlCMpCT0z09SaCUBMt9BxLiy0UHvlOhFzwnQbHwXRccGp8eDTwid
         91dzBH1si+wbWOvskvtjKIC8qVvKoF4Yq3idBNPMJ8OHYBD1j864J5zPM4mGnh2qxNNY
         VLStV6FUP6Vh+8vKk6o484EX2UvGEOMQaPJeYQ4yWhCyBop/jJXTElbaCja9g2lVMYV/
         Z/3bub5+LS3SdpGg9FkAlvWGcW/T/hOTlOifem45NfFRc7Z162Ji4R4t1kBJ6snzk7ie
         AafRCnaelYmgeYIc2pMy6FULIJS4BW3uMDvj/RTUaoZpWwvlFBfTsIlq/bA4sWm8UDcK
         KU6Q==
X-Gm-Message-State: AOAM532AaFwYhaYV16RmthBOIZKkbOdz4BVUTdQSpEUfTb0vRBi11l1j
        d3GMxruTYQheaBe01XIoeCU=
X-Google-Smtp-Source: ABdhPJxprP1KeRUC1FhoUhxkXRU3cVbkUfd7QCJSTsCGLNIkePAMX/w/gCEaOn5x+tU6H8IpjYk5+g==
X-Received: by 2002:a2e:a90e:: with SMTP id j14mr31880345ljq.299.1636920462053;
        Sun, 14 Nov 2021 12:07:42 -0800 (PST)
Received: from localhost.localdomain (46-138-46-211.dynamic.spd-mgts.ru. [46.138.46.211])
        by smtp.gmail.com with ESMTPSA id d30sm1204644lfv.58.2021.11.14.12.07.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Nov 2021 12:07:41 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Rob Herring <robh+dt@kernel.org>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Anton Bambura <jenneron@protonmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/2] Support Sharp LQ101R1SX03 display panel
Date:   Sun, 14 Nov 2021 23:07:15 +0300
Message-Id: <20211114200717.28986-1-digetx@gmail.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Add support for Sharp LQ101R1SX03 display panel used by ASUS Transformer
TF701T tablet device.

Anton Bambura (2):
  dt-bindings: sharp,lq101r1sx01: Add compatible for LQ101R1SX03
  drm/panel: sharp: lq101r1sx01: Support LQ101R1SX03

 .../devicetree/bindings/display/panel/sharp,lq101r1sx01.yaml  | 4 +++-
 drivers/gpu/drm/panel/panel-sharp-lq101r1sx01.c               | 1 +
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
2.33.1

