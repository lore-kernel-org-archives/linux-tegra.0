Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16638CD484A
	for <linux-tegra@archiver.kernel.org>; Fri, 22 Sep 2023 17:16:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232874AbjIVRQT (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 22 Sep 2023 13:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232767AbjIVRQQ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 22 Sep 2023 13:16:16 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 243B61A6
        for <linux-tegra@vger.kernel.org>; Fri, 22 Sep 2023 10:16:08 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1c5dd017b30so16781705ad.0
        for <linux-tegra@vger.kernel.org>; Fri, 22 Sep 2023 10:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695402967; x=1696007767; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
        b=BWQIRm3eUX4ZBoJ1U57MYmaIbPdf8z5SesOZqHrXyqm/tIcJKfKxXVm9Ksj8HT7CRX
         zDEztsz5fpzUChAX3JySlC09KbWyvZYC0q2GuLgRtBMR+xEHhpB60s2FKMlLE5TMPfb7
         x9VHwlp1N1qomZ3ZmOlgZgj/mJHUaeaKxrj7s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695402967; x=1696007767;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICBL/Q4jbf7cf4gR4zY8Pazn4MfjoBlTiYldqzQrKlk=;
        b=a4fxSsYHsR9hN/BcFjyMrt7owwstzdM0n2ZgKcy3OVreTz5fhQPMPQM7SZZ7kg73dV
         WHAWEQbynn2UI48dgfmJd1J4ydIjL1FtosKjCvOWSJK7bifJ89Z1fG3Qs0KLuhB+JvJe
         Vrq6O8H5RiTczEFQvwrpAVLi+JlXmimOVppNBvsNoT+34Xxy6yK5SYSTYWmIRinys0Dp
         8v3A9j0kQu31afPU7QUvd1hHM8Jphz54rAg0I9uzhckV6LlBchgSTlRQ83oBx7OjGg4v
         8vFGb6t3RrXK/W3xtjZggX3sYiniKE/ncAktSHDiBXZqKA2ruvQe4tBxE4/D+ALtjX/o
         LRuA==
X-Gm-Message-State: AOJu0YzUTBwTd7+0EDY2Uxg3XQLu+rj+h4G/M+Vw5V/Fzbwue4ldQUnb
        lbKywu6Qtb4UNczhQwrRVki24g==
X-Google-Smtp-Source: AGHT+IEetMJnHs5bBcV9L3R6HPyKeQTS1z7sgSklrhHfcojQhz5I0wr5ShzBfZ21ocAxIbhohXa34w==
X-Received: by 2002:a17:902:a416:b0:1c5:ecfc:2650 with SMTP id p22-20020a170902a41600b001c5ecfc2650mr2175732plq.14.1695402967593;
        Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id ji18-20020a170903325200b001bdbe6c86a9sm3742195plb.225.2023.09.22.10.16.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 10:16:07 -0700 (PDT)
Date:   Fri, 22 Sep 2023 10:16:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
        Alyssa Rosenzweig <alyssa@rosenzweig.io>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Tudor Ambarus <tudor.ambarus@linaro.org>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Jie Hai <haijie1@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Green Wan <green.wan@sifive.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Jon Hunter <jonathanh@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter Ujfalusi <peter.ujfalusi@gmail.com>,
        Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Yu Kuai <yukuai3@huawei.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jordy Zomer <jordy@pwning.systems>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>, linux-kernel@vger.kernel.org,
        asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
        dmaengine@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-tegra@vger.kernel.org, llvm@lists.linux.dev,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH 00/21] dmaengine: Annotate with __counted_by
Message-ID: <202309221015.AB63726@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <202309151307.F3341BD5A@keescook>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202309151307.F3341BD5A@keescook>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 15, 2023 at 01:08:30PM -0700, Kees Cook wrote:
> Just a ping on the series... how do these look to you, Vinod?
> 
> If you want I can carry them in my tree. Please let me know.

I'm now carrying this in my for-next/hardening tree. Let me know if
you'd prefer I drop it.

Thanks!

-Kees

-- 
Kees Cook
