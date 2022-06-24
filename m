Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5954ACCA47E
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Jun 2022 16:06:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230474AbiFXQGm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Jun 2022 12:06:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230463AbiFXQGl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Jun 2022 12:06:41 -0400
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9896562DB
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:06:40 -0700 (PDT)
Received: by mail-wr1-x42e.google.com with SMTP id o8so3755652wro.3
        for <linux-tegra@vger.kernel.org>; Fri, 24 Jun 2022 09:06:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=XD25QM33us7hPEequuu5UA72HkDpqMdvG8CesGBJr0o=;
        b=tTfKAwsZQSYXujHGO/BsaRvBdcaNwCqG7HIiKalwbqfhHKdbZSkZ/5Or17qeliqKGq
         JDE2vMnl6zH0zQBkFTUAL3hK84XBjWM3WPVKld8QV4Dr4WcQ5JYi6dBVYFr2vj5gUeSA
         Ly+HGwKo5x9GS54htRUXP3ZtOsH0H3okkdgBWMat9yKyK4/GMwBwrQ/GkOSS2p5L9h2Q
         ALP7JernsUKXZV+TrFDXJDx8i8NDjodlVrGA69kYvyfI2dIXRfc6dntOP6rwx44y3qm5
         8jSNWJNk4cBFM5UlKr1EnEbfqzKbZYab2vAnI81m4WGZBaxmO4EfqgLLjH4O2rQeZan8
         EDAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=XD25QM33us7hPEequuu5UA72HkDpqMdvG8CesGBJr0o=;
        b=MOkBtgL+WZMrerAp/4qjoZBFuJ3Uz4QdoA6LD8YjAmILoQpE5yJznyM60S9eDJhtpw
         ia9XcvY8vdjBAF8VzLUY6SbQF7nkGUn/nVeaMleUeshQVwbrdxjeyHfhivfP6XticP4m
         OF6lPY3RQIvNIwtma4lIpIMvKTd9fmmNN/2X/yyoDEGzb4nD4DOAE1Ox7rTYIdM9kV7W
         q8eU1xWGsRuiiMXtsihr2m6jZNaiPqhXxDDyaYonMXEX6XdsTnQsEHeG3VKnmEbnzIp4
         /q0XBhUVreDjV/umNF4cH0EmVjt6dAQvMfR7OvWdpGQbrRJO/eKircxpuDptl86u2Z+G
         T9Aw==
X-Gm-Message-State: AJIora/0G05UWrspZ6Jes34WBhe39qFU2ILg+H+1L9/cM2rZXWIF4hqk
        u0R2l38ueFBt8IjX09TRKGZ4Vqo9H/T7Kw==
X-Google-Smtp-Source: AGRyM1uubThZWxs0LtJdne3P4esvibl90VzKex8ROZDrXmt3/kumeOoNNP4LbTVIZXQ4u0xtRlU3tw==
X-Received: by 2002:a5d:50d0:0:b0:21b:978f:e54 with SMTP id f16-20020a5d50d0000000b0021b978f0e54mr14021882wrt.612.1656086798942;
        Fri, 24 Jun 2022 09:06:38 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id k1-20020a5d6281000000b0021b9e360523sm2754953wru.8.2022.06.24.09.06.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 09:06:38 -0700 (PDT)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     linux-tegra@vger.kernel.org, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, vbhadram@nvidia.com
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        thierry.reding@gmail.com, treding@nvidia.com, robh+dt@kernel.org,
        catalin.marinas@arm.com, krzysztof.kozlowski+dt@linaro.org,
        kuba@kernel.org, jonathanh@nvidia.com, will@kernel.org
Subject: Re: (subset) [PATCH net-next v1 4/9] memory: tegra: Add MGBE memory clients for Tegra234
Date:   Fri, 24 Jun 2022 18:06:35 +0200
Message-Id: <165608679241.23612.16454571226827958210.b4-ty@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220623074615.56418-4-vbhadram@nvidia.com>
References: <20220623074615.56418-1-vbhadram@nvidia.com> <20220623074615.56418-4-vbhadram@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 23 Jun 2022 13:16:10 +0530, Bhadram Varka wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Tegra234 has multiple network interfaces with each their own memory
> clients and stream IDs to allow for proper isolation.
> 
> 

Applied, thanks!

[4/9] memory: tegra: Add MGBE memory clients for Tegra234
      https://git.kernel.org/krzk/linux-mem-ctrl/c/6b36629c85dc7d4551e57e92a3e970d099333e4e

Best regards,
-- 
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
