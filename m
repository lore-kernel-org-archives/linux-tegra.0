Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97216C433B4
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:17:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E02561186
	for <linux-tegra@archiver.kernel.org>; Fri, 14 May 2021 22:17:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232475AbhENWS5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 May 2021 18:18:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231616AbhENWS5 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 May 2021 18:18:57 -0400
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com [IPv6:2a00:1450:4864:20::22b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47939C06174A;
        Fri, 14 May 2021 15:17:45 -0700 (PDT)
Received: by mail-lj1-x22b.google.com with SMTP id o8so274656ljp.0;
        Fri, 14 May 2021 15:17:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=O1jDJoBF1IIxiwPu5dY/r3QCpZYHEApy1Q8WasD1I74=;
        b=XOe6oz1eSrcyvbewViSVlBdGbWmi+LlldjNnFiaBZEXu6jap0XmE4v25SMXvAt2e6k
         N9IoyrINuZQtJn46kcbzkD2gyRrIeLUh7rRZcmTCXa7C41G3gvd0+mRT1ZiF571KFdgW
         e0YMT/r9quhCN4jWlF6iE4ePJakggJK5CPA1P044fN6/N+JOs5G57+T+16bawLPX1W5K
         0cz2UctZYeCQ5QD8jugq7HuMrlacTAhJOdX7oV0D/IPDt8AeRwZ7GvwPAci/KkKYadMJ
         uh9vNhPbtXIa2+pmOM2iw0Q77rNgtrAEOW2pWHIpr78TaYwHbPG5raPQhPcOJGsz+qB1
         rIVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=O1jDJoBF1IIxiwPu5dY/r3QCpZYHEApy1Q8WasD1I74=;
        b=n4k+2q2PpAm0NJQqZ9rCPvKE2o6gauuyiz/pI5UpKnLdLDPDevnDryz0dxdsAzAgyB
         FZaluFQMcjwdph+60JD1Rl2rfSFyzTWr9CShg2WYVk6vaXij6fft83/p5TmUhpTqCtVl
         BqsHKtBWXHf/3wLYai17syJPF43tN4WHQ6eYihpV5v2JXV5aGJqBNTY5IcWrcnN0Huv3
         /zrbJoINYutwSv4hHYgLmZaJjyM/pNDeknDSTiUmNaX3XAX29Mj90sc15rXuarDFfZFr
         hfzCnkyrmHkI34ML45I568utexmLqtxCps+I6cTnys5oPj6FWAtwleKEJ+uur6XFnxjS
         6aRw==
X-Gm-Message-State: AOAM533DK/7n/Y/AKYEFAWEclrdlIXlVvMT8kG7HFjrZQm22sYhCE3t5
        rNj9aQC25wcFFrzOdNEjU4gz7f5eLo0=
X-Google-Smtp-Source: ABdhPJwPQuk4D+DULcz+oF1lH/aCd4AZW2B2bjMwnM3wqyDIGoWSC1BZsOQ9zXlhKTNgc4Bl8dUVdg==
X-Received: by 2002:a2e:99c2:: with SMTP id l2mr38438446ljj.125.1621030663504;
        Fri, 14 May 2021 15:17:43 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-91.dynamic.spd-mgts.ru. [109.252.193.91])
        by smtp.googlemail.com with ESMTPSA id t10sm1487311ljj.44.2021.05.14.15.17.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 May 2021 15:17:43 -0700 (PDT)
Subject: Re: [PATCH v1 03/10] ARM: tegra: acer-a500: Bump thermal trips by 10C
To:     =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Agneli <poczt@protonmail.ch>, Paul Fertser <fercerpav@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210510202600.12156-1-digetx@gmail.com>
 <20210510202600.12156-4-digetx@gmail.com>
 <20210514211601.GA1969@qmqm.qmqm.pl>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d961df59-49fe-94b2-fc1c-7ed3ead6abd7@gmail.com>
Date:   Sat, 15 May 2021 01:17:42 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210514211601.GA1969@qmqm.qmqm.pl>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

15.05.2021 00:16, Michał Mirosław пишет:
> On Mon, May 10, 2021 at 11:25:53PM +0300, Dmitry Osipenko wrote:
>> It's possible to hit the temperature of the thermal zone in a very warm
>> environment under a constant load, like watching a video using software
>> decoding. It's even easier to hit the limit with a slightly overclocked
>> CPU. Bump the temperature limit by 10C in order to improve user
>> experience. Acer A500 has a large board and 10" display panel which are
>> used for the heat dissipation, the SoC is placed far away from battery,
>> hence we can safely bump the temperature limit.
> 
> 60^C looks like a touch-safety limit (to avoid burns for users). Did you
> verify the touchable parts' temperature somehow after the change?

The SoC is placed under a can. Both front and back of device are large
metal planes which dissipate heat efficiently. I don't recall A500
getting hot ever and I'm holding it in hands every day. From a user
perspective it may feel like a part of device getting slightly warm in a
worst case.
