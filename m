Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DD60C433DB
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 07:34:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3536B64E78
	for <linux-tegra@archiver.kernel.org>; Mon,  8 Feb 2021 07:34:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229963AbhBHHeB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 8 Feb 2021 02:34:01 -0500
Received: from mail.kernel.org ([198.145.29.99]:33600 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229751AbhBHHeA (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 8 Feb 2021 02:34:00 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 8493364E76;
        Mon,  8 Feb 2021 07:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612769599;
        bh=PLvxj8AOgyn0FB5uuxgnnw6lfnNSe9JgKHhMwnhGoBw=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=b3/SzO+Q8/32GJW1IEUQ++VJaU6VoKyfD1eTtAjUiFXw0kWspldzq1/J5oqVRVkLr
         5etolVMX/sJkYJPRn29FK6AQw4wsjPL7D+wy5/K3L7XH0/NvL+oCm4gIxRHlSrZUtU
         xUfdL0iHQZ5EehNHyy/kDOTvfT7n+ZOZ/pCbysnrHaGLHcbXRmbTTf8LUDQ/X2Xxph
         8NHfGgdXqahKGEDd1qP0+7o8a/o8rTg9mgIUTyDsDjpzObF3PdWnhj6MrnryMgEcHb
         IQybQ0Trt6Gt9U+fvUZ3VspVx4uC4pLmOORIHtZM/8ZYxXh6W4GdyJbsz8g4XQmvnu
         /9CbnSjpeEfew==
Received: by mail-ej1-f48.google.com with SMTP id y9so22963013ejp.10;
        Sun, 07 Feb 2021 23:33:19 -0800 (PST)
X-Gm-Message-State: AOAM532zwjSGRzyglNCrGMgEjYODpTBgjzaFpaB34GOlqPIOaVmkRJah
        OUMq+4jQqM+BupQlOBB874YWc1SiQ2ueQCuq1Dk=
X-Google-Smtp-Source: ABdhPJxkd5dV108IbJ7mCIt1DofOzSEau98h9UYcjCcnmbfmquAu3yGv9xq5uFk8WLaj3yC40mjiNCMymFwRlKfbgoc=
X-Received: by 2002:a17:906:158c:: with SMTP id k12mr15919234ejd.119.1612769597949;
 Sun, 07 Feb 2021 23:33:17 -0800 (PST)
MIME-Version: 1.0
References: <1612684970-125948-1-git-send-email-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <1612684970-125948-1-git-send-email-jiapeng.chong@linux.alibaba.com>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Mon, 8 Feb 2021 08:33:06 +0100
X-Gmail-Original-Message-ID: <CAJKOXPdCk6vE7JXC9GV6rK+n5P7VZNE5nRCTzo0VtWE_d_06Jg@mail.gmail.com>
Message-ID: <CAJKOXPdCk6vE7JXC9GV6rK+n5P7VZNE5nRCTzo0VtWE_d_06Jg@mail.gmail.com>
Subject: Re: [PATCH v2] memory: tegra186-emc: Replace DEFINE_SIMPLE_ATTRIBUTE
 with DEFINE_DEBUGFS_ATTRIBUTE
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sun, 7 Feb 2021 at 09:03, Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> Fix the following coccicheck warning:
>
> drivers/memory/tegra/tegra186-emc.c:158:0-23: WARNING:
> tegra186_emc_debug_max_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.
>
> drivers/memory/tegra/tegra186-emc.c:128:0-23: WARNING:
> tegra186_emc_debug_min_rate_fops should be defined with
> DEFINE_DEBUGFS_ATTRIBUTE.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>

Hi,

My question from v1 is still valid because I did not receive any
coccinelle report - where can we find it?

Best regards,
Krzysztof
