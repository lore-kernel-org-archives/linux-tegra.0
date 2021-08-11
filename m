Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F4E0C4338F
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 10:03:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E74256023B
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Aug 2021 10:03:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236719AbhHKKDh (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Aug 2021 06:03:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236573AbhHKKDg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Aug 2021 06:03:36 -0400
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com [IPv6:2a00:1450:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66DB9C061765;
        Wed, 11 Aug 2021 03:03:13 -0700 (PDT)
Received: by mail-wm1-x336.google.com with SMTP id f9-20020a05600c1549b029025b0f5d8c6cso3979644wmg.4;
        Wed, 11 Aug 2021 03:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=yHJmYJ+iLasQ/NhqiYwsp7hXEwdmSi+n3SNIBsWP/t0=;
        b=aM3rfTlF1LxRtAwhykRxcMt5AB5GwV5uq0HyjW8JQOXibcwDEbmkhFA0xjlWOXPjCj
         Lb4BKAOHHPflObtQ0bCOCQfSVeYH+iBtdttHM8UZm8VLXodWliQIkN6yZFZHDT9mlcfS
         fpDJ3WtGy84DNhkg8p4aFjb5PwWy3WfQkXv5jjb87/z42vVmV1IJSa1ORU7HVcIDFjjj
         JeeSOkvlxSVVPfz59g6jQpht2s21i15Q+1zZIUgFBoW7tzlTsjnwHEw+6655AeTmtOGN
         blcTyGUkUbX/7WSKXiR+e5eyE0IE8SS0C8TRgmYGOvH6dLIcAHKfQubv08S0OQMgrU8U
         5PXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=yHJmYJ+iLasQ/NhqiYwsp7hXEwdmSi+n3SNIBsWP/t0=;
        b=nt0NRYJwdayxTcIF8qiAxZ/4cT6QDk1E1kVtGv73Q2x5ll6V6jK9Cb+h88ewgOVw51
         Gs5hGlgrnUw4x4WX0SESvQRfqNIKSVXIUBPtlUrgmtAVaalPmOiQgkYNLZ1QArRqpRkn
         HhusJqWWW5PHpaS1ZI2cxjUv5Iw+996WW0vcFXISDBGsxaewVyMAzLtWD6RMEZrZPIyA
         NmYi7OuW4J0TDuJZE6IogsHW1aAMDOXfrMpYlptxfDqhB+KSC6pPUs5NpgbrEF/Fh5uZ
         LEnSHKhzRtP557Ext2v0kUEjcFv+dRd8owkqFktmHlj0rEVUSjyH9twMmRobr9BpjxkI
         d8dg==
X-Gm-Message-State: AOAM532RkVS8TUuYqbpBk1abGvsWAYNvtJV2UXbzlTi+H5Ol62dSq0Ah
        Zz8a36wE5ktWFRDrttI75Uo=
X-Google-Smtp-Source: ABdhPJyFmYJlSuYS4zIYvYiiyN1uZEpXBbwYXYvtgI3RNIK4RB9t84j1DEVDKhpm+25b0toKrwmrnA==
X-Received: by 2002:a1c:4d13:: with SMTP id o19mr8910146wmh.32.1628676191934;
        Wed, 11 Aug 2021 03:03:11 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id g5sm5136900wmh.31.2021.08.11.03.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Aug 2021 03:03:10 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: Re: [PATCH v2 00/15] Tegra ARM32 device-tree improvements for 5.15
Date:   Wed, 11 Aug 2021 12:05:35 +0200
Message-Id: <162867631362.1310243.7415185739241921029.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210802211947.19715-1-digetx@gmail.com>
References: <20210802211947.19715-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Tue, 3 Aug 2021 00:19:32 +0300, Dmitry Osipenko wrote:
> This series:
> 
>   - adds SoC thermal sensor node
>   - adds interrupt for LM90 to Ouya, AC100, Nexus 7 and A500 devices
>   - fixes interrupt of LM90 sensor for all boards
>   - removes bogus VBUS regulators from A500 device-tree
>   - improves thermal zones of Nexus 7 and A500 devices based on previous
>     discussion with Daniel Lezcano [1]
> 
> [...]

Applied, thanks!

[01/15] ARM: tegra: Add SoC thermal sensor to Tegra30 device-trees
        commit: ffd8969c91000c5e914e3a6e9dd108b80a935910
[02/15] ARM: tegra: ouya: Add interrupt to temperature sensor node
        commit: 00786f61df89c45c83d04e07f4021acc8fb87287
[03/15] ARM: tegra: paz00: Add interrupt to temperature sensor node
        commit: a371e9698e8912ddae6cff65cb5bd068e45efe80
[04/15] ARM: tegra: nexus7: Add interrupt to temperature sensor node
        commit: 4eb121af6184dcbae39438a4e6a5cfbac820cdd4
[05/15] ARM: tegra: acer-a500: Add interrupt to temperature sensor node
        commit: c626fd7eeb11934af7b59b330885ff8f96e2c2a0
[06/15] ARM: tegra: nyan: Correct interrupt trigger type of temperature sensor
        commit: 303e2f343403472f3a8421bdd9f62525117507d7
[07/15] ARM: tegra: apalis: Correct interrupt trigger type of temperature sensor
        commit: 61f8c4f6eefb1f5053ba208c872bceac057747ff
[08/15] ARM: tegra: cardhu: Correct interrupt trigger type of temperature sensor
        commit: ad86e473e1f3a7faa034535a91c9e594dd038830
[09/15] ARM: tegra: dalmore: Correct interrupt trigger type of temperature sensor
        commit: 0a6e9f9cc27be904f32ed40742f3b74a8fc2690d
[10/15] ARM: tegra: jetson-tk1: Correct interrupt trigger type of temperature sensor
        commit: 3970dc6444c5902463b50b10f04d3b0f576077bf
[11/15] ARM: tegra: acer-a500: Remove bogus USB VBUS regulators
        commit: 0c3136565b64e6e90ab5f9bd6b6c12d5b506c335
[12/15] ARM: tegra: acer-a500: Add power supplies to accelerometer
        commit: ebfbd63602b036f523514c48b5d1d36bef481d51
[13/15] ARM: tegra: acer-a500: Use verbose variant of atmel,wakeup-method value
        commit: 0cae833ff5187f9f629ef8b97543eb24d2c64faa
[14/15] ARM: tegra: acer-a500: Improve thermal zones
        commit: d97a74513cec1e378de9ffb6e5f512703db447d4
[15/15] ARM: tegra: nexus7: Improve thermal zones
        commit: b3b3e68aaab6a7f233fbf05ec30ace9ddcb36e51

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
