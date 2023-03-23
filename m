Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2145C6FD1C
	for <linux-tegra@archiver.kernel.org>; Thu, 23 Mar 2023 08:39:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230253AbjCWIj5 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 23 Mar 2023 04:39:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230409AbjCWIj3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 23 Mar 2023 04:39:29 -0400
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com [IPv6:2607:f8b0:4864:20::b2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2EC718149
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
Received: by mail-yb1-xb2b.google.com with SMTP id x198so14184763ybe.9
        for <linux-tegra@vger.kernel.org>; Thu, 23 Mar 2023 01:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=QE23HGJQHnGAd09QtB+TQS3Q2R0AzQuCJycDS0LJ3CvnhtMzqkExBmjQuj/DUSULwW
         CdTUyRpJfr0BxLeiqJk77HGiEpcXePcfNRVwAuvI4fjDQMcfKVbD5YDefCwoepOjxwZs
         CRKobbEslFR4+47TabRND3zS6BWHhNJQPmXbEQsdpKGm0+ZIf0RjTtSzFo1V0GM4z8iO
         t8YpWg2zcFpkTKc8apwndzQ5TnHNOY/z+enoDLOK1JvEzONxhz0ECaTqBZ98ytvb76mU
         C7s7uOR2SKQANO394Ed6N34I7/1N8dPGan68/QCltgPt0qY65XouFSoJLketbqzkmIx8
         o4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679560683;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq8iULvcx+/Gb+0OFAUtoLewabyi+bElNPlA9W28jjU=;
        b=bmhWmMEf1uurMLmsepvxchzHBWbZlMJCgJXphwl8huZMyBbpHnXFAGXYdCr6FkiXx1
         qITMNmm/C+cYM7vEI8a7EBTHZ8zv3NcoQCMD+1+sa8Ambe39E4ZhyxZUECfGrANu6U+O
         Bb1iFTWaB19HsQ9ED/7FVtV9neher1TWPl7h254RwHeszno73grF5vLl0Ucz0z/t72YS
         2MJsyhF+CJ72PGGe4lPOu9lQl3zdGC14TF3Evu48VymfZafjYJ8hJ5Be7G1T6/chWkbW
         xBSXG+A6xxog4PsvqmtP5YcmP8xbDe0F6yv8SEPU3cV3qfgLtVHTFBKhS7c9t0vzbXmy
         4oiA==
X-Gm-Message-State: AAQBX9emcey7sKQD+yEQC7QSGJHAwFU4xk3ct1wgKOED17wzBLzHxYxv
        olo59F33WAQDuYx3LJXuVrh7/xYjR6Pae9dtqFSqTVaL9VNdlH+S
X-Google-Smtp-Source: AKy350Y1PGIFybckLNdnrmn7B3+z+PO42zpuO3LlrftnXKkUHf5Mxe7g7DsahcR71Hcc5jkg0FrjjJg/mpuCBsLCn1U=
X-Received: by 2002:a05:6902:124a:b0:b74:77fa:581d with SMTP id
 t10-20020a056902124a00b00b7477fa581dmr1459338ybu.4.1679560683403; Thu, 23 Mar
 2023 01:38:03 -0700 (PDT)
MIME-Version: 1.0
References: <20230323012929.10815-1-dipenp@nvidia.com> <20230323012929.10815-10-dipenp@nvidia.com>
In-Reply-To: <20230323012929.10815-10-dipenp@nvidia.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Mar 2023 09:37:52 +0100
Message-ID: <CACRpkda9A-1qKqUPMC=9JKN5uotUmTt2CGQZv5Z91wgrSmwtHw@mail.gmail.com>
Subject: Re: [PATCH V4 09/10] hte: handle nvidia,gpio-controller property
To:     Dipen Patel <dipenp@nvidia.com>
Cc:     thierry.reding@gmail.com, jonathanh@nvidia.com,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
        linux-doc@vger.kernel.org, robh+dt@kernel.org,
        timestamp@lists.linux.dev, krzysztof.kozlowski+dt@linaro.org,
        brgl@bgdev.pl, corbet@lwn.net, gregkh@linuxfoundation.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Thu, Mar 23, 2023 at 2:29=E2=80=AFAM Dipen Patel <dipenp@nvidia.com> wro=
te:

> The dt binding adds nvidia,gpio-controller property from Tegra234 SoC
> onwards to simplify code handling gpio chip search. The gpio chip search
> is needed for the AON GPIO GTE instances to map the hardware timestamp
> GPIO request (coming from the GPIO framework) to the tegra HTE
> providers. The patch also adds new gpio chip match function to match
> from the fwnode instead of the gpio controller label. The addition
> of the property does not break ABI for the existing Tegra194 code.
>
> Signed-off-by: Dipen Patel <dipenp@nvidia.com>

Yups just like this!
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
