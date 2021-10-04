Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 880FFC433EF
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 695EE61165
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236330AbhJDUeL (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:34:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233934AbhJDUeK (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 16:34:10 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A55D6C061745;
        Mon,  4 Oct 2021 13:32:20 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id n8so21110946lfk.6;
        Mon, 04 Oct 2021 13:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=9++LVbb1ZgVmL4thX9K4PQNAQ2NBkN+QYbEP+4ptnH4=;
        b=V84IwbKWTotGIBqNXF2nkUgsADhmRFOGZVunhqZTJ6RtYtB8Z/FiCkaFAxjv3zjmuw
         YXHgph8NGFOvN+GpVeQ1Vcyytw/Kcdded/YAu3rr4U4T6P/A1E8HL4DxrQ4Zfszva0lX
         OYgZ2ZlBiCWJ0NBV6AW6F/y8SK44ZtO+lIj+42T6O9fAb3vJiH2HH6Mhv6quyEx+497l
         eVJAniwQmeIxG6Kv7JS6oZaYeixGmXQwuU0cXWahQ5VUNhvAQd4w9smpv9c/JlqJITHD
         /Xs2LX2tj+2thofc8yzrLgBed7Wpds8pym2PHbUcw2Q7LzsjTVCGzAI6WNkTf06xNqrh
         rIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=9++LVbb1ZgVmL4thX9K4PQNAQ2NBkN+QYbEP+4ptnH4=;
        b=G7MFXXhWaURWjm6wFRs/gDw4vHvvs8PaxPevkBMkTF+2IY2F/rPxqb0LX2Q1rdbxPw
         qcYfIwamRCTJzqmYNtqSpFjA6DvfaZK3sb2qbRvp5eg1GV60wggUk1ONCyZoDUKRlEKI
         oimSre6J5CXjnS81MqwQf/cJz/61Hkal4e+yNwp7Yuum6I/Pr3K8v1p6qKWWYOVLfvZY
         nAzR67WOTYTyvcfUglI6QGxvZy7zKFoBHoylKCPUjoZC3Oce3ARlMLLXiO4Qb8QpF8yQ
         5X8scMN4a7+KEAjhJ3UGbEFINeu04YOpQK84xFFWLRtCh4rGyirk00/Y91zQMHgVXRoC
         EG3g==
X-Gm-Message-State: AOAM533NtaIIug/3TF9tynnw6uFguK39xk80IzhKcCkUo8MUGs0l2nCS
        lu++A7EVeJ5C+p6ryQiVnnU1ijcDos0=
X-Google-Smtp-Source: ABdhPJy1IMBj+UoXvSNdaYO2FdaApa8G9+VkflvO9WSPaNeDF1mm5hubzT+oIwR97eBUaJ3C9BWfSw==
X-Received: by 2002:a19:4344:: with SMTP id m4mr15742299lfj.155.1633379538372;
        Mon, 04 Oct 2021 13:32:18 -0700 (PDT)
Received: from [192.168.2.145] (79-139-163-57.dynamic.spd-mgts.ru. [79.139.163.57])
        by smtp.googlemail.com with ESMTPSA id j12sm756247lfk.246.2021.10.04.13.32.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Oct 2021 13:32:18 -0700 (PDT)
Subject: Re: [PATCH v2 0/5] iommu: Support identity mappings of
 reserved-memory regions
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
        Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>, devicetree@vger.kernel.org,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org
References: <20210423163234.3651547-1-thierry.reding@gmail.com>
 <95e4c23e-4700-ef7e-d8ae-17693b65e121@gmail.com>
 <YVtUrTdI9kUSScui@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f1fadc7-119e-0fad-f597-0cea99cd9095@gmail.com>
Date:   Mon, 4 Oct 2021 23:32:17 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YVtUrTdI9kUSScui@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

04.10.2021 22:23, Thierry Reding пишет:
> On Sun, Oct 03, 2021 at 04:09:56AM +0300, Dmitry Osipenko wrote:
>> 23.04.2021 19:32, Thierry Reding пишет:
>>> I've made corresponding changes in the proprietary bootloader, added a
>>> compatibility shim in U-Boot (which forwards information created by the
>>> proprietary bootloader to the kernel) and the attached patches to test
>>> this on Jetson TX1, Jetson TX2 and Jetson AGX Xavier.
>>
>> Could you please tell what downstream kernel does for coping with the
>> identity mappings in conjunction with the original proprietary bootloader?
>>
>> If there is some other method of passing mappings to kernel, could it be
>> supported by upstream? Putting burden on users to upgrade bootloader
>> feels a bit inconvenient.
> 
> It depends on the chip generation. As far as I know there have been
> several iterations. The earliest was to pass this information via a
> command-line option, but more recent versions use device tree to pass
> this information in a similar way as described here. However, these
> use non-standard DT bindings, so I don't think we can just implement
> them as-is.

Is it possible to boot upstream kernel with that original bootloader?

I remember seeing other platforms, like QCOM, supporting downstream
quirks in upstream kernel on a side, i.e. they are undocumented, but the
additional support code is there. That is what "normal" people want. You
should consider doing that for Tegra too, if possible.
