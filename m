Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D4BFC6FD1C
	for <linux-tegra@archiver.kernel.org>; Wed, 22 Mar 2023 17:49:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjCVRtu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 22 Mar 2023 13:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230136AbjCVRtt (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 22 Mar 2023 13:49:49 -0400
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com [IPv6:2a00:1450:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE7E5DC85
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:49:47 -0700 (PDT)
Received: by mail-ed1-x52b.google.com with SMTP id b20so43309840edd.1
        for <linux-tegra@vger.kernel.org>; Wed, 22 Mar 2023 10:49:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679507386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Brqf9H0laJ8u+DYDleJIwtFoT2fzYdX2rr0CX+x499Y=;
        b=mdlidY1TIFYDWgx65gxNofWZZlmiNGEoPaeJmrt9fG5ThZFkEa6Gi1FElgBHC1oED1
         vdKQjZLFhKaX4lcbG++t9EKU1KMpvcE+n9VRpYcQq7BeMww1gPzTC4q7ASTSJRD0kbMU
         WbeyYhF5iFITtUy9+NkjHWc6Lxm0Je0HRGZJ9rFR653HUx3BfD/5kRYoWpacesHkM1QH
         ++3yNpdajmdmYToUbOl43+2KZB8xonMQ343/9tGzEiw7JA+EzMDPDlPQpopDjgi1LoBu
         xtLinroJT+p2Q110gaHLhoN1PO4k6UH0HP9j9dL+mSklGyMs18iW0A5LpkkJCzDMk3dC
         XnbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679507386;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Brqf9H0laJ8u+DYDleJIwtFoT2fzYdX2rr0CX+x499Y=;
        b=2kP89FlsreMUIndzDXnZloV6Py9gN9WNQjFNv+HpQeQM3mBBvqGwD1q40L1KsaJSUR
         mbPEGSn4ReuEmOH6psM9P+pLEOOuhvQv0hgpdKKVCZk3k5ltC/iYj2/yb44O9rABxfW/
         euHjHJcHNy0SLK7K+baBYuR8uxrgfAsifwdJVUMKk9xvm1tq0G/vp+2zdE8W0wKp8NUo
         G8IAreTEHcD/ZSRbLL85xZrYU32L3r4bFmVfzUfRXoOmx/M8+PxPSdp8GcA2E5J4/5NV
         pNgGq+S02ITTFiQCt9XpCFczphWuFbdbfIwYqFj5vyxra/YqXoqxp4rbe47czPn91Q94
         PO3w==
X-Gm-Message-State: AO0yUKWOCYnSk8wqQK4oEZNsTgpG+EjOtNXWqm49cizqwJA7DtXsKZ/y
        mZzGaMRSqzu6hwcy/HU7yBtRvIKExspBkOP3rrg=
X-Google-Smtp-Source: AK7set8OjPrOjvr4B/ORjmdJ8FAG3SDmimrAAx7kPFUY/jMvgqiNKdZRgm9MAksiiDBs1srmITKuiQ==
X-Received: by 2002:a17:907:75d8:b0:8aa:502c:44d3 with SMTP id jl24-20020a17090775d800b008aa502c44d3mr8041080ejc.41.1679507386168;
        Wed, 22 Mar 2023 10:49:46 -0700 (PDT)
Received: from krzk-bin.. ([2a02:810d:15c0:828:5050:151b:e755:1c6])
        by smtp.gmail.com with ESMTPSA id w11-20020a1709067c8b00b009231714b3d4sm7401364ejo.151.2023.03.22.10.49.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Mar 2023 10:49:45 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
        linux-tegra@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH] memory: tegra: remove redundant variable initialization
Date:   Wed, 22 Mar 2023 18:49:44 +0100
Message-Id: <167950737690.817132.16717008375791109925.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230319171303.120777-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230319171303.120777-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 19 Mar 2023 17:13:03 +0000, Diogo Ivo wrote:
> tegra210_emc_table_device_init() sets count = 0 twice, so
> remove the second instance.
> 
> 

Applied, thanks!

[1/1] memory: tegra: remove redundant variable initialization
      https://git.kernel.org/krzk/linux-mem-ctrl/c/2ae66ecc0825b0b4707384772b848c79b0986ef5

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
