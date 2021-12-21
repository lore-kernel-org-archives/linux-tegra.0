Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6FB4C433EF
	for <linux-tegra@archiver.kernel.org>; Tue, 21 Dec 2021 15:47:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229624AbhLUPrf (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 21 Dec 2021 10:47:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbhLUPrf (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 21 Dec 2021 10:47:35 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A349CC061574
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 07:47:34 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id x21so22068493lfa.5
        for <linux-tegra@vger.kernel.org>; Tue, 21 Dec 2021 07:47:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=P/AjqKnlbhjD52zhKuwLST7SIhcLpZikm45Z0zGIr8g=;
        b=oz1TU+1UCx2PBCN4OQBrtioUPbG6hLhpDKNcLgx9IEUzhslAyNQT+3S/srKEeF/0L1
         mnDjOYEhP/7M1h0rnzPr5H1K6gZPtML7CnDtqjnJBfPyj8AvdpMcIJTFcQrqvOKFrvsE
         IpNCoO23yd+z7bpbjZH71rSKMDI/KiwYpoojjEDHKADkEjbH+80NXYFVhJyogR9YjLhZ
         XdDv1GggRi/wCWqiMd1WOiEeKTgMK3qYnku7fzegx6DuXiy8I9bQ87Tnp0AboAc4gLl3
         zERM1MYIwOjuaXXt32oMFIkx9YAsfQBiAyIL2VDZQLZh8tyH6QD9bf9Rw8YWTTNy3iy9
         hSJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=P/AjqKnlbhjD52zhKuwLST7SIhcLpZikm45Z0zGIr8g=;
        b=Q/CWK9IHp9LGlVONS0KpQz2j3rLDT0mFTOONf+dxMd11uffgix2+oIq3z0r7Cr+Js1
         gKdZG4U3mfFqwFIgrrCQZJMPb27EDuf/PqZmwcDHDggOwRVvDrEaZVX1bb9bCsqcr/Am
         UuJ35xhGzyosF1H4jnZRxXpYL7e0OPEJqcchXVKOBykqYMF5ij5huwgYQReEEx4oDaqE
         BztP8fymMHNo0qETQQ0hfXkIUGo6RigWZvTNvNLQaONW4AXNrjbyjPvAKWQwy+6+7b/g
         CR0yUJ8elfaRTtNniMqPr1ciAgabdSE4Yts+j8CVotyZqqTmI8CZ4ohovFoXKIKD9KS6
         9nIA==
X-Gm-Message-State: AOAM532a6OU+pAnNTLnNkNVkj6sTyJDRU44iSbQQPaCZpgMkOQW5BJRp
        Hctp0ENcjF7WzN4jEIs+Oo41DUW4CaY=
X-Google-Smtp-Source: ABdhPJwpUWaPqAbiSqRSSP3dYUaQSUPtyJxaTeDK0cFwBA/ikKMVtsdvGE+98TsRLV0XpDdW/0aYog==
X-Received: by 2002:a19:6e42:: with SMTP id q2mr3478719lfk.60.1640101652838;
        Tue, 21 Dec 2021 07:47:32 -0800 (PST)
Received: from [192.168.2.145] (46-138-43-24.dynamic.spd-mgts.ru. [46.138.43.24])
        by smtp.googlemail.com with ESMTPSA id c20sm2767716ljf.37.2021.12.21.07.47.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 21 Dec 2021 07:47:32 -0800 (PST)
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
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <c2d2e5a1-7f44-a190-2ab1-84125fbe9f65@gmail.com>
Date:   Tue, 21 Dec 2021 18:47:31 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YcGzO0A/iWzhFjvE@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

21.12.2021 13:58, Thierry Reding пишет:
..
>>>> The panel->ddc isn't used by the new panel-edp driver unless panel is
>>>> compatible with "edp-panel". Hence the generic_edp_panel_probe() should
>>>> either fail or crash for a such "edp-panel" since panel->ddc isn't fully
>>>> instantiated, AFAICS.
>>>
>>> I've tested this and it works fine on Venice 2. Since that was the
>>> reference design for Nyan, I suspect that Nyan's will also work.
>>>
>>> It'd be great if Thomas or anyone else with access to a Nyan could
>>> test this to verify that.
>>
>> There is no panel-edp driver in the v5.15. The EOL of v5.15 is Oct,
>> 2023, hence we need to either use:
> 
> All the (at least relevant) functionality that is in panel-edp was in
> panel-simple before it was moved to panel-edp. I've backported this set
> of patches to v5.15 and it works just fine there.

Will we be able to add patch to bypass the panel's DT ddc-i2c-bus on
Nyan to keep the older DTBs working?
