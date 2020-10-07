Return-Path: <SRS0=Z/5G=DO=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E69D9C41604
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:18:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 89EFB21582
	for <linux-tegra@archiver.kernel.org>; Wed,  7 Oct 2020 17:18:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dVrg5yXs"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728179AbgJGRSu (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 7 Oct 2020 13:18:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728171AbgJGRSu (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Wed, 7 Oct 2020 13:18:50 -0400
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA3D5C061755;
        Wed,  7 Oct 2020 10:18:49 -0700 (PDT)
Received: by mail-ed1-x542.google.com with SMTP id v19so2983237edx.9;
        Wed, 07 Oct 2020 10:18:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FbvgWYf8WmFqAJOEe1UYaKohDkiYp3VreWyGDtXaqz8=;
        b=dVrg5yXsPbI5qvL4/8aGH30/TpyXARXamdOnbGSmS4gTpTQp9eH1GXn8IgbLEolJ8G
         hiPkIqvvDj/4CTAnjCcHO2SIozfvoIWT1av/ixwfQcBvgX+hxUquKwrnasaWknawYceu
         nRIcU7O+fGSVRQp3Ocs0MYUJAlgOx7xC/dVH9Z7YZoVhwlPI8cyjSq/9GCYkR0LKEydy
         v4YidfNyN/xlHadchDVutaYDFw1zaym5gVxxcVOfiyXZMZy7zYVmsNK2SuDroi+h0Jao
         7rVmi77ctUuEP8FctJq/GPBn0lpXoFscuQHs9OMgtEFVH8SG6K3B5GPkFCG8Jauoq2Jk
         iCEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FbvgWYf8WmFqAJOEe1UYaKohDkiYp3VreWyGDtXaqz8=;
        b=cT0sKvUscAnwo2W/XSSgS8eOIZ7qbE6z6dl64gk2Fl+QbXBmsSgfLw7DOwlyLG7o4y
         e9tLqb9fCgkYH3dNOjdrDw41uOMDmnC9JJXQWyuyhv2pllU0Bh7T/sm1nIp7QjJkRZtA
         e4+O8PxvEFWrpOda8deSTtbLeba8LLpshIrxqjNw5uPJ+LpSuhdlv5CeXh+JewPTmIRR
         X1TD8ocDHzEkcK7omth/Xl/M2AHxHYcd2yskZB4wWHlESn6Hxgul5afDt3blUMsYXAfo
         URfvnizFrWrknASI7ISTHHPfX5O8uUpdbJi2qDzSY2MftLpfbidhz+ZwjWVFoiGn3S4O
         rCgA==
X-Gm-Message-State: AOAM533ie5vNREXlQbmqaAhbujJTYvSG2d9m3hR7CfdIPf6wkCAL5cZl
        Lv4+oRxhl5GIJ9cb0NxACDhcQV7Yg+yvz30v8MA=
X-Google-Smtp-Source: ABdhPJxR2PNvYgiGBJpfUyMO8e+O6T4BT5QzDizpTZdiP0rpHdLPJLC65LYH5YSEruuW6EvK5oJ7yyPXu2SGR31hvQ0=
X-Received: by 2002:a50:c199:: with SMTP id m25mr4495447edf.207.1602091128283;
 Wed, 07 Oct 2020 10:18:48 -0700 (PDT)
MIME-Version: 1.0
References: <20201004133114.845230-1-pgwipeout@gmail.com> <cdd0f520ae4990de90f461e21cb4f298@agner.ch>
 <4d3eb998-045b-f288-7a9c-aaa620c38bff@settrans.net> <c8140ea3-8731-8084-47dd-8819b4b4df6a@gmail.com>
 <f12c1ad2-d180-8981-c3bf-db8ab6afbbaa@wwwdotorg.org>
In-Reply-To: <f12c1ad2-d180-8981-c3bf-db8ab6afbbaa@wwwdotorg.org>
From:   Peter Geis <pgwipeout@gmail.com>
Date:   Wed, 7 Oct 2020 13:18:36 -0400
Message-ID: <CAMdYzYrNg39QmR3QDG4T5DTOht=8p4LvFon14M1J7HkEZo4KRQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/3] Support NVIDIA Tegra-based Ouya game console
To:     Stephen Warren <swarren@wwwdotorg.org>
Cc:     Dmitry Osipenko <digetx@gmail.com>, Bob Ham <rah@settrans.net>,
        Stefan Agner <stefan@agner.ch>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Matt Merhar <mattmerhar@protonmail.com>,
        Leonardo Bras <leobras.c@gmail.com>,
        Michael Brougham <jusplainmike@gmail.com>,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Lukas Rusak <lorusak@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Wed, Oct 7, 2020 at 12:08 PM Stephen Warren <swarren@wwwdotorg.org> wrote:
>
>
> This definitely isn't the correct attitude to copyright.
>
> The facts[1] that Ouya published the code and that it used GPL-only
> symbols certainly does imply that they *should* have published under GPL
> or a compatible license, but doesn't mean that they definitely did. The
> only way to know that for sure is for there to be evidence in the file
> content or git history, such as license headers or Signed-off-by lines.
>
> When someone writes Signed-off-by in their code submission, which is
> required to contribute to upstream Linux, they are stating/warranting
> certain things about the code they're submitting. One aspect is that
> they definitely have the rights to submit the code under the given
> license. Without evidence to this effect, or having written the code
> themselves, nobody can state/warrant this. Take a look at the following
> link to see what you're stating/warranting when writing Signed-off-by in
> a code submission:
>
> https://developercertificate.org/
>
> [1] I haven't checked the facts.

Unfortunately the only source release I've been able to find is the
last release.
Ouya purposely purged the git history for the current source release,
it's also completely lacking in signoffs and commit history.
[1] is the commit that added this driver to their source.

Their original source release had the git history intact, but I never
got a copy of it before Ouya purged it from their repos.

[1] https://github.com/ouya/ouya_1_1-kernel/commit/407e72990e39d5c29d015e21110b9497aea2dfe3
