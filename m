Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D813C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  7 Feb 2022 21:28:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239402AbiBGV2l (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 7 Feb 2022 16:28:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239501AbiBGV2k (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 7 Feb 2022 16:28:40 -0500
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5B6AC061355;
        Mon,  7 Feb 2022 13:28:38 -0800 (PST)
Received: by mail-lj1-x230.google.com with SMTP id u7so20055835lji.2;
        Mon, 07 Feb 2022 13:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhIcXoTJ5dfjGtkY8N0iFOs+egG/OP/6IT1nkIAGt7o=;
        b=ahC61Qw0MuIU7n1LIs+QRHjq+wmaK401ceSHoJ39Ffp8nwaqxS9cxyxxF3g8rf4Awi
         nVpRnxgHDodCJYnVhkoq73m4NBSVODRXNZhSJMBZDgvGwcUM75qoTUrp/DCkVV8eXMcv
         PppPDjZFYNaO4KPmMG34D8gofgX29eBmO6fp5eKQMrH/hkQXlAMNaqEi59IXSyCCErMb
         5iErgc4hvnM2XZoY8VW8irkGeOoeocEnbsgrkMErigYuQ2yYJTdk8cq9aw/tnzl9Ytih
         avjTdN2Fo7kRZuBi8IKVk7FoCnqc0lPIzSy+0KX25BEt4WTjhSUczp1d93+iib23nKZB
         cGTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=xhIcXoTJ5dfjGtkY8N0iFOs+egG/OP/6IT1nkIAGt7o=;
        b=OJNqYIaUXx1oMBo7dUhX/ym5O/8NceIUWZS2W6NHux7hU++NNmuy3U78QvDBYma0Kp
         nw2loJ/p+T/I8izUfEqzoTG5TCkdVvnvt/y1k1Q0K0ES1QRaI5PuMiPhtDQO4KvJt55N
         I3fobQpDsHnzRl/x7ugmNR21zLq64qmE2noV3LCxd/GoXm8z0NoVnYhKctoO/x6ZMNFH
         kIEtH57/z7Vqni6zW1ECie3h6R6F0L87gj8CrwKH3wGWVeIkI0dcvxEN83wgfyK9V7+z
         6oKyYj56VYZaKoQ40n5LpG0dUkS5vrLjOGRTxpxW+l3d2iAJ6TgEOZnYLJ7urEny/VDz
         +ZHQ==
X-Gm-Message-State: AOAM5334P77eXeU1y5U87yr+PSh/DXlgdbAU7W42fm7mY326Ct3o+dFg
        sQ6uDoridcg+4/EOPwLpNYo=
X-Google-Smtp-Source: ABdhPJzdJwOQ3OAxyzQw9jPbMfGhSpp6dMka4vBNLcbB/BW9EMqZzbD06P1tDEeNWJ1beK/wtPADxw==
X-Received: by 2002:a2e:3509:: with SMTP id z9mr884437ljz.488.1644269316992;
        Mon, 07 Feb 2022 13:28:36 -0800 (PST)
Received: from localhost.localdomain (109-252-138-165.dynamic.spd-mgts.ru. [109.252.138.165])
        by smtp.gmail.com with ESMTPSA id i3sm1650867lfj.144.2022.02.07.13.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 13:28:36 -0800 (PST)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        David Heidelberg <david@ixit.cz>,
        Robert Eckelmann <longnoserob@gmail.com>,
        Agneli <poczt@protonmail.ch>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/4] NVIDIA Tegra ARM32 device-tree improvements for 5.18
Date:   Tue,  8 Feb 2022 00:28:22 +0300
Message-Id: <20220207212826.10307-1-digetx@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Here are couple minor DT improvements and enabling of HDMI audio on
Asus TF101 tablet.

Dmitry Osipenko (3):
  ARM: tegra: asus-tf101: Enable S/PDIF and HDMI audio
  ARM: tegra: tf700t: Rename DSI node
  ARM: tegra: paz00: Add MMC aliases

Svyatoslav Ryhel (1):
  ARM: tegra: transformer: Drop reg-shift for Tegra HS UART

 arch/arm/boot/dts/tegra20-asus-tf101.dts               | 10 ++++++++++
 arch/arm/boot/dts/tegra20-paz00.dts                    |  6 ++++--
 arch/arm/boot/dts/tegra30-asus-tf700t.dts              |  2 +-
 arch/arm/boot/dts/tegra30-asus-transformer-common.dtsi |  2 ++
 arch/arm/boot/dts/tegra30-pegatron-chagall.dts         |  2 ++
 5 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.34.1

