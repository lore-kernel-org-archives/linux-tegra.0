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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F70EC48BE5
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:19:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BC0761185
	for <linux-tegra@archiver.kernel.org>; Tue, 15 Jun 2021 22:19:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbhFOWWB (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 15 Jun 2021 18:22:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbhFOWWA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 15 Jun 2021 18:22:00 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A692EC061574
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:19:54 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id p7so767897lfg.4
        for <linux-tegra@vger.kernel.org>; Tue, 15 Jun 2021 15:19:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kx2V6/kii0fkN6ERxcXygqp8Bpu9empcp2wroAAgz0s=;
        b=fQdVlFl6JUzBWWoK1G2plSLcQIE5I9bTMe605J3/Y3fNiY1k96PaFJ+1X81tIHfNUY
         82jTvlBVChkOVCUV9MByRcNXlMobaTW3PUbFDQBBzpcTx5+iu2s3mit/Zn0t+sXC5SVM
         2b3swh9kirOaIYwi1ob0oyT+4hnIJGX30yFwPpx+sxDAChnFcJE2FbtjzlFEj7DCo8r0
         9F1whDmk3gUk0O2wqTtQ3UF9X1Uj9fECC6N63ityVtR/M9AITMzfAYTA1y2oWZYgEIs7
         iuvLdtamdQ1wkxkhd80T0/xqocVD6AQ7gkceSNUOP6fSpT6GWLqfvVQFhDlFHNd5TrfG
         4YoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kx2V6/kii0fkN6ERxcXygqp8Bpu9empcp2wroAAgz0s=;
        b=Mqou5qkqTKqEIBnXpifDKI8JZ0s7a5wqD8EWdSBDQVHkNIWlArSkBWfyQufArLg94U
         7GPn6eFFn1UbbugxNfZ2Otf/W4+uTm0F+48KbLNPb4/PmUOJVMCx0KjHtrSQHKpzUP0N
         e/yt7ahxYWZ2IrJOY9aMfeUBvxRZ6r3LHSaY4yQL2khl0DplQo2BqvF1gQ7BcWYzthHh
         0DFpZtl2CaIUGug7O6v8alLg0x/3g60/0kv9/I/OYIdd32JSVphi2PV9gDVFvH7mz+Bk
         JNFoI+iTc0D2ipzTRRJhxwCRaFs8LZ3FmnesLSnA6dXNGTgvEjz9++9KNWfLY8uMVHxt
         ahzQ==
X-Gm-Message-State: AOAM5336S/I8nhfHFc971Kb8osSKAOz2HZBFIhYRFpKHDBPFwsLEo/YN
        2EyPo/I91ZfIr8HxZy/zLFycY7ERnFw=
X-Google-Smtp-Source: ABdhPJwVA6yfmt55TjhnUlf1uqobLgrF8pecoI/UQREatg97iah54jqHs3HCHhSdBFcrLXeHGJTifg==
X-Received: by 2002:ac2:5edd:: with SMTP id d29mr1144897lfq.57.1623795592922;
        Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
Received: from [192.168.2.145] (94-29-31-25.dynamic.spd-mgts.ru. [94.29.31.25])
        by smtp.googlemail.com with ESMTPSA id x22sm35110lfu.171.2021.06.15.15.19.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Jun 2021 15:19:52 -0700 (PDT)
Subject: Re: [PATCH v7 13/15] drm/tegra: Implement job submission part of new
 UAPI
To:     Mikko Perttunen <mperttunen@nvidia.com>, thierry.reding@gmail.com,
        jonathanh@nvidia.com, airlied@linux.ie, daniel@ffwll.ch
Cc:     dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org
References: <20210610110456.3692391-1-mperttunen@nvidia.com>
 <20210610110456.3692391-14-mperttunen@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <b1f0d64c-1ad3-186d-85df-0e2fa473bfd3@gmail.com>
Date:   Wed, 16 Jun 2021 01:19:51 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210610110456.3692391-14-mperttunen@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

10.06.2021 14:04, Mikko Perttunen пишет:
> +++ b/drivers/gpu/drm/tegra/gather_bo.c
> @@ -0,0 +1,82 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/* Copyright (c) 2020 NVIDIA Corporation */
> +
> +#include <linux/dma-mapping.h>
> +#include <linux/scatterlist.h>
> +#include <linux/slab.h>
> +
> +#include "gather_bo.h"
> +
...
> +const struct host1x_bo_ops gather_bo_ops = {
> +	.get = gather_bo_get,
> +	.put = gather_bo_put,
> +	.pin = gather_bo_pin,
> +	.unpin = gather_bo_unpin,
> +	.mmap = gather_bo_mmap,
> +	.munmap = gather_bo_munmap,
> +};

I think it's a wrong to model host1x bo as a part of DRM driver. It is
akin to the ill-defined model of DRM GEMS represented by host1x_bo that
current mainline driver uses.

Host1x BO should belong to Host1x driver. DRM BO should belong to DRM
driver. Mixing them together makes no sense, it is very unnatural and
confusing. This should be a part of the driver reorganization discussion.
