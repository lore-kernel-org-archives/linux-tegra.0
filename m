Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FF32C77B73
	for <linux-tegra@archiver.kernel.org>; Thu,  6 Apr 2023 12:48:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237363AbjDFMsI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 6 Apr 2023 08:48:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229639AbjDFMsH (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 6 Apr 2023 08:48:07 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FF8411C
        for <linux-tegra@vger.kernel.org>; Thu,  6 Apr 2023 05:48:06 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50299ceefa4so1272558a12.2
        for <linux-tegra@vger.kernel.org>; Thu, 06 Apr 2023 05:48:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680785285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rAvv/otmGc3hwMXwQhQHoUuaDflO8xWMjxGu4buYhBU=;
        b=UYFWuwtQZE6dbI/L901jI2OuT9Agu1VXY2EejSe+o6TS7XLyjvoSWvDKcswwOjC+ae
         cyDDXDCmwHn6bMpkeUTzVFVaRnm3MTvUDi5n2jR7j0mc7w9M9XohOcQxoHRN8xt74wdg
         8pxGPiPLt2bBrOI65/sXwNQS6wpL7vSfl+UNJ57iOdrir3FNjkBAt2bMDYeGucin0a8h
         00IYrM1ypuEDqFqK4ngforUGZ+1nO82xDabjQUetehEC7fYmrDmlFpx8wJA+a79OD2HX
         gVjmDzZ6QlHbfViR+TSQTykseB/NGyAqLHRiAzgldDT3wI/DOr01d3fz0DZ2p7ot+pOG
         ah+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680785285;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rAvv/otmGc3hwMXwQhQHoUuaDflO8xWMjxGu4buYhBU=;
        b=IphvoRgFjbMTKmyf1XHc/0SpkaG69cYpLcUPDwqmixKwXHMC/qcjsuAuvSlbDEQEHt
         b0x1zMZwGmxg2l27sUmWHIADNpTg2MDSYKepnn121Dlogi8PNdzl1K13SaazRiznxSE6
         1FU+nwl1YB+rem48Vl35WaGxaqI58q2Qfk8KeWM/yda0JpfHOgIGk5YZIF7POQbykaBz
         tAmg2FL+haADqAzlsq1+93kGFRbqP2zSiutlxTKO1syK0aCIO0AchDa8RkJV3V+x74on
         R4b/2QQa8fTEO9eQirUMmpx/XEnwZQTmYzBybqbUieUeXbe3gXETKzB6q38lqHC4HHW8
         Qp0g==
X-Gm-Message-State: AAQBX9fGfbAhzEGAc1FslZUO2xM9EE40LzdJdMgr2ssmh/xdGyF+DDb+
        di6qJuSaYrGtIPtp6yD8xhE=
X-Google-Smtp-Source: AKy350Z5ATxSZlSfguG4OpymE0cvmmmtJXCnwNBQv9rv/Ol+ovzictkZq8tSc3aSPoqP/5qlntn56w==
X-Received: by 2002:aa7:c50b:0:b0:4fa:e129:31cf with SMTP id o11-20020aa7c50b000000b004fae12931cfmr5437923edq.23.1680785284856;
        Thu, 06 Apr 2023 05:48:04 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id y40-20020a50bb2b000000b004c2158e87e6sm697255ede.97.2023.04.06.05.48.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Apr 2023 05:48:04 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 1/7] ARM: tegra: Core changes for v6.4-rc1
Date:   Thu,  6 Apr 2023 14:47:58 +0200
Message-Id: <20230406124804.970394-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.40.0
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit fe15c26ee26efa11741a7b632e9f23b01aca4cc6:

  Linux 6.3-rc1 (2023-03-05 14:52:03 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.4-arm-core

for you to fetch changes up to e8476011f04b1ee4360f755ed19cbbddf12dc83e:

  ARM: tegra: Remove MODULE_LICENSE in non-modules (2023-04-05 15:03:17 +0200)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Core changes for v6.4-rc1

This contains a single commit to drop MODULE_LICENSE() from a driver
that can't be built as a module since that can now confuse tooling.

----------------------------------------------------------------
Nick Alcock (1):
      ARM: tegra: Remove MODULE_LICENSE in non-modules

 drivers/amba/tegra-ahb.c | 1 -
 1 file changed, 1 deletion(-)
