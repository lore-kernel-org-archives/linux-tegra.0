Return-Path: <SRS0=kAmo=DM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D738C4727F
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:30:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 186BA2078A
	for <linux-tegra@archiver.kernel.org>; Mon,  5 Oct 2020 14:30:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Iqz8PRRw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726655AbgJEO37 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 5 Oct 2020 10:29:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726643AbgJEO34 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 5 Oct 2020 10:29:56 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D639C0613CE;
        Mon,  5 Oct 2020 07:29:56 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id s205so7604069lja.7;
        Mon, 05 Oct 2020 07:29:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=eTnn/kYDZ2BMoYt3lOwT6li62X6H6HZqtaJOYKGMGl0=;
        b=Iqz8PRRwA1HefiIetdTAflRL7/PFZahvL5Cpex3hvr5Ls5x3d77NrOz/bDJyKbQpre
         EHS32TtbLrg3b99ldQTfqIns0hV2MnzN0gBrU7Q/F8wvOfEU4cjDCqHOI5EISYSzMc+O
         a0o3ZqGAMUpYJNf7iGAj+WB7WuKQZyS0RZDWZE4orWXOdooyzATVjXoUua59xJ48hscL
         b2g2J6DiGjuw3QeSbkcztrx4KupcJppVSPwJamVBogYl9axd76d6Wh4j4S6pM1Y8094Y
         +lxZxA8vCKF2Gm/DPh/rR0i9EToBAHReEDJsEcoLobwyOoeh8uZT6taV2dBgdnouMdsK
         D1/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=eTnn/kYDZ2BMoYt3lOwT6li62X6H6HZqtaJOYKGMGl0=;
        b=ALlN/COp9pZMFeuOw2v3MnzJpAF6yRqnsuDOOZsUNitCuBji7vywvjEkshI2LeRNRu
         0LatWpFJZsynPA5IALEwHNm37WsEkz1a4ZRWjrCvf/HPyFLWS5I+r8vqYG9mQf2epG8/
         Cf4WwLCVJ91Wbor0HtcHFhOcji0DyXKrz7Nz0Y+5YNnk6nh8WP4jxoLy8w6t5NREZ//A
         lsynZgzTkXgWXvqWzYEVs+UVwg5pd269Td4TCinm5sM+CJKHVIvXqfdNHvuWQHKbbKVI
         S9Jf9TW9BF81O3iUJH9jKo0y2r6sztF4c/sIyPA0tq6Ch2OAzr8RopYtPJAxGEuJi6B5
         3Xkw==
X-Gm-Message-State: AOAM53288UyZ4J/UufbnLBV1+1OSfPgjr6sxNWbmoiubFjHnKswVHu/l
        uHQWVwxmHQ1S32mTgBQsabiOslOphL4=
X-Google-Smtp-Source: ABdhPJyJZhlMtE0jvoYtCzDL1pzsEU40Hbiyqw6qIX3RWmgHX5RBdfQJaJpngRhXFO454KmyTwgSWQ==
X-Received: by 2002:a2e:9dc7:: with SMTP id x7mr5139056ljj.447.1601908194605;
        Mon, 05 Oct 2020 07:29:54 -0700 (PDT)
Received: from [192.168.2.145] (109-252-91-252.nat.spd-mgts.ru. [109.252.91.252])
        by smtp.googlemail.com with ESMTPSA id q22sm860990lfm.51.2020.10.05.07.29.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Oct 2020 07:29:54 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] ARM: tegra: Add device-tree for Ouya
To:     Peter Geis <pgwipeout@gmail.com>, Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Bob Ham <rah@settrans.net>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20201004133114.845230-1-pgwipeout@gmail.com>
 <20201004133114.845230-2-pgwipeout@gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e7662043-7f8c-4df1-df5c-bef34983c0d9@gmail.com>
Date:   Mon, 5 Oct 2020 17:29:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201004133114.845230-2-pgwipeout@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2020 16:31, Peter Geis пишет:
> The Ouya was the sole device produced by Ouya Inc in 2013.
> It was a game console originally running Android 5 on top of Linux 3.1.10.
> 
> This patch adds the device tree supporting the Ouya.
> It has been tested on the original variant with Samsung ram.
> 
> Signed-off-by: Peter Geis <pgwipeout@gmail.com>
> ---

Reviewed-by: Dmitry Osipenko <digetx@gmail.com>
