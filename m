Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 990CECDB487
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232356AbjJMPhe (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232444AbjJMPhc (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:32 -0400
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 35338E5
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-9ba081173a3so372291166b.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211446; x=1697816246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PlsJKQ9o+97lJJY3AUNBW2W1fulutNe23lIectOvZKw=;
        b=WWItODHe73DUGo//djKijjKqmYU01TWGF28RYwC1JcJaEhK7C1NvLstSatYCmlpeVx
         DsWi92eW6c4QYCnf2Ou74SFLw6sfzEJa/bCXc7PsCv8itVvIlzNVUR9bcSmYgmMI9HD3
         nXdXpnkMgwOP1hQy4+yDmTMjmDEL48eQhtlyc04L1h0lwB5QHUiKvS8oRCoV77hqhRZy
         1bNmy2fxT5XjNSsyNqhbsreMPTUAVdxk+8YFd5CI8xHJCB53NXmTyeBY5DKL5QKkWiD/
         kXYmihVSejhULnlmL79vkXOa+RvcCio8xvOxyx1wQRU0YC6lDac4i+kHF+kiG3c9qQao
         rzYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211446; x=1697816246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PlsJKQ9o+97lJJY3AUNBW2W1fulutNe23lIectOvZKw=;
        b=ORqoxdobl/bhtVIyZ7QMx9Q6jhc+ydF9Hdfx2FNWvkfQdXeFR/RYpSDbJap+25J/iI
         xqXzF0AXbsO2JqOKBm6WlYmQqWhiohs98U6wNuwt5zN+3lXc56SND17ko8D+7ngW0rrT
         0grcNnUqXsVb2HmeseQeZw22QINopQIs8QDYsmY+X8UiGZix0+Ay3+luR8jAJnayJ71/
         95jlH4inHQl8EcRpI0zjv479ELFwCHWyjg909frJSvv3usENs1Mzygr10iQJ0EDCGZuS
         a+xKiyB5096UWR/M6LgOqjCkxwcXeXLE2sYCvqgIsFe0b7KU6CCb34HBEz9ozrnqdeMH
         1W/w==
X-Gm-Message-State: AOJu0YxrgVJaXWVqZ5ytAkYMbuHieAZOYdiJMRp6t95rsX85f9kWzhbC
        a9F/sSgk9XDN9IUjfXL3qJSKXGtkZ/M=
X-Google-Smtp-Source: AGHT+IF3x8zmRFDMy3fLrl9T3QnLqwr20Q75vbxLig7CrswuqjzGa0s5PbKwgN0DhW2anpArJUF8jA==
X-Received: by 2002:a17:906:7394:b0:9ad:fb23:21d8 with SMTP id f20-20020a170906739400b009adfb2321d8mr23182490ejl.12.1697211446233;
        Fri, 13 Oct 2023 08:37:26 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id cw11-20020a170906c78b00b0099e12a49c8fsm12767358ejb.173.2023.10.13.08.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:25 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/6] firmware: tegra: Changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:18 +0200
Message-ID: <20231013153723.1729109-2-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-firmware

for you to fetch changes up to ea608a01d4ee66f8b51070e623f9adb8684c0dd4:

  firmware: tegra: Add suspend hook and reset BPMP IPC early on resume (2023-10-13 14:20:27 +0200)

Thanks,
Thierry

----------------------------------------------------------------
firmware: tegra: Changes for v6.7-rc1

Contains a typofix and a new mechanism to help fix an issue that can
seemingly hang the system during early resume.

----------------------------------------------------------------
Deming Wang (1):
      firmware: tegra: Fix a typo

Sumit Gupta (1):
      firmware: tegra: Add suspend hook and reset BPMP IPC early on resume

 drivers/firmware/tegra/bpmp.c | 30 ++++++++++++++++++++++++++++++
 include/soc/tegra/bpmp-abi.h  |  2 +-
 include/soc/tegra/bpmp.h      |  6 ++++++
 3 files changed, 37 insertions(+), 1 deletion(-)
