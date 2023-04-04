Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8DFDC6FD1D
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 12:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234637AbjDDM0U (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 08:26:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234878AbjDDM0J (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 08:26:09 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7F1230FD
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 05:25:56 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id t10so129668051edd.12
        for <linux-tegra@vger.kernel.org>; Tue, 04 Apr 2023 05:25:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680611155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4BNNcQpkxyR0owyOp5CMFaVav8tmtq+PNdeLtVexXGg=;
        b=CC/lEtwAIIAE+rV4NEW62Io54HThR97NeZjjZRuADs1kYyEYTkhBrZRYXhuRWdvvND
         qyOy889MoGrSzBo7OngzpaBLzv0q4/f+8hWGIaxgT9CkqFh27Of7n0ygAKid77E6Gn4D
         II1J9/qY9rO4mEQy34oAnTPl449SYZ65RE2Mcs/xUJ+aVQR2Jx9HBB1VOcgAtQ67TIpu
         E5fkKiuADxQ9Aw9dDeL7KgSipZOBzCfCEtZeKVMxiMIWo8QHnUABb1n4f9oEYdR7c4Db
         961/aFn3M+qkqPVQ88n3fYVvEA4kYeepFfyFDkFNoznTkglLJuB7NfF+kmJMd/QAPX8f
         lMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680611155;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4BNNcQpkxyR0owyOp5CMFaVav8tmtq+PNdeLtVexXGg=;
        b=H4BIb/2yGAW30XUkIxNSVL9RJKMqlwFX1OcbNDU99QP2ITUZ9qNYOGzJXxALMiqV1/
         7sGK/l4rm56SFkrCHLaSv4g2ShBlhKePEpxZ0AiET5vzVT+LIGDd1r7wrR0kd5bddFFP
         QRSAxvTXtEFVwoIbQrI2L0dV8QwTn0JKC0BXLnKEK+75jiqe3yWA+5DKAjI3DJM+aAVk
         AoDPj4ewKWfNQNGqtjVjT4An4tZ6HyaQ4RCJxFxfruwGsbMBx9ePV2UopYrJPNwgryxk
         JFSkIFdbLwyXGVYYsfBsNUFLc5r60Xen/4pA9FhnLH59+LekOxj0ayu1HbRaTo7fRXnL
         PxXg==
X-Gm-Message-State: AAQBX9cvkTK8w26RWDj86ryJjXe4g3RJgrxS1suyM1tsS9ujWWNZT3ip
        QPxLus3GXIdU9zWEYCEsa3M=
X-Google-Smtp-Source: AKy350ZJ+dpLujFfmYnZFteYJ6Sd16eXrhgaRM2M9aGB2JJRl/BkHvzYANjiW+BGvFjpR4jKTV7EMA==
X-Received: by 2002:a17:906:f1d1:b0:92a:3709:e872 with SMTP id gx17-20020a170906f1d100b0092a3709e872mr2373777ejb.19.1680611155252;
        Tue, 04 Apr 2023 05:25:55 -0700 (PDT)
Received: from localhost (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id dx7-20020a170906a84700b008d53ea69227sm5908478ejb.224.2023.04.04.05.25.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 05:25:54 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     airlied@gmail.com, Yang Yingliang <yangyingliang@huawei.com>,
        thierry.reding@gmail.com, cyndis@kapsi.fi, mperttunen@nvidia.com,
        daniel@ffwll.ch, linux-tegra@vger.kernel.org
Subject: Re: (subset) [PATCH v2 resend 1/2] gpu: host1x: fix potential double free if IOMMU is disabled
Date:   Tue,  4 Apr 2023 14:25:51 +0200
Message-Id: <168061111513.2057226.17028997773710080607.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20221126073315.365567-2-yangyingliang@huawei.com>
References: <20221126073315.365567-1-yangyingliang@huawei.com> <20221126073315.365567-2-yangyingliang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

From: Thierry Reding <treding@nvidia.com>

On Sat, 26 Nov 2022 15:33:14 +0800, Yang Yingliang wrote:
> If context device has no IOMMU, the 'cdl->devs' is freed in
> error path, but host1x_memory_context_list_init() doesn't
> return an error code, so the module can be loaded successfully,
> when it's unloading, the host1x_memory_context_list_free() is
> called in host1x_remove(), it will cause double free. Set the
> 'cdl->devs' to NULL after freeing it to avoid double free.
> 
> [...]

Applied, thanks!

[1/2] gpu: host1x: fix potential double free if IOMMU is disabled
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
