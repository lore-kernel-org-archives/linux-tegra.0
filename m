Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81592C7EE25
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Jun 2023 07:19:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238177AbjFIHTZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Jun 2023 03:19:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238631AbjFIHTP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Jun 2023 03:19:15 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FD2235B1
        for <linux-tegra@vger.kernel.org>; Fri,  9 Jun 2023 00:19:07 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id 3f1490d57ef6-bacfcc7d1b2so1419013276.2
        for <linux-tegra@vger.kernel.org>; Fri, 09 Jun 2023 00:19:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686295147; x=1688887147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOnQny2umDrk1smK2zGM40DSipRaq+yaONPV/kg+jes=;
        b=Q2ZeCh/kiBwRYajWH6H2lX7Tqx8slH9n01ZbvULiY0+FLiPuy0UPSJwhNF85mtdA1x
         ygo3wjOrWzzqc46K+yMjHp2NLV7Bn9ibwQDIzwXq6p36FJ5UUvViiqMKTI3TCbm/WgLm
         BRSGVf5ZVLN3BWI3oANYPl4um6vbJ5GkR4VcH6zXQb9J3QWntxOWZxnzdnmzekg5L1WX
         JAj2VbzGsI9BBF9TuBr5fLckF26aAKBjC8B722yhWwbd4SnK9mvZxMmXYzSxd79v61xU
         9EBXJIALhm26kekKS/SsP2lzptr6n8kXpUxLDrSFlSDZt0K18XMqxwj/pNVuQFXYW8L2
         NhAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686295147; x=1688887147;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOnQny2umDrk1smK2zGM40DSipRaq+yaONPV/kg+jes=;
        b=aSvWRpZfWKuzSgKt7LW3Tt2ierVr05GiwLAoaL12tBN4FEKFkT/O5CCvmn11SZnmgK
         pA+teAYo9dNma6GKFVoxSlVHzOBWio2tM71KCPTYCUCQN0lmWKNg+rhoClFapZiqnec3
         OqEM5k5nhkSFnM+iMnqVtFperIxQqdInUuCHbyTeaG2iw0jdm/wHtjROJzwIFvWPjq9l
         aA2e4YYY9pXRjeY2RzU4O1tbw9hOyUj1nPNCgfxWsIM46DRW6xL6FX7VSZ0KYf5G1rM+
         0BBDDtdmxy5lUddFJQTZA4Nv2NN19ib0tdZnUDfodXMiGz49sQKea3I7fKh4xsUHnbPi
         bAGQ==
X-Gm-Message-State: AC+VfDwfYRJ4MiRAR0n29tjxaMBND4lAvnrOGHhP/di5PRM561Najrsb
        jfsu646LowHrefz2g9V0ZVgb37MZ8rLKhHiGC25WYA==
X-Google-Smtp-Source: ACHHUZ5/A4sqbElurOLrxvngAAGU5+a732xM1IRjBEuxN/qGJstSrqSESlmH+Vfwt26rChyYHG+EOPw3RPZeMqTtKt0=
X-Received: by 2002:a25:2509:0:b0:bb8:9a96:3e05 with SMTP id
 l9-20020a252509000000b00bb89a963e05mr258713ybl.48.1686295146827; Fri, 09 Jun
 2023 00:19:06 -0700 (PDT)
MIME-Version: 1.0
References: <20230606071717.8088-1-pshete@nvidia.com>
In-Reply-To: <20230606071717.8088-1-pshete@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 9 Jun 2023 09:18:55 +0200
Message-ID: <CACRpkda_FjWO6SEW_upvZhYxc1=SzMgrfBXwDmVnYJCG+XJZyA@mail.gmail.com>
Subject: Re: [PATCH] gpio: tegra186: Check PMC driver status before any request
To:     Prathamesh Shete <pshete@nvidia.com>
Cc:     brgl@bgdev.pl, thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, smangipudi@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Jun 6, 2023 at 9:17=E2=80=AFAM Prathamesh Shete <pshete@nvidia.com>=
 wrote:

> This patch fixes the issue where even if PMC driver status is
> disabled still we are trying to look up for the IRQ domain
> that PMC driver would've registered if it had been enabled.
>
> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>

Patch applied!

Yours,
Linus Walleij
