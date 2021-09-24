Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24BB7C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 07:40:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0C28961241
	for <linux-tegra@archiver.kernel.org>; Fri, 24 Sep 2021 07:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244368AbhIXHmR (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 24 Sep 2021 03:42:17 -0400
Received: from mail.kernel.org ([198.145.29.99]:50946 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S244166AbhIXHmR (ORCPT <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 24 Sep 2021 03:42:17 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id B026E61241;
        Fri, 24 Sep 2021 07:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1632469244;
        bh=KGRj7zaejQRrquDHEGdmDBrND00o4l+yU9h0flV46Z4=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=dgu/0u00F3ZN/pGr1CoFex5HXIH7CJSuYbqxOiBI3lA5kJxwmhWb9zk4H8oyEcYV5
         tfCn4wfZCl2pL53xc+7W+4Qv/1I9Z/tGDBIfw2PJ3RDMHLhWhuthpvw887k/854D2M
         Tq24/Dvw0RbH4tjnKy+bAOM/y24qiNCepcrwNtOXrpGzteBFT/KkazNbgpPWQY7wOB
         63qMvkaUUT5TVmFUqt35Cv8irliOSigoIIgWwKa1EyCditTS8uPN1YjHxR+1KUOYOP
         cWOG3WaznesWD6ajPPK9RQmUMISCC4hnICGafGRk0KVZwjmR1bWjvgrcnrA1ykHE8M
         yERY4Sk7uacIQ==
Received: by mail-pf1-f173.google.com with SMTP id w14so8194999pfu.2;
        Fri, 24 Sep 2021 00:40:44 -0700 (PDT)
X-Gm-Message-State: AOAM531Nq1QEO6UPdn5W++kOVqd6Dp9cQ4hcFIPqR/Si+PLrd2d3y/1Z
        sxpfiC9DmecWvHZ+lxub5MUuYfrOCRm9PYEyWWU=
X-Google-Smtp-Source: ABdhPJwVgzUBS1jHmBlN/QYv+cZQGCKyob4lgApPFYtL28AzyMCWAHFnBA9HQ+3su5wUoPJk+PurbKDWJIV+pEY/PuQ=
X-Received: by 2002:a62:ce0d:0:b0:438:71f1:4442 with SMTP id
 y13-20020a62ce0d000000b0043871f14442mr8511406pfg.21.1632469244329; Fri, 24
 Sep 2021 00:40:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210921174434.4839-1-bbiswas@nvidia.com> <YU0Bbc4lqtENJ5WF@robh.at.kernel.org>
In-Reply-To: <YU0Bbc4lqtENJ5WF@robh.at.kernel.org>
From:   Krzysztof Kozlowski <krzk@kernel.org>
Date:   Fri, 24 Sep 2021 09:40:32 +0200
X-Gmail-Original-Message-ID: <CAJKOXPfVb0WybiF4T4cEh4ukCQWTB2+qwbOBAhCSyp+w1uBdiQ@mail.gmail.com>
Message-ID: <CAJKOXPfVb0WybiF4T4cEh4ukCQWTB2+qwbOBAhCSyp+w1uBdiQ@mail.gmail.com>
Subject: Re: [PATCH V1 0/3] Add tegra header license and dt-bindings Copyright
To:     Rob Herring <robh@kernel.org>
Cc:     Bitan Biswas <bbiswas@nvidia.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        thierry.reding@gmail.com, jonathanh@nvidia.com,
        rostedt@goodmis.org, mingo@redhat.com, jassisinghbrar@gmail.com,
        p.zabel@pengutronix.de, skomatineni@nvidia.com, broonie@kernel.org,
        linus.walleij@linaro.org,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, 24 Sept 2021 at 00:36, Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Sep 21, 2021 at 10:44:31AM -0700, Bitan Biswas wrote:
> > Few Tegra header file are missing license text.
> > Some Tegra dt-bindings header do not have Copyright.
> > Add license and Copyright for such Tegra header files.
>
> Who do you expect to merge this? Tegra maintainers or I can apply
> patches 1 and 3.
>
> Series should be for 1 maintainer clearly, separate series per
> maintainer if there's no dependencies (this case), or clearly state who
> you think should take a series if it has cross tree dependencies.

Please wait with applying these. I had comments for patches 1 and 3,
but the set was sent three times, so maybe you don't see my questions
in this thread.

Best regards,
Krzysztof
