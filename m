Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FCDDC433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Mar 2022 08:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343897AbiCHIom (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Mar 2022 03:44:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52966 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232253AbiCHIol (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Mar 2022 03:44:41 -0500
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8F00236686
        for <linux-tegra@vger.kernel.org>; Tue,  8 Mar 2022 00:43:45 -0800 (PST)
Received: by mail-ej1-x634.google.com with SMTP id qx21so37495147ejb.13
        for <linux-tegra@vger.kernel.org>; Tue, 08 Mar 2022 00:43:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxKlE600DjKjqdojxt+FivATkPbQP3ZK6Vj/OlWsxQ0=;
        b=b8MTlwrkatRq2vLJXcHuIzvuo7Jg2ihK8I9i8/Lg/fuOBjcjJsJ81ZcQ9XIu5phtmY
         uws1Y2OCYEQmqx/DICMwGu3MdIFXWR5JqHycZT3ifUG6wCozCqHZKDoo62ZhHyeQnalX
         v2ULCbHK52SEvl8VFfoIbU9rHLvXzY9/GbO60hCmtgFguU6TORNyOqPRixN+zZLm/jav
         W0JmO9wII2SZARZ43fPPEEbxck054vYL59H6u5Ic+RSJVU2hPLIO+D90HlTlILsOeSbr
         ikxJ6yKrxCdXhoSBCX3BdG6z6+c+Q7YCaRo0JXPEgF8Z0TC66kmfMoZ0dof+wpqIyXA3
         TaTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RxKlE600DjKjqdojxt+FivATkPbQP3ZK6Vj/OlWsxQ0=;
        b=jSVJUzNf1e1ZKQwG3/h1tBTWEZyf14IBs4v1Z2Ir5iCiCovaBk1X020WBEaH+Yso4S
         yg8nbtBRBY/Sc9oCv7LVUCx0LX9IDXarABMBnZELeQjqB0lA8BAYOYFRDkpCkH41nLeB
         eJ74CjzFC8bbQJjvL9P+7pwRZEirD3tKZ1cOBmjdkfB2ddHk9O9KyoR5xvX1kDzNWywk
         jJ0pVA2Vbyu5IQC0fvQTyxL9NudQR+tyx8BCdV+EMx/eYY1dLzbARq2l4eQmMTy4NG+a
         kbpLzraMfLJ+ailPdWdYo1Kv7cCchzT1i6rzO/mFIX0/N8CTMWBOM6LIFyCVrHAzgvh9
         DYqg==
X-Gm-Message-State: AOAM530koqIG6tblRkoMj/+oN8O2cuykDArFvsghKZRwYjduV8dZ9YCK
        6N8t5OVSd9IZfOr5elvdN2E=
X-Google-Smtp-Source: ABdhPJxW4v0nChVyHeE8MtiIgLlsbfy+rFqKts2xGh9gUivBGZTf9oLhF0qJ+eTxKbHfZFGsdyJHNw==
X-Received: by 2002:a17:906:b102:b0:6db:1487:e73 with SMTP id u2-20020a170906b10200b006db14870e73mr8425587ejy.474.1646729024001;
        Tue, 08 Mar 2022 00:43:44 -0800 (PST)
Received: from localhost (p200300e41f032400f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f03:2400:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id n25-20020aa7db59000000b00415965e9727sm7208071edt.18.2022.03.08.00.43.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Mar 2022 00:43:43 -0800 (PST)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     arm@kernel.org, soc@kernel.org
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] ARM: tegra: Device tree fixes for v5.17
Date:   Tue,  8 Mar 2022 09:43:39 +0100
Message-Id: <20220308084339.2199400-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Hi ARM SoC maintainers,

The following changes since commit 8d3b01e0d4bb54368d73d0984466d72c2eeeac74:

  ARM: tegra: Move panels to AUX bus (2022-02-23 13:26:00 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.17-arm-dt-fixes-2

for you to fetch changes up to 7401b49c50c2b032223de408e28e37cbd63f4c97:

  ARM: tegra: Move Nyan FHD panels to AUX bus (2022-03-07 19:02:39 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v5.17

One more patch to fix up eDP panels on Nyan FHD models.

----------------------------------------------------------------
Thierry Reding (1):
      ARM: tegra: Move Nyan FHD panels to AUX bus

 arch/arm/boot/dts/tegra124-nyan-big-fhd.dts | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)
