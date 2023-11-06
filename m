Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09730C0018A
	for <linux-tegra@archiver.kernel.org>; Mon,  6 Nov 2023 13:25:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232549AbjKFNZb (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 6 Nov 2023 08:25:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55100 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232526AbjKFNZ3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 6 Nov 2023 08:25:29 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1BD25D8
        for <linux-tegra@vger.kernel.org>; Mon,  6 Nov 2023 05:25:26 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-da0344eb3fdso4548796276.3
        for <linux-tegra@vger.kernel.org>; Mon, 06 Nov 2023 05:25:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699277125; x=1699881925; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Gsb4v8pLfkWEsP47Lc0OVMB/I72SK10CYsME1p3Fl0=;
        b=n5cf7UuQR+711zDnFBXRqUaF7O7GrnnxSDqm9IM1S3HfZqvOphK4Qcer0cgF6/Pa1/
         e8P8t92y9yW3Aeg/q+BXdz7Ycc5oJvcGkX6oQmIjA7AID0yUsGpVnMY8ET3bB40cyfb0
         VLeuY7nsFCMIgVs5MganNEHgmw/hwNrvs8/zM5y2AEgxzGKbIv9Tl7wnND7bSQGLOWBy
         yKgKBUfzjj8UXMA81Z8M33Scr4gadE2XWEbuZDHlF2i7UYULccH2VriTN0WdT1LCZO3p
         BQj+7wJp+PPeBaIyQ693AJTmyV8a3iLRwbRhga+fAFMlGMrFQ2I+jXdlB+VB9jb758NR
         cugQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699277125; x=1699881925;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Gsb4v8pLfkWEsP47Lc0OVMB/I72SK10CYsME1p3Fl0=;
        b=fV0rCslgJrDnsxckHgMchiAfvwlqCcJ1WpFKC3mG8mN2XIO5lWHihzYPh9+8d3raRb
         ud5G8RL9jcVkGuXm01RVauobenNmIHHFdb38AAizaTsZK2G1pjUZL2fzQTCmqhJwpmDT
         9d4R2plBlBlz4mXSznJT3FYDmI+4sdYCUEepMg4HQwSbdcsGINAwyrMupsLX1C/t8rrt
         z1gjxxJ6OD+fZQPn0m84I6dwjF3VuGWumDSiTvqE9WWkFVoiKObb4dw869B36O/1ZB8f
         TOt04SCx6O0BtiJxsETBQU4+tYejNWPLULgXCSe6krE8tL1queaUBMOQUuoT5wMcjuii
         6i9w==
X-Gm-Message-State: AOJu0YwVAxj5E93bARDdgE/8p1pA8BokqlYRPhb2nkpN35nBEcGya/b2
        oE6AG0aYp2fd7+MbltrODLDaWCk/IuVrLfv8U6FBJXqd0OKsHw6E
X-Google-Smtp-Source: AGHT+IGiRAVAhYa99RVMAfuw9X1QR/WgPzWj4a/vasDijfQYx1o4We9P+qgKiEeTzF8HyZU0uLRDXYq2I5VRDRe+ko4=
X-Received: by 2002:a25:ada1:0:b0:da0:3792:55a0 with SMTP id
 z33-20020a25ada1000000b00da0379255a0mr25046888ybi.18.1699277125179; Mon, 06
 Nov 2023 05:25:25 -0800 (PST)
MIME-Version: 1.0
References: <20230929122101.466266-1-thierry.reding@gmail.com>
In-Reply-To: <20230929122101.466266-1-thierry.reding@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 6 Nov 2023 14:25:14 +0100
Message-ID: <CACRpkdbzvk7LOa8BMJ8wzgg_fq7T86XKzFkuqf4vXz=a8g4sgQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: Display pin function in pinconf-groups
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Luca Ceresoli <luca.ceresoli@bootlin.com>,
        linux-gpio@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Sep 29, 2023 at 2:21=E2=80=AFPM Thierry Reding <thierry.reding@gmai=
l.com> wrote:

> From: Thierry Reding <treding@nvidia.com>
>
> The function that a pin is muxed to can be read from the top-level
> pinctrl-maps debugfs file. However, this only reflects the values that
> were specified in device tree, so they will only show deviations from
> the hardware default setting. Display the current pinmux setting in the
> per-controller pinconf-groups debugfs file along with the rest of the
> per-pin configuration settings.
>
> Signed-off-by: Thierry Reding <treding@nvidia.com>

Patch queued for v6.8, will appear in next when the v6.7-rc1 is released.

Yours,
Linus Walleij
