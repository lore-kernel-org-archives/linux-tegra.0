Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1EB0DC433F5
	for <linux-tegra@archiver.kernel.org>; Mon, 13 Dec 2021 14:03:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230456AbhLMODw (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 13 Dec 2021 09:03:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229905AbhLMODv (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 13 Dec 2021 09:03:51 -0500
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CFA7C061574
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 06:03:51 -0800 (PST)
Received: by mail-ed1-x533.google.com with SMTP id t5so52125482edd.0
        for <linux-tegra@vger.kernel.org>; Mon, 13 Dec 2021 06:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XHS3evdL43UusUkzdyL+Eag9Ud1wvbYwhkTvvLVLKZQ=;
        b=kQxxS6sCbBzgHe3NuN/zYZkc+LIzALmBm4UOz5HWZBqdQ8ffRQvulekfv02dLh7W82
         5ql6w3M5xPmdFNpWot2pRBZcrogAtDKqBJl57jAjgoiJ6QXuDNdwh85x9vxvcfb8hK2g
         mRn+L11bzQ/I8SwHD67KNVkhRYHnywFl/SiXrkJ+m62nOKxHvwQNKV8MziAxQKhlYcUe
         Dyof44FTxVtig7WM+qCKQxT/WMWyzyPF6D5zXzG6TVtR59Pfu4AUDc6uaDqlob75gaJt
         PMl7HkO6w5hAXgstzobnqbJceqLy4YAwiUPT4agFYuWQJ8uZsSHef8EOXQkN34yvVXLc
         FyTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XHS3evdL43UusUkzdyL+Eag9Ud1wvbYwhkTvvLVLKZQ=;
        b=DYrZuteKnyhuj0C0rH+wgWP4kdQxXL+4LqRXuFcw0MZonqxu4BsXhDPV3otNZgJ5wU
         DD/yUvKLuQ9HkyoM74VZ+GzLlvM7r070V4o7cRCEiMJyndRgnvuga4GqELmRW6596UT9
         W9RlCEN+icTOMBNgu3p1nWQGRcPMqGegnZ/ICCas4z6W8x09Ce5fs8XAKBa8ZfzhO3yr
         fPmETeL1XKkpYqjKTEyZ559sDmz+IBA5dbeEImrMv81X3gaasuTx5Hs70RfHYfGlEgSl
         ExjPby/9/aKlpYkF37uU7CJg/ylgW6hi/zEjOU43S701pXI7VEWHC2qr9xts2A10vetl
         Z9cQ==
X-Gm-Message-State: AOAM530UgRbfLpOliGJqGdVpYJ+qXaIauEUS6CG6hFUgKb0p8k3TGuVV
        H5hdW3o65xFZK+EvBKiMk3WQCdGrseDfZ6/cs6TijA==
X-Google-Smtp-Source: ABdhPJzbOPDGAHP7Pt938eaLWI6FygxZxb7hKLKl6lUFd7dKTP4HNFDubvq09o/yZ7JbnkxRHM0vm5RQJ004FGwNY8M=
X-Received: by 2002:a05:6402:51c6:: with SMTP id r6mr64359808edd.365.1639404229973;
 Mon, 13 Dec 2021 06:03:49 -0800 (PST)
MIME-Version: 1.0
References: <20211210160206.872998-1-thierry.reding@gmail.com>
In-Reply-To: <20211210160206.872998-1-thierry.reding@gmail.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Mon, 13 Dec 2021 15:03:39 +0100
Message-ID: <CAMRc=MdeX7P5N-wnHAuAQWWUGL3Qnh6sEpd4zCJuEC17208Hrw@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] dt-bindings: gpio: tegra: Convert to json-schema
To:     Thierry Reding <thierry.reding@gmail.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jon Hunter <jonathanh@nvidia.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Fri, Dec 10, 2021 at 5:02 PM Thierry Reding <thierry.reding@gmail.com> wrote:
>
> From: Thierry Reding <treding@nvidia.com>
>
> Convert the NVIDIA Tegra GPIO controller device tree bindings from
> free-form text format to json-schema.
>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---

Queued patches 1-4 for v5.17.

Bart
