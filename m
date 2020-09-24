Return-Path: <SRS0=yNrD=DB=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92B13C4363D
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:26:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45E3323741
	for <linux-tegra@archiver.kernel.org>; Thu, 24 Sep 2020 13:26:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="kgTjvI+n"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727988AbgIXN0I (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Sep 2020 09:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727873AbgIXN0I (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Sep 2020 09:26:08 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34EEC0613D3
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2020 06:26:07 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id gx22so4480450ejb.5
        for <linux-tegra@vger.kernel.org>; Thu, 24 Sep 2020 06:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XexnDGcXtnYzxSDXXL3LsxUhuAmen63As9oxJV/uz9Q=;
        b=kgTjvI+notSvcV1G6DlP/YbBRTYIoc9l+xpy2LnM2CAUVSj4ezg/9x6dqOZ6wnrq94
         9MtdtxN11ZInl93BO1eYXIug84nACv74HI0Bou42h/R6ly+hJgJucBtFwoi55wT0shSk
         LFDbcbXi7f8wKGj9oWgR9a4BMZ8us74xQRmaL0jhunAT0o6ZPyKIS1cQ5obDH5ZVDNK1
         i/HHctQ+fqdd3KkbVaoKIPbGFGuQf7QfUZZX4jKh5f3qRC4qyq1s4k53xIqvXVLpHDQn
         oRsIhLPdVxLK/zWXUj1yCexDQd9E2st1Mz0TEywAu4kFD7takgrMpk5THLnYgtq/3ckb
         3sAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XexnDGcXtnYzxSDXXL3LsxUhuAmen63As9oxJV/uz9Q=;
        b=frLRsCzbEHvHDaZ+WvYlsNRm+KFLQ1FCBmEPYj793FUdpAESLacBFkx4Rt/KrwfnWI
         xNpnS6PlwascU419KmxKzV8OHpvfypwCJ26fe+iIFuVjc/PvxJJ8pBQ4jlxH14l44oPh
         uimgfS/A3Y7a0hNaoq/OW5xiNKg5knOwd3yDUZxbMFLRWlcxyUANnNdRvzAUYR4ZO1sD
         Kvr0+Cu+OjkpqCYdFnSaYwdfsfB6+Bn3zsMd7ksKYSkYMrd/SXN2M60qXcsnQMMD6oy7
         DnknC9UazAnbsIvK0+Mfg0BE9KjbB/KB9YRrwO7lTvHviub1j6jDrSbJiHt58sGL74oj
         r67A==
X-Gm-Message-State: AOAM531Ikh5NBN+/axlKtVbF3uTLkdOeOm8BQ89Kz6LZFe+uVEwkxmBS
        hYZOZkZkePzc1AZHq0rK7uQCqyJoVuMkJZxr4pOAWw==
X-Google-Smtp-Source: ABdhPJzL25q1kuPvZnzXILD9yCjuVJJoFdPmKYvOCzgBP1DPA6gPD4TIEnBP9L8hXZW3TjX9vVurhdi3YXx/TqF6yN8=
X-Received: by 2002:a17:906:f11:: with SMTP id z17mr1101533eji.88.1600953966583;
 Thu, 24 Sep 2020 06:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <20200916094952.458003-1-jonathanh@nvidia.com> <20200916094952.458003-4-jonathanh@nvidia.com>
In-Reply-To: <20200916094952.458003-4-jonathanh@nvidia.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 24 Sep 2020 15:25:55 +0200
Message-ID: <CAMpxmJVFtx4kZOvP5UkYL1U_1UJn_FGabBZdE7cdMDxQAPoSwA@mail.gmail.com>
Subject: Re: [PATCH V2 3/5] misc: eeprom: at24: Support custom device names
 for AT24 EEPROMs
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        linux-devicetree <devicetree@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 16, 2020 at 11:50 AM Jon Hunter <jonathanh@nvidia.com> wrote:
>
> By using the label property, a more descriptive name can be populated
> for AT24 EEPROMs NVMEM device. Update the AT24 driver to check to see
> if the label property is present and if so, use this as the name for
> NVMEM device. Please note that when the 'label' property is present for
> the AT24 EEPROM, we do not want the NVMEM driver to append the 'devid'
> to the name and so the nvmem_config.id is initialised to
> NVMEM_DEVID_NONE.
>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---

Queued for v5.10, thanks!

Bartosz
