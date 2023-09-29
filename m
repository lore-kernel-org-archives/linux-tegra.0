Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FBF5E728CF
	for <linux-tegra@archiver.kernel.org>; Fri, 29 Sep 2023 18:46:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233653AbjI2SqU (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 29 Sep 2023 14:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbjI2SqU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 29 Sep 2023 14:46:20 -0400
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com [IPv6:2607:f8b0:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7ADF61A4
        for <linux-tegra@vger.kernel.org>; Fri, 29 Sep 2023 11:46:17 -0700 (PDT)
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1c724577e1fso44729145ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 29 Sep 2023 11:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1696013177; x=1696617977; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oa0jeuOHt4Ygw+vX2a1/F/6PlmjBYIo0hM9//kmfJYU=;
        b=H4bNxhoX5k64IHNur9UQuAolyRs/rPBIr1qCZqFo+FXihIHN35W1DQQw8ns0QX9lvS
         yTSHSpW8vpWpjCe14WQtadyZlXKQp3+cjKLuG3Smvb6u6+NcPV6Fe0eGwiNhb65VKwTM
         XTt4sExupCa1969zkbPyJh8OPjhKwaKKP8G2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696013177; x=1696617977;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oa0jeuOHt4Ygw+vX2a1/F/6PlmjBYIo0hM9//kmfJYU=;
        b=OdwvHgssgV+bx6XcIvoqt+Osdjpc/C+MVrvrKHHYtbBrQn96EQV14vrAAfEV7/DtYY
         ZTSm3Ztl7lPYQ8Mb8SOKV2WvGMRMfirGoMdl4z4/Slqf4kQ24kavkpA1HUFgEFUZRCu9
         pwX9aMq/pwk1SCpFgOWvme2eTuLE7x6EPAYn73QcWQAlzTUWyhHJ0IlyriN7mM7AE8ud
         dbEf2XvBpfVRIrknc0SbGAnZohPjp6Au94FGDpSC+iYHqnSwMdUo8/Ro7vav0c9JJySR
         k6IdEPUcIVqqKBOKU+qkXQ489YhFPyJQpde4O9VhDFQamlps9whDU2Jn2X36jyeZg/kh
         wNug==
X-Gm-Message-State: AOJu0YwJ56DgbA95SLzuMZhRThDrPhezAKlkuQxwhKfd946nMYrv4Gva
        hk9PY5vqAnmxIlvyOaLQ0WJZwQ==
X-Google-Smtp-Source: AGHT+IFaIItATlDRNYtcD9NZzG6YXArn5AX8jrSe1vJMwigpZOnGOphSVTghcOXwMrz7Aid2q4S5sw==
X-Received: by 2002:a17:902:c115:b0:1bf:4a1f:2b57 with SMTP id 21-20020a170902c11500b001bf4a1f2b57mr4844128pli.13.1696013176804;
        Fri, 29 Sep 2023 11:46:16 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id l19-20020a170902d35300b001bc6e6069a6sm17300448plk.122.2023.09.29.11.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Sep 2023 11:46:16 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Justin Stitt <justinstitt@google.com>
Cc:     Kees Cook <keescook@chromium.org>, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: bpmp: refactor deprecated strncpy
Date:   Fri, 29 Sep 2023 11:46:14 -0700
Message-Id: <169601317381.3009991.4885445233179317899.b4-ty@chromium.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230913-strncpy-drivers-firmware-tegra-bpmp-debugfs-c-v1-1-828b0a8914b5@google.com>
References: <20230913-strncpy-drivers-firmware-tegra-bpmp-debugfs-c-v1-1-828b0a8914b5@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, 13 Sep 2023 19:38:44 +0000, Justin Stitt wrote:
> `strncpy` is deprecated for use on NUL-terminated destination strings [1].
> 
> We should prefer more robust and less ambiguous string interfaces.
> 
> It seems like the filename stored at `namevirt` is expected to be
> NUL-terminated.
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] firmware: tegra: bpmp: refactor deprecated strncpy
      https://git.kernel.org/kees/c/5a4b8c16f53f

Take care,

-- 
Kees Cook

