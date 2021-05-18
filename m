Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E7B6CC433ED
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 22:31:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9E1B61040
	for <linux-tegra@archiver.kernel.org>; Tue, 18 May 2021 22:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238557AbhERWcu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 18 May 2021 18:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237154AbhERWcu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 18 May 2021 18:32:50 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94374C061573;
        Tue, 18 May 2021 15:31:31 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id i9so16095522lfe.13;
        Tue, 18 May 2021 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6ljTRHwDIGzKo93ro0EyJFj979FSc4cfbPsSrjnxUwY=;
        b=EZ1892QSAlcdInwXoIsMLGfBxydo1KcRAPSMXGWFBtVz33HsOcLCnYuXraX+CikYq4
         MXk/yi+C6QME/uL9aalttKXxoKix8sL2suoO/6QP2322m4DLH4p3GWCPMULIumAk5Lfk
         3hpwqiEIOLOKEeSXwUI4Vpsry4X1eQOjE5kTns+E01m4ssxuXe0n5u1xjBQw0wFrSl6U
         ZLcF3ehyVwO4z2qWjoCfKfn9ej4x65SZ2Vex3P9E+OsEDzm94CWjj0JxOUZxAKfklGY6
         JR76fvBSQw8qjEKE2CGcEvuBVjFThmoVeDlA5WFQxFs8CIPKsi4mumcG2vsAKlt697iH
         JXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ljTRHwDIGzKo93ro0EyJFj979FSc4cfbPsSrjnxUwY=;
        b=GsQpfUFBAwTLnie9swUvAEMSmBBRtxjFsbGnV8DNZf+GxhuotgrDTk5vG3Y7Af8qMb
         VQsp8LMqjFOC4CRXiSZjvWI/Z7p7ISvCFihgUj2uZytLsv/NsPzfcMwIhcoXQ7x/3cLM
         fg2coUSRP9lWSGntYR2nfzr7VCY5vOBxB3vMsylCOXxTVWPtRP7XInJQhAlcQp43XQCe
         4p9D5rjt3lYz9pjeEryfc28pbWqQMfGd6zS/dC2xGHWSfkW8PZHvF/rTuCen9IYTmLzJ
         mmr9kExJqhRm8b20aMIkvyCj7SXyD/jTcDUl9F+Um5tEpFxATC+Vb0PHy9235GFYLPLa
         wvjQ==
X-Gm-Message-State: AOAM530cFFg1/8/FLDJVcjZj1F5FRB2C23xlPbschHubWchpr6pqaJlr
        PROxpd58NI3T6ZeiGesJwDg=
X-Google-Smtp-Source: ABdhPJybbVaMiPw92JX0U2shg8oyjsaIK95UmJ6HxuvOu18l6A+ecA9rZrx3Yn/FqFTI23c+Zl+7EA==
X-Received: by 2002:a19:431b:: with SMTP id q27mr5484708lfa.226.1621377089928;
        Tue, 18 May 2021 15:31:29 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id m22sm2392071lfu.219.2021.05.18.15.31.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 May 2021 15:31:29 -0700 (PDT)
Subject: Question about Tegra UCMs
To:     Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Takashi Iwai <tiwai@suse.com>, Ion Agorria <ion@agorria.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        Frank Rowand <frowand.list@gmail.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh@kernel.org>
References: <20210518001356.19227-1-digetx@gmail.com>
 <20210518001356.19227-3-digetx@gmail.com>
 <20210518180949.GA949047@robh.at.kernel.org>
 <20210518183455.GE4358@sirena.org.uk>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <92cef674-c454-e08c-b44d-d8c08b1e8ccf@gmail.com>
Date:   Wed, 19 May 2021 01:31:28 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210518183455.GE4358@sirena.org.uk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

Mark, could you please help me to understand the UCM naming scheme that ALSA uses..

About a year ago I tried to complain to Jaroslav Kysela in a comment to the UCM change [1] that it should be breaking the naming scheme of Tegra UCMs, but haven't got a meaningful reply and moved on to other things.

[1] https://github.com/alsa-project/alsa-ucm-conf/commit/8ff2d50745efbb6959324f672460e413f0b618b8

Today I noticed that the naming scheme changed again and I still don't understand what to do about it.

I have two devices:

 1. Acer Picasso tablet that uses "Acer Iconia Tab A500 WM8903" for the card model name.

 2. Google Nexus 7 that uses "ASUS Google Nexus 7 ALC5642".

Previously UCMs were picked up by pulseaudio from these paths:

 1. /usr/share/alsa/ucm2/Acer Iconia Tab A500 WM8903/
 2. /usr/share/alsa/ucm2/ASUS Google Nexus 7 ALC5642/

Now the lookup paths are changed to:

 1. /usr/share/alsa/ucm2/Acer_Iconia_Tab/
 2. /usr/share/alsa/ucm2/ASUS_Google_Nex/

Strace shows that pulseaudio searches UCMs only at these paths.

The output of /proc/asound/cards:

 0 [WM8903         ]: Acer_Iconia_Tab - Acer Iconia Tab A500 WM8903
                      Acer Iconia Tab A500 WM8903

 0 [ALC5642        ]: ASUS_Google_Nex - ASUS Google Nexus 7 ALC5642
                      ASUS Google Nexus 7 ALC5642

IIUC, the "ucm2/Tegra/codec_name" scheme [2] that the current ALSA UCM uses simply doesn't work at all. Is there anything on the kernel side that I could change to get a working naming scheme? If yes, I may try to do something about it in the v2, thanks in advance.

[2] https://github.com/alsa-project/alsa-ucm-conf/tree/master/ucm2/Tegra
