Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D68BAC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Nov 2021 01:23:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbhK2B0u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Sun, 28 Nov 2021 20:26:50 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:37566 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236052AbhK2BYu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Sun, 28 Nov 2021 20:24:50 -0500
Received: by mail-ot1-f51.google.com with SMTP id h19-20020a9d3e53000000b0056547b797b2so23272199otg.4;
        Sun, 28 Nov 2021 17:21:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=35yw570T4KFH9Vn7h+QDO1+4caagXV0XP1TQ4gz5280=;
        b=K1eyhAOdUcasaxVaykS2HCvGilML+GE8PHe6ojvcu0263gIG6c6hM6/xht2hh1mjbB
         4ZZWWe20KKn8CA5ej7++R5FC19gWtOndwaG1ksBOp2az8Cp6z3U3xecbL5whgHIdTlaH
         JPSb4szPi7fktOpP9gw5a5jXJPsWg5iwzBv3veHX7piB+l4CtBtCsP5fHp9aXccirLy+
         RCNcVr5PPXp4PHJ7rwvfab2jqPe/sc0oq5ghKm4vh7qhCuw86vGDjO3VuGoZRFCnUVNy
         j+ubE6/xrU92ihtJHrtpFAP5XXfGIA3OW4iYoKiWOTIZHXr4l3GKu4qmfMpRbYXskj82
         JJoA==
X-Gm-Message-State: AOAM533ozm17i7ALhnhRv0UG8VBSutygcwpg8l0kMjij3Ilc8mTpbdMg
        9ri4wsHGVJ/m51+oWZTwPA==
X-Google-Smtp-Source: ABdhPJzJpgDDeqI5phORJElcPK/Ul1dZlNZVTFQoni4QTL8NZuEmBhGu0ak5YcK9HiFlLLtITX4wcQ==
X-Received: by 2002:a9d:4e89:: with SMTP id v9mr43407932otk.352.1638148893308;
        Sun, 28 Nov 2021 17:21:33 -0800 (PST)
Received: from robh.at.kernel.org ([172.58.99.229])
        by smtp.gmail.com with ESMTPSA id y192sm2637613oie.21.2021.11.28.17.21.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 17:21:32 -0800 (PST)
Received: (nullmailer pid 2965603 invoked by uid 1000);
        Mon, 29 Nov 2021 01:21:29 -0000
Date:   Sun, 28 Nov 2021 19:21:29 -0600
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     linux-tegra@vger.kernel.org, David Heidelberg <david@ixit.cz>,
        Nikola Milosavljevic <mnidza@outlook.com>,
        Rob Herring <robh+dt@kernel.org>,
        Ihor Didenko <tailormoon@rambler.ru>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Thomas Graichen <thomas.graichen@gmail.com>,
        Antoni Aloy Torrens <aaloytorrens@gmail.com>,
        Andreas Westman Dorcsak <hedmoo@yahoo.com>,
        devicetree@vger.kernel.org,
        Raffaele Tranquillini <raffaele.tranquillini@gmail.com>,
        Anton Bambura <jenneron@protonmail.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Ion Agorria <ion@agorria.com>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Jasper Korten <jja2000@gmail.com>,
        Svyatoslav Ryhel <clamor95@gmail.com>,
        linux-kernel@vger.kernel.org,
        Maxim Schwalm <maxim.schwalm@gmail.com>
Subject: Re: [PATCH v3 01/14] dt-bindings: ARM: tegra: Document ASUS
 Transformers
Message-ID: <YaQrGZUc3W4RAw80@robh.at.kernel.org>
References: <20211127142327.17692-1-digetx@gmail.com>
 <20211127142327.17692-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211127142327.17692-2-digetx@gmail.com>
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Sat, 27 Nov 2021 17:23:14 +0300, Dmitry Osipenko wrote:
> From: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> Document Tegra20/30/114-based ASUS Transformer Series tablet devices.
> This group includes EeePad TF101, Prime TF201, Pad TF300T, TF300TG
> Infinity TF700T, TF701T.
> 
> Signed-off-by: David Heidelberg <david@ixit.cz>
> Signed-off-by: Anton Bambura <jenneron@protonmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
