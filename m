Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 522C3E810AD
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Sep 2023 08:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229940AbjI0Izk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Sep 2023 04:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230027AbjI0Izh (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Sep 2023 04:55:37 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3853B3
        for <linux-tegra@vger.kernel.org>; Wed, 27 Sep 2023 01:55:35 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-59b5484fbe6so132067647b3.1
        for <linux-tegra@vger.kernel.org>; Wed, 27 Sep 2023 01:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695804935; x=1696409735; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+rEuhWfGGpeiMbDXbtGqSA+/xxJxI7p+DAMTljVHvCg=;
        b=qpSPb/zQW+MEHzRhWGV+uKe8l6FQb6fiH/rTEduad9K3peZmWYx691tJq91grZxcW4
         xoWd4kwv/nAcwfll3FFHom3erynDdnNLXQZXXqyea0nnGJkQnD6SMay2ynqu1e7E8REZ
         H4xUy15Qd8NtMYqhaRrWdaatd33E4pLF99yPIxu6+eqb+TNCZsNUlH2OcIHJGQlPMa0z
         G6jj3J7zC0/DUs0CvoaBL0BxnmUEyw5AjUg/PnKBOhOxNRBnA6pwY4Yi1C0Q6klamoap
         OfXJ+tpWqS4BWAU+ZQRTrjESbYUXOwU80Ixc1L1umg2RKKZ9xHYUF0ge91zNgaPxsTic
         TBuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695804935; x=1696409735;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+rEuhWfGGpeiMbDXbtGqSA+/xxJxI7p+DAMTljVHvCg=;
        b=nK5NQB8L6qjEHYMhn7H7Ss/3II4VHk+hwbhrULbELL2yvIPIEbApe3XPRKo3+qUD1W
         SlV2Fd/Be9z8wI7Gf2+p4z4/57UgktgmCYusQPHcsmRaPYY5Oh+e6qFwcg3SQCgyOoJv
         NraxG/2nHG6u19L5VJUNeVktwb1nM/ncY0XHUm3BW445tCsNOXi+8YZZ4X4+eokDxboG
         irZuXrhcU8SSLtx6c+kZAMFo2nXWyCW1Bpa6kWbM0C/8+nDGNVsu1G/pm+0uVIqg2XDD
         RA5IQTHl5u/g7HVo6r/QijbARdmNRlXF9jMiQxwki1QGDma5Q/oM2hLg4AqOfbtLr61T
         Wefg==
X-Gm-Message-State: AOJu0YxMZQ79yHGSVcPOYarN/k11kIFgVYBy8KOSkM3GcySkhuRU6UAL
        pqkEwUpF9ystZcgnAio8/+wiGjrEHebj0JlGUqmnpg==
X-Google-Smtp-Source: AGHT+IEGDZNFq8Uqnqfe0D3ubILPKiVBAPL+coBrxNeyPsMnzM+oXkwB/+eN3MAGbFNSxFf5TJqiSviAyAxXhe31JYc=
X-Received: by 2002:a0d:ea84:0:b0:59f:687c:fb36 with SMTP id
 t126-20020a0dea84000000b0059f687cfb36mr1656040ywe.45.1695804935133; Wed, 27
 Sep 2023 01:55:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230926103938.334055-1-luca.ceresoli@bootlin.com>
In-Reply-To: <20230926103938.334055-1-luca.ceresoli@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 27 Sep 2023 10:55:24 +0200
Message-ID: <CACRpkdacS=tfgd716OcQEaouGSuoCRdRW9Eo9S+KmM8R46J5EA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: tegra: add OF node when logging OF parsing errors
To:     Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc:     linux-tegra@vger.kernel.org,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Prathamesh Shete <pshete@nvidia.com>,
        Thierry Reding <treding@nvidia.com>,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org

On Tue, Sep 26, 2023 at 12:39=E2=80=AFPM Luca Ceresoli
<luca.ceresoli@bootlin.com> wrote:

> These errors are not quite clear without also logging they device tree no=
de
> being parsed, especially when the pinmux node has lots of subnodes. Addin=
g
> the node name helps a lot in finding the node that triggers the error.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Patch applied!

Yours,
Linus Walleij
