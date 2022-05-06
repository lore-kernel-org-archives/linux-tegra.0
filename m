Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9F71C4332F
	for <linux-tegra@archiver.kernel.org>; Fri,  6 May 2022 14:30:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442195AbiEFOeL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 May 2022 10:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442212AbiEFOeE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 May 2022 10:34:04 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB3C7318
        for <linux-tegra@vger.kernel.org>; Fri,  6 May 2022 07:30:18 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id e24so10275546wrc.9
        for <linux-tegra@vger.kernel.org>; Fri, 06 May 2022 07:30:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7E6fI/oP3TVn2/gg+vyC6SjczNcImpmXjf/EfX/EIEU=;
        b=jrBnnEH44+sf3d0rkVVd9mnlGM9qbcjsILZ3u+Sla956FHQw8v7gEsezyXGJcKEx3/
         uuSG6qLmkuiezON2AmP6n+845JHbxOlIWCVsCCLraUMb4lCw2Q/+9E33Y8p+OsvTfzkC
         mMogoEezH6hztQZKuaJWUMDhiRpVszZl/44VMbeNfAiV8jnsALo88kI45lc4zIXBLZZ2
         YPzv9XCX8GMaYUUAKSwdzzF2eeR7jFuotL1jAVCLuHDVP1OzxVSLIYelORAYwJ7x/jpW
         6XihXQo2baZsUws+M5iitOgKMXkx9sxJbU1xK9zj83smQa4PDGhHk05jnzqrpIozAfas
         PQNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7E6fI/oP3TVn2/gg+vyC6SjczNcImpmXjf/EfX/EIEU=;
        b=nkOMreASdkc2ysumu3XXoByprTen5IXBxdhLZgwuf22v9VQegW8EvtCdG/E6qraq6r
         CJmwEAAYhmRVqoEnR0bQMhEnomSVAFAdzXWXB+UthGfuZppgoslQDAEcwvEaBfIByIIF
         FIK32BEzoY4hLChIQ6cZzh3Ys8z8sEWnVYOvssUPmYGJeWF12Gpu/f5Jt9tMAtQlQ0Us
         TSjBKxCaKVCGHg86R5Aye5IbNCoKkX33yO4kQILIKUxVv2stt5mKj2FpP4E40u9lCOZL
         4k8RqmW2W01thmnwiizcvIW2+en8/WFgCniV9sFcS0sS7XCrOeaGWTfshcpqBp4vxlFT
         qNGA==
X-Gm-Message-State: AOAM530sGyH9yzCIqQ2DbBQmrQBrH3gHAozrjOaGlEH1S2FLZAKbq8WF
        MX2AYdZdTc48zy5mXiVShk+cdx0DR0g=
X-Google-Smtp-Source: ABdhPJzeQuCsbxXOst3YKaO9hmwP2GvMrOstyLO3192slkVa8bsTI2oCXyZ8X2wlYUTbQHQFgYo78w==
X-Received: by 2002:a05:6000:1569:b0:20c:4ed4:4ba8 with SMTP id 9-20020a056000156900b0020c4ed44ba8mr2924448wrz.270.1651847418393;
        Fri, 06 May 2022 07:30:18 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id 66-20020a1c1945000000b003945cdd0d55sm4441422wmz.26.2022.05.06.07.30.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 May 2022 07:30:17 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 6/6] arm64: tegra: Default configuration updates for v5.19-rc1
Date:   Fri,  6 May 2022 16:30:05 +0200
Message-Id: <20220506143005.3916655-6-thierry.reding@gmail.com>
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

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.19-arm64-defconfig

for you to fetch changes up to e46ab742195ae8760e03cb15fcf6f6a90fcad636:

  arm64: defconfig: Build Tegra ASRC module (2022-04-26 15:11:57 +0200)

Thanks,
Thierry

----------------------------------------------------------------
arm64: tegra: Default configuration updates for v5.19-rc1

This enables the driver for the new ASRC audio block that is found on
Tegra186 and later.

----------------------------------------------------------------
Sameer Pujar (1):
      arm64: defconfig: Build Tegra ASRC module

 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)
