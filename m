Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2538C433F5
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 11:25:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A1727611C4
	for <linux-tegra@archiver.kernel.org>; Tue,  9 Nov 2021 11:25:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343528AbhKIL2X (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 9 Nov 2021 06:28:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43384 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343512AbhKIL2V (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 9 Nov 2021 06:28:21 -0500
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F340C061766
        for <linux-tegra@vger.kernel.org>; Tue,  9 Nov 2021 03:25:35 -0800 (PST)
Received: by mail-ot1-x335.google.com with SMTP id h16-20020a9d7990000000b0055c7ae44dd2so14332825otm.10
        for <linux-tegra@vger.kernel.org>; Tue, 09 Nov 2021 03:25:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CDizYRLdhl/XpmR617V9H1nya21GLh5Jm8U5bQ4LhoU=;
        b=pcchXYWGxC8TUsHCp5znzNf5KqyQkyCyzfUCSvDkKHtx5mWHUOO8WNnGzpEBxmV+6x
         aS53nZCnimN8PLnkVqe+PR9PUrCbU4qVIArU7eio+orLNFpyUvA57zYi6QtFSL9yQwyK
         toptpZysma61dUrGogLMOO28VVX3X8hltPZU/6jiQzXHizfhRgzTVDI6omem/foZmPRr
         By/xAszBff15g/bTqwowz6AwZtZlD+LEJlB7UhaqxNA+cNQGVNdGq1MA4grHWL5Se8Hu
         nXf9RHpSS2PYZ1saAT1TJe5mHgonWHRqsxCU6t5J5uuEtdrLOdR8Z/RuPs7d9CmpsVrs
         Ij/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CDizYRLdhl/XpmR617V9H1nya21GLh5Jm8U5bQ4LhoU=;
        b=CaENA3R5uq2Tp8xt6g2RRUaQmVLQfcLiBaq9m3Cumerx8RYezE/SIBjo6o9LBBzBpB
         4xzejkrTl20yOqqbtGYlyx1V1AICUErxhLRop+Z/B5FvwAcCKtJPkjhcekkM7kGBQnAq
         o6t/NhlzvwIXRFMCyYZdV+8QaIFLidBHIDTxT0YETDsIHPWKZhrKs3LAQSQiHbzehvnj
         F2SUhIOyKFjUVlbfl9ROgK9uECacHv1dh16wfMbTN/23C3mJUowiF116XrjRhHEZT2el
         9mnMGIteksSzpC/R7mXd9l85ICtb+OuwXIEMhq4GfAhmW2DcLpFLCf+eBQ+aESgb+UOH
         n2Zw==
X-Gm-Message-State: AOAM530+Zjudha/KjFf+cd/yMRzFnXL0H/CgUCu+4g2s7csy51NsFH9V
        6GpYx4k5pvYCvSMdSBPnem5THpYwcrNHeseK3j7QmQ==
X-Google-Smtp-Source: ABdhPJyRH7wRwc40p2pr7KQ1rJshmkwLCVnX0dMDih0C93l57ktFNpTLf45fmsBytgVH+zEml5yVgY1zsZUMIy6VYk4=
X-Received: by 2002:a9d:6348:: with SMTP id y8mr5349659otk.179.1636457135054;
 Tue, 09 Nov 2021 03:25:35 -0800 (PST)
MIME-Version: 1.0
References: <20211104133645.1186968-1-arnd@kernel.org>
In-Reply-To: <20211104133645.1186968-1-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 12:25:23 +0100
Message-ID: <CACRpkdadqcKr-Biq4oS-zeO0RLQHOXk+V3ORLeTbbRk2+XqE4Q@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra194: remove duplicate initializer again
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Lee Jones <lee.jones@linaro.org>,
        Arnd Bergmann <arnd@arndb.de>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Nov 4, 2021 at 2:36 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> An earlier bugfix removed a duplicate field initializer in
> a macro, but it seems that this came back with the following
> update:

Thanks Arnd, patch applied for fixes.

Yours,
Linus Walleij
