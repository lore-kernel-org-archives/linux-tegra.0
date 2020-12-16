Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3C6CC2BBCA
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 18:06:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B036258A1
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Dec 2020 18:06:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729245AbgLPSG6 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Dec 2020 13:06:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729237AbgLPSG6 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Dec 2020 13:06:58 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B3FCC061794;
        Wed, 16 Dec 2020 10:06:17 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id x20so31119699lfe.12;
        Wed, 16 Dec 2020 10:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+jz7pMhRZX2EwuvPuR9wM0+Uj3dSUg56oG6Xr4iEnbc=;
        b=t/U67GEjLVQ7gylijqiRc4cdBz7et0h3wFy5eS507Do0evLWYZY5169V0p6jdDmXUh
         kqdYv1ZoASsECRBcNfymgbe7WZ3/rG1n6YHvymYq4so6kCkklV7wArkrWO6sdozeKZd7
         NdB9RZcyqJ0xromQsHnWGq2fu+u0JNxce2ZsaMmgkfcDePRxQ9z5dEg7c6yZ6uq3h2fK
         h5HCtvxqNZLi616TkPxFgh1Vgf2yGMoi+tV0anf9m1aaXNgDoGRdR6vhceL6cPEhssvZ
         fhKR0ZfREmmZumsb+pjIEvJKGhqKmK6urJdprRFwEm5Jhf44U0iw+FJzH6DArig1NHe1
         QnAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=+jz7pMhRZX2EwuvPuR9wM0+Uj3dSUg56oG6Xr4iEnbc=;
        b=EoCwlXKVFTxFqyCfFZ6RQ7YC/Ighc83iKiaGbERGkYzeuRsoTyRHltD0pUCJqxOPFS
         gJBVNNG+SE8XiF8GQauOPDld9kdGoIrk+DNIJnNmhu5cjjcQDwevYrUIo0MCTmxcm2LZ
         oe4DXu5Sdk9nL3h73AuexmBpHneUBoEb9mX5WzWn8xFmYoznoHvJ4GPK9u563QTpS4T/
         wVVkvzMNE1Y7nGbjNICx6iaMkY9XKEwbrR8DpdJjHvwrpC2wt5XbSR/47bt05SOZ5/kj
         fRFc3rAYJxvQIxWfU83jKfzglGb2siGYR8LkGzwKx6B3wbl9UhphXJEV/HExu3WAWVFZ
         erKA==
X-Gm-Message-State: AOAM530VAGO7wkzRn7rTs8OQIvqPZGnDXCUmCks445LWEiPxYC02diTQ
        4Xik/MFc0QbnNHR7jayiD9DSQ/HiOYM=
X-Google-Smtp-Source: ABdhPJx6qvDuq/zm57OJu6zRHlAZFZC4Bhxuf5+/GiAbjP2wP1EKNrgU8hX9VhRcKdMKLIR1iUF2Sg==
X-Received: by 2002:a05:6512:789:: with SMTP id x9mr8638236lfr.487.1608141974630;
        Wed, 16 Dec 2020 10:06:14 -0800 (PST)
Received: from [192.168.2.145] (109-252-192-57.dynamic.spd-mgts.ru. [109.252.192.57])
        by smtp.googlemail.com with ESMTPSA id i18sm358368lja.102.2020.12.16.10.06.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Dec 2020 10:06:13 -0800 (PST)
Subject: Re: [PATCH v1 3/8] usb: chipidea: tegra: Remove MODULE_ALIAS
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Peter Chen <Peter.Chen@nxp.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Felipe Balbi <balbi@kernel.org>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Peter Geis <pgwipeout@gmail.com>, linux-tegra@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20201215202113.30394-1-digetx@gmail.com>
 <20201215202113.30394-4-digetx@gmail.com> <X9pKz8O4ESRShKzh@ulmo>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <d06ee91a-2ae6-3c17-0952-0fd9df432141@gmail.com>
Date:   Wed, 16 Dec 2020 21:06:13 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.2
MIME-Version: 1.0
In-Reply-To: <X9pKz8O4ESRShKzh@ulmo>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

16.12.2020 20:58, Thierry Reding пишет:
> On Tue, Dec 15, 2020 at 11:21:08PM +0300, Dmitry Osipenko wrote:
>> The module alias is provided by the OF core for the OF drivers, it
>> overrides the alias set by the drivers. Hence remove the unneeded macro
>> in order to keep the driver code cleaner.
> 
> This is slightly misleading because that manual MODULE_ALIAS is there
> for legacy reasons and created that alias to bind against a platform
> device created from board files back in the day.
> 
> Depending on how I interpret the commit message, it also sounds like
> you're suggesting that the OF core will automatically add this alias.
> However, what the OF core adds is an alias based on the OF device ID
> table, which is completely different.
> 
> We don't support board files anymore and to my knowledge the aliases
> generated from the OF device ID table are enough to have the driver
> autoloaded, so this patch is correct. Perhaps make it clearer in the
> commit message why this is no longer needed. With that:
> 
> Acked-by: Thierry Reding <treding@nvidia.com>

Alright, thanks.

