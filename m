Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDA13C433F5
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Feb 2022 10:58:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231200AbiBPK6c (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Feb 2022 05:58:32 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:39552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230062AbiBPK6c (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Feb 2022 05:58:32 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EED66DA84A
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 02:58:19 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 952F140338
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 10:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645009098;
        bh=APDj2JQowla5VN9wgYQvqEBkeDwB1AQlKi39bfuox6w=;
        h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
         To:Cc:Content-Type;
        b=fd5QC5V+cESXhKdtBRnGjOxYs20VglPL1pDLyYUP9lm0u8bZeMq4dXrPhHE+OqAmP
         EcPEI4jjAm8HiRnnCDG92wjAPQ14VZQPBeB6t+4C2F4AdQ2vGWH3xb5HiZdL/1kXYo
         d6MCwTp5LWtPBlOgt198cFRZ8Dtlp6fY3iVdeOVZeb1xjxVJj0wTQiV6nzwC+8b579
         AFzRla9L8jwSz4j0fklCcBSq8tHrVqQZQNVjYRpT9nstAQlSlxkiz1ybsO8Y9FbPrP
         +WiKvD1HyukpehHl3aTKNAm2YTAZFjq9/+Y/JMwgO0pZWJpG8mKvH/ADhZBBUMEPA1
         CHkbGU4LsuPIw==
Received: by mail-ej1-f70.google.com with SMTP id hq19-20020a1709073f1300b006cdd7712c2cso662999ejc.11
        for <linux-tegra@vger.kernel.org>; Wed, 16 Feb 2022 02:58:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=APDj2JQowla5VN9wgYQvqEBkeDwB1AQlKi39bfuox6w=;
        b=6buzpvTnf+WG3B7ewJoUkyWCrtaZUskLk9L/QyE+8JhJOADlbdDkWRTxuLjzHe8Wo8
         /KK/BTthOajjZf8I1hCzk7HPLTLaFcOxZWavpGAkwDruFsXS9WzaHLSvN2grfVMPWiSY
         1sh/GFlJT79GES/CFhM6ym3hLXRXSzMm6BQdHThqCYqtu8IsH4z6k6CrgRmOpAaGrtdr
         9cP1UwOhtMK6548cKVQiEzz1HcLWYJMwMEIjkV0Mcy7ZxUdTa1af1EwWiNvioTtYSa3d
         V4VWjeByvadcWpEbnbpqAT054s/jngoiA9eYDVK5kUAHm8RauP9fq9dtpFZcbnV/b+DI
         fZmQ==
X-Gm-Message-State: AOAM532fLPS4QjG3HAYtZK02/TaC9F5pwV0R2NeSxTtu8OXEybRVry7r
        Fexio/M/D1ww36X67d+4TuQrKorkxGzsnSt9iXJkxZztG//fRrXiE4I5+4Ku1CvpaYdgz4KjL4A
        GaHW44y/Ohytqy/jKDD36aXgSshrY4F48kAlg8+Lv5RDIMBRdqo/41H5w
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id re28-20020a170906d8dc00b006cfd1d1db25mr1808012ejb.285.1645009098276;
        Wed, 16 Feb 2022 02:58:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy5GVqeYDxf8KFG6ucnyHvzLbGYzH9A2TyOYd9tau6dRiSUPrlEWjw70ZXBEh1BoDUDDU1MjaUHZ/lMRXjFl3s=
X-Received: by 2002:a17:906:d8dc:b0:6cf:d1d1:db25 with SMTP id
 re28-20020a170906d8dc00b006cfd1d1db25mr1808003ejb.285.1645009098094; Wed, 16
 Feb 2022 02:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20220216092240.26464-1-mkumard@nvidia.com> <20220216092240.26464-6-mkumard@nvidia.com>
 <2249cf46-5c54-2e59-f247-5a22f2e6e5b9@canonical.com> <DM6PR12MB4435ABC8098A6C3EB2357B47C1359@DM6PR12MB4435.namprd12.prod.outlook.com>
In-Reply-To: <DM6PR12MB4435ABC8098A6C3EB2357B47C1359@DM6PR12MB4435.namprd12.prod.outlook.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Date:   Wed, 16 Feb 2022 11:58:07 +0100
Message-ID: <CA+Eumj6UU-WqNckYrE8YMJaSVS_E2KFydPs4B-Q=ESiVZw=QDQ@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] dt-bindings: Document Tegra234 HDA support
To:     Mohan Kumar D <mkumard@nvidia.com>
Cc:     "broonie@kernel.org" <broonie@kernel.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "thierry.reding@gmail.com" <thierry.reding@gmail.com>,
        "tiwai@suse.com" <tiwai@suse.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>,
        "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 16 Feb 2022 at 11:54, Mohan Kumar D <mkumard@nvidia.com> wrote:
>
> Hi Krzysztof Kozlowski,
> The current order is intentional to reflect the new->old chip, the top entry is newer chip. If needed we can add comment to reflect this info.
>

Hm, okay, such ordering sounds good as well. :)

Thanks!

Best regards,
Krzysztof
