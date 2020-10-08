Return-Path: <SRS0=64AB=DP=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 816FCC43467
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 10:29:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B85B2145D
	for <linux-tegra@archiver.kernel.org>; Thu,  8 Oct 2020 10:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602152961;
	bh=aGtPmz0jQCnPrRwm4OgrxnkKCiIk1h8w8sNT/5t+438=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=uj/KQg3wddyQUdUr6zMRAxLFxlYvvsR7GiKXymNwLS83OHuJVTGerRu3H06hvB2cl
	 ls8/UBpfI1oosdZBgqUnq+ps/LYh4sD986B0kRYTkeCFYw1iNQHVYQZTiNIcvI1rH2
	 Yh1iXdlD4nSeaKepelkCKwXDsVfTFC+AoQi8viv0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729372AbgJHK3U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 8 Oct 2020 06:29:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:57874 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729371AbgJHK3U (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 8 Oct 2020 06:29:20 -0400
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A09BD21734;
        Thu,  8 Oct 2020 10:29:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602152959;
        bh=aGtPmz0jQCnPrRwm4OgrxnkKCiIk1h8w8sNT/5t+438=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=MjaFMn1eNf5GqxWZRsdldb5zfJbkScRZCFtc0cJB8neR1oSLlZ+7bvRMBCKFuR2Vw
         LGIOQ2NW8zU6wLqPJu5KAYj1st1LV3mQpcleatJgsPxom8EbGYfK/YnFhc97+N6X9+
         5ESZA/hJhG4QdPkcs4UIsJCI0tDuOkRWn0VSOuKk=
Received: by mail-ed1-f47.google.com with SMTP id b12so5247144edz.11;
        Thu, 08 Oct 2020 03:29:19 -0700 (PDT)
X-Gm-Message-State: AOAM532vscE1Uk9pmBRIaCqFMr9n5GNYq6xAuSpdEjygOk1MDREJZiM0
        /Y9Jx1A+FU5E+JK1NWqoVWQTGippGCgsMney0jQ=
X-Google-Smtp-Source: ABdhPJw4b8QVEx2CelZyRUH9YrC5rBASXgSBHU9KP5XH716bOMRxnx7Vw2tOo1E1rRRI1um9pIavwi63gufQ5iHz4YQ=
X-Received: by 2002:a50:8b62:: with SMTP id l89mr8442277edl.132.1602152958020;
 Thu, 08 Oct 2020 03:29:18 -0700 (PDT)
MIME-Version: 1.0
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
In-Reply-To: <20201008003746.25659-1-nicoleotsuka@gmail.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Thu, 8 Oct 2020 12:29:06 +0200
X-Gmail-Original-Message-ID: <CAJKOXPdf8YMFkoTzLhM7d51dwtH1ckGis86dHiSYpFBV0oscfA@mail.gmail.com>
Message-ID: <CAJKOXPdf8YMFkoTzLhM7d51dwtH1ckGis86dHiSYpFBV0oscfA@mail.gmail.com>
Subject: Re: [PATCH 0/5] memory: tegra: Fix client list and add swgroups
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     thierry.reding@gmail.com, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, 8 Oct 2020 at 02:44, Nicolin Chen <nicoleotsuka@gmail.com> wrote:
>
> This series has two fixes of tegra210_mc_clients, and three
> changes to add missing swgroups, according to Tegra X1 TRM.
>
> Nicolin Chen (5):
>   memory: tegra: Correct la.reg address of seswr
>   memory: tegra: Correct tegra210_mc_clients def values
>   memory: tegra: Sort tegra210_swgroups by reg address
>   dt-bindings: memory: tegra: Add missing swgroups
>   memory: tegra: Complete tegra210_swgroups

Hi,

It's too late in the cycle for another pull request so this will wait
for merge window to finish.

Best regards,
Krzysztof
