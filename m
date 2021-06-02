Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A9C1C4708F
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:38:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 49C8360E0B
	for <linux-tegra@archiver.kernel.org>; Wed,  2 Jun 2021 07:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231792AbhFBHkW (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 2 Jun 2021 03:40:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231775AbhFBHkV (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 2 Jun 2021 03:40:21 -0400
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com [IPv6:2607:f8b0:4864:20::935])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BE8BC06174A
        for <linux-tegra@vger.kernel.org>; Wed,  2 Jun 2021 00:38:39 -0700 (PDT)
Received: by mail-ua1-x935.google.com with SMTP id g34so770118uah.8
        for <linux-tegra@vger.kernel.org>; Wed, 02 Jun 2021 00:38:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=L+TTh5KqzQy7Y+EAoFlysDwIssfmwwnP8VJI5NXEb/8=;
        b=ui0SAsqvnSKtekZ5xaMzh11I/7tb6Y8cTj9gTGMe0c2ln73DXlIhrzNtUOa+1vynrg
         /cmEUeDyzFYRMqdDbOO2EQjxLgQq3Gb9eW376DtmojBSYF9o3PleaIq4+f6J5P8CXTQ5
         EjEpZfGq6VXaMFeHwTcLGBTwWyrUpenqTZzmX+TYRPp23PnzakSnJZ+Ay7YUp/oPF5Pv
         o/7jLjZb6EF4Miy//21ONjkRZgV8xLVr8RQOlWoh4/1d9g0/Fhy2ESTiEHyn3Q59VGVy
         h1eNVx8WS4qLUopqJDSO6fVMGnD38ZAgoyRedhLkHJmKSfPmdTrXplCUxjHLI6RVKv+C
         xf1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=L+TTh5KqzQy7Y+EAoFlysDwIssfmwwnP8VJI5NXEb/8=;
        b=mz8gu1lb/ERSByVKEH8R9ee3E7nRdsyU9EsWZjdSXsvWeyT577cMl9W52kvKk5CLVx
         k86slg9qFVNS4F7TTr38te++/0Bei5Zpguub68633kOybw6sx6N8SSh70yERGd9nxgAz
         ec2eYVPwDB1un5CKRM0RTXlnxIL9N4Ym7hrM3prJW+rPB5sCbpVfopZYNbYLbRlU8OGS
         jaXXNMBN3+8WqChB7BpZ9sLf2KotAkjavSecvFBHQczn7KkdxPK270vSsDVt2Fkv+khe
         PGgSgILmZE8bdVN4+SHG41DTyLW58i54PXjPZwKkA2/dkWF28m+GH1zjAW1WVVN0oqYu
         3rzg==
X-Gm-Message-State: AOAM530XvjZlxKVtXHknVdfPQV5O3bGh+k9fSYOC8dgcTM7RruQf0L6M
        7gSkA4cXwyCJsEdNuKW0Rva6QozUQ5twwjadnL/zfg==
X-Google-Smtp-Source: ABdhPJzyd7BJ2tG/pzaTds/WFODrDilZ8jvrif516usWWpuQ3h/Tm2Vr5Wt8EbH3eFPPfqiJWc+o7XOTCEPsPWLEuEk=
X-Received: by 2002:ab0:100f:: with SMTP id f15mr20386864uab.100.1622619518153;
 Wed, 02 Jun 2021 00:38:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210601231003.9845-1-digetx@gmail.com>
In-Reply-To: <20210601231003.9845-1-digetx@gmail.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Wed, 2 Jun 2021 09:38:01 +0200
Message-ID: <CAPDyKFpMCkp5tHHcZJZf6sC4+C_xGGnhUWJg5+6hHbDT8FD_Bg@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] NVIDIA Tegra core power domain follow up
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-tegra <linux-tegra@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 2 Jun 2021 at 01:10, Dmitry Osipenko <digetx@gmail.com> wrote:
>
> Remove the lockdep_set_class(), which Ulf Hansson asked for. And
> prevent core domain syncing if domain node is missing in device-tree,
> which I accidentally missed to add after squashing the standalone
> domain driver into the PMC driver.
>
> Dmitry Osipenko (2):
>   soc/tegra: pmc: Don't sync core domain if it's missing in device-tree
>   soc/tegra: pmc: Remove usage of lockdep_set_class()
>
>  drivers/soc/tegra/pmc.c | 21 +++++++++++----------
>  1 file changed, 11 insertions(+), 10 deletions(-)
>

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>

Kind regards
Uffe
