Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C909CDB482
	for <linux-tegra@archiver.kernel.org>; Fri, 13 Oct 2023 09:22:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjJMJWO (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 13 Oct 2023 05:22:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230273AbjJMJWO (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 13 Oct 2023 05:22:14 -0400
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06BD5B7
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 02:22:12 -0700 (PDT)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5a7fb84f6ceso20764257b3.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Oct 2023 02:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697188931; x=1697793731; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F8SGxNakBdg/eVn7PIGX4hM/sVFT3VICvg5gS9TqXYU=;
        b=ePGxTHedJgq+x2NfArPc8AXEgphXX8+AVGvo2ci3Cde4p8Ehe031nOYNB/8MBUBLCY
         1C1KD/HUAQ2ZpGvBHmMZ8+gacEiyjAlk4JwnmQ3sZvxfanvbw2jHRVkrPe+yrpYYd6vu
         RMy/bvSAShf5Ss3Y0UOJygkJhW0awFpETI9/gPbPihmh/dB5TUhC7GUqRdjKhVFHe01Z
         uu6Sp0OxlCTLK2qvhbmkcWkuPddm26/wdJcxq8eG4nUPQ8VRTKZEv4GgIetejoNRK4Es
         /14ZKbBIkLSsZgSh34XzB8MIYTuSg0W9EvwoyKSQUcO+dRIYEx8KUzCx/dGXuomui8wp
         vlYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697188931; x=1697793731;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=F8SGxNakBdg/eVn7PIGX4hM/sVFT3VICvg5gS9TqXYU=;
        b=nIa5Z9tItDKYHW5PMZEbgORvoS2ycSzrnNA3/O2CTr826HP1qvoIet34Q4gnGY0mXe
         J4tyH7DIVB9Ig/oQjM5MGahVfgGFObHZ+GFX8QmFNhMyOmKF8e1EvKi12TXSjJ8baa8/
         N/Lja10HAlLdWxkzLkKQPkGspd3XjvUHhnCevtggOQpfeGDJ3MgPAgap5dJuVyGRW+cG
         jnutkA/JlH5qCsXeQy1faPgwLVUnZLkfeVY8dSh9s3yrVT+aJB8huFTThKOwb7559C9E
         oDBMHnpw7gJoGloPcD0aNRKzOE/gfBr/0ixnOXy0ipcp85byGyg5ybkLgOfQRrGjOxiI
         CI+A==
X-Gm-Message-State: AOJu0YzSjd5O7V3m9Wf2N6g58W5HYyovgi/53NbSxdBuJtlV7PPnbtRe
        sxpRfVUrKUss2SvfeGCJG5YlHvj0SMIYbxalBo0d6Q==
X-Google-Smtp-Source: AGHT+IEjUM6QSsdSZkuqSoUoeb4zdk5rMs26kzkqd85aMBvo/kCgSPeF7NujSuPVw/r4lCqKepQvz1vCuwu8uOhiG1s=
X-Received: by 2002:a81:a247:0:b0:599:b570:2db7 with SMTP id
 z7-20020a81a247000000b00599b5702db7mr26076473ywg.30.1697188931174; Fri, 13
 Oct 2023 02:22:11 -0700 (PDT)
MIME-Version: 1.0
References: <20231010151709.4104747-1-andriy.shevchenko@linux.intel.com> <20231010151709.4104747-2-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20231010151709.4104747-2-andriy.shevchenko@linux.intel.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 13 Oct 2023 11:21:59 +0200
Message-ID: <CACRpkdaPfBBW4a-AQZs21J=CCwMVNSdzBicu5CTS4xzT2=Qmiw@mail.gmail.com>
Subject: Re: [PATCH v1 1/4] gpiolib: provide gpio_device_find_by_fwnode()
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Dipen Patel <dipenp@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-kernel@vger.kernel.org, timestamp@lists.linux.dev,
        linux-tegra@vger.kernel.org, Bartosz Golaszewski <brgl@bgdev.pl>,
        Andy Shevchenko <andy@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Oct 10, 2023 at 5:18=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:


> One of the ways of looking up GPIO devices is using their fwnode.
> Provide a helper for that to avoid every user implementing their
> own matching function.
>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

This makes sense to me! (But I haven't looked at the rest of the
patches in the series. Yet.)
Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
