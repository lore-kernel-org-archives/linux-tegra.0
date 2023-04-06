Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A5ACC7618D
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 12:49:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238032AbjDFMsm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:48:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237645AbjDFMsJ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:48:09 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70C6B11C
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 05:48:08 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id l15so1094258ejq.10
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 05:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EP3pWoThzxNHvqPa+xfASwdPg7dot4xq5Kg3CfDSY8o=;
        b=b5ZFEB2OJgUR3afX1uEmCBWj9H8BCyx/vbkn3JTjzU7lMKWXz8uvG12uoV4X7IZx2a
         f4MCqfZi0Z+Tm7qRn8FyIT7U5qI2R2jaI/BUrB3SXYCv6qqZvewlktPlwQSsMOO+GT9t
         I+bTw1o6FZmez2RteHa7ox8HqDjgLJrVMfrS9o8tMGmrRHh3ZQfKKE4O1Ev7UJ0aso2i
         PkC7HUHE+cmEiKxVmzOoWuNxJCY2+Bbp5J+BeDuA76y1knKfrQUf4Jb4YDbo0C7UPQoU
         Buay7IGYg2ve9yKeYpqFol4An9jCFch9ULHpxS97ZuSnq14NgrgjMn15sIouflOlFKgC
         fT+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EP3pWoThzxNHvqPa+xfASwdPg7dot4xq5Kg3CfDSY8o=;
        b=EQmRnsRBzM6lTDfG+76yrC82eR3Q5IZXQr6gkG7Z4wC6SnCdBej4U0NYDzfoms9ycE
         m84p26LUt4eqzzakttSgiyTXAO1yRjuH0XdEmjG5Td0rQTAIstCAPcHDRySX1RbEkfg+
         GBMhMlgeLyM2nW4sOzZ32fYE7CN+jA0rgqBj/+L0+DK1W/7EoGBerGisF8V4uCVSYXIL
         j9CkUBsckIy3Fij05EpepOqIt3pEmeSXGyKjFiuN1IAI4qpmtSxfbicQWvnXEdCWhW2c
         +fSeeJRWK5IzjDFJM9p9st1ZSMBzJebuqLf82zy4FHMh0MpvdEERE9fi7hUlasiwZHA4
         eVVw==
X-Gm-Message-State: AAQBX9fNBBk/uAf4vnBdhd19VxE3CAxXEjv5KeKXT7EJJ1bauLWfGVf/
        xuYCScZrA/AImlllE+V3ql4=
X-Google-Smtp-Source: AKy350YXQtNJ66qZW0DYBXxnghnb5q4N1dEGs04/9d/3jbwLyuWpNIV9ZakPEe1v49M4zU91KARp5g==
X-Received: by 2002:a17:906:6851:b0:931:af6a:ad0f with SMTP id a17-20020a170906685100b00931af6aad0fmr5936423ejs.76.1680785286754;
        Thu, 06 Apr 2023 05:48:06 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id jr3-20020a170906a98300b00933356c681esm771775ejb.150.2023.04.06.05.48.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:06 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/7] soc/tegra: Changes for v6.4-rc1
Date:   Thu,  6 Apr 2023 14:48:00 +0200
Message-Id: <20230406124804.970394-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230406124804.970394-1-thierry.reding@gmail.com>
References: <20230406124804.970394-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-firmware

for you to fetch changes up to 8c47b8253f4cfd8b4dbda8c9adc1d0b1d7f3009d:

  firmware: Use of_property_present() for testing DT property presence (2023-04-04 21:51:23 +0200)

Thanks,
Thierry

----------------------------------------------------------------
soc/tegra: Changes for v6.4-rc1

This contains minor fixes and cleanups. Note that one of the patches
here includes ARM firmware changes, but I picked that up after checking
with Sudeep and Rob because it didn't seem worth splitting it up any
further.

----------------------------------------------------------------
Mikko Perttunen (1):
      firmware: tegra: bpmp: Fix error paths in debugfs

Rob Herring (1):
      firmware: Use of_property_present() for testing DT property presence

 drivers/firmware/arm_scmi/optee.c     |  2 +-
 drivers/firmware/tegra/bpmp-debugfs.c | 12 ++++++++----
 drivers/firmware/tegra/bpmp.c         |  6 +++---
 3 files changed, 12 insertions(+), 8 deletions(-)
