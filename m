Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26377C433F5
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Nov 2021 12:12:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241457AbhK3MPx (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Nov 2021 07:15:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240941AbhK3MPx (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Nov 2021 07:15:53 -0500
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com [IPv6:2a00:1450:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BCD4C061746
        for <linux-tegra@vger.kernel.org>; Tue, 30 Nov 2021 04:12:34 -0800 (PST)
Received: by mail-lf1-x131.google.com with SMTP id k37so53253521lfv.3
        for <linux-tegra@vger.kernel.org>; Tue, 30 Nov 2021 04:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bc5K5YmYf78G284ZTH0v7tQEmW7lp6rl84/YK+dus9o=;
        b=ZmQHn59B4TF0K+0OSuEGNLFsZWWW0OJpsiXtMxRnI9T0w8E8HGTA++72P50IpNiyu0
         SQi0pkLi1Gyk9HFaKqh3oXhe6dg2KfIdgPvZvN6yBkFbzrntQsgzvlRLVTT8VUBk2QIe
         Gm8z3ZBFcP1XlqD+bJZ4+eScwNWngKo6w3S1EiWHo33L01jCh/27jwcph8s2IN7kRPuu
         FpnFUgIRQY2bX6urfhLNaCQWKV3OmkuCupRrELA0dgIgMUZ1U5npsuxEU0lL0EMlp+aQ
         QUPQssia8NrBquNWfjkf6YkPHH923fFNtGP73fgnBKg8Rm5+KwaxBj/iunceCHNkzC/0
         4gVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bc5K5YmYf78G284ZTH0v7tQEmW7lp6rl84/YK+dus9o=;
        b=y9T1PsLGz1ZR48EEFamWSMqB2IKIGkYMLC7LcNWzuzQThmPDqcghwoJOD0UzuUq1T4
         8oR2yel8awpFIVDoznv224q7rCwTZFhyNwUtXHBtHNMA09QY1EjLWSNgh0iHmjkks3U6
         chISNkvQBE1ZCcQK2Ia5L7k2R90Prbh4TGOALqkgxtzzh201LFQHwytYIWdsRgmbVbIN
         UvFRkU0wKV7SdqEy1/Mgq9RiV30IhpK3D/NHHEGAa70z8VkqhCpYsRN9XZTSGdzey4Gh
         m1uBDTO9t5Efa7+sgFiMSXW7EyvX8Nv7Kr+hqW7oYF+TmnlHExUPn3xbQvlCktGpDGxC
         baEQ==
X-Gm-Message-State: AOAM5329m7VWcAvqptdHdsVzRY7SaNLtlHQW2t4pafDYSwHoHltyuBg5
        G00GkHTuSO4NP2XWXlUDZhn2ISEIKJw=
X-Google-Smtp-Source: ABdhPJzTYyXWQjo+8VeOYssyJoJ/mtL0kk4751xYFHHayZZwsQHY6SswTTjj4IIyn2brhQGsV660rw==
X-Received: by 2002:a19:fc08:: with SMTP id a8mr55550400lfi.645.1638274351317;
        Tue, 30 Nov 2021 04:12:31 -0800 (PST)
Received: from [192.168.2.145] (94-29-46-111.dynamic.spd-mgts.ru. [94.29.46.111])
        by smtp.googlemail.com with ESMTPSA id h20sm1690971lfg.14.2021.11.30.04.12.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 04:12:30 -0800 (PST)
Subject: Re: [PATCH V2] soc/tegra: pmc: Add reboot notifier
To:     Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>
Cc:     linux-tegra@vger.kernel.org
References: <20211123111134.26409-1-jonathanh@nvidia.com>
 <eeb4200f-7608-56d5-76e3-508660669812@gmail.com>
 <b2f11233-819c-a33e-aa92-fea7e818dfbb@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <2b5a6530-638d-ae9c-483a-d6039eb44c63@gmail.com>
Date:   Tue, 30 Nov 2021 15:12:29 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <b2f11233-819c-a33e-aa92-fea7e818dfbb@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

30.11.2021 12:08, Jon Hunter пишет:
...
>>> +static int tegra_pmc_restart_notify(struct notifier_block *this,
>>> +                    unsigned long action, void *data)
>>> +{
>>> +    u32 value;
>>> +
>>> +    tegra_pmc_program_reboot_reason(data);
>>
>> So the PMC reason is programmed twice now? First time by the reboot
>> handler and second by the restart? Why?
> 
> That's an oversight. OK, thanks I will fix that in a V3.
> 
>> BTW, could you please always CC LKML or request to include linux-tegra
>> ML onto lore? Tegra ML uses Gmane and it's unusable for development
>> since all email addresses are mangled, the Gmane support told me that
>> only Tegra ML admin can disable mangling, but I'm not sure who is it,
>> maybe Stephen Warren?
> 
> I see linux-tegra here: https://lore.kernel.org/linux-tegra/

Nice, I refreshed the list of MLs in Thunderbird and see that it's
indeed there now, thank you.
