Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0561EEAA42
	for <linux-tegra@archiver.kernel.org>; Fri, 15 Sep 2023 04:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229762AbjIOEBF (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 15 Sep 2023 00:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57860 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229554AbjIOEBE (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 15 Sep 2023 00:01:04 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BAF9A268E
        for <linux-tegra@vger.kernel.org>; Thu, 14 Sep 2023 21:00:59 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1c1f8aaab9aso14609125ad.1
        for <linux-tegra@vger.kernel.org>; Thu, 14 Sep 2023 21:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694750459; x=1695355259; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dSXFfyqgPwKVqMylZWaZxOwMkCRZt/DukldIcyDr7/Q=;
        b=OLrBWk+HHUIEagXG9HPi9FmVAexOREXK8DbV4Qa9njdBrjDNZ5qiM3QaBAAGlZqgUS
         84DVS843GER+iS3+9N1WMDQKv7VVywrngGQG/KZnAFFXGXI41pMQih2gh4yqU3fyWnWw
         vtPQ71EdCJ1HBaCHm/K6UabYgv+1faZsGG8Jc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694750459; x=1695355259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dSXFfyqgPwKVqMylZWaZxOwMkCRZt/DukldIcyDr7/Q=;
        b=FfqxVc0vGsz0wJCVbzwnuBUbZh7B9UsH1wTD5AA+wTHGFhW/fnjU9k7LC7Uhob1FgF
         gJVGKt0OBvIBZD4unidF+kKLluCMDXmocEm/oHFsKI6fG2Er9UylwWdXaoqNRlPJud3J
         WpagQIhCg7ebE1Ys+TzxDiaCLkC57LhTXYN3HR1M98gakYn1OsQKFfrO0CV8pKpc/14W
         VRQccH2sOsyGeQ8sRcRsUVlKKMhwUWQ+09vTaF1p63YUvHBKrcSFqT/CEIdu0UFVcpJu
         uhPScFkdl9GAvkKM1/SjiCWE0lcxAcnHp4DlFXBTO2sru4rjD2A+iopab2hj65Y/quqk
         5D3g==
X-Gm-Message-State: AOJu0YzFpI1XcT2OtkBUFMfkxu9gChUDxXlt8lU7BMv6zUEQ2BKFQZJq
        FT5Z+0Z2ReLNC0qsQ+PQh2cubg==
X-Google-Smtp-Source: AGHT+IGrfmym+Yfc4T+2FuFkeWde43uGhYIAgsRNS/mPDe3YUyp9Q/Gpkh8qdFQgMFLcFHhnM1UsEg==
X-Received: by 2002:a17:903:2302:b0:1c0:afdb:1e6c with SMTP id d2-20020a170903230200b001c0afdb1e6cmr691210plh.8.1694750459263;
        Thu, 14 Sep 2023 21:00:59 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id jb4-20020a170903258400b001c0cb2aa2easm2350777plb.121.2023.09.14.21.00.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Sep 2023 21:00:58 -0700 (PDT)
Date:   Thu, 14 Sep 2023 21:00:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Justin Stitt <justinstitt@google.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: refactor deprecated strncpy
Message-ID: <202309142054.8D93862@keescook>
References: <20230913-strncpy-drivers-firmware-tegra-bpmp-debugfs-c-v1-1-828b0a8914b5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230913-strncpy-drivers-firmware-tegra-bpmp-debugfs-c-v1-1-828b0a8914b5@google.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Sep 13, 2023 at 07:38:44PM +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> It seems like the filename stored at `namevirt` is expected to be
> NUL-terminated.

This took me a bit to establish, but yes: buf[256] is used to store
filename, so it'll always be %NUL-terminated with the 256 bytes, which
is the same size used to allocate virtname, which means it will always
be %NUL-terminated.

> 
> A suitable replacement is `strscpy_pad` due to the fact that it
> guarantees NUL-termination on the destination buffer whilst maintaining
> the NUL-padding behavior that strncpy provides.
> 
> Link: https://www.kernel.org/doc/html/latest/process/deprecated.html#strncpy-on-nul-terminated-strings [1]
> Link: https://github.com/KSPP/linux/issues/90
> Cc: linux-hardening@vger.kernel.org
> Signed-off-by: Justin Stitt <justinstitt@google.com>

This one looks weird because namevirt seems unused, but I assume there's
some kind of DMA side-effect happening somewhere?

But, yes, after digging around here, I think this all looks right.

Reviewed-by: Kees Cook <keescook@chromium.org>

-- 
Kees Cook
