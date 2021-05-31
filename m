Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 517ABC47082
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 08:57:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 276AF60FDA
	for <linux-tegra@archiver.kernel.org>; Mon, 31 May 2021 08:57:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229591AbhEaI6w (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 31 May 2021 04:58:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54066 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230337AbhEaI6v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 31 May 2021 04:58:51 -0400
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A97FBC061574;
        Mon, 31 May 2021 01:57:11 -0700 (PDT)
Received: by mail-wm1-x32f.google.com with SMTP id s5-20020a7bc0c50000b0290147d0c21c51so6098874wmh.4;
        Mon, 31 May 2021 01:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=RF3HhzPbZOpIW23n6bNx9kOfpYyehp9pvKpqhLGFiBk=;
        b=hHlwqwiVTAnBJqK62Ks7ZNacp0JwZZEia96WgpcwAOIteUMDg9vSxrh9yfMUf0gqQH
         PcPYi6nnk+XKFk2ZBFkT6CqaNs4qugaKlXCTHoQ5/qc7KttqxsjStjJdSnM6MvoYPoko
         gG7NTaJnVKe4Z1/+Ewjb3L+jk2bSuyHry3j2Lz2ZAN0S8MMPEOFfUS/8LAQCuL0Wj1Fx
         3+CVibx1+5Yj6oYKamLByAlbVWmWhYh9BmEqCHTzCTHOTCJDq6hhR7A0Os4A02cBI2pD
         Q7FSQ6PoCyJTiFdmf4Vjnrx0Wmk8LcfI49mNEOev+osjt+85NzP5DBih0xq3NL9KL+E3
         jZxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=RF3HhzPbZOpIW23n6bNx9kOfpYyehp9pvKpqhLGFiBk=;
        b=F1IjMQM1t3Jp6Jfu+XzlGp7Sgl27DpkW0qH6HOleDsjPs+m9iILYvMA8rC/E9xE0wD
         VuPXi6MwzqIW02Q9axIEcU6cJPeMU8E6wXZAGdx0OEWcJBL8aEs+75nO7Zx+MjrWr4zA
         0siyF6Hiki0uthOZKIaa2u24m5+w5Sbvpn9Aqc3BkVFbpd1RSx4CKpddd0nxSSKEPEel
         Z5PdZXZnnS1IthJ8edITOzbf0MdQ6oGhKqaDagH+PCU9KekxrYNd+D7Eepccfs/kDVRY
         GhiL1GlZGU4yjgI2fE9vgyh6ysWodQ2zbTr78WbY30ZLcFD7Pl9YRZF71x7dYLfIKCrS
         g9hA==
X-Gm-Message-State: AOAM5321MDYJRoigzwqpboLTGelFGDRNWPGhl8pvEhGNmX235Do11PKw
        f8dBOSeGB8hlHfT+LRVVHUo=
X-Google-Smtp-Source: ABdhPJx+NqPAR589sN2yjtZSZBkPtRiaxHvLWGmRatA9PvhBTLbPaLUmydZLVXDM1jzTDekd5MnChg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr7449265wmk.25.1622451430256;
        Mon, 31 May 2021 01:57:10 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id x10sm16464848wrt.65.2021.05.31.01.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 May 2021 01:57:09 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Paul Fertser <fercerpav@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Dmitry Osipenko <digetx@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/10] NVIDIA Tegra ARM32 device-tree improvements for 5.14
Date:   Mon, 31 May 2021 10:58:40 +0200
Message-Id: <162245148227.52373.17739116835818488825.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210510202600.12156-1-digetx@gmail.com>
References: <20210510202600.12156-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Mon, 10 May 2021 23:25:50 +0300, Dmitry Osipenko wrote:
> This series brings couple corrections and improvements to the device-trees
> of Acer A500, AC100 and Nexus 7 devices. It also corrects polarity of
> headphones-detection GPIO in all Tegra device-trees that use WM8903 audio
> codec.
> 
> Dmitry Osipenko (10):
>   ARM: tegra: acer-a500: Improve microphone detection
>   ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
>   ARM: tegra: acer-a500: Bump thermal trips by 10C
>   ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
>   ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in
>     device-trees
>   ARM: tegra: paz00: Add CPU thermal zone
>   ARM: tegra: nexus7: Add i2c-thermtrip node
>   ARM: tegra: nexus7: Improve thermal zones
>   ARM: tegra: nexus7: Remove monitored-battery property
>   ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
> 
> [...]

Applied, thanks!

[01/10] ARM: tegra: acer-a500: Improve microphone detection
        commit: ef3082db434f3f87b83ccaa1ce4ebfd05535b651
[02/10] ARM: tegra: acer-a500: Specify proper voltage for WiFi SDIO bus
        commit: a99d77c4b2ac9095d9bd5969996905886debbe8b
[03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
        commit: c46240c005ae7fe10c2fe753ead996379cbf73ff
[04/10] ARM: tegra: Add reg property to Tegra20 EMC table device-tree nodes
        commit: b39a16b577cc11c7ab3fb67c8723c7ea057d96d4
[05/10] ARM: tegra: wm8903: Fix polarity of headphones-detection GPIO in device-trees
        commit: 5f45da704de425d74abd75feaa928fc8a3df03ba
[06/10] ARM: tegra: paz00: Add CPU thermal zone
        commit: 2e09908f37c34356baae72f047bbb8fc9faac32f
[07/10] ARM: tegra: nexus7: Add i2c-thermtrip node
        commit: 8b73d8c3d2c93c6e3db19d8c2641fc74dc9f8bf1
[08/10] ARM: tegra: nexus7: Improve thermal zones
        commit: 7168137532d2d27d34811cd5a073ad5c3215b592
[09/10] ARM: tegra: nexus7: Remove monitored-battery property
        commit: 4405d933b66c0c9268de3b3d9cab3e3b780c64f1
[10/10] ARM: tegra: nexus7: Correct 3v3 regulator GPIO of PM269 variant
        commit: c4dd6066bc304649e3159f1c7a08ece25d537e00

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
