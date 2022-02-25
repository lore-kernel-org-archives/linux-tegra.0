Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47D5C433F5
	for <linux-tegra@archiver.kernel.org>; Fri, 25 Feb 2022 01:41:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236498AbiBYBmC (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 24 Feb 2022 20:42:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235462AbiBYBmA (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 24 Feb 2022 20:42:00 -0500
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91A35294543
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 17:41:29 -0800 (PST)
Received: by mail-wr1-x42b.google.com with SMTP id j22so2181722wrb.13
        for <linux-tegra@vger.kernel.org>; Thu, 24 Feb 2022 17:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+0aly+EpU5c29EdYXAbZBm+EYfsQisP7ntPk9ELmOPI=;
        b=U6Esquhs6xzZo1G1iqSp/12AoCcrBBUsjvqlKoAMjSrQjE16KyqDFJm8nSDQfQfSyQ
         dOnJGGgKI5DFhN2CD9VwP8rfaHeHxw+CY1rmT01bWlpJ17IOqYxg8MjWUnWhFjrpYGlJ
         mh4s39sJaBlyrXS6TTtFACSMMMzJEUZo+2ybw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+0aly+EpU5c29EdYXAbZBm+EYfsQisP7ntPk9ELmOPI=;
        b=Izhli/uwr4mgGidKcM14wya0T038xfr4GrIaGTbTlL2PM4Azm2uK3jJXxVZ+aR32Pt
         HHPvDI72tKzdfKcMyIHL5ZyNFD/6mE/gPEENdbvb6OLVgOyCBax9VFCCer45NowndIhv
         OoZGKtCfxL0xdJDmnANBq4nqm55lG/fh3xeDRo4Tnq+rZdhsBgjonmFrExsGE+x58npw
         oebtpTV2rtXqixefriZwf9YSB+5qyZDU0LQWfSb8CVtmvqgENA+/RU+eA/U/5P09Mzbp
         aH6poEgPqchXLYyUfhfOQ5RHjXJK496Tg4KVVNZRiEc6GyvipqT0+SJBaUlqjbPWWdbS
         HiaA==
X-Gm-Message-State: AOAM531uXcc/r2uvfN53bDmSEGCoaBkB+CrGeUuZaXAlO7x+IQzhfyPx
        +D0c8nT2z149JTf+wxUS1z7foe7duhYa+m+LQPX6wg==
X-Google-Smtp-Source: ABdhPJyE0OKTeTamLyNYWZfcT4RIf6leHH6LoaGVF5o836TauTjq3YSF9ORLnYIvhnLE0h9TBQ+4hQioY0gJQH0PLrc=
X-Received: by 2002:adf:fcd0:0:b0:1ef:31fe:d08e with SMTP id
 f16-20020adffcd0000000b001ef31fed08emr2395465wrs.667.1645753288042; Thu, 24
 Feb 2022 17:41:28 -0800 (PST)
MIME-Version: 1.0
References: <20220224003421.3440124-1-jwerner@chromium.org>
 <20220224003421.3440124-4-jwerner@chromium.org> <ec0c90b9-58a9-669f-fe4a-73e60df335d5@canonical.com>
 <Yhd8OoJQer86kTZ8@orome>
In-Reply-To: <Yhd8OoJQer86kTZ8@orome>
From:   Julius Werner <jwerner@chromium.org>
Date:   Thu, 24 Feb 2022 17:41:16 -0800
Message-ID: <CAODwPW9_cbsvU3Jf-9G6TSRUwHwu+HKCQug=eJ51tsRFo6HcPg@mail.gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: Update jedec,lpddr2 revision-id binding
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Julius Werner <jwerner@chromium.org>,
        Dmitry Osipenko <digetx@gmail.com>, devicetree@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-tegra <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

> > I bounced the mail to Jonathan, Thierry and linux-tegra (+Cc), so
> > hopefully they will get it. If not, series might need resend with proper
> > addresses.
>
> Thanks for the bounce. Applied.

Sorry, I wasn't sure how this was supposed to work for interdependent
patches, I thought they would all go through the same maintainer tree.
If you do split them up please be aware of the dependency, i.e. this
patch should not be applied anywhere without patch 1 and 2 of this
series landing first.
