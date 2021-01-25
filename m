Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD411C07EBE
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 19:22:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7987322A84
	for <linux-tegra@archiver.kernel.org>; Tue, 26 Jan 2021 19:22:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbhAZFqg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 26 Jan 2021 00:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60412 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730208AbhAYPmM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 25 Jan 2021 10:42:12 -0500
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C795C0611BC;
        Mon, 25 Jan 2021 07:27:33 -0800 (PST)
Received: by mail-lf1-x135.google.com with SMTP id v67so18347799lfa.0;
        Mon, 25 Jan 2021 07:27:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=UoWqLYFxEb3nF4ce0Tbsv2hSrI7OApPalzEh2y4l+cg=;
        b=apX8fpQRgXrDIIQdjhUlTMXanMxM8vUDXIXSQxsrotsPIpCU3fVl8nY1YSQaDejIuV
         dMgju/qSlputc6pRNtgKBzQxzNpw4j9gADNtjJHru12juCIpeM8mif1GHz2d0r/2k16o
         aSR7B67E5usnCWLnTai1SHUwssmY+SFCBsktn2XmcUibTdzawm4AHdcZ/mq1ZYxmQwvb
         qfUNzewXuyTQMasbbW02FnhTG71BJB5ta2ayJHvm+eYvOxS8NSUQKUikYW+vBWlcNs1a
         fUKPSWRLzYwNO2Q7MVbX90QA18Fe7TsS8XixZVhjR7DOjzoEljVqH9PhXu06e64suN7K
         HTnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UoWqLYFxEb3nF4ce0Tbsv2hSrI7OApPalzEh2y4l+cg=;
        b=ggfRmOi77Yyc9zwHYRL9QaMiHTFruu+L0f/ZYz5TTk6te4RGs4r1HTKO9/6U8hYx2k
         R2sNaKrkjw2wfg+GGk/bNdpxR2+dNUDMWEUMAndAdjseDbGFJncDtUxVzHwgdWOJQQPe
         NjO2Jph5ik4IJOKJYF9gyufRCOv+enegKtaSAaaw5ojnA+Y8maxF71gYymcL3u0P3Vzz
         nni+eu40feiDXsZb7W12Z68p1SYn82yrPsFnYEtQpfMqJcVYp1qBuA0wl9Xm3kg24JnR
         XBjPCxi9VISJUy/HLlrccw/kh3olR0XkVP9FCTU2HnF4HhN6mWkYLXjyBGRGC0kegF3G
         /tDw==
X-Gm-Message-State: AOAM531xYLKVWwhu2QXVJ+fjzm+fnLavjU9YfykFlmcaep1JWzcMPMuA
        dm46jDu+AVRkXkPAjl01HXsSZQ+C9BE=
X-Google-Smtp-Source: ABdhPJzDcoM6wlnR4aq1O5cH1RDetElITIqHpJu7IarP73ywYIe7RT+4sbqdWBMZvwGLKk3tZuJ6Fg==
X-Received: by 2002:a19:d83:: with SMTP id 125mr460486lfn.651.1611588451591;
        Mon, 25 Jan 2021 07:27:31 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id x2sm1928237ljd.63.2021.01.25.07.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Jan 2021 07:27:31 -0800 (PST)
Subject: Re: [PATCH v3 2/6] ALSA: hda/tegra: Reset hardware
To:     Takashi Iwai <tiwai@suse.de>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Jaroslav Kysela <perex@perex.cz>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20210120003154.26749-1-digetx@gmail.com>
 <20210120003154.26749-3-digetx@gmail.com> <s5h35yp3uzn.wl-tiwai@suse.de>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <7535a927-5246-4ccf-63fe-f8ded9eb6c52@gmail.com>
Date:   Mon, 25 Jan 2021 18:27:30 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <s5h35yp3uzn.wl-tiwai@suse.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.01.2021 18:18, Takashi Iwai пишет:
> On Wed, 20 Jan 2021 01:31:50 +0100,
> Dmitry Osipenko wrote:
>>
>> Reset hardware on RPM-resume in order to bring it into a predictable
>> state.
>>
>> Tested-by: Peter Geis <pgwipeout@gmail.com> # Ouya T30 audio works
>> Tested-by: Matt Merhar <mattmerhar@protonmail.com> # Ouya T30 boot-tested
>> Tested-by: Nicolas Chauvet <kwizart@gmail.com> # TK1 boot-tested
>> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> 
> Currently we have neither dependency nor reverse-selection of
> CONFIG_RESET_CONTROLLER.  It wouldn't be a problem for builds, but
> you'll get a runtime error from
> devm_reset_control_array_get_exclusive() always when
> CONFIG_RESET_CONTROLLER=n.
> 
> I guess it must be a corner case, but just to be sure.

The CONFIG_RESET_CONTROLLER=y at least for ARM32 Tegra builds.

https://elixir.bootlin.com/linux/v5.11-rc5/source/arch/arm/mach-tegra/Kconfig#L15

Not sure about ARM64.
