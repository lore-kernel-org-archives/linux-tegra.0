Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2598DC433F5
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10F9861130
	for <linux-tegra@archiver.kernel.org>; Wed,  6 Oct 2021 22:49:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239819AbhJFWvM (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 6 Oct 2021 18:51:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239851AbhJFWtm (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 6 Oct 2021 18:49:42 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58657C061746;
        Wed,  6 Oct 2021 15:47:49 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id a14so2987872qvb.6;
        Wed, 06 Oct 2021 15:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=BzEsakUalTivewsFW2Yd2Avwfz1+J2TGxCg0pwP1Sao=;
        b=MABdq9r8Ztjgpoj3hLbtjNdSUcuRFEJXrFmP4RZBFiWAI9YTl1E6NJ51ERjKZvHR14
         aszWembgYbDQhecfItgOIulDGdeqhunuYDkO4Xsh42j5gMGJDH0+mLwEwR6PLWIkYdAa
         h826yoa9wVME+a/94if6OXUcdMYyDpn89jPP5SFG+vJwlzFvDLcp1zF7hOgLby7BlUrZ
         aa3qOClVfNRQdt4HqDBpLrN/wMYDnVygyjyTIKptj5bd0gBeEet9Ri4Tm1/l2ZdwCEE6
         +sCda+BarTm1nYojpLHyXJI7uBg9BNC4Y0sqZb+SRDEW/KD2p9WLfK8Hakb9zjp3n+oK
         Safg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=BzEsakUalTivewsFW2Yd2Avwfz1+J2TGxCg0pwP1Sao=;
        b=eaMnCs68V05Gb9q9fvjJ1xiw3lwzfpDsI/MZpqYXM83akL2wivXR2nTMrDkbHbMhNE
         VFADGUkVBbeUQEBGgUzVDXqgXe6eWcTfhe5dmQWWacOYiabzh9EgLAM6UjoiPMFlmuDl
         tvyCQ8cdEwQmckZWZ8YONBgPseXNfx4xvyU6bIzMDc3TUVxKw6RyjPh25TQB90BTh9tS
         UXLHNw94PHK/rn8brHJpKw09gCWTJ2bbKz9pivpDQ1QQr6TGMJC8lvpCmWqQdrD0PSQZ
         YkOQLYKDKaFe35wK1ZXCMBVAbIDxRY+XAAfARKxwz9UBo6IeREnRE8Tyfy0zFZ6BhfGu
         XMxQ==
X-Gm-Message-State: AOAM5300f02/NSmhujknu/7Yg4QnQ7OUfuuFO1ME3VMDYgZMZelY2sYu
        P5HOjDLV+RSBGUjDMS2MKI1xrLrT6w8=
X-Google-Smtp-Source: ABdhPJzL0zou6p35ipO4N2b/ob7VuhRIRm3gyUHUrRn8PRvp4jtUv21D+K6sWNNe4xXqp7vnb0yMpg==
X-Received: by 2002:ad4:554a:: with SMTP id v10mr856362qvy.29.1633560468508;
        Wed, 06 Oct 2021 15:47:48 -0700 (PDT)
Received: from localhost.localdomain (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.gmail.com with ESMTPSA id n11sm14738166qtk.92.2021.10.06.15.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Oct 2021 15:47:48 -0700 (PDT)
From:   Dmitry Osipenko <digetx@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: [PATCH v5 4/9] dt-bindings: memory: lpddr2: Document Elpida B8132B2PB-6D-F
Date:   Thu,  7 Oct 2021 01:46:54 +0300
Message-Id: <20211006224659.21434-5-digetx@gmail.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211006224659.21434-1-digetx@gmail.com>
References: <20211006224659.21434-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Elpida B8132B2PB-6D-F memory chip is used by ASUS Transformer TF101
tablet, add compatible for it. We need to specify this compatible it
for a device-tree node containing corresponding memory timings in order
to allow software to match the timings with the detected hardware.

Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
---
 .../devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
index fe573750577e..25ed0266f6dd 100644
--- a/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
+++ b/Documentation/devicetree/bindings/memory-controllers/ddr/jedec,lpddr2.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - elpida,ECB240ABACN
+              - elpida,B8132B2PB-6D-F
           - enum:
               - jedec,lpddr2-s4
       - items:
-- 
2.32.0

