Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1398FC46CA1
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232374AbjJMPhe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232435AbjJMPhd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:33 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D18FEBD
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:31 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-99bdeae1d0aso363755666b.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211450; x=1697816250; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m+ZY1Eo+hGBgOwzkZ57/CG02BALJwavzrznNDKUJoBg=;
        b=Y2PjxqOBweV/IKCKp3kBA9HocAqIcF6ZtDnCd1nsW2EYRKyXkmmu10W7ZYDIbtuDbg
         q+e1HewVemG1Xp/NWQSEogC3+oII8odp2/vDzR9/+oLXkQWYeBeVmiailX7R99S9mq60
         tnUoMVmD1V5Vn89xWDV+bZUcul8grerrgycpvouNBbZiTbhIHBy8Tqous2bv65DaoWVc
         YgKAaPwIcRyLWZShJejplBUtiN/iVreDTrr5kuCp4sFSR/hdHIzKeT68OdV4nfqzrZDT
         gN6UkvSyOyBKia60TPDxtclskzctZXUO9OKhtYRqpC2lMXfU/UnlsMocOq41EoGSwhzc
         +tbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211450; x=1697816250;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m+ZY1Eo+hGBgOwzkZ57/CG02BALJwavzrznNDKUJoBg=;
        b=DfSIoUtM5ywRjZ0uosy10eUbqkpa/n0a8AC8/iqb9DtNX9j3OKELcBIi5HAKoKnMrp
         K9Y3b2V+W+3zyPYQHyJNghz0bv9fVdmWpZPZQ4jVncor+3vfzehAJ/brugRMmCJnpt1G
         dpBVSjiCk1MFikWThkr5K9z/w93/IcYR4TeIaPfo/1c59EzaYmm2W3FrGqNTsgrCdd5L
         HYGLkYtN4arVIJISwUz+xWjmoEIU9EBcSqiSSEa8VOm4+85pH119Eh1HB/sGwCUhYpaT
         zwwcilWCzAf/3HS3O3acecQL9RKoPHtjZjlEhFBaxanW9c5rIxkgflMQHbRrOR5vh+7X
         aKxw==
X-Gm-Message-State: AOJu0YyGwbuaDnszERU4AVWljS8yGhhp+uJwmkRgvsClA10/HkllnZze
        7V0WhCwBUUaXevFHwWpD62c=
X-Google-Smtp-Source: AGHT+IHF39k1Gkjh3CL21FI3J5A3m1jhzhd1cVfiEnS0AlXW/MWrlPSiofKiUmdWkr5p+9m5gZAEIw==
X-Received: by 2002:a17:906:7389:b0:9a5:b878:7336 with SMTP id f9-20020a170906738900b009a5b8787336mr28447343ejl.7.1697211450300;
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id h17-20020a1709063c1100b009b94a8150d8sm12605318ejg.199.2023.10.13.08.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/6] ARM: tegra: Device tree changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:21 +0200
Message-ID: <20231013153723.1729109-5-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231013153723.1729109-1-thierry.reding@gmail.com>
References: <20231013153723.1729109-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 0bb80ecc33a8fb5a682236443c1e740d5c917d1d:

  Linux 6.6-rc1 (2023-09-10 16:28:41 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-arm-dt

for you to fetch changes up to 3c2508d3ce5764d1daea0a580cf11f35bd4f2801:

  ARM: tegra: Drop unit-address from parallel RGB output port (2023-10-10 17:43:48 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree changes for v6.7-rc1

Contains a small fix that drops an unnecessary unit-address.

----------------------------------------------------------------
Maxim Schwalm (1):
      ARM: tegra: Drop unit-address from parallel RGB output port

 arch/arm/boot/dts/nvidia/tegra20-acer-a500-picasso.dts  | 2 +-
 arch/arm/boot/dts/nvidia/tegra20-asus-tf101.dts         | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-lvds-display.dtsi | 2 +-
 arch/arm/boot/dts/nvidia/tegra30-asus-tf700t.dts        | 2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)
