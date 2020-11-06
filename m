Return-Path: <SRS0=26Yb=EM=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6631CC388F2
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 18:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D7F520B80
	for <linux-tegra@archiver.kernel.org>; Fri,  6 Nov 2020 18:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604687449;
	bh=T1VbY5ldZIMJ8UfuwC4rN+uXQTkxlvOnAc50wdGJlSQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=qjxo5Rzx6mxXM8gLvj+jvdISHq0QmE8ya05a5in3Z+lqjVnO3b4A76E29JeIU0kdk
	 DcJpQgUIKQG+O4wO7eUUHA/2EmgoIwhIveT8rfFnzq8YWz7GznM7UD0WLp/aLvGk85
	 FuaN6FdaU+8EtfhlOtRrwzJtUYW8FsOm1k0GoFr8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727791AbgKFSap (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 6 Nov 2020 13:30:45 -0500
Received: from mail-ej1-f66.google.com ([209.85.218.66]:42310 "EHLO
        mail-ej1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727183AbgKFSap (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 6 Nov 2020 13:30:45 -0500
Received: by mail-ej1-f66.google.com with SMTP id i19so3239715ejx.9;
        Fri, 06 Nov 2020 10:30:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LGNdf9QrireIvWZa+KriZNBtoGagpUWNerj0S6Na9/8=;
        b=j8aJLAGsI+8hwvgRzEI6fODdLeh3rrG6FtSK3Z6dSPMuq5cp0lAKdNCSKjYwC5bL3s
         KMOMqYvZvBHSETA8JjRAzyBSNucgT4YDHBuaut9t541vrLBs5lY52/NqUspp71qGvxld
         wuumEO69XUa9HepFL9zcDp2oPA200dXK7SP1yaCEEnbhpafTnZ17+PdbYO8ICLuYNH4s
         JQu7hXXriHbXamV5WRmhDXL9cLiebA8lBQy2+v2tZFcRLn71PZf7kbfoRvbOjlXp7D4S
         x7v6Xij8Ej8N7w6BQ9swCC73cWAYESzHJzNsxjuW/3+ZflH2TEEv8VHAdoRJcJRgLNKj
         1xog==
X-Gm-Message-State: AOAM53388jV83zRrQM5iZvPrg1SYgt0oyaRfRrCi2k5G4La3xgJIE/TX
        o4Xb3Nul+JpfieCHPyozyBsFZzkp5wM=
X-Google-Smtp-Source: ABdhPJy6k9N/Bpoe9hw4KBNy8mWyB7R8cTN/EwjyvcQpQntkEHkgEQ7Wvpsqm/uxCbuGPdQbauDOEg==
X-Received: by 2002:a17:906:86cf:: with SMTP id j15mr3334965ejy.260.1604687442427;
        Fri, 06 Nov 2020 10:30:42 -0800 (PST)
Received: from kozik-lap (adsl-84-226-167-205.adslplus.ch. [84.226.167.205])
        by smtp.googlemail.com with ESMTPSA id v11sm1473235ejj.123.2020.11.06.10.30.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2020 10:30:40 -0800 (PST)
Date:   Fri, 6 Nov 2020 19:30:38 +0100
From:   Krzysztof Kozlowski <krzk@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Mikko Perttunen <cyndis@kapsi.fi>,
        Viresh Kumar <vireshk@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        linux-tegra@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH v7 07/47] dt-bindings: memory: tegra20: emc: Document new
 interconnect property
Message-ID: <20201106183038.GG65086@kozik-lap>
References: <20201104164923.21238-1-digetx@gmail.com>
 <20201104164923.21238-8-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201104164923.21238-8-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Nov 04, 2020 at 07:48:43PM +0300, Dmitry Osipenko wrote:
> External Memory Controller is interconnected with memory controller and
> with external memory. Document new interconnect property which turns EMC
> into interconnect provider.
> 
> Acked-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../bindings/memory-controllers/nvidia,tegra20-emc.txt          | 2 ++

Thanks, applied.

Best regards,
Krzysztof

