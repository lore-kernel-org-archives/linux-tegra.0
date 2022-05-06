Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1B74C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442225AbiEFOeJ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442204AbiEFOd4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:33:56 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A5F68F93
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:13 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id c190-20020a1c35c7000000b0038e37907b5bso6967459wma.0
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XvzszIaoDVyGIeiyDwUueQbTfRTKog+5eHM5w7GT3Uw=;
        b=KYximoHLvW2jnoDv6V1VvejmoARYe+s05gRb2gHDKNyymp5wvO8XECxRmNIg8UPTwB
         /tTuMIXU2OdiwBalcZZJBv2auLDke+PyuIUaIpQplG6BE2HUxuZ9KQPiJ5qOuz2XfPkA
         P8nQ8jZ6phdo1/AN1e1GzXC2lKLle27Wvc5ykVTZ+r/JlwbezthlU1z8zkwqhHWdJ1tH
         x1ZaPq7O1B/RAvDBSRdJfUAN7yp6scug7KGFYGj7i2FDUiDqrQsTghmGx4oIvC+x3nck
         WLGpsYGy71la7mDqgIwTJ/fufWwa3aMtL+A7OVR2zwD2ZNagVOFYfmr9yva8W4FvmdzX
         fGCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XvzszIaoDVyGIeiyDwUueQbTfRTKog+5eHM5w7GT3Uw=;
        b=lT0StpqM51GCeOSozJKo8JbaTO5wEsDDLN9VeEDwaIiBAqIqt+TT5IRjHCmXM2a7XR
         4b08qswAnDEAsr1T2s/ZSgeMUeVZvBy/Rbu+9RX3qTnGRQJJNUt6GjkKpNGsUF63RZj3
         vDvqaTys9zK0TPVZ08mxak3xHR52OiPwNU1VKtv2ntpgaH5TFkgv02dD+ysefnV8tzlY
         XdQ2iiaVEqEZZyuO41f/UE5neUCrl50BMhLVPz79LolMPgAIUxJXd2w/G/TKXLIxrvCH
         D1n2NWlSKQhTu509KrY9uVXG7tlEJpFF7n8nW2jA6bpNsmw+OhvzKe+w7R1Slnj+qogM
         qDlA==
X-Gm-Message-State: AOAM53116KDFAPUj85kydSuxC4PlwjQH90AburmErjnYxgpw0gkEqxjc
        W8yQ6wkIaR0bqft19hvsHqE=
X-Google-Smtp-Source: ABdhPJwUKR3iNuQKRW1bDmDSsMKBsXpPJcrUwzKrZaVbllOBB3u0Yvtka4c+NPZLtMhCR1Fj7IbwFw==
X-Received: by 2002:a1c:2185:0:b0:38f:f4ed:f964 with SMTP id h127-20020a1c2185000000b0038ff4edf964mr3613394wmh.115.1651847412336;
        Fri, 06 May 2022 07:30:12 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id g6-20020a056000118600b0020c5253d8d6sm3825361wrx.34.2022.05.06.07.30.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:11 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 3/6] dt-bindings: Changes for v5.19-rc1
Date:   Fri,  6 May 2022 16:30:02 +0200
Message-Id: <20220506143005.3916655-3-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220506143005.3916655-1-thierry.reding@gmail.com>
References: <20220506143005.3916655-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 3123109284176b1532874591f7c81f3837bbdc17:

  Linux 5.18-rc1 (2022-04-03 14:08:21 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-dt-bindings

for you to fetch changes up to e2ab93e59bc3c029b61a7091825f193f1a66a1a1:

  dt-bindings: memory: tegra: Update validation for reg and reg-names (2022-04-29 10:32:09 +0200)

Thanks,
Thierry

----------------------------------------------------------------
dt-bindings: Changes for v5.19-rc1

Updates the memory controller bindings to properly validate the number
of entries in the reg and reg-names properties.

----------------------------------------------------------------
Ashish Mhetre (1):
      dt-bindings: memory: tegra: Update validation for reg and reg-names

 .../memory-controllers/nvidia,tegra186-mc.yaml     | 80 ++++++++++++++++++++--
 1 file changed, 74 insertions(+), 6 deletions(-)
