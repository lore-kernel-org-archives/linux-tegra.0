Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B141C433FE
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 31AE9610CA
	for <linux-tegra@archiver.kernel.org>; Sun, 26 Sep 2021 23:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232210AbhIZXjJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 26 Sep 2021 19:39:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232182AbhIZXjI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 26 Sep 2021 19:39:08 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 39D21C061575;
        Sun, 26 Sep 2021 16:37:31 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d6so46698621wrc.11;
        Sun, 26 Sep 2021 16:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0SaHnwHD1gi0FyPi9PTObqAr6rfKxQusrhprm2lVB2E=;
        b=qKMqk4bQNMkxGUurX6zAHFEdiCL50HBnaeOc5/xFC4sRmRBGO/djVSrkZNm1RqXjIG
         gCOI2meQzIvGD8RLf80pV5k+qXKGmGDOfzW3MyJGVekvnChB0j8L23J/rvC3IHbvFL/7
         ly9gph6PBihJd55agwqC4FQO5QTIrblFdyC1Dn55TniideaJJSaIL72990R9st69Wtk6
         SKuYLK1NH/XZ8rn90feZOWAIuWDu5SwcKPVS/bzH5IbBjjh2z0hge/Qv618xepVNS6Lk
         G6YSXZjBYzfhRyfWFCjfomSNWdMxPx1s1GfQHlhiXdQanLSI8gsL83tEX2wO7ULPKpSX
         m1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0SaHnwHD1gi0FyPi9PTObqAr6rfKxQusrhprm2lVB2E=;
        b=OR2RVBIbcuHH0V3JoZbtjC/82SsTl3eW8FslRxAXkRvWccp04dClc8bnyPHaFuuAk3
         8dx8zo8pZ8jCJGEWNuODceQlUwGy0x8g6j+XNDyvrPiRd4GkqVLdd1SzUb4hfosGodAw
         gx5E/mc6uor9DLWWHc/S8J+BqchtFQ5OCa0kqecWswugVF+oimyDT/h0G8g1fv4X9Ckk
         rwLLV1sPXqdBY5f+XIN7KebDLfbuyHidhpfGTJEEXjFdlExXLL8JlY3W8jWDMas7pRMV
         01pT/uCBtzh4Jbk0tZeiZ11xPr10xvCtzOEHckhPtChWza/kHd6ovxwXweGhPKBr78MK
         xH4w==
X-Gm-Message-State: AOAM530Dyum5K9LwdfNuOknl78FaONXbdmtlb82/faHwfNk3fqlvo5BI
        ZTfOqbx0nuJohWr1cSfd3Vk=
X-Google-Smtp-Source: ABdhPJy/mgMSQ0WBJ1dw/MAoEKdz2ImoOImrcnV/ZhkiSXA+PawJ8TxtArdalNXf419YrE31tbLKog==
X-Received: by 2002:adf:fb44:: with SMTP id c4mr24678283wrs.179.1632699449880;
        Sun, 26 Sep 2021 16:37:29 -0700 (PDT)
Received: from localhost.localdomain (46-138-80-108.dynamic.spd-mgts.ru. [46.138.80.108])
        by smtp.gmail.com with ESMTPSA id y7sm12493698wrs.95.2021.09.26.16.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Sep 2021 16:37:29 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v1 1/3] ARM: tegra: acer-a500: Correct compatible of ak8975 magnetometer
Date:   Mon, 27 Sep 2021 02:37:02 +0300
Message-Id: <20210926233704.10164-2-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210926233704.10164-1-digetx@gmail.com>
References: <20210926233704.10164-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: David Heidelberg <david@ixit.cz>

The "ak,ak8975" compatible is not recognized by dt-bindings, it's
deprecated. Use supported "asahi-kasei,ak8975" compatible.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
index 2280d75b66ab..5ac288fa9c5e 100644
--- a/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
+++ b/arch/arm/boot/dts/tegra20-acer-a500-picasso.dts
@@ -543,7 +543,7 @@ i2c@7000d000 {
 		status = "okay";
 
 		magnetometer@c {
-			compatible = "ak,ak8975";
+			compatible = "asahi-kasei,ak8975";
 			reg = <0x0c>;
 
 			interrupt-parent = <&gpio>;
-- 
2.32.0

