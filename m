Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C70A8C83F14
	for <linux-tegra@archiver.kernel.org>; Tue, 29 Aug 2023 14:16:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235525AbjH2OP5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 29 Aug 2023 10:15:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235919AbjH2NCk (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 29 Aug 2023 09:02:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B0B0099;
        Tue, 29 Aug 2023 06:02:37 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-26d4e1ba2dbso2441413a91.1;
        Tue, 29 Aug 2023 06:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693314157; x=1693918957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vdHihkDodJZ1zbMYzbLK5uhU7cWISPONZ6xmGX9SPeA=;
        b=gxd2avELHPu6O8sb7n5wkVyK89hlwzKnyWNstax9GCEt769ZfvCd8grpIkZBlnJoVa
         x0vjmbR+sSny+Y5KDnWN1wyFeGk4FgV6MCEwbcJrHyEj4p0dwBQ8mQm5DmIQXH7F0XGD
         QVgYTsfulTaU7nOCgUcACrbgrfExGsQ+S6sbkX0bYIV6fwH/RtTWBtpcdZ66fIySIc3a
         jJHiuI1/1IwEMAfOIHh5m/27/fzVEVaToVTMF+Y8AbdeJTJspc6L27fM+GfvwTk20/ce
         pLsZx/cf6Wyv4bEFvNPbOfW+v3dqHjCq7KribAOJNXxMi9Rok+fC9/A7A56mMMu1RpWO
         ToJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693314157; x=1693918957;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vdHihkDodJZ1zbMYzbLK5uhU7cWISPONZ6xmGX9SPeA=;
        b=Lw0exGkKWQ4olb3Y21AJjHOoWgj0uuNkUuybga61FizDlLP7Zm2QKBwCNae33AYhhT
         t1vSbEJllZXpzfKeGay6pUTKqQjb5MzWUsX+TVY8in1GzeHTrxATHm57BRCqklTVwol7
         lKNl96yWGMSaDvCDPzxvO7uiBw45bnzVqxw2Jou5a41dQMMHTSfOVKNp7sXNgQDdQYLQ
         v0SegSR2yxTu17fzoNNT7QUSU/NtG+wtrAmJtPYwHKQfBrRNce7+loBJ7gY/y6AcGhEm
         G9E9vqnpDsAhwfFkXaVSNQwctNCzHGQg0YlbPCt66BtnfI0hOwfm3JRWqG2iZCnqy4b9
         1cNQ==
X-Gm-Message-State: AOJu0YzzJOQ9QZ547fh5vn51tjlL08UPsPjZbxPviI806MxG4RiQy4eW
        dmjJ/6k/EavsWRnZX50cID4=
X-Google-Smtp-Source: AGHT+IFucp7erZUfWzsJ6NfTC63JCtXjhh1LHMK/XIy0iDU5O0dQBrCZznFGedL78va3rvP0Z+HOgw==
X-Received: by 2002:a17:90a:f98c:b0:270:87d:34d8 with SMTP id cq12-20020a17090af98c00b00270087d34d8mr7232811pjb.44.1693314157017;
        Tue, 29 Aug 2023 06:02:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ds1-20020a17090b08c100b00262e485156esm10737940pjb.57.2023.08.29.06.02.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Aug 2023 06:02:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <340b37a3-662d-b186-aee6-98e73693b601@roeck-us.net>
Date:   Tue, 29 Aug 2023 06:02:34 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH V2 0/4] hwmon: ina3221: Add selective summation support
Content-Language: en-US
To:     Jon Hunter <jonathanh@nvidia.com>,
        Ninad Malwade <nmalwade@nvidia.com>
Cc:     jdelvare@suse.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        thierry.reding@gmail.com, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20230825164249.22860-1-nmalwade@nvidia.com>
 <482ac044-e163-478c-8e67-5f03d7dc7820@roeck-us.net>
 <b6ca9be7-49b2-f72e-b51f-b778786e0646@nvidia.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <b6ca9be7-49b2-f72e-b51f-b778786e0646@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On 8/29/23 05:52, Jon Hunter wrote:
> 
> On 25/08/2023 18:11, Guenter Roeck wrote:
>> On Sat, Aug 26, 2023 at 12:42:45AM +0800, Ninad Malwade wrote:
>>> The current INA3221 driver always sums the shunt voltage for all enabled
>>> channels regardless of the shunt-resistor used for each channel. Summing
>>> the shunt-voltage for channels is only meaningful if the shunt resistor
>>> is the same for each channel. This series adds device-tree support to
>>> allow which channels are summed in device-tree.
>>>
>>
>> V2, but no change log. I am not going to review this series.
> 
> Sorry about that the changelog is ...
> 
> Changes since V1:
> - Added patch to convert dt-binding to json
> - Added patch to add new dt property for bypassing/disabling summation
>    support for a channel
> - Added patch to populate ina3221 devices for Tegra234 boards
> - Updated summation bypass patch to display summation status via sysfs
> 

I have not looked at the patches, but this non-standard sysfs attribute
is a no-go. Use debugfs if you want such information to be available.

Guenter

