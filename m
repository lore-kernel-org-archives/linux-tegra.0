Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3EBCEC4332F
	for <linux-tegra@archiver.kernel.org>; Tue,  8 Nov 2022 10:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233897AbiKHKfg (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 8 Nov 2022 05:35:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233866AbiKHKfg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 8 Nov 2022 05:35:36 -0500
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1F1341983
        for <linux-tegra@vger.kernel.org>; Tue,  8 Nov 2022 02:35:34 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id f5so37428938ejc.5
        for <linux-tegra@vger.kernel.org>; Tue, 08 Nov 2022 02:35:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yn7cGSh6ga+XvXC/WD382w/qtJjrRb9SC8qneI59x2o=;
        b=FsO3/LugMOTmbSku629MUN87TIXPdjbekhV0S/V+dwk2WUwZvdyWby++l3JW6P5p2+
         kBSL0ZPP2ttcPZsWoeGv3QKoYg8IUwN3NRCqzKNUgaMHet6UUT9upcylwAH28aZNWnTA
         0v9PWaxGz8F3O1Rqor7qQUOYIDZs7cUAWMkz3K9zq/D2TXImxsME0Bq7/++0vJ6EheLW
         KKzhyTa/83KmhKuBWFdYgwSqK6NDGcu9KApjX4T3No0kT8/10C+mxoylXIXefzg9R23t
         adxUteO4Ez2w/5n87FnSLfmi+rHzzhOhtfjqBOvyXP/Tcun+Zb6Gwo6UiI1NSUOj2EFN
         kBhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yn7cGSh6ga+XvXC/WD382w/qtJjrRb9SC8qneI59x2o=;
        b=YQrwpa+zq0KQQCHczzClHyi7eU027K1oHDlj3xHPDDRWLno3uXQnMXpMpzv/KvaQlG
         /O0O7WdyG0GilzeEVKu6YvqgbCjeVq0isYKdWomEFywnw/rtFmeMouhLdm2i6ipuDfiT
         XpbdwzEveQodoLYbBahr4sYUTVzith97EPDpjtnHKma3kXSaoHXAWoGwdyKO46SijLqs
         /Q/5y5hy9APs7Ez2BL5/gZutLeutd+A5WQMmbIFd8LXFQOsu2T2XCyxtEDW2PLKiIX7H
         q4+vP6g1lfpqYg33H4OqSBHGi8mpzk4nY0at/sT6lmB54GGwGbMaqvDbBfudErqVeVpq
         VH6w==
X-Gm-Message-State: ANoB5pmDu4zoMHNyJnfYMFPcJOLv8GX2ddfTw2z6NzvLlinCHTQcq/gb
        /cSQ0HO1B2Btl7ANHJDSxFNs/7uQrZV+tRyhdRoiYVTz2yc=
X-Google-Smtp-Source: AA0mqf7njpSPHTl5w0lEA2wQzjzeI8ZdHAIWGs0xbwdjixY+aGZD4R27BBbVJqGheaqnU2vWfLvZuUwIf7VewEqhzuo=
X-Received: by 2002:a17:906:6acc:b0:7ae:658c:ee45 with SMTP id
 q12-20020a1709066acc00b007ae658cee45mr10506662ejs.190.1667903733422; Tue, 08
 Nov 2022 02:35:33 -0800 (PST)
MIME-Version: 1.0
References: <Y1aa3/oJA2ElSGp0@orome> <20221026070614.24446-1-pshete@nvidia.com>
In-Reply-To: <20221026070614.24446-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 8 Nov 2022 11:34:58 +0100
Message-ID: <CACRpkdaRuOUObmwWYDnmwbdFaKVQfzJ0xAuaK5VvrSHpFRj7bw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: Check PMC driver status before any request
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     thierry.reding@gmail.com, bgolaszewski@baylibre.com,
        jonathanh@nvidia.com, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        smangipudi@nvidia.com, kyarlagadda@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 26, 2022 at 9:06 AM Prathamesh Shete <pshete@nvidia.com> wrote:

> This patch fixes the issue where even if PMC driver status is
> disabled still we are trying to look up for the IRQ domain
> that PMC driver would've registered if it had been enabled.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
