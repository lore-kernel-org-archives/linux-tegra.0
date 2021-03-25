Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1097C433DB
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:12:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B852361A1D
	for <linux-tegra@archiver.kernel.org>; Thu, 25 Mar 2021 16:12:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229833AbhCYQMK (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 25 Mar 2021 12:12:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229695AbhCYQLi (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 25 Mar 2021 12:11:38 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2BACC06174A
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 09:11:37 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id z8so3795130ljm.12
        for <linux-tegra@vger.kernel.org>; Thu, 25 Mar 2021 09:11:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=ggTLCYiucNEELklM5H4viR5GchgP9qruE7lbu2+18sA=;
        b=oeiaLVPKsh1oQ0QCruTY1aOk3BNjCBvFufh1A6cESewg3SJzqII0hBVetUKCqxRT5+
         jyJLCI7PqivIaReKM06/dy3e591w2YZsIUQGHqMdXTa+/sciFR2OXocnizooFPFEYd3L
         zMrBdlVREc++UJPVG/cHx9VZXOPuHWLXnxz0c9dGvvGeM+b6BTi60xZLsXGv03NAZ9EN
         mP9bc5wRSL4x7GBbepM26csXLJU3XwPIx4OdPoCDgTC7PNJm/S6oOO13WFPQmSOcrz6v
         uERjdv5GxdtTIh8GKcBmE1D4JWCWX4FKC7naLSGB7P+NQlVf0ecDCu/A5GyVi81SLU4F
         pLFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ggTLCYiucNEELklM5H4viR5GchgP9qruE7lbu2+18sA=;
        b=EB74mIGxBq0Bu4XI/0AyH1IiHyeDmcYtAve9FzkwkLw9E0RkETO1vuMEdyWpNGvZZB
         ydmxmF+JS22xsWiWc2zeaZa9MhsLQkdtwPKJ/tQC5kQrxHjiPXc72BR4mMcQPREaG8kT
         DNFC9jISsQ8waEoNnclu9F5n3MtsExKAjlr4LAqUK6q4Ihss9T1gi4Z/16W5WerkwR49
         Fj6GTg0jqzbRSGA2gpkSCrd3wqigV5Qmh+06aDX0WzrB4pizXCMsZD9FAUZ1pZuRNrDi
         4LaYCS0PgdkbVBnI03r8mLUZXh/oy2LOPJ2pe2NKoMrIsAnEAwuFQOTnq8qA27W0wPmM
         bOGw==
X-Gm-Message-State: AOAM530Q/VT9qSbnQ59TOIzAwfDDtHK8yMYq3B5kyC9dPgcxlsDqqb8n
        fus2HG3gi5WcTyoS0sOjhsQ=
X-Google-Smtp-Source: ABdhPJxb+XS3CZiVQiHlT5voV54bsbhF/2ejvRnr+8J7mYaYDVSPUhYtdFgAbMSdt8j1Dg+3Huq65g==
X-Received: by 2002:a2e:6f15:: with SMTP id k21mr6316055ljc.444.1616688696190;
        Thu, 25 Mar 2021 09:11:36 -0700 (PDT)
Received: from [192.168.2.145] (109-252-193-60.dynamic.spd-mgts.ru. [109.252.193.60])
        by smtp.googlemail.com with ESMTPSA id u30sm588471lfm.288.2021.03.25.09.11.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 25 Mar 2021 09:11:35 -0700 (PDT)
Subject: Re: [PATCH 1/9] memory: tegra: Move internal data structures into
 separate header
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        iommu@lists.linux-foundation.org,
        Jon Hunter <jonathanh@nvidia.com>,
        Nicolin Chen <nicolinc@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20210325130332.778208-1-thierry.reding@gmail.com>
 <20210325130332.778208-2-thierry.reding@gmail.com>
 <ca70b07a-608a-51b3-3c30-ff04bdf8bcc0@gmail.com>
 <YFyxtq6cwIJNr/Y5@orome.fritz.box>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <4f1e0859-60b9-0ded-a4b8-70e06dd5a905@gmail.com>
Date:   Thu, 25 Mar 2021 19:11:35 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <YFyxtq6cwIJNr/Y5@orome.fritz.box>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

25.03.2021 18:52, Thierry Reding пишет:
> On Thu, Mar 25, 2021 at 06:12:51PM +0300, Dmitry Osipenko wrote:
>> 25.03.2021 16:03, Thierry Reding пишет:
>>> From: Thierry Reding <treding@nvidia.com>
>>>
>>> From Tegra20 through Tegra210, either the GART or SMMU drivers need
>>> access to the internals of the memory controller driver because they are
>>> tightly coupled (in fact, the GART and SMMU are part of the memory
>>> controller). On later chips, a separate hardware block implements the
>>> SMMU functionality, so this is no longer needed. However, we still want
>>> to reuse some of the existing infrastructure on later chips, so split
>>> the memory controller internals into a separate header file to avoid
>>> conflicts with the implementation on newer chips.
>>>
>>> Signed-off-by: Thierry Reding <treding@nvidia.com>
>>> ---
>>>  drivers/iommu/tegra-gart.c      |  2 +-
>>>  drivers/iommu/tegra-smmu.c      |  2 +-
>>>  drivers/memory/tegra/mc.h       |  2 +-
>>>  drivers/memory/tegra/tegra186.c | 12 ++++---
>>>  include/soc/tegra/mc-internal.h | 62 +++++++++++++++++++++++++++++++++
>>>  include/soc/tegra/mc.h          | 50 --------------------------
>>>  6 files changed, 72 insertions(+), 58 deletions(-)
>>>  create mode 100644 include/soc/tegra/mc-internal.h
>>
>> What about to make T186 to re-use the existing tegra_mc struct? Seems
>> there is nothing special in that struct which doesn't fit for the newer
>> SoCs. Please notice that both SMMU and GART are already optional and all
>> the SoC differences are specified within the tegra_mc_soc. It looks to
>> me that this could be a much nicer and cleaner variant.
> 
> The problem is that much of the interesting bits in tegra_mc_soc are
> basically incompatible between the two. For instance the tegra_mc_client
> and tegra186_mc_client structures, while they have the same purpose,
> have completely different content. I didn't see a way to unify that
> without overly complicating things by making half of the fields
> basically optional on one or the other SoC generation.

The additional fields aren't problem for T20, which doesn't need most of
the fields. I'd try to go with the additional fields for now and see how
it will look like, if it will be bothering too much, then we may
consider to refactor the drivers more thoroughly (later on, in a
separate series), with a better/nicer separation and taking into account
a potential modularization support by the MC drivers.

Using a union for the exclusive fields also could work, although always
need to be extra careful with the unions.

> Maybe one option would be to split tegra_mc into a tegra_mc_common and
> then derive tegra_mc and tegra186_mc from that. That way we could share
> the common bits while still letting the chip-specific differences be
> handled separately.

But isn't tegra_mc already a superset of tegra186_mc? I think the
tegra186_mc_client is the main difference here.
