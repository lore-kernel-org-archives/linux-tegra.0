Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23826C001DE
	for <linux-tegra@archiver.kernel.org>; Mon, 17 Jul 2023 08:50:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229970AbjGQIuL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 17 Jul 2023 04:50:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53088 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229938AbjGQIuI (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 17 Jul 2023 04:50:08 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4C5021B0
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:50:07 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2b6f943383eso60147521fa.2
        for <linux-tegra@vger.kernel.org>; Mon, 17 Jul 2023 01:50:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689583805; x=1692175805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cRtKeBQgmHxd1qwAjF5+7xOi7ACRnyz8GWvFGlC6NaI=;
        b=lVfpkQDsBX2jijJ4cQd5xDprfhUNfw+aFWl/SPbCtiH62iMx/8tcv3FZtiDC5iZXvL
         UF0U5XpUvYQyNYEGqoPbPA52WJfZiXgMdBSNpBen0u5iQRyU0nEzTLH7e//LPsYZmwqr
         9FtApY0tH6RWkzGKpYfGcuh5ZYQx3dbsT4Jtfsn33FjmXwFg99e4ZUYhz0T6WwLdU4F3
         kMQU4dighH+gfA66aK934nxet643bbGtnOjHSlVBp1xct+AYgNpMGi+15wlUNj5zb5AK
         qKmNe4sE8e5XHDoTcKdiAy27xeOe6IQlCZy3Z7J76QhwwOUwzXCjpXDBAWENmx80wWIR
         YvbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689583805; x=1692175805;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cRtKeBQgmHxd1qwAjF5+7xOi7ACRnyz8GWvFGlC6NaI=;
        b=C2H05rm1f2dWnZjVloe3c2lalgu02k++uYsei/9reIeXgyPGadDpp22oV5QIWEpXBh
         8Q5qBUupiMivfO2VyOojXJqHC45N33GCNsCjSVMAME0kRjP/ilq0n4Jt5+cPUS/Mmf2Y
         9wIP0KndalhS77V5tbD9LFifjScI7gu/SBs1zs3kUdM43P3ZGUgsjBs9VCTYYr0YoE20
         7Z940jkycXGmTVcEf56fpEfsJvcRXrme9DXuk4NTrlQOH0e4K8ENwXeobXaY2z3kLzGM
         BtXXs33zbOVGqiVBMKbVgWfSvDOeKppY6HVD0OtD2vwFeX20y+exrLuDvfMljK2YKguC
         zR5Q==
X-Gm-Message-State: ABy/qLZxcmVxhDOkRIIhjrS/seVEpcAt2z0BrPcqZY98PhrtFBpVZwEK
        lx7dp+c9gggMRiPSOucbmG0=
X-Google-Smtp-Source: APBJJlGws6xut/nEDK6Y4fbvQgfSFieY8ikJ5dVIQCGVJAUbd9LkWpYAmzC37FBGQDUdhC+GVqkZSw==
X-Received: by 2002:a2e:9d47:0:b0:2b6:d9ad:aec9 with SMTP id y7-20020a2e9d47000000b002b6d9adaec9mr7701768ljj.35.1689583805150;
        Mon, 17 Jul 2023 01:50:05 -0700 (PDT)
Received: from [192.168.2.145] (109-252-154-2.dynamic.spd-mgts.ru. [109.252.154.2])
        by smtp.googlemail.com with ESMTPSA id o8-20020a2e7308000000b002b9358f5088sm1091623ljc.53.2023.07.17.01.50.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 17 Jul 2023 01:50:04 -0700 (PDT)
Message-ID: <78ba744f-d7f6-2388-0330-1a5105c9dca5@gmail.com>
Date:   Mon, 17 Jul 2023 11:50:03 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: LVDS panel compatible strings
To:     Thierry Reding <thierry.reding@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>
Cc:     David Heidelberg <david@ixit.cz>,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        Maxim Schwalm <maxim.schwalm@gmail.com>,
        =?UTF-8?Q?Pedro_=c3=82ngelo?= <pangelo@void.io>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Zack Pearsall <zpearsall@yahoo.com>,
        linux-tegra@vger.kernel.org
References: <ZLFd_L_Uw1PmpSep@orome>
 <CAPVz0n3fj77JEzJbYve9-5pjjVt+yJHNcFGqJr0HFSJnaOtbzw@mail.gmail.com>
 <ZLFmxuVuO2FWy1as@orome>
 <CAPVz0n0sYJvKJRmwBRpp_aUx7HbgbcLnkAJAV82XryHVeeYcHA@mail.gmail.com>
 <ZLTq3KXeV-tT_HFG@orome>
Content-Language: en-US
From:   Dmitry Osipenko <digetx@gmail.com>
In-Reply-To: <ZLTq3KXeV-tT_HFG@orome>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

17.07.2023 10:16, Thierry Reding пишет:
> For cases where the timings are the only things that differ, the DT
> bindings allow overriding the timings specifically. So you might get
> away with using one of the existing panels if it is close enough and
> patch up the timings in DT.

If panel-simple supported timings override from DT, then panel-lvds
indeed could be removed. But panel-simple doesn't support it:

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=a21f18a993c56566db94ba836684bc32c070a82c
