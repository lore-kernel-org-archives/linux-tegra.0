Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0B0CC433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 14:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90E4D6198D
	for <linux-tegra@archiver.kernel.org>; Mon, 22 Mar 2021 14:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229692AbhCVOoa (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 22 Mar 2021 10:44:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229591AbhCVOoE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 22 Mar 2021 10:44:04 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FE33C061574;
        Mon, 22 Mar 2021 07:44:03 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id i26so5848779lfl.1;
        Mon, 22 Mar 2021 07:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=zI0qMXNSeXWkmjLx/rxCTs/IrQfMrB84lSC45WohEb8=;
        b=NySQEmQrIYpVG8gZNVHI3CiB/LYRUq/j8d2JALKnJeonlnt7lcmfMUIyIATzNJcA7f
         UB1avLvIgVeKONz/Rixb5wh6B2NKqnLLEXmt/cGnAuL5EVT5dlc8hNMXZLCAWsBiDIFm
         MPAWxXiHDIFJwO9jEAMvsTiVQgSLnRnasdCvrJe/WKG90OqoUqPSUczbv69B1RPjnRha
         hx6Bs/PP2zkB3qEf6BKSrALmVvYmWdlJa1aW/boTGtFHSGEkFgfRJxpaY5z+7xkrPTBY
         vdzzVxqef/hI9b73tdbhPSu8ek0zFLYHAPjpniXsclLfX8rjB8QTfGvDnc8mxOy/13Nr
         2YbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=zI0qMXNSeXWkmjLx/rxCTs/IrQfMrB84lSC45WohEb8=;
        b=kcV3ZOJE8fl401K/UBpGyNnz7X9BQ3oHAzgBkioiGJhAsnJNa8H6DJ8E6eHGN3yFTZ
         w5UYbD86jb2jvOvgc3KGPaOf382Y7R7IcBN90OCRhUHXRg24mMIUZFwuzHOy/Ms2fumi
         fexCdf8774kDIzSZU8eNFIEgfFlzhZnvcD2JwE3edzeUYZo+HiSclOolT/q2cjMPsFHs
         0ViOxbN2+7TYLLsFd0DKXI0Ron0lu+A0qT2ZDsI+eTdrxAHvKAx4INDQztum6ntd2ZcZ
         zRjcjWXn5Z734mM8xHx0eo+52VYVjobTF5z9udZ62c1rJHfrSI8QeosVtiCecZLPax99
         yBjw==
X-Gm-Message-State: AOAM530NNxyXbCcWbAvv5HKdxiuVnzFJQFTzLA258fOTemyHY/4aeH4E
        BhWslZbE3c3yDe08rQJLob7fmWEolys=
X-Google-Smtp-Source: ABdhPJx2YjtSABIyhLogShpdxcRRiP93mE0TfM35++ovOTjixhAhhfSNg7EBX0ODwNki3akHFtGy8w==
X-Received: by 2002:ac2:5449:: with SMTP id d9mr8856236lfn.172.1616424241809;
        Mon, 22 Mar 2021 07:44:01 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-47.dynamic.spd-mgts.ru. [109.252.193.47])
        by smtp.googlemail.com with ESMTPSA id v6sm648251lft.167.2021.03.22.07.44.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 22 Mar 2021 07:44:00 -0700 (PDT)
Subject: Re: [PATCH v4] mm: cma: support sysfs
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Minchan Kim <minchan@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-mm <linux-mm@kvack.org>,
        LKML <linux-kernel@vger.kernel.org>, joaodias@google.com,
        willy@infradead.org, david@redhat.com, surenb@google.com,
        John Hubbard <jhubbard@nvidia.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
References: <YFS06OLp70nWWLFi@kroah.com>
 <78883205-e6da-5bc4-dcec-b6eb921567b1@gmail.com> <YFTITw73Wga0/F0V@kroah.com>
 <72db59eb-75dc-d1ed-7a83-17052e8f22a8@gmail.com>
 <YFTRkBEr5T37NFpV@google.com>
 <071c6681-f492-2c94-5686-30c30778f39d@gmail.com>
 <YFTrpN8Qkv6ZY0Ci@google.com>
 <007c0317-8819-a6b8-fdff-c0b5899c4f51@gmail.com>
 <YFT1klxSFMlIXLHb@google.com>
 <d2e24e65-9c9d-6b18-81bf-bc1c46c6e0f3@gmail.com> <YFWp0ZpO+uKC1ziR@kroah.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <e82e475a-cf18-2c63-e66a-ebefa24b6c31@gmail.com>
Date:   Mon, 22 Mar 2021 17:44:00 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFWp0ZpO+uKC1ziR@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

20.03.2021 10:52, Greg Kroah-Hartman пишет:
..
>> I found the Greg's original argument and not sure that it's really
>> worthwhile to worry about the copycats since this is not a driver's code..
>>
>> Maybe we could just add a clarifying comment for the kobj, telling why
>> it's okay for CMA. Greg, doesn't it sound like a good compromise to you?
> 
> Please no.
> 

In the case of a static objects, like CMA, this creates more bad than
good, IMO. Even experienced developers are getting confused. In the end
it's up to you guys to decide what to choose, either way will work.
