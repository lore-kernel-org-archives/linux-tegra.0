Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14B83C48BDF
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 21:47:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8B53611AB
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 21:47:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229829AbhFOVto (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 17:49:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229782AbhFOVto (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 17:49:44 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB007C061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 14:47:37 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id q20so659006lfo.2
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 14:47:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Qy++EBDFaZvqgW1m5dlJjqlqqRntruqLJpN8Iy2Fv4E=;
        b=Nym15taujVAAmzyaYHFyzI8sHtY6x4g1W0VAbFhykXsx5of73+d8ZQhFmZIj9Wlt3y
         wlqYe7TjDxI22C8U8cYWfh9P4eg00mnYYpTOJedwAZOuS/8/Q/77HSofJXsiUSo6vkcP
         W9AENC77oVK2I0OP8J4/oudI8pPhP02BqStctJykLMuqznmgy60Tvyboglw6VwScW0/b
         oIYJ70Yi37DM8xin5aYFAAlOz+UbmIaqbnMYBt1+zG9hgd4SFH103oH09dPsUMmvqz1I
         /wISy8dd0xtTMx+o+HjwTFT6zFwRYl26G9Z7+WqcucG39ydd0cpfaU2aTQpNzFjd6DAA
         dtVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Qy++EBDFaZvqgW1m5dlJjqlqqRntruqLJpN8Iy2Fv4E=;
        b=GMyKNDtve3oxOv/ywX3y6tjOhFd1nxz/bBQms8DEGk413C/WGkjyjd615AyGfadx1a
         xO1SmIg+3BVU6BDqudgB0QfSgitxnJ4cPR4QKREqJ0cLJ29AS8G8G1ZOMYRpG5SNf7Mk
         mAOllFNHT5xUJBqGI/oAjaQM9QppIyBqIXiuodlm0eiNc+EPyq/LlY5WVFmzW4pXk2Zj
         cceAaAsFduE9FlX70zhgOEDhRWjwcwSY68vy7PTyfIrAwhiEEF1D/65zxGyoPzQXxfCg
         /0w5YMDpV+QCC6/w6Y1KO2wKfetbggshaYJnj9FUFzT2qQpuPyn8ze6mtl2m4XSQTQfx
         84vA==
X-Gm-Message-State: AOAM533/6Mfp4y5xAlfBkdAMNpTkPmvt8lGIDeEA8F9kPlbPugL1rmrs
        J1FWF2t00WpeU45ZFm5/7vpIWPXF/MU=
X-Google-Smtp-Source: ABdhPJzgD1p44mcbnLOeVGJlHvz/io+GuULyRYbswGgzwLUw837NRJokSgSiDtP70pubdqGsWLS+cg==
X-Received: by 2002:ac2:549c:: with SMTP id t28mr1020384lfk.205.1623793655799;
        Tue, 15 Jun 2021 14:47:35 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id m22sm5447ljj.45.2021.06.15.14.47.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 14:47:35 -0700 (PDT)
Subject: Re: [PATCH v7 01/15] gpu: host1x: Add DMA fence implementation
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-2-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <3867c5c2-7cf1-66f2-96fe-74ed106f590c@gmail.com>
Date:   Wed, 16 Jun 2021 00:47:34 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-2-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

..
> diff --git a/drivers/gpu/host1x/fence.c b/drivers/gpu/host1x/fence.c
> new file mode 100644
> index 000000000000..2b0bb97f053f
> --- /dev/null
> +++ b/drivers/gpu/host1x/fence.c
> @@ -0,0 +1,184 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Syncpoint dma_fence implementation
> + *
> + * Copyright (c) 2020, NVIDIA Corporation.
> + */
> +
> +#include <linux/dma-fence.h>
> +#include <linux/file.h>
> +#include <linux/fs.h>
> +#include <linux/slab.h>
> +#include <linux/sync_file.h>

Stale headers

> +#include "fence.h"
> +#include "intr.h"
> +#include "syncpt.h"
> +
> +DEFINE_SPINLOCK(lock);

static

...
> +static bool host1x_syncpt_fence_enable_signaling(struct dma_fence *f)
> +{
> +	struct host1x_syncpt_fence *sf = to_host1x_fence(f);
> +	int err;
> +
> +	if (host1x_syncpt_is_expired(sf->sp, sf->threshold))
> +		return false;
> +
> +	dma_fence_get(f);
> +
> +	/*
> +	 * The dma_fence framework requires the fence driver to keep a
> +	 * reference to any fences for which 'enable_signaling' has been
> +	 * called (and that have not been signalled).
> +	 * 
> +	 * We provide a userspace API to create arbitrary syncpoint fences,
> +	 * so we cannot normally guarantee that all fences get signalled.
> +	 * As such, setup a timeout, so that long-lasting fences will get
> +	 * reaped eventually.
> +	 */
> +	schedule_delayed_work(&sf->timeout_work, msecs_to_jiffies(30000));

I don't see this API. Please always remove all dead code, make patches
minimal and functional.

...> +int host1x_fence_extract(struct dma_fence *fence, u32 *id, u32
*threshold)
> +{
> +	struct host1x_syncpt_fence *f;
> +
> +	if (fence->ops != &host1x_syncpt_fence_ops)
> +		return -EINVAL;
> +
> +	f = container_of(fence, struct host1x_syncpt_fence, base);
> +
> +	*id = f->sp->id;
> +	*threshold = f->threshold;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(host1x_fence_extract);

dead code
