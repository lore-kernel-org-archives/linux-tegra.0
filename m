Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB0BEE743CE
	for <linux-tegra@archiver.kernel.org>; Thu, 28 Sep 2023 23:42:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjI1XmO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 28 Sep 2023 19:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229541AbjI1XmN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 28 Sep 2023 19:42:13 -0400
Received: from mail-oo1-xc29.google.com (mail-oo1-xc29.google.com [IPv6:2607:f8b0:4864:20::c29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 77219199
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 16:42:12 -0700 (PDT)
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57bce354d94so3728738eaf.2
        for <linux-tegra@vger.kernel.org>; Thu, 28 Sep 2023 16:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1695944532; x=1696549332; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
        b=eIm0Tr3UrWUjzJ4jN6/2IK7vGtk83w/aM+dkwIMq+AwB2ci1Gu09xf9F9GMwaILj70
         n4QvEnSrxRKunYK7/hD7XS4qnfKHiKUaPe20ZtTX7CsoKDMIVZZO8CFpNReTVXNSUq67
         RXlmxi/OVy4WJv6gtNUzW8faa2GmV5dV2N214=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695944532; x=1696549332;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3RV2WVrYFvmUIy/kF4sgLaI/igSwAmnqnqr5+CNVDt8=;
        b=rB8dcfY8dd4/QtcS4BMg9CITL1Xp/Gp8/C7FH55jhldtoI4UynBh/nF+F+JsQ0Z38W
         ZV5rI8Q7CWmECglKiPbFvXS58d5QfXp48axdfc4IHRDvHKH2qurymkzYYyt8Y/25wmPL
         oO9m3R8lWv84o5gE+4pOuDZ7SuyxFhBY6MoTKp7auIvsP/7Nd9ZezoJ0foDZXwwgpldU
         1X0IBvWbXHBvNnVMgljhvUHVYkbRj57AQmLf18+ySjFbu88+KkHS80ETACzneta1fSrN
         DW+OwvXsnNdMdLYltBt85wrL1hD7s83LJO7nIEP+qduvOWTo+C/ZI36jYx5GlRgqAxeE
         Dk+w==
X-Gm-Message-State: AOJu0YwhIjeOCDuCom7TJHTPemJ0LVN+hqUA9btMQBz4pVyeK+fsbE/z
        zg96/o6z57QWNIb8WVCd3dMeOA==
X-Google-Smtp-Source: AGHT+IHBsCldxysDZTajanQY+g4dIkq4a5ohe3XveIhxwgWt0zJyzNyJaoBdNbO8ZXRuiDiGJefhMw==
X-Received: by 2002:a05:6358:2808:b0:13e:ea2a:40aa with SMTP id k8-20020a056358280800b0013eea2a40aamr1895209rwb.8.1695944531707;
        Thu, 28 Sep 2023 16:42:11 -0700 (PDT)
Received: from www.outflux.net (198-0-35-241-static.hfc.comcastbusiness.net. [198.0.35.241])
        by smtp.gmail.com with ESMTPSA id t6-20020a639546000000b0057a868900a9sm13316234pgn.67.2023.09.28.16.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 16:42:10 -0700 (PDT)
Date:   Thu, 28 Sep 2023 16:42:09 -0700
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
Message-ID: <202309281641.47911CC@keescook>
References: <20230817235428.never.111-kees@kernel.org>
 <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <169590216841.152265.1942803099201042070.b4-ty@kernel.org>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Sep 28, 2023 at 05:26:08PM +0530, Vinod Koul wrote:
> 
> On Thu, 17 Aug 2023 16:58:37 -0700, Kees Cook wrote:
> > This annotates several structures with the coming __counted_by attribute
> > for bounds checking of flexible arrays at run-time. For more details, see
> > commit dd06e72e68bc ("Compiler Attributes: Add __counted_by macro").
> > 
> > Thanks!
> > 
> > -Kees
> > 
> > [...]
> 
> Applied, thanks!

Thanks! I've dropped them from my tree. :)

Also, I found 1 more, which I'll send separately.

-Kees

-- 
Kees Cook
