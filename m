Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C0401CDB482
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 15:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232428AbjJMPhd (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 11:37:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232439AbjJMPhb (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 11:37:31 -0400
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A37AED8
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-9b9faf05f51so349156666b.2
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 08:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697211449; x=1697816249; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zdk4NvJbSMGfd0BIaU/OwOTGoubjjFd1QVukVbebO28=;
        b=feGyU6ws5sjVgcyy7M16uf8tH+GrPMNVXC3deYXiybkpsmLHSKAzrxlBegtuv4wrX+
         GMqvTaxpv8wpLlfJr8wZHXIvCBRnicp5+2YYj/hw62mPpTX13CmL6ibIcrZRdx8FItp1
         cm7Zc6xAEV1SBK3Ta9BiKS+bDKvzVyqaCc5qciC1RoHnri3hjU0p5rzQ/+ITARoMRJI0
         wKbfbvQ4A15qy2waO91+VpUsf6B2w6tZ9cJ4pII/4cPBx7Lhewknu/StclfnjPKwJyuD
         MASJYEnCo2zkXBJc3Wd3XXxuBEfSMz5Noetkfh2x8fwq5ya97psQI1wwv0ZtLHe7IPGk
         TAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697211449; x=1697816249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Zdk4NvJbSMGfd0BIaU/OwOTGoubjjFd1QVukVbebO28=;
        b=BdHvC+ZqjoSkvjlKwRNidM8FzC1dKnwJu7RGw+Js4ctKHZg0YAIbk2a6gyGH15cVNz
         dZ618ltQ1SybrMC31sBQgGr5L8/892h4/l0o3PUFfC/sth7bNDErvfRjKSF0sM4DleC2
         hXUeaZHZse7ioc4V2mHMju0hSxkxjh/9UJnWDak+5XGi1ji/S2Qwu9oFResPOgibKdQC
         m+YcUaAlQxUQ1Ar6EqAUoByNO0tSm6DzC2k6EtPViWrvqAaF7MoN9IoazP/Dkf3QBK2r
         asUjHqlDLBbsn7h85GjNeWZsijHBE53pLhLvc98Ij/mK/o9J3woFe8hL8KxhLShYSWHq
         +/uQ==
X-Gm-Message-State: AOJu0YzzF8MXrnne33Kjc2Hkw+W0VJC4Dx9rYda3YGJVDUYv/otlmBp7
        ZyTuN5KTNpbYV4SERNG9EeY=
X-Google-Smtp-Source: AGHT+IFYqC9tGqZnZhl1BWHxrEQ6EXrSviw9xGYIOiIjwt/Jf8wWQMwZrgXE4xHWoxXV8yVorBkenA==
X-Received: by 2002:a17:907:7d90:b0:9bd:fa48:83c5 with SMTP id oz16-20020a1709077d9000b009bdfa4883c5mr852294ejc.70.1697211448948;
        Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
Received: from localhost (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ca9-20020a170906a3c900b009ae587ce128sm12513281ejb.216.2023.10.13.08.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Oct 2023 08:37:28 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 4/6] memory: tegra: Changes for v6.7-rc1
Date:   Fri, 13 Oct 2023 17:37:20 +0200
Message-ID: <20231013153723.1729109-4-thierry.reding@gmail.com>
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

The following changes since commit ea608a01d4ee66f8b51070e623f9adb8684c0dd4:

  firmware: tegra: Add suspend hook and reset BPMP IPC early on resume (2023-10-13 14:20:27 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.7-memory

for you to fetch changes up to f344675a34383ae26a8230f4b1cd99cbd0defebd:

  memory: tegra: Set BPMP msg flags to reset IPC channels (2023-10-13 14:23:41 +0200)

Thanks,
Thierry

----------------------------------------------------------------
memory: tegra: Changes for v6.7-rc1

Contains a fix for a long timeout that can make it seems like the system
is hanging during early resume.

----------------------------------------------------------------
Thierry Reding (2):
      Merge branch 'for-6.7/firmware' into for-6.7/memory
      memory: tegra: Set BPMP msg flags to reset IPC channels

 drivers/memory/tegra/tegra234.c | 4 ++++
 1 file changed, 4 insertions(+)
