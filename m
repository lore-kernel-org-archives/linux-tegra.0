Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17942C433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC02964DD0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 21:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231448AbhA0V3Z (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 16:29:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49792 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344491AbhA0V1g (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 16:27:36 -0500
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com [IPv6:2a00:1450:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E146C061573
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:26:56 -0800 (PST)
Received: by mail-lf1-x12c.google.com with SMTP id v24so4723516lfr.7
        for <linux-tegra@vger.kernel.org>; Wed, 27 Jan 2021 13:26:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=PkkTYvfWyANciuqV75npJ/gFbUncXc5JjD+XYOH0VH8=;
        b=BoTOvXdu3swqZb2+lsk9WlhzPZXwfhI0WIxDCA1OMC3oHJSMsL1Zh31Dw1l3Zdxb4q
         MMN90OsKTnEdbi0aHFmA9tRnjbanvZU+JmL1+/GLsWujC2m5oxLBaS9EUv44CgxaXTsX
         zFOVDhw+I7SE5LIVzDMgnhED4Kx/zqvWwwpCTqSfJvbBLg9ZsVPPJPuuKIxMWFHkUnAu
         5Iv9e80z+3WGVPpj5FAFTn7k3RaSbMc6fmyxTe29aAln4dwrjABSJ/0h/8Hba5eEX2zz
         vwFrXxIm2d9WTNUuXgfFAdgbO8ayBDEjiR2q0zHB48CBdtSyhL+4tLM6zdErCvdcEm+p
         vj3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=PkkTYvfWyANciuqV75npJ/gFbUncXc5JjD+XYOH0VH8=;
        b=ErYD0UNtLKp3rCv96Nq2iJH0/yu7Ne0jZ0XUyujzcFSSkDykxIb6kaLQC1oExg3YAW
         wrjm+JPqKuGy3aWz9F19icRJh8KlTD9Dw3/de2qr0f5rSpBd1UYy0jDe4wPkZUSZGycA
         T1iZT5S7zRRLS2hjrgZNWdmif3YUi3pwAmaw0od19gjCxY7quo9z1V8LWwwR1NfUS7ZQ
         easftReviMufy5ia1Qr3I55e+Rv+LGR/r92ak3MLguD8RXuAgNCy6x1lbApu+gQWvxdO
         sEZpMyBGu01Zb1Ca+YE8y667yJePc5hrOw+4EWJ127KTSKiJpx5IUlExzOsmzcpiSGQ0
         6O9w==
X-Gm-Message-State: AOAM532UAOCEFQ5o2oFXPd4LCqxoOwuEKXQAuSz02LjwKvIHvLR5Qeg3
        F1xMQuC90+mm0hl/Wgh4rdY=
X-Google-Smtp-Source: ABdhPJwMOh5Zbzn5jlQDDiionvaHND6cl6YEMpkKIEYnDhyiUHbvJwqooKTYa8uuAqSnKJskJJ6wiQ==
X-Received: by 2002:ac2:4907:: with SMTP id n7mr3247719lfi.213.1611782814893;
        Wed, 27 Jan 2021 13:26:54 -0800 (PST)
Received: from ?IPv6:2a00:1370:814d:ea25:a10:76ff:fe69:21b6? ([2a00:1370:814d:ea25:a10:76ff:fe69:21b6])
        by smtp.googlemail.com with ESMTPSA id b18sm823875lfj.140.2021.01.27.13.26.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Jan 2021 13:26:54 -0800 (PST)
Subject: Re: [PATCH v5 00/21] Host1x/TegraDRM UAPI
To:     Mikko Perttunen <cyndis@kapsi.fi>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com, airlied@linux.ie,
        daniel@ffwll.ch
Cc:     linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org,
        talho@nvidia.com, bhuntsman@nvidia.com
References: <20210111130019.3515669-1-mperttunen@nvidia.com>
 <da085c38-4ac1-19dd-7706-caf323c969d2@gmail.com>
 <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <638c1aeb-921b-0ea2-5258-16c6d3183306@gmail.com>
Date:   Thu, 28 Jan 2021 00:26:53 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <2f999b6d-d781-503a-78f4-d444bce72c58@kapsi.fi>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

26.01.2021 05:45, Mikko Perttunen пишет:
>> 5. The hardware state of sync points should be reset when sync point is
>> requested, not when host1x driver is initialized.
> 
> This may be doable, but I don't think it is critical for this UAPI, so
> let's consider it after this series.
> 
> The userspace should anyway not be able to assume the initial value of
> the syncpoint upon allocation. The kernel should set it to some high
> value to catch any issues related to wraparound.

This is critical because min != max when sync point is requested.

> Also, this makes code more complicated since it now needs to ensure all
> waits on the syncpoint have completed before freeing the syncpoint,
> which can be nontrivial e.g. if the waiter is in a different virtual
> machine or some other device connected via PCIe (a real usecase).

It sounds to me that these VM sync points should be treated very
separately from a generic sync points, don't you think so? Let's not mix
them and get the generic sync points usable first.
