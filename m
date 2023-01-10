Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67071C54EBE
	for <linux-tegra@archiver.kernel.org>; Tue, 10 Jan 2023 08:24:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237902AbjAJIYo (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 10 Jan 2023 03:24:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237824AbjAJIYe (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Tue, 10 Jan 2023 03:24:34 -0500
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com [IPv6:2607:f8b0:4864:20::112f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D7C5496C3
        for <linux-tegra@vger.kernel.org>; Tue, 10 Jan 2023 00:24:33 -0800 (PST)
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-4d19b2686a9so17700057b3.6
        for <linux-tegra@vger.kernel.org>; Tue, 10 Jan 2023 00:24:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+VsxYooBopMhkLQpN5cBLVBKPwsYnLnhSjEilG/xMas=;
        b=H7pDvZDQ1MfoFeaazIGBoScW34THvY8lDhkMwO3zzNGgmqIyFn+oi35rOuV5XxI5Wz
         s8l73v1+CAEh++7BZLbRN/TiGY9JuMbdDXwlAyfr2fVbgkcrfJgZrrcV4SDixVk+sab9
         3NK2FFrvo8JtAtuiE5YDYVAUollGzaWJjgrJWsS+P5TE7umW4Jmhb/S4zh9FgxtjsJhu
         mbMmlsMDcf37/YX6QcXT9fJ0pympHyPEj1j3kC25/RZkiNxaTdGu9HO53T2hPalazTX8
         DSEk7PYZXiDu/ocWiyd/k0/bzquhaWFkznquFIo/cecBnnKLNSwF4Suc01J93bBTKc4n
         l/6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+VsxYooBopMhkLQpN5cBLVBKPwsYnLnhSjEilG/xMas=;
        b=k7KxIA4BEBE1CQuq5gceHkTnewfzOKgwNZNiGnjzF+SN2DKrUL+9moyFzLsb0hS5l5
         jshFxp+eoibMnuT8sGkrO/XPK3yJur25uB0ez9L+NwQ8Tg8Eknfvh2bjG6aBZAKlzWsg
         T3ECjYT6Gz+MCBTLk3F5FkYd0FuKr4wrtSW7obwhG2tioOG2MSQ994qpcRQl4PPrRZPM
         k0pOe5ClEEeyDDrigbOiSi7R629T8O0Pf5elU22QfFvXX2dpma6iQkPNkx5lD56FqtXs
         6Ht4P03FomjMzeN+/VXHzFiZPdzyynSIAyjiocIioJAePQlmETZQNnjHAj6evSrQWNgE
         KYQg==
X-Gm-Message-State: AFqh2krPe++vyFsZGc8rgrsJMLbyJh9pukepIVewGashqbqZcEboLkZ9
        VeOW5FV8XCLN+q+hdYee+iBKk6beolnHh6yThetMmQ==
X-Google-Smtp-Source: AMrXdXusbX6v2C5N8FwrOyY3GS/HBT2amDYOSb1ETSnQ6xhO925pkhWgsMl/OjRO053TEXNMRxeCO7ZwYhiRqSpRHUs=
X-Received: by 2002:a81:7784:0:b0:461:49a3:db6a with SMTP id
 s126-20020a817784000000b0046149a3db6amr1721899ywc.185.1673339072305; Tue, 10
 Jan 2023 00:24:32 -0800 (PST)
MIME-Version: 1.0
References: <Yhe0pCpfeCpyfPWg@orome> <20220816102725.14708-1-pshete@nvidia.com>
 <CACRpkdbMnRNTLcCtqNjKpxWxMbAXLssnuBEuNqAfgDfj3XVfXQ@mail.gmail.com> <14dbbfdf-c096-439e-41c9-71e083138560@nvidia.com>
In-Reply-To: <14dbbfdf-c096-439e-41c9-71e083138560@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 10 Jan 2023 09:24:20 +0100
Message-ID: <CACRpkdaBY31f6R3TTD-5iRDdKV46tY5GK-Xvd=exwZ4HeCTYAw@mail.gmail.com>
Subject: Re: [PATCH v2] gpio: tegra186: add Tegra234 PMC compatible in GPIO driver
To:     Jon Hunter <jonathanh@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Prathamesh Shete <pshete@nvidia.com>, linux-gpio@vger.kernel.org,
        linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org,
        thierry.reding@gmail.com, smangipudi@nvidia.com,
        Manish Bhardwaj <mbhardwaj@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Mon, Jan 9, 2023 at 9:37 PM Jon Hunter <jonathanh@nvidia.com> wrote:
> On 08/09/2022 14:21, Linus Walleij wrote:
> > On Tue, Aug 16, 2022 at 12:27 PM Prathamesh Shete <pshete@nvidia.com> wrote:
> >
> >> Using this patch we are adding PMC compatible string for
> >> Tegra234 in GPIO driver so the IRQ hierarchy can be set.
> >>
> >> Signed-off-by: Manish Bhardwaj <mbhardwaj@nvidia.com>
> >> Signed-off-by: Prathamesh Shete <pshete@nvidia.com>
> >
> > Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> >
> > It also has Thierry's ACK from v1.
> >
> > Yours,
> > Linus Walleij
>
>
> I don't see this one in -next. Are you able to pick this up?
>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>

Bartosz is queueing GPIO patches right now, but the mail has the
wrong address for him.

I put the new mail address in To, so he can pick it up.

Yours,
Linus Walleij
