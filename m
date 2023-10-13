Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 846D0CDB483
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 12:43:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231705AbjJMMn4 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 08:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231680AbjJMMny (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 08:43:54 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0F47291
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 05:43:53 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-405524e6768so21108105e9.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 05:43:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697201031; x=1697805831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SG3HmGe+27aKsRFtsa+ottrkWvA9Hk/0pT0LlGcbDV0=;
        b=UiB+J+YKfMCUGSTchDltlUddx4t5A61fS8SyN34Q4Q9V433Bi9KBGMScCkJ7pxVG7J
         CCK3sXqr3/zS7S+g0wyREyz2yeBK7jBG6kEd5nd/JxtvX5xHX7piK6bZOTvwXOWRJAbx
         +WaNaSSM4cX93gYjVK+H/UiH7mbAOhgtObD0iCmw7XOEb0ChuVugMy/moUtf66SoLlGx
         ZlpjIkKbVLHjKyQgOL8lY5DdAc33m2La5Ssboy7lFMsmfAOaGgXvXmzdky4yrGw/riZh
         C0uEjoiRBT9ZELqONh4U1CxrwsH2Hb+csD//K7CbZT/lDsXleJKawrdcz0u9ycMSTxSz
         3msQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697201031; x=1697805831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SG3HmGe+27aKsRFtsa+ottrkWvA9Hk/0pT0LlGcbDV0=;
        b=pJ1Nhme1OWBzpUkyK2dZ16taYqdtC62nrND8wb3eFt/QLgvtUXtGnN2EJyNK1yW5cC
         fGGrOflxHa7Ot+fB70JajGdtcZdaBqleiA/ZE7DWcJ8YpUS5TXcG+p8sg8NAesO6OAhg
         xMX4ZshTonDdzLB2VYWE2olQ3D8SUxGClNRfK4jz95GpgZBx0kaFGr4wND0Ex9cx4Jya
         sG4TgcOjpESMda5xMgkehIkqbeoPZPVujtnMvtaMFo8DSCEgFcdQXyDzJzV4gCrDrW+o
         LcxcsbdPD68vmB1d83xe30NJXDIDuQadhdjHlOxMMgB6j6LUX4sArGZeOT1adVP5RXs5
         BWIQ==
X-Gm-Message-State: AOJu0YzaCOgsn28Zq0y13j1AYP2QQ3UQIR+9bn1SHb2aYMUsZgqwr5+/
        4QokJ6nj72qiDX/L7NaB8KycRz5s8LA=
X-Google-Smtp-Source: AGHT+IGZ8mS5ViKDnkIPVoCHENBBlptXIRyKPMmenijCvJ7SOtPGxgfTGR9gqiDZhwlaKaBAUsJO4Q==
X-Received: by 2002:a7b:cd98:0:b0:405:1ba2:4fcb with SMTP id y24-20020a7bcd98000000b004051ba24fcbmr24354517wmj.16.1697201031267;
        Fri, 13 Oct 2023 05:43:51 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id s6-20020a05600c45c600b00401d8181f8bsm29372wmo.25.2023.10.13.05.43.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 05:43:50 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Shubhi Garg <shgarg@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Use correct interrupts for Tegra234 TKE
Date:   Fri, 13 Oct 2023 14:43:49 +0200
Message-ID: <169720099121.3883934.4023345936837730133.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231012124311.3009393-1-thierry.reding@gmail.com>
References: <20231012124311.3009393-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>


On Thu, 12 Oct 2023 14:43:11 +0200, Thierry Reding wrote:
> The shared interrupts 0-9 of the TKE are mapped to interrupts 0-9, but
> shared interrupts 10-15 are mapped to 256-261. Correct the mapping for
> the final 6 interrupts. This prevents the TKE from requesting the RTC
> interrupt (along with several GTE and watchdog interrupts).
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Use correct interrupts for Tegra234 TKE
      commit: c0b80988eb78d6423249ab530bfbc6b238790a26

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
