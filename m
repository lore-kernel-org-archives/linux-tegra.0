Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12334C04A6A
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344001AbjHPQaV (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:30:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344692AbjHPQ3u (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:29:50 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E42610EC;
        Wed, 16 Aug 2023 09:29:49 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-99c353a395cso909705366b.2;
        Wed, 16 Aug 2023 09:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692203387; x=1692808187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iXGFip4xPQmMc5o7WGRu/er7WEU0mmI/vsDic791oFk=;
        b=nav2gjQSHKdfSoi26eHLcYD2RTczPmWHhP9Wz123smxcYh9WU4evRt3NPI9Qz9N/I1
         qNeVriHM6r+4Hqc41JCa12Yx5VhTVQyRlWGWMpg+a29P/S1fGBRGdVZfIIbUmUw8wgwJ
         qpaULOP/ByK8TtxAexpFYqpyarMP7Osjh97BeFVxnwzLe1qJ27ljP/UPQuDL5aMynjck
         39KbCTcGKm4fVBFNg5VvJnfdTvXmaNdkaIVwJevkqTFPUh1i6rvH4AB5ZWwaBFZx63jV
         X/HmuaxBvgNRmQUccRO6HxGGKrobYWjhghK8Bc+OdTpW3kjNJqaTE8MmClDT9DI3mECr
         Xf0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203387; x=1692808187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iXGFip4xPQmMc5o7WGRu/er7WEU0mmI/vsDic791oFk=;
        b=aoZWiaMuTUl2cY90QxjDDcRB2E4ivOAaFiSo9FxY9Ip6MhpqGtuar/ywkRrPtD1hmB
         fsyEMPhfYesAKpTzSrZ5sR/x7zfiKv78al4jFQG+1XI+NETOWF/s0Lg3p+wl8PRF0AAC
         mmKAFNcz0J9XxI28KW9iHYx5RPfi2TebtxdOMSTK1qN3qUYNd5842Ro92YmnkDe7eJFm
         YmZsDFj4ggem0eAGUJx3RbSF7Rf27E5KCkyqhOG0YfXeWb9IKEXk7u1BF9sa5aE730xh
         TWmc/aTzdu0eF8Kq1la0ZIWzGpDFint8X3ZO7X4tKRAaHdae0gryryVYUYU5xdY9LyRP
         bO8g==
X-Gm-Message-State: AOJu0YypwqQZ+FEOu+Ar6gHF31liSAZ0BF/VHovIHdhpktkHPbif2te+
        /tl3S6iqD/QFLyU5Ft+lndvnlePU/AY=
X-Google-Smtp-Source: AGHT+IFHKqf7og4SYztrQ3hgIh5ddW0RNG/gZrAwpm3G8/UpTC9TEWnOgxvGkdelTp6fWETrxjdcIg==
X-Received: by 2002:a17:906:504e:b0:970:c9f:2db6 with SMTP id e14-20020a170906504e00b009700c9f2db6mr1458897ejk.63.1692203387361;
        Wed, 16 Aug 2023 09:29:47 -0700 (PDT)
Received: from localhost (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kg7-20020a17090776e700b009829d2e892csm8760489ejc.15.2023.08.16.09.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:29:46 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Subject: Re: (subset) [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Date:   Wed, 16 Aug 2023 18:29:45 +0200
Message-ID: <169220337040.3329623.1496882748150713518.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Mon, 07 Aug 2023 14:33:00 +0100, Diogo Ivo wrote:
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
> 
> Patch 1 adds the DT bindings for the panel.
> 
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
> 
> [...]

Applied, thanks!

[3/5] arm64: dts: smaug: Add DSI/CSI regulator
      (no commit info)
[4/5] arm64: dts: smaug: Add backlight node
      (no commit info)
[5/5] arm64: dts: smaug: Add display panel node
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
