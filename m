Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FB4FC433DB
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:36:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6DF4B619CD
	for <linux-tegra@archiver.kernel.org>; Tue, 30 Mar 2021 22:36:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232982AbhC3WgZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 30 Mar 2021 18:36:25 -0400
Received: from mail-oi1-f172.google.com ([209.85.167.172]:46837 "EHLO
        mail-oi1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232974AbhC3Wf7 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 30 Mar 2021 18:35:59 -0400
Received: by mail-oi1-f172.google.com with SMTP id m13so18043734oiw.13;
        Tue, 30 Mar 2021 15:35:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=mIW2TN59yaf7zZvWo0eZuc3U3VKeCIk16a9IMwj2jH4=;
        b=Jex/x1gCI/NUzl7+GOx0DoYROYgkJjbyw+H76iTdXxX3bUo4v3bXLNH3lfXgMf8d9x
         rhxLWU0PhO2um1aeHU7NvgOZid9+p8fzZS3vHYtfHD/ZfKjVYx95f5pEV1rI5HgM049/
         Dsff8SA17ZXrrMAKbzHFdXfjdqSF6BYEYuwf+dXo034MGrXeh511/f+NtjwIF5Ip/bvp
         5999EoEUtiiMaHVzVTDVl91RI65YTqqbe7X31ZfODJ6tAqkB9mkSvwO00wr6GvjcH9v/
         0ydHL2UI6mXw42WkKmk91kpwUVw4PjoDLXMOsdI8CTyOdszSJZpTwICl5ITYGbIBJfXV
         fuwg==
X-Gm-Message-State: AOAM5333PyK27Xc6zmRUP0hggd6EOTEsJkXjW6WPxIGB31/VNJlAlAJ1
        ASFnqYxuym3r9zEgNgNJqg==
X-Google-Smtp-Source: ABdhPJxdmGtnDEkcmeCwnDV30W9Zan2ZxgrLPrYWWYAT9Jbea/xyf4fodvHERtWQUKxb5eMS8C8WDg==
X-Received: by 2002:aca:1c14:: with SMTP id c20mr129285oic.146.1617143758403;
        Tue, 30 Mar 2021 15:35:58 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j35sm46218ota.54.2021.03.30.15.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Mar 2021 15:35:57 -0700 (PDT)
Received: (nullmailer pid 837656 invoked by uid 1000);
        Tue, 30 Mar 2021 22:35:56 -0000
Date:   Tue, 30 Mar 2021 17:35:56 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 5/6] dt-bindings: memory: tegra20: emc: Convert to
 schema
Message-ID: <20210330223556.GA835644@robh.at.kernel.org>
References: <20210329194602.17049-1-digetx@gmail.com>
 <20210329194602.17049-6-digetx@gmail.com>
 <7e45375c-3e24-4fc1-5776-190db32681e5@canonical.com>
 <2ded3a2d-6487-6e6d-d211-0cae45f4f948@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2ded3a2d-6487-6e6d-d211-0cae45f4f948@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Mar 30, 2021 at 06:32:20PM +0300, Dmitry Osipenko wrote:
> 30.03.2021 11:48, Krzysztof Kozlowski пишет:
> >> +  nvidia,use-ram-code:
> >> +    type: boolean
> >> +    description:
> >> +      If present, the emc-tables@ sub-nodes will be addressed.
> >> +
> >> +patternProperties:
> >> +  "^emc-table@[0-9]+$":
> > This might not be easy but you should add constraints when emc-table and
> > emc-tables are expected. The schema should check if proper node is used
> > depending on "nvidia,use-ram-code".
> > 
> 
> I'm afraid this is not doable. If you have an example how to do this,
> please share it with me.
> 
> I see that there is a "dependencies:", but it doesn't work with the
> patterns, IIUC.

That's correct.

Rob

