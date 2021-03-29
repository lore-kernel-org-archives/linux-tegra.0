Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49A36C433DB
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 06:50:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 168AD6196C
	for <linux-tegra@archiver.kernel.org>; Mon, 29 Mar 2021 06:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229441AbhC2Gts (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 29 Mar 2021 02:49:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230328AbhC2Gtg (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 29 Mar 2021 02:49:36 -0400
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com [IPv6:2a00:1450:4864:20::52f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1972C061574;
        Sun, 28 Mar 2021 23:49:35 -0700 (PDT)
Received: by mail-ed1-x52f.google.com with SMTP id dm8so12990336edb.2;
        Sun, 28 Mar 2021 23:49:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=dvJrD38+Gd0ZZfT3SZAwY+e98dco9w+l9AERMmUkun4=;
        b=ew+I8Zx3kLnvSgMLoTHkAJaNu+rvPBxtmPFiLXJz1lS4Tx+N+rBMis1LTjcK9rRx7n
         2/Tav3DObTgXUf7PbtOWdAgB4s/F1Ie76PLgsyQ1HYFIUWAoviKOYes6dmy/GE0agGyh
         +1SicMn1MhsCW4Q/8Nfpj+YyExvb1w8F9jKEQPgdqplos5pV3py7PWTEyJ6l3TogDnhX
         NLp2uq5CavP+ukvEg73Z3axM8efl3Q4z1xbDKp17XSnuOKnrqFLcX+YgYMIiNyoup293
         6NEm7YDoEdCXL4N2fSNioyFawWwE5gXGKqnCm0V/RgX9XHg4wI4tQi6Go4Kos+xcrih1
         k7uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=dvJrD38+Gd0ZZfT3SZAwY+e98dco9w+l9AERMmUkun4=;
        b=f36sIXzfymYXWX1+/GLhzFKsTUlFf1OQHc7PONkCD2MaszATrfCxYwV2JHHCMqh8BA
         XbhRw/N0eQZ3uC9LGMLQjKkjmnLe8NEogj7Cuihm8nZ3WOXaq8f0VKGfeoX3jJfL6gcr
         s3Rc6ExGAeqfSc3aUNgspobXyyo8nZajnZ5QKKR+KCsI7qO08XNuBn22N8ctOKVwguz/
         MF77wY+dVGrSmYKVKETuGESfmXWAjlVJMb/0r4KQw59LzbK9HRlx3cGbkRGEdNTmuTzt
         5LkoIGCsXp/lRsXp+mvRu/JoyhKnvj8jIr6qk99Crm7cT+WQMKveorfpQ59Q7na+iIKR
         DIFA==
X-Gm-Message-State: AOAM530JmNdWarBr3pjrsm6S3C/DOwYwit1SRAS8v6kQsSXP0Ea6rVmA
        lTybXHw1emtVDi7TBp0imDhCjuy/lWM=
X-Google-Smtp-Source: ABdhPJydy6eDabhN/L6gwqCNv1MYhFf0/Yc5thGJOO9FABN3b0uIVZgU/ie3tTad8ORQ3j1ow6MYgg==
X-Received: by 2002:aa7:cb90:: with SMTP id r16mr27693945edt.139.1617000573716;
        Sun, 28 Mar 2021 23:49:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id eo22sm7682061ejc.0.2021.03.28.23.49.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 23:49:32 -0700 (PDT)
Date:   Mon, 29 Mar 2021 08:49:57 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh@kernel.org>
Cc:     Mark Brown <broonie@kernel.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Sameer Pujar <spujar@nvidia.com>, alsa-devel@alsa-project.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] ASoC: dt-bindings: nvidia,tegra210-ahub: Add missing
 child nodes
Message-ID: <YGF4laeEP3v7bP9X@orome.fritz.box>
References: <20210326195003.3756394-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ijQsMv6nekEBJq7o"
Content-Disposition: inline
In-Reply-To: <20210326195003.3756394-1-robh@kernel.org>
User-Agent: Mutt/2.0.6 (98f8cb83) (2021-03-06)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--ijQsMv6nekEBJq7o
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 26, 2021 at 01:50:03PM -0600, Rob Herring wrote:
> The nvidia,tegra210-ahub binding is missing schema for child nodes. This
> results in warnings if 'additionalProperties: false' is set (or when the
> tools implement 'unevaluatedProperties' support). Add the child nodes
> and reference their schema if one exists.
>=20
> Cc: Liam Girdwood <lgirdwood@gmail.com>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Jonathan Hunter <jonathanh@nvidia.com>
> Cc: Sameer Pujar <spujar@nvidia.com>
> Cc: alsa-devel@alsa-project.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
> v2:
>  - Also add 'dspk' child node
>=20
> This patch ideally should be applied before this series[1].
>=20
> [1] https://lore.kernel.org/r/20210323163634.877511-1-robh@kernel.org/
> ---
>  .../bindings/sound/nvidia,tegra210-ahub.yaml     | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

Acked-by: Thierry Reding <treding@nvidia.com>

--ijQsMv6nekEBJq7o
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmBheJMACgkQ3SOs138+
s6GRJA//SwwwKllKwUX2o66Qc7knEWeus1NCiU3TvglA4jxSC+pf74q4wyOIWu3y
T/LTXQBUaDsagPelNfETPnOJbdMbUjpNwHFSy3tsMbmP9LDC9caNOhLHgx5EICdq
j//Ni9BhTN/GtLQup6XKKoE20g2Z+L9chB/8rh6lIBY98TTImJn5e/dZzEnhs00+
oIWn7jhIQLGyICN5K3RBbtLaB4gBlIZExABmYOXCRL9Or6ku1KjrNpVFIGlRIn0Z
FiaxFLJpDGAXITI+M8xVDFg6nEY2k0/iXLTC/dncmuWR7oyIJ3Z0eNB4vos3LNA6
b9Cchxrx5bkOoGErHtROtPdmuvwFFKwlM1SR782EkuVDUHinVmyndTlF5ax9q/2c
LK8T8/XPwr8V7Ip2EUxKcnotAsm3YK5KXma2O4pIxHdnFsgnMC4Rcz6WTQCsd1GV
aMIqtS/7rZb/CyxiHsuJ8BdUWxgl5hT588cGKbVaNWpgGDYdIGpvHwbShnnGb6Ow
P5O9EeBy93UxjrY5pZVWmBCOEPLuW1fSOhuGc9mYetjy4nJylBy9yDGkPQ6FxlgK
a2eGJqEx199Gq7TwCpLZcv87mW6Njm4DqJJ4Cu2yp09ig/0uzIfE67RUVKqnVjSi
DLBMBmqxdPzdjXYAfT7BXy/9TTcUKWR6wmh/LFZhALywMF+uT1Y=
=znco
-----END PGP SIGNATURE-----

--ijQsMv6nekEBJq7o--
