Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E81A4C433EF
	for <linux-tegra@archiver.kernel.org>; Fri, 10 Dec 2021 15:28:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235341AbhLJPcP (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 10 Dec 2021 10:32:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231651AbhLJPcO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 10 Dec 2021 10:32:14 -0500
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 68040C061746
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:28:39 -0800 (PST)
Received: by mail-lj1-x22a.google.com with SMTP id l7so14300849lja.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Dec 2021 07:28:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uAsrTzimnlAecR9PKGy2FhtMJH+2kV9fQLxVMMQj13g=;
        b=PziCei16mNm5P7fgfPohb+aU+E17raTwaO1y1Bk/GM+MT7qfsPu3lUOhEjxRqLw3JX
         e4685kbgm9aGJ1DxKUeF1ZfOQZ2TACR0bQLYbu1bcXkXfnV2l7HI2RsE+rfiN0+NOkvc
         1Lp5t52QLbIhuwJ/ri08qQqGp8F1mZiTnwLX29VaixVPsmCyTMeai7Dmn8JSMAf7hn47
         /UxBEhaQ0AMPeT5YkDh146xVJjtzTv8X3vvs3xmefhij1/PxYuWb9rPY7HZxNKw+1k/F
         qNBmCYnQGJhMN/hCLGL6I9EGkxjD8SIhHOZgubwwK4I/4VbLdm4og0iiBhjIOIEoEQNX
         NRWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uAsrTzimnlAecR9PKGy2FhtMJH+2kV9fQLxVMMQj13g=;
        b=eYiETzweJyBsBwq+TT3jvSFmSTvRp0geFyrwrMChugrKiQASYcl9D5CTkxjAH+3Tse
         G1VuEnta72qWZTGI+LxeZ3ALgk9NF7aqyvG3m7LY9zmu2mgec7mJOQmQwqWmtKzu4u0M
         CMHHgaC3idHp5o9JvybcFFYe+3sJjJzGxvjcxSINRYdyGLi/9w1qIL1L8YtjC4UC+/wn
         m2OW2qihs7kjk9p2QSmCAb1cNKvUnWgdnc8dZ5jDiePFbeGuZ+8cI/QLu5xnzRhbpcsm
         KBwCgJvWhtbpQyTSgdvWSpPZvte9ENDJxtmXyrFhjve+4Vxn2P8WSDT+205acc1qE9Je
         p18A==
X-Gm-Message-State: AOAM533TGCg+XG69OFH0W3kgjHRP9V994yrQXApq3svxUYorGoN4lako
        p7acfscR5d05d3cVo30jcnrKZgRArdk=
X-Google-Smtp-Source: ABdhPJyv82pq98svbBQPlgO4QVGGIRvYzllKBTUYgnYDMifyVSR5rchGWJIfj0RXZTQzbmpZVFuwEg==
X-Received: by 2002:a05:651c:1507:: with SMTP id e7mr13517270ljf.83.1639150117445;
        Fri, 10 Dec 2021 07:28:37 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id i26sm338812lfl.261.2021.12.10.07.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Dec 2021 07:28:37 -0800 (PST)
Subject: Re: [PATCH 07/25] ARM: tegra: Add #reset-cells for Tegra114 MC
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org
References: <20211209173356.618460-1-thierry.reding@gmail.com>
 <20211209173356.618460-8-thierry.reding@gmail.com>
 <f63ccf90-2def-e241-5f86-1166ab938d8d@gmail.com> <YbNZlyjpi/i2Dph6@orome>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <60c59ccd-eed4-3046-3ecc-b74475778a3f@gmail.com>
Date:   Fri, 10 Dec 2021 18:28:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <YbNZlyjpi/i2Dph6@orome>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.12.2021 16:43, Thierry Reding пишет:
> On Thu, Dec 09, 2021 at 11:34:39PM +0300, Dmitry Osipenko wrote:
>> 09.12.2021 20:33, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> The Tegra memory controller provides reset controls for hotflush reset,
>>> so the #reset-cells property must be specified.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  arch/arm/boot/dts/tegra114.dtsi | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/arch/arm/boot/dts/tegra114.dtsi b/arch/arm/boot/dts/tegra114.dtsi
>>> index 328425dba023..ce7410ee08b8 100644
>>> --- a/arch/arm/boot/dts/tegra114.dtsi
>>> +++ b/arch/arm/boot/dts/tegra114.dtsi
>>> @@ -542,6 +542,7 @@ mc: memory-controller@70019000 {
>>>  
>>>  		interrupts = <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
>>>  
>>> +		#reset-cells = <1>;
>>>  		#iommu-cells = <1>;
>>>  	};
>>>  
>>>
>>
>> This will conflict with the patch that adds video decoder node [1].
>> Since the VDE patch was sent out earlier, I suggest you to drop this patch.
>>
>> [1]
>> https://patchwork.ozlabs.org/project/linux-tegra/patch/20211208173609.4064-23-digetx@gmail.com/
> 
> I prefer to keep this separate because it actually gives the reason for
> why this is added, whereas with the VDE node patch it looks like it's
> there by mistake.

So the direct reference to the MC using TEGRA114_MC_RESET_VDE is a
mistake to you. I disagree.

I don't mind if you'll keep this patch, but then please don't forget to
resolve the conflict, or we may have two #reset-cells entries.
