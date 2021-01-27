Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AC5FC433E0
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 18:33:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D71364DAB
	for <linux-tegra@archiver.kernel.org>; Wed, 27 Jan 2021 18:33:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236844AbhA0Scm (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 27 Jan 2021 13:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234876AbhA0Sca (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 27 Jan 2021 13:32:30 -0500
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04DEDC061574;
        Wed, 27 Jan 2021 10:31:50 -0800 (PST)
Received: by mail-qv1-xf34.google.com with SMTP id ew18so1545458qvb.4;
        Wed, 27 Jan 2021 10:31:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rXrK6DUFkQoHA6UtFnK+GRp2XFKl2WDl0sNO4FAmRkE=;
        b=gjFQ/lDKd1hq4aRb6LOw1AGF3t1XuxuPb+u3XwpeTTbXelL/sd1Pq206woT+c/rMFw
         NVOMpnaYC005wmuRQ6yI3u9CxBjUj9f1mPJYSV4h8n2snk0T3UR1YkiRdXPUqx75T9Qu
         rKS4MW6TzgtPG7SLHxmt8HGNB8XNXzgYCum2Q+Cr0Kvk6bSgK5kQbxowLnHnNffvPolB
         suUEy57iH9eZVfKvDD8Lodpp0YA6InvrfSMxY0/4XYAqXRXa4kmF84IQjFjNJ2se5/vZ
         AVu0Hcic95RMaW/QjWEpiW2Yw65XSGE7G8VEkLrFewPEpkdSnsIHcyKZw3M0eHT+16An
         0YSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rXrK6DUFkQoHA6UtFnK+GRp2XFKl2WDl0sNO4FAmRkE=;
        b=YitILkeTDnOqvY1NFyTnxUmDeLwi5LpevJfgEu2kL31w/JL5QCvaJrDaMk30blV9wg
         RHmBQsR0vhKMqZy2+9urhJkMjPmXnsos+6mx3Z7JsFFN/r0uNq77uBdcZY2lh4hNUNxh
         /U3hIEY4vqIsRKbkw5bcg9lYFTSjFXK8eWRxHvW6pwsDHkYe4c7iwd9+4MzOoibCn2/T
         ENUFzkmE9yRXJGMIpxYvM0i1KD6JHY8al5uMQIjf5QNvl6sIkjlcB2XCemBok4EbOrqc
         VEM42jt6V4RT+NuWbkdR0EF6mdSS/YjU+azG/gU+3fetcF29xIQMsAPfZL5JsdZIImMd
         u8MA==
X-Gm-Message-State: AOAM530HYRyo7ENOD+DxN8ATiqXr9LCS6dbv1484CdNT4FhHP3MT9GB6
        9QVvF2nwhoBYELzUP2MN7og=
X-Google-Smtp-Source: ABdhPJxUBAt0IS+g71CUq7LIdgrGhLwKazDOEV+d3QGKf+qYqVjYg2wiPhWmmVj+1zigkN9kmweqdg==
X-Received: by 2002:ad4:55e6:: with SMTP id bu6mr3124005qvb.49.1611772309303;
        Wed, 27 Jan 2021 10:31:49 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id p11sm1810220qtb.62.2021.01.27.10.31.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Jan 2021 10:31:48 -0800 (PST)
Date:   Wed, 27 Jan 2021 19:31:45 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add support for Jetson Xavier NX with eMMC
Message-ID: <YBGxkd1Ig5/2R0aG@ulmo>
References: <20210127175250.326390-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="9xTh0WmjaG5ht5NQ"
Content-Disposition: inline
In-Reply-To: <20210127175250.326390-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--9xTh0WmjaG5ht5NQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 27, 2021 at 05:52:50PM +0000, Jon Hunter wrote:
> There are two versions of the Jetson Xavier NX system-on-module; one
> with a micro SD-card slot and one with an eMMC. Currently, only the
> system-on-module with the micro SD-card slot is supported and so add
> necessary device-tree changes to add support for the eMMC version.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/Makefile           |   1 +
>  .../nvidia/tegra194-p3509-0000+p3668-0000.dts | 351 +-----------------
>  .../nvidia/tegra194-p3509-0000+p3668-0001.dts |  10 +
>  .../boot/dts/nvidia/tegra194-p3509-0000.dtsi  | 351 ++++++++++++++++++
>  .../boot/dts/nvidia/tegra194-p3668-0000.dtsi  | 282 +-------------
>  .../boot/dts/nvidia/tegra194-p3668-0001.dtsi  |  19 +
>  .../arm64/boot/dts/nvidia/tegra194-p3668.dtsi | 284 ++++++++++++++
>  7 files changed, 669 insertions(+), 629 deletions(-)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000+p3668-=
0001.dts
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3509-0000.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668-0001.dtsi
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra194-p3668.dtsi

This looks good, although I must say this is difficult to review. Maybe
it would help if this was split into two patches where first the files
are split for tegra194-p3509-0000+p3668-0000 and the second patch adds
only the files for the new SKU.

Thierry

--9xTh0WmjaG5ht5NQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmARsZEACgkQ3SOs138+
s6ETDxAAwPQZq83FdgRdSuejDU3XJACOxEzB2bOSC5/O+thJ8vAeHInVkTTc1fGi
E8qEvB7nRx+KXfK+kJFZiH5ZSksrGhgXHK3bsvODbtpE15V9zbyHiTvHa35P2lOO
mP2IeYIVtCN3fa1QMyP5oPZ/sxPDKMWeVbTGluHvtosDvzg3ygmkyRq93wK1dxYu
skMN9FjlzpQUpRiiOdxV08hhx3AfL74exf3Ugny6df9u8o1xgLMXPFp2Tx/ztfV9
TEQ7mvccnd4fhPk2+URmecH9Z3v3jbWoAUUjowuDLOGRPsea2UWyL/HX/WZ4bAWM
IlBVzGxfBh5ZIfkk2q4gEYiE4CV5BRnsVt2NKWPDDjVZ7ZV5b4q3vfcDJxbIt6kf
/x+99TsqpDau85XvcSXYDvZenXf1RF8d6RVzsCgHPxf8pyu9BQZDr5Dc2YBr+AbV
jN87KS+GjT66Es6IyfMCR3pF85iQyU79VjIcKNFdxEuD8/WzDk7P2ucB0IeUAqSe
q1SgCEHiRo0DVgbSCopBsOmfC4QLPLHp1ZvvxiwMLm+1AC0F3N9GAMisMxuxP3wk
QSDCSSFMnOP0E7JxmPNTaHD41S33BJAp7B2xwUMjF+L24AB1opvLe3W1KCQkzITh
830dOxt2LPFqf9eoF3sFnHOAh2QsThBAPiDsaGxd1VzOY+3Gu0U=
=ElPI
-----END PGP SIGNATURE-----

--9xTh0WmjaG5ht5NQ--
