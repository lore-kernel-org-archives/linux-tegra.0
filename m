Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C174C56202
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 02:01:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 18D33207C3
	for <linux-tegra@archiver.kernel.org>; Sun, 22 Nov 2020 02:01:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kKIXK7FH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727095AbgKVCBO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sat, 21 Nov 2020 21:01:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727027AbgKVCBO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sat, 21 Nov 2020 21:01:14 -0500
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com [IPv6:2a00:1450:4864:20::143])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEC60C0613CF;
        Sat, 21 Nov 2020 18:01:13 -0800 (PST)
Received: by mail-lf1-x143.google.com with SMTP id z21so18898169lfe.12;
        Sat, 21 Nov 2020 18:01:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=uk/uljnw5dkhMuHJcyG6t+EUhLYhiEmvZcOgKfsyFbY=;
        b=kKIXK7FHodJdsPn2IJ69JCIa9qL7ywC1hkAJ7QFEXXgsc2cRhPGLZNDorNElSRze2k
         2vQBVFGBypoCKutrGo2Pow3GJLwjJeg+va//qSXIlT7ahPGGLkxZelTMNloVfGChq9Mv
         519vRHmEQp9T/t/BiB05lMm1+L0eane+LwY4M3aemBloR4HP6Qro3Bo8dPcFdAcv2h18
         PC4npNoZ3D/wLjCVyR6y33+2uj/IzITYckis+hjuc8ZEyvA+mMkG/Wl3mcfAeX3BLO4q
         /0989lWL3jPwMa7TKVuykqfjx4jN7xyD63E1GGyGwrwpyJ66RC2kbBM0wbCYRXwnHy3x
         +hlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=uk/uljnw5dkhMuHJcyG6t+EUhLYhiEmvZcOgKfsyFbY=;
        b=OiLPEXnXOpRZyaYzKu/UMN6kzoAlqRB5FlKDdHrSNmCvKVPWqLLg1CFz2IurfX1x6A
         rKdhQLO7JTRWt4zJES2WGc93c7o2oCUqTr8Zbs4CDgFoIeqsPlDdN9k8mI67ulhvDX6q
         gEoTrUzldOEB4tUY82wgXc2VUGqBuwPxyJGQPfj4MXoAG3b02z/TOhx1ioxYFEhRzSZo
         k82rlwrvW9zr83IYimCnE3Qn5GUvfpKaIIWim7nwb69yhbqrYRUprogjVTmNjSIvSvgV
         51Qt0hnVroq3TvU4fMqE1p9M4QsjdRyzLfZD/6SvPtqtKMGzojLfxf9Z69KO96RVEbEy
         4M+Q==
X-Gm-Message-State: AOAM530GaZUoGeHw9c0Qn2g44JxTgL9H5CjlIAeuDO4bh83AdCy6PbD8
        MhPYexMiT6NMWZYlamptqakaZI+0pYo=
X-Google-Smtp-Source: ABdhPJw6wSTFDc52CkEHyfbeW7rPOMyo0PdAgkWOyolQ+UWqTQOBpDH80YT8aLcmo5oQ12wQlPqzlA==
X-Received: by 2002:a19:f704:: with SMTP id z4mr10030812lfe.312.1606010471709;
        Sat, 21 Nov 2020 18:01:11 -0800 (PST)
Received: from [192.168.2.145] (109-252-193-159.dynamic.spd-mgts.ru. [109.252.193.159])
        by smtp.googlemail.com with ESMTPSA id u16sm789992ljd.93.2020.11.21.18.01.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2020 18:01:11 -0800 (PST)
Subject: Re: [PATCH v5 2/4] staging: media: Introduce NVIDIA Tegra video
 decoder driver
To:     Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Stephen Warren <swarren@wwwdotorg.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@xs4all.nl>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        linux-media <linux-media@vger.kernel.org>,
        devel@driverdev.osuosl.org,
        devicetree <devicetree@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <cover.1513038011.git.digetx@gmail.com>
 <3d565db80f8dccafd14224924305243b37b75a07.1513038011.git.digetx@gmail.com>
 <CAAEAJfBZD0u6MDxcp3See-agzyCSJS7dKpwK28LMJwPvE9DLtQ@mail.gmail.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <5665b221-04d7-6be9-2377-8006b9563d4b@gmail.com>
Date:   Sun, 22 Nov 2020 05:01:09 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <CAAEAJfBZD0u6MDxcp3See-agzyCSJS7dKpwK28LMJwPvE9DLtQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

22.11.2020 04:02, Ezequiel Garcia пишет:
> Hi Dmitry,
> 
...
>> +++ b/drivers/staging/media/tegra-vde/TODO
>> @@ -0,0 +1,4 @@
>> +TODO:
>> +       - Implement V4L2 API once it gains support for stateless decoders.
>> +
>> +Contact: Dmitry Osipenko <digetx@gmail.com>
> 
> The API for H264 stateless decoding is ready.
> See https://lkml.org/lkml/2020/11/18/795.

Hello Ezequiel,

Thank you for the notification! My last attempt at implementing V4L API
support was about a year ago and it stopped once I realized that there
is no userspace which uses that API. FFMPEG and chromium browser had
some kind of V4L support, but it all was oriented at downstream driver
stacks, and thus, not usable. Do you know what is the current status?

> One minor comment below.
> 
...
>> +       // PPS
>> +       __u8  pic_init_qp;
>> +       __u8  deblocking_filter_control_present_flag;
>> +       __u8  constrained_intra_pred_flag;
>> +       __u8  chroma_qp_index_offset;
>> +       __u8  pic_order_present_flag;
>> +
> 
> This seems to be bottom_field_pic_order_in_frame_present_flag,
> as there is no "pic_order_present_flag" syntax element.

Correct, looks like I borrowed that name from the libvdpau API.

https://vdpau.pages.freedesktop.org/libvdpau/struct_vdp_picture_info_h264.html#a405f7ef26ea76bb2c446e151062fc001
