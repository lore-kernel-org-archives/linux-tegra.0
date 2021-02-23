Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F6C2C433E0
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 05:12:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1D05364E21
	for <linux-tegra@archiver.kernel.org>; Tue, 23 Feb 2021 05:12:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbhBWFMm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 23 Feb 2021 00:12:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51008 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230291AbhBWFMl (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 23 Feb 2021 00:12:41 -0500
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1E8DC061574;
        Mon, 22 Feb 2021 21:12:00 -0800 (PST)
Received: by mail-lj1-x234.google.com with SMTP id g1so55709687ljj.13;
        Mon, 22 Feb 2021 21:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MqKNcCWFmGpjZ57u9e3bWqEH/En69wSXNYW/psMEX2A=;
        b=XBIU3ShVfEYVkEfsJoA0zfHk+Idyqi6d6Z7/C5x061wFD604LIHtE2G3rdjNtmRI6C
         aoXib0vcLdPaLrUwEia9MaVe2NbvprPBnctkHWN03strp7uoWDb+pnS5SlynldbNDVPB
         Jc6e+OOazOyAZic0DCJxMg8nWKnYb0uuwlfbPIOMcyE53QXmEstQrz67QU0CoU0gHEdb
         pkmpWFAbHjNiFak7P7pjWGXdjHxn7uM0MwdtXuvfaNz2kaxTue+UMWqHxGWvVT9oK9En
         ahEPGlsFDCkRjvsvYyvEb/I3PMlw2N9vFPGQWSQzFprBQXd7iBG02u0hd+2uXMTtvZtb
         47iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MqKNcCWFmGpjZ57u9e3bWqEH/En69wSXNYW/psMEX2A=;
        b=MgAssONdBlUL3YRBLL7VYKEFDe2eKEjEZYFcZwXKOc7Zg/6Z/geyfafpMvC6F1Bjza
         InshzVf2vOZ+eNlIEfG9vO9I4u0GCRhrhJjqnN241x0He5lECWX/S8myoAExIsxapmt4
         dshWR9Gmh4NoOIZTMTZZMgqwvuSjn5mRqFKCfTyV/M45kqncPaIsAIhgUjXAZzjCWq8W
         AaJ8CdjMMPIoxga6ksl5g55G2X9p/QE0Z3BjPuecyvYbj0/kY9r/yrK166pDx41uZ9gr
         U2GNUTIuZDR8n7fDjJH2E25IcpZm7+P4fPliTkahEVsIG8N63xs0sSK6Ca/RtDzXUraB
         7Tnw==
X-Gm-Message-State: AOAM533OIkpsSeHN1twfIm8HXEO5VObKTf0HwnYUvC907QP+NqO9Gn62
        SGxCvV50FvYvOrmTXym6RqA=
X-Google-Smtp-Source: ABdhPJyrVHXWEDuuAo5M4a3B67jAnmirbj+V3eqJCAz0dRDjZXUlzTZ5E5rz/CGQq1K0k5QoUiuv1Q==
X-Received: by 2002:a05:651c:54a:: with SMTP id q10mr15763669ljp.454.1614057119252;
        Mon, 22 Feb 2021 21:11:59 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-52.dynamic.spd-mgts.ru. [109.252.193.52])
        by smtp.googlemail.com with ESMTPSA id 124sm229007lfh.252.2021.02.22.21.11.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Feb 2021 21:11:58 -0800 (PST)
Subject: Re: [bug] RTC alarm vs system suspend race condition
To:     Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc:     Alessandro Zummo <a.zummo@towertech.it>, linux-rtc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>
References: <0a82c37e-ba83-a853-1db8-ba267f7728d7@gmail.com>
 <YC7GVnhsOmQ3uCnL@piout.net>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <6ca90632-c149-5f8e-28c5-1a2a78c3e42b@gmail.com>
Date:   Tue, 23 Feb 2021 08:11:58 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <YC7GVnhsOmQ3uCnL@piout.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

18.02.2021 22:56, Alexandre Belloni пишет:
> Hello,
> 
> I just wanted to thank you for reporting this issue. I didn't yet have
> the time to work on that but this is on my radar. There is also another
> issue when resuming and I'm not yet sure how we can solve it for all
> platforms.

No problems, please feel free to ping us if you'll have something to test.
