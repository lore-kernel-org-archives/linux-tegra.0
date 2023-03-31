Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F06D3C76196
	for <linux-tegra@archiver.kernel.org>; Fri, 31 Mar 2023 16:33:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232809AbjCaQdX (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 31 Mar 2023 12:33:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232207AbjCaQdG (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 31 Mar 2023 12:33:06 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2426022E88;
        Fri, 31 Mar 2023 09:29:23 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id y4so91898884edo.2;
        Fri, 31 Mar 2023 09:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680280160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G3EnkvQBvvzze5Eu61l7gVjFY+rjVaPV8wxN9ORbWm8=;
        b=IFSDs06gzi3yqI6LLwUobzcxoUpZTZWK3mpEOvRMZy7vr9TAwadK3qlef/yFWak7GI
         +qcbzDxi9cxuw8rx1ZyqRaZGGs+FetGZBl76c8vrGr4rFxCSwrnanOqqKHTxQiOKzfLB
         wqvzKsmacmK29KsYaHH82u2QzDaFiJuFDiA/HBMcxGKa6c6Fp5ArBsb4ps26+yk09zdV
         gejq/nyvF6ac2jK9kc5jLKKe6RAxCWttqxjR+v1436osx03yIVUi8ZF9brR366r3z3u4
         ZP6blTS2Z7hB4WeKL5yu3uf/qbAcEQc/Uqe2HkFTvdqe+xRbWKTkjshOaQF/ANKRQkbY
         BKEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680280160;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G3EnkvQBvvzze5Eu61l7gVjFY+rjVaPV8wxN9ORbWm8=;
        b=Z503Ipfi3X2wFh+p373afkfcUA5ApRpVxHnA/VYR+Ebq6lX9rStPGOd/lmoa73oiNV
         OrnlCABW/aIuLdzY3l++XP/vLlpyugh74Jr7G2wEq+gxGyjBELCcM1VQy11hLhdfuIOm
         7/xobe0P7lV2bkPyHpsnDiiTdT2WSMGk3Xkic9H9GVexuybLfSdd+frutfQ35bdD6H/C
         m+opy4do2D6Yo5IV38emMNRCoaCPDIL3RCBZOt7P2V09hfpRtvroDtqly6PfnXAqh+EK
         AvD5TUGYoCzOWrL9JaKxbxTJ11s4pP38tNaQslzJ1LocC2hvp8Bh4izWo52JXeo1QImi
         osVg==
X-Gm-Message-State: AAQBX9dU2y+IoIjWUA6yL/itjumXdqST0HUGh1XTmzolrK6JsWfqAaPk
        3XxHPsQ8Vr0bJXjDObKlLSk=
X-Google-Smtp-Source: AKy350Yfb03jO7la9tbyytLQre49eAz/3UWInRpcaZJFjf1YZWpbKu5KpiSnAR/MnNVfiH5TmnT4bg==
X-Received: by 2002:a17:907:7784:b0:930:e2c:ddc3 with SMTP id ky4-20020a170907778400b009300e2cddc3mr26995433ejc.72.1680280160150;
        Fri, 31 Mar 2023 09:29:20 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id hp17-20020a1709073e1100b008cecb8f374asm1135766ejc.0.2023.03.31.09.29.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Mar 2023 09:29:19 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh@kernel.org>
Subject: [PATCH v3 1/4] dt-bindings: tegra: Document Jetson Orin NX
Date:   Fri, 31 Mar 2023 18:29:11 +0200
Message-Id: <20230331162914.16922-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

The Jetson Orin NX is the latest iteration in the NX family of Jetson
products. Document the compatible strings used for these devices.

Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/tegra.yaml b/Documentation/devicetree/bindings/arm/tegra.yaml
index 939a77c767bb..6c13d5e5719a 100644
--- a/Documentation/devicetree/bindings/arm/tegra.yaml
+++ b/Documentation/devicetree/bindings/arm/tegra.yaml
@@ -213,5 +213,9 @@ properties:
           - const: nvidia,p3737-0000+p3701-0000
           - const: nvidia,p3701-0000
           - const: nvidia,tegra234
+      - description: Jetson Orin NX
+        items:
+          - const: nvidia,p3767-0000
+          - const: nvidia,tegra234
 
 additionalProperties: true
-- 
2.40.0

