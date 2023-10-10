Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA568CD8CA7
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Oct 2023 15:46:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233026AbjJJPql (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Oct 2023 11:46:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbjJJPqg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Oct 2023 11:46:36 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93820AF;
        Tue, 10 Oct 2023 08:46:34 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9b64b98656bso988439366b.0;
        Tue, 10 Oct 2023 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1696952793; x=1697557593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZMkYHrfhXWipN/ee6VJFogJnXBxiy/M8Hxj4mP6AF/w=;
        b=AvUAnp5VWCtAEtkI44WBFSAV19EdVp4fkS0nhGVbyzsyupZ+LayakVhbZ49gJHGBvr
         jFkIOQQ3TWn+A7MuDVhqggxcBdq77S88pvvahujzUOBwaswGYKw1Q7ti+1QrgCjm21vY
         qAyn7op01UJ1iiAwxmnpJn3T5q9Xi2MkKTP6rfj2GnaRnHhsHcLraMTcgEn/t7ybbiHy
         WJcBJ+/P78T94TCNIjlhZysydwZOFYf7DdZE2FgK55rNxNZkJaIcy2GlXrFEKADaqdl2
         bR41HXMf2fUYWvpNC4wwEGz3oGkgpgu39RKoeq0B1B3xVJMMwKOwpD0Bc7ocSX9tatcR
         6jcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696952793; x=1697557593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZMkYHrfhXWipN/ee6VJFogJnXBxiy/M8Hxj4mP6AF/w=;
        b=ohfjIo3j3427yas8EVRpUjyn7syxyDmPqqwEjXk3ITToEb7oF8frqCC1DoLQL00OBe
         OyAesmvspMbINK1LYbYA9B6X5oyigjjMokWdoIR9VGvCwTxZZBL2NteW22lMwWL2KmOp
         0lxiXAmZZEGvgft0J/dlhLxhTY0VMjleoDOBr/KHn5Nt75oVp6KMHi/5h9c+RIBbl7pH
         awsdATiKHnWnEbkojN5r8ZExAv39hxCU+0F9hm1yQFiCO1oSb+EyDNF/Rb5bowsUchLd
         99yHQlcSSweHst7hT7kJTkV0NbxxAtIvDeTNuEISze6Myx7RCTicSWJYhwKtacCfEB4D
         4KTg==
X-Gm-Message-State: AOJu0YwhhkyDIeCV2WaOBKInQF6FClDSxWMKyBo5PY5G839javJ/d9Nb
        VPs5ranhPs+KrhOp7glUY/A=
X-Google-Smtp-Source: AGHT+IG6zqiukIzWsJKn9OL4P8A2iPIED1bxFNTAhVCUbLFrwSbvu5J1IObjwfklPC/cJl6Vo5ewnQ==
X-Received: by 2002:a17:906:3050:b0:9ad:df85:97ae with SMTP id d16-20020a170906305000b009addf8597aemr15366554ejd.66.1696952792886;
        Tue, 10 Oct 2023 08:46:32 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k18-20020a1709065fd200b009adc7733f98sm8628023ejv.97.2023.10.10.08.46.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Oct 2023 08:46:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        Dmitry Osipenko <digetx@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v3 0/5] Support bridge/connector by Tegra HDMI
Date:   Tue, 10 Oct 2023 17:46:25 +0200
Message-ID: <169695268806.976123.4285803254322342270.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230807143515.7882-1-clamor95@gmail.com>
References: <20230807143515.7882-1-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Mon, 07 Aug 2023 17:35:10 +0300, Svyatoslav Ryhel wrote:
> This patch adds support for the bridge/connector attached to the
> HDMI output, allowing to model the hardware properly. It keeps
> backwards compatibility with existing bindings and is required
> by devices which have a simple or MHL bridge connected to HDMI
> output like ASUS P1801-T or LG P880/P895 or HTC One X.
> 
> Tested on ASUS Transformers which have no dedicated bridge but
> have type d HDMI connector directly available. Tests went smoothly.
> 
> [...]

Applied, thanks!

[1/5] ARM: dts: tegra: Drop unit-address from parallel RGB output port
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
