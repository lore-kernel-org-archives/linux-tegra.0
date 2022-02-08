Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0CD4C433FE
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Feb 2022 23:47:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238252AbiBHXrH (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Feb 2022 18:47:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238326AbiBHXrF (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Feb 2022 18:47:05 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6F984C06173B
        for <linux-tegra@vger.kernel.org>; Tue,  8 Feb 2022 15:47:04 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id a19so794356vsi.2
        for <linux-tegra@vger.kernel.org>; Tue, 08 Feb 2022 15:47:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sOZ1/HmS7XU5V/LDu5A24lCTTMFiGZWOuTFw4nQO1Pg=;
        b=TudL7nkIKdegfN6eFSMj27XML9pjwgnS/zGcz6vWwSHZAZ2H4Vi1K6Ap/Ptslueqnp
         NslRfwem+KjhgBV7JbfLD051SsWZ3KOI9zbw2ix4wZ6bX+iidlL1w/sZwJV1zuScQPQI
         ao7/1kfK3gFUKqCqUs21Yp0xmEFsOoKh5bgqs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sOZ1/HmS7XU5V/LDu5A24lCTTMFiGZWOuTFw4nQO1Pg=;
        b=ZnQCx18t7HFDpxwLU1dg8QAbfUKYKO1BRNCFE6gpKzjWwIhf2IrM6/zd+Mrs5WIZI9
         sjjLyX1fQ5QnKUH1RsKWCQ6Wnxctddts0MhhRQyHiY7nCRj39SCj2PEMTDtpLad3KTK2
         6WTDnE9e4/ffuTKmsSzia/2mfHfFE4zTersw3BVpEkYpj0DJV/m41DvX2B9K980Mvu23
         IXemxKABuymenpOqGN4tDe/GkuM3TWmm7YzqH7AZRI9I+AsFZ64wCVgeI0Gko2uSIO5h
         kmUu8IWjd71zolTk7LX2G9X2+WfN0YpoCbPv0/bfOa4PbgtjGX5w9I7DVNJ4EX1WOtS/
         t6Aw==
X-Gm-Message-State: AOAM533jMcnUFL+v58cTvp6JUiyci/bE/W2LqBKzrcHJDiakLc1fX80G
        0S8tbXBR71jLRd3U3Ujm6bB9CReHuefdMQ+YEIfhUg==
X-Google-Smtp-Source: ABdhPJxq1zn10SEEq0v4RMUk2mIAVq7gGoJdgGcgvoDDDy0oiG2d2D/qNJOYy9bsGYyrxOUqzUpBNPJv3+gSh2iZKZU=
X-Received: by 2002:a05:6102:913:: with SMTP id x19mr2432786vsh.18.1644364023249;
 Tue, 08 Feb 2022 15:47:03 -0800 (PST)
MIME-Version: 1.0
References: <20211006224659.21434-1-digetx@gmail.com> <20211006224659.21434-4-digetx@gmail.com>
 <YWimShkkxkR+bQLK@robh.at.kernel.org> <CAODwPW-2othAhTC9a_joBdHScA86iqs-FkZJZDrK5LxrJm8F8Q@mail.gmail.com>
 <d69f99ed-75a4-9b8c-addb-3eaa2b2be6a6@canonical.com>
In-Reply-To: <d69f99ed-75a4-9b8c-addb-3eaa2b2be6a6@canonical.com>
From:   Julius Werner <jwerner@chromium.org>
Date:   Tue, 8 Feb 2022 15:46:52 -0800
Message-ID: <CAODwPW-AMqQ+ZbnvUTuxP5Bbxdcy08GSXnhcLC+V6BW=OPYaqg@mail.gmail.com>
Subject: Re: [PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id properties
To:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc:     Julius Werner <jwerner@chromium.org>,
        Rob Herring <robh@kernel.org>,
        Dmitry Osipenko <digetx@gmail.com>,
        linux-tegra@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> Unfortunately I have no clue what patch you talk about ("this patch").
> There is no context here, no link except the older LPDDR3.

Sorry, I tried to reply to
https://lore.kernel.org/all/20211006224659.21434-4-digetx@gmail.com/
([PATCH v5 3/9] dt-bindings: memory: lpddr2: Add revision-id
properties) and was hoping that would automatically provide context.
That patch added two one-cell properties `revision-id1` and
`revision-id2` to "jedec,lpddr2". Earlier in
https://www.spinics.net/lists/devicetree/msg413733.html ([PATCH]
dt-bindings: ddr: Add optional manufacturer and revision ID to
LPDDR3), I had added a single two-cell property `revision-id` for the
same purpose to "jedec,lpddr3".

I think it would be better if this was consistent between the two
types of LPDDR memory. Should I just send a patch that replaces the
two revision IDs in "jedec,lpddr2" with a single one according to the
principle of "jedec,lpddr3"? Or is it too late for that now and the
binding already considered stable and unchangeable?
