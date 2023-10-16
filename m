Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CC08CDB465
	for <linux-tegra@archiver.kernel.org>; Mon, 16 Oct 2023 19:49:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233412AbjJPTte (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 16 Oct 2023 15:49:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54510 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233707AbjJPTtd (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 16 Oct 2023 15:49:33 -0400
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com [IPv6:2607:f8b0:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2186DF3
        for <linux-tegra@vger.kernel.org>; Mon, 16 Oct 2023 12:49:29 -0700 (PDT)
Received: by mail-ot1-x331.google.com with SMTP id 46e09a7af769-6c6504c9ac5so3447104a34.0
        for <linux-tegra@vger.kernel.org>; Mon, 16 Oct 2023 12:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1697485768; x=1698090568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TDEvoDDFlhaScQdoPW2tJhTzTU/5dfUG14nxqzDs2yA=;
        b=JsWsXFp7B+tTYU2ItV0yg6gp2M0FieKyfLU1u65a9OD1zULLXTI9IUZjcTP7nPF7Cn
         YSCdjyak05QNzkxjgILMkBBeuFuaEDcGmtspaaZ0UkOdFWCCO9Y+CEAiN6jstBqMGYAA
         5fy3L2H023WgcLg5FJNBOoKl/Kgvhf3HtIiXQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697485768; x=1698090568;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TDEvoDDFlhaScQdoPW2tJhTzTU/5dfUG14nxqzDs2yA=;
        b=OW5aUZNXh3fr+ZZrRm7K8g6V/cgWDdfZd4zfyZ4mfRz7VqTzw+QjhPPG0j5hu0SVAN
         VTNRJNAvx8U4g2O9jUeHobzL56uC9PKTvYqGZbmjWuCozaODR1gNDgznJ0zJ9ED30H/f
         b4cvY2cD+1BJgVLNdksk9PiysLIq3IbtCCG/q92FTj0Z8HQrIpsYXIiUL5vH9echE50j
         cBF7XeS9iOyTLqkVR0dIgEJ7CcY0WbYAr5rkoPGHCNf3aECO4exlOn2QW8AuQq4zHQxu
         3qCZ7vNSLAFwgVM7W1Vf8UnkE9ETic7CFoFxA/4A320TB1f8wc8yMC7rkkn7UM41RERt
         p7iA==
X-Gm-Message-State: AOJu0YwAO4coAYOivSb5lfCoBC4Vx3bdBb75+t7QOQ4L5K7xqSjwAJhO
        Vkoq4vdj5X3SYhfbsPOe/IjmDA==
X-Google-Smtp-Source: AGHT+IGzztkRAoioNbwxGtaNyJL8FtTv0uRRmTERYsx7mf9E05Z0DIj6n8vDcTI8S1PZr6xfpA678g==
X-Received: by 2002:a9d:6d9a:0:b0:6b8:807b:b50 with SMTP id x26-20020a9d6d9a000000b006b8807b0b50mr221886otp.22.1697485768484;
        Mon, 16 Oct 2023 12:49:28 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id v67-20020a626146000000b00690d1269691sm309260pfb.22.2023.10.16.12.49.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Oct 2023 12:49:27 -0700 (PDT)
Date:   Mon, 16 Oct 2023 12:49:27 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Kartik <kkartik@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com, andy@kernel.org,
        akpm@linux-foundation.org, arnd@arndb.de, ulf.hansson@linaro.org,
        linus.walleij@linaro.org, pshete@nvidia.com, petlozup@nvidia.com,
        frank.li@vivo.com, robh@kernel.org, stefank@nvidia.com,
        pdeschrijver@nvidia.com, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-mm@kvack.org
Subject: Re: [PATCH v5 1/8] mm/util: Introduce kmemdup_array()
Message-ID: <202310161249.A59D2AE2@keescook>
References: <20231016053411.3380-1-kkartik@nvidia.com>
 <20231016053411.3380-2-kkartik@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231016053411.3380-2-kkartik@nvidia.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Oct 16, 2023 at 11:04:04AM +0530, Kartik wrote:
> Introduce kmemdup_array() API to duplicate `n` number of elements
> from a given array. This internally uses kmemdup to allocate and duplicate
> the `src` array.
> 
> Signed-off-by: Kartik <kkartik@nvidia.com>

Acked-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
