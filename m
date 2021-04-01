Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE775C43460
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 08:58:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95C54610D0
	for <linux-tegra@archiver.kernel.org>; Thu,  1 Apr 2021 08:58:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233504AbhDAI6D (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 1 Apr 2021 04:58:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233637AbhDAI5v (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 1 Apr 2021 04:57:51 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D475CC0613E6;
        Thu,  1 Apr 2021 01:57:50 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gb6so829809pjb.0;
        Thu, 01 Apr 2021 01:57:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=oXtJ821yB9S8peS7jwk7jXIhvNxqy4kwSPnw73VGxuY=;
        b=aA5+PCF5ZjUkVztXBPOOYY2ElzvNGYpU+nmwQbZeikkytPRSBL3KM0UIJYvlGV43eZ
         jMCLFVWtv0tNz/qNiQPUDKTbOuAKOXQT4Go8yTJZx6BLJP5iiPI7E2pbfp6ObQK7cNGo
         NGpuNX7kaEnW/v3sJsAQnq1p21TchRmAm8ofsDXDzn786S0o+0sTpP7zb49tQ5mZ0BE6
         WwyMNvXZVwqy6nMZ0SfONJmIxRNDW885ZzzFzjySanxNQrl3E1un6u8Zl9S8DZjXTpCm
         eCqk0n3W/gKZkEH/ySIRus1BQ6SeM9T/sv16mkNcKIok3heNI6DMJdfbjqaElZfyHiZs
         CyJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=oXtJ821yB9S8peS7jwk7jXIhvNxqy4kwSPnw73VGxuY=;
        b=dlqkRZQK2cN5/c9kaCtn0lqBBZ0OApRDh7Aw4G22t7f5UgNyXADcjp00kYuUEBUK8T
         YOHOeuAz17J1YFCZpCPpsPP03UBWLAXa4/kzrYmdkxCP4thDhvP0KcEe/75YLH3wRXOp
         2GZ5zvKzUPNqTD9Niova5AGd1lvN9pH/a0ZR3ukSC4NrR+JWjpJhAkziXKtuITl+ACbT
         8uolstOWbkN6kNguIO3VuLRKKAmkga+gUgoPPKvQrT9A/sOklYj9VqpKWq/p8Iy2ZOaP
         WGUDBokk84Ppbn1aeERyeHxIExDYUp9FgRXKGxW1KLpNoGlleFFrV49guwxcNbfmrT5q
         WFJw==
X-Gm-Message-State: AOAM530859A+OtlQFu8/IqX/tu4WVqh8viAN66WTqyojTVny47BHcTsa
        vSZ/Rmk8L/0ia5d2EkNHLRE=
X-Google-Smtp-Source: ABdhPJzvGu1N/wS8TdEjPhRmZPGQtvMqhoK8l4yaacUdBjiNF8CVAyTyrCf93DCUjT3hj2p3hpmsTg==
X-Received: by 2002:a17:902:a502:b029:e8:3a40:bc6d with SMTP id s2-20020a170902a502b02900e83a40bc6dmr4974818plq.14.1617267470411;
        Thu, 01 Apr 2021 01:57:50 -0700 (PDT)
Received: from Asurada-Nvidia (thunderhill.nvidia.com. [216.228.112.22])
        by smtp.gmail.com with ESMTPSA id y7sm4824167pja.25.2021.04.01.01.57.49
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 01:57:50 -0700 (PDT)
Date:   Thu, 1 Apr 2021 01:55:49 -0700
From:   Nicolin Chen <nicoleotsuka@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Joerg Roedel <joro@8bytes.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Krishna Reddy <vdumpa@nvidia.com>,
        Will Deacon <will@kernel.org>,
        iommu@lists.linux-foundation.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, guillaume.tucker@collabora.com
Subject: Re: [PATCH v1 2/2] iommu/tegra-smmu: Revert workaround that was
 needed for Nyan Big Chromebook
Message-ID: <20210401085549.GA31146@Asurada-Nvidia>
References: <20210328233256.20494-1-digetx@gmail.com>
 <20210328233256.20494-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210328233256.20494-2-digetx@gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Mar 29, 2021 at 02:32:56AM +0300, Dmitry Osipenko wrote:
> The previous commit fixes problem where display client was attaching too
> early to IOMMU during kernel boot in a multi-platform kernel configuration
> which enables CONFIG_ARM_DMA_USE_IOMMU=y. The workaround that helped to
> defer the IOMMU attachment for Nyan Big Chromebook isn't needed anymore,
> revert it.

Sorry for the late reply. I have been busy with downstream tasks.

I will give them a try by the end of the week. Yet, probably it'd
be better to include Guillaume also as he has the Nyan platform.
