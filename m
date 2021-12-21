Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C5A1C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Dec 2021 16:45:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239971AbhLUQpf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 11:45:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239280AbhLUQpe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 11:45:34 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C60D6C061574
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 08:45:33 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id bu9so9134839lfb.7
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 08:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6BcxuSoP4KKIbKcDwoVqc9P1xJ4zWJFdyW7tJdDGuqM=;
        b=U35HBS5uUor1AtMLIHNRQOgZoU28Ks462TgyqbscU/EDyO4KNZLAmVlLrsxtLLkQrT
         akcaozUWLxCi1NlR0QVBfscek8EsIyPOUI3Jx3C6VTDDB7mnrxWXDcBA7gS4a9lm4Na5
         k+3Tb8cEZq/INP9tDlgerGTjw80jH3hThBV0BbhfqhNbYryp4vdShtUrfDwXct9zQ9+z
         rgYEdstQNBICzOt4KLf/4nmaFTGkMpkOZo/Sur5+QD5zrr3JdhS7/Z0P/1LeHdc1qsQM
         QUBz5RH2Z3MOxhp6vKBNQHKZqefyvo/VO1vskNLr1h7lnjvKqPaowsSbaDNs3vCy53gM
         daHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6BcxuSoP4KKIbKcDwoVqc9P1xJ4zWJFdyW7tJdDGuqM=;
        b=vb1054h+rThLmJCRWxGFs5w2b8h+C/+zgmOJdvbjXKkR/0GsMTWbgi97Cn5PKMWIqk
         4Cl1CbhE3WfWeORP4FESvSg1WHIrzHU1dVpzxczvhwafBavDIOiCgdueazCERH+uZRWb
         g/4kOrmDj/JvH6NEgJVUWLniDLh/MVKCHXxS25iH2f2FPg/bi4YRBtxKA11d9zX6YdvB
         5mkRRheuv7AR087icKent9dQaR7VK8Lwa4wtXiEdY5sylBaqM18Q1trGIgbvDijFGn3/
         dF9mRtrxRtktNIHeM1KNAfRQEflxRzNmpuoeLLM0Dn6QT7CFjvll4uWUaXY79N+HLehW
         kX4Q==
X-Gm-Message-State: AOAM530WimPg1gOwILAJU5htuqIZwFxSkXqHeAyIji0YTTf4g9Vid41i
        vuJ+LG12gyBibCJcmD9C6Cvke3+pk4I=
X-Google-Smtp-Source: ABdhPJxY//gm8ktKuhUgK3t9T0aUAQHZ6jPz+4q3MwYgjnL3RJW6PG3rDFKkA34L7WB55U4khI73mw==
X-Received: by 2002:ac2:418c:: with SMTP id z12mr3833570lfh.90.1640105131915;
        Tue, 21 Dec 2021 08:45:31 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.googlemail.com with ESMTPSA id h24sm2677380ljg.106.2021.12.21.08.45.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 08:45:31 -0800 (PST)
Subject: Re: [PATCH 0/2] drm/tegra: Fix panel support on Venice 2 and Nyan
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Thomas Graichen <thomas.graichen@gmail.com>,
        Douglas Anderson <dianders@chromium.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20211220104855.428290-1-thierry.reding@gmail.com>
 <dd7a2f23-00d6-9160-1e09-1d4ea5b1f5e1@gmail.com> <YcCg/xktJ2uShFRf@orome>
 <e27bd5e0-51d2-875b-aa41-f198230880ac@gmail.com> <YcGzO0A/iWzhFjvE@orome>
 <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com> <YcH+Fw9sCzCIzFIx@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1bac3b32-ad9b-4d10-c7fb-6aafd353cdd4@gmail.com>
Date:   Tue, 21 Dec 2021 19:45:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcH+Fw9sCzCIzFIx@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.12.2021 19:17, Thierry Reding пишет:
> On Tue, Dec 21, 2021 at 06:47:31PM +0300, Dmitry Osipenko wrote:
>> 21.12.2021 13:58, Thierry Reding пишет:
>> ..
>>>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>>>> instantiated, AFAICS.
>>>>>
>>>>> I've tested this and it works fine on Venice 2. Since that was the
>>>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>>>
>>>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>>>> test this to verify that.
>>>>
>>>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>>>> 2023, hence we need to either use:
>>>
>>> All the (at least relevant) functionality that is in panel-edp was in
>>> panel-simple before it was moved to panel-edp. I've backported this set
>>> of patches to v5.15 and it works just fine there.
>>
>> Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
>> Nyan to keep the older DTBs working?
> 
> I don't see why we would want to do that. It's quite clear that the DTB
> is buggy in this case and we have a more accurate way to describe what's
> really there in hardware. In addition that more accurate representation
> also gets rid of a bug. Obviously because the bug is caused by the
> previous representation that was not accurate.
> 
> Given that we can easily replace the DTBs on these devices there's no
> reason to make this any more complicated than it has to be.

Don't you care about normal people at all? Do you assume that everyone
must to be a kernel developer to be able to use Tegra devices? :/

It's not a problem for you to figure out why display is broken, for
other people it's a problem. Usually nobody will update DTB without a
well known reason, instead device will be dusted on a shelf. In the end
you won't have any users at all.
