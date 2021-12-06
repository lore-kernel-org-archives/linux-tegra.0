Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89697C433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Dec 2021 20:03:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348892AbhLFUHS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Dec 2021 15:07:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348859AbhLFUHS (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Dec 2021 15:07:18 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 628D7C061746;
        Mon,  6 Dec 2021 12:03:49 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 26292B81259;
        Mon,  6 Dec 2021 20:03:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D19D9C341C7;
        Mon,  6 Dec 2021 20:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1638821026;
        bh=+kDhCbS4MC6s87gk/hqVpCOT11rigfeiUnE60NGNue4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=TqXb1o09pzzAyZnhphRi6zhR0nR0J0ZfQXgZ2W+8iWznQHDXsfhe8xgzlujcb8CaF
         2xkA+UIKoCW5U1pQ66tkL1DHai1FvWRJEnHWcm9npJoskMS886GnBUj9EpR9uYgupm
         OVQv9Z3LMkE21b54+0e09iBtrOIe0Vfz1QEsOKoWmZI1gNWOoH9sdIycnnoQII2BgX
         hFAXoy4MOgPJkz+prVhLy884l50CC7hWIO4bkenz5/Y5bQsxDe/DDjzLf9PYLFGI7d
         RuCIZuBTeZUye8klN87O5vBCW5wIAON9iY52UkbWM2W4Rhpccbm+K2g2dddZ57lhDh
         4H1zCXn67k3Xw==
Received: by mail-ed1-f52.google.com with SMTP id g14so47187206edb.8;
        Mon, 06 Dec 2021 12:03:46 -0800 (PST)
X-Gm-Message-State: AOAM530st0M2CeuIL+fXIv2KF4KfJUj7njbwIi0P9Y9s+xHkTh3ZxYXe
        m2Yf1hnwvy/cz5KPe6TACbAXJeBvyFJvwH2cDQ==
X-Google-Smtp-Source: ABdhPJyCFtv6blqxShf0Ee/DkuII0HgNMAAxcboZkr2vCOEDnBoXPgE9wT4RXkjxOTkQvnAm0/E5m3qKXiAfZxiIHsc=
X-Received: by 2002:a05:6402:35ce:: with SMTP id z14mr1787984edc.197.1638821025123;
 Mon, 06 Dec 2021 12:03:45 -0800 (PST)
MIME-Version: 1.0
References: <20211201155716.149543-1-jonathanh@nvidia.com>
In-Reply-To: <20211201155716.149543-1-jonathanh@nvidia.com>
From:   Rob Herring <robh+dt@kernel.org>
Date:   Mon, 6 Dec 2021 14:03:33 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9aMp2w-GUCsvjdm_8n73mSe3idGwn+FMDA4q8oNPQ9Q@mail.gmail.com>
Message-ID: <CAL_Jsq+9aMp2w-GUCsvjdm_8n73mSe3idGwn+FMDA4q8oNPQ9Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: arm-smmu: Fix json-schema for Tegra
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux-foundation.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Dec 1, 2021 at 9:57 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> The dt_binding_check currently issues the following warnings for the

dtbs_check

> Tegra186 and Tegra194 SMMUs ...
>
>  arch/arm64/boot/dts/nvidia/tegra186-p2771-0000.dt.yaml: iommu@12000000:
>   'nvidia,memory-controller' does not match any of the regexes: 'pinctrl-[0-9]+'
>         From schema: Documentation/devicetree/bindings/iommu/arm,smmu.yaml
>   DTC     arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml
>   CHECK   arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dt.yaml
>
> Add the missing 'nvidia,memory-controller' property to fix the above
> warning.

Thierry sent the same change, but made it required. That's not a
compatible change, but could be justified. Please sort out which one
you need applied.

Rob
