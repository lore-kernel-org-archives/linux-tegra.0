Return-Path: <SRS0=2JVP=DQ=vger.kernel.org=linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7345C433DF
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:15:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6245420709
	for <linux-tegra@archiver.kernel.org>; Fri,  9 Oct 2020 12:15:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nnOt3zE6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388441AbgJIMPQ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 9 Oct 2020 08:15:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388439AbgJIMPP (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 9 Oct 2020 08:15:15 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26987C0613D2;
        Fri,  9 Oct 2020 05:15:15 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id l24so9107890edj.8;
        Fri, 09 Oct 2020 05:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ATUnAdVI+/TfaTi/4Z/fh/a3Euzf/j0YG28GOxqTAhY=;
        b=nnOt3zE6lcM6BESY8hPBGDdlfifdhY5gS/Hx61UlNYctRBuqOFMnf2rivnFB9aTIdw
         bvUY2hhcheD0oUpXQ9LtA611gske/LLrWuk3Rs7K0SufEBLex36r3346qxWySwHQ5sUt
         TxuFIM+zplVApmXG+n5J6yBr++xY9n+FZK6ZN9+Eb+ILs3eJizFP39A3QStaKbEDgRMp
         4hZE4Xf4yg41Wt9r2DZ/r8ZJ9zvdfdMWpIxypa19pnEablqzePvx1zONh7MP3aKkfq67
         3AA14awgszdnObEhuoxORISqVZH90mjM4KY71mTFxaXpvK0+wnDxSAU/LrVfOhRh8XU2
         5nUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ATUnAdVI+/TfaTi/4Z/fh/a3Euzf/j0YG28GOxqTAhY=;
        b=rMedSM1S686gXM7hBy82HSTCjoWhAG6GypilMLoXRT3GeDGlTkZg4vzGaEOQSNG3sV
         6Jz39cvbfAcVK47vF3tNEosAr/hvxdXS5wL9gXre/vj2e12De694ZR2zqk5CSog1/FUp
         Z4B7vcbjY9zm5Ake02u3i9QDL5wQ28GiQ5I42qaAd2FCEAuQJABZ7twZDOv0PvXf8P0I
         B/FjhW5D+y+9rVk8uznQ+dgJTETwAC6MTy2wXTm+dDUIjS0S1kbzCbl+9lQcriwfC6EO
         DguVHuzoI9si1gvOG7SB5+haNBQq/HrqXAtxTP61ICUg7DNX72m9CJ0WJE98lNAqHasc
         /xSg==
X-Gm-Message-State: AOAM530yy2fqlWqzB/9Iv85vK2bDKZ3rM1CRLnwBmS3sFRP4AY1ITjVX
        lTVKA0UNkz7lOmtPzO+prDs=
X-Google-Smtp-Source: ABdhPJxsVPvhAXWmbyjDkJU+Nka8Ve5QOVdux5ORAMBM3iiYpRMhg3Z2bejR3uN4ClqgD//hfmBpiQ==
X-Received: by 2002:a05:6402:6d0:: with SMTP id n16mr14320527edy.133.1602245713879;
        Fri, 09 Oct 2020 05:15:13 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id bv8sm6264812ejb.3.2020.10.09.05.15.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2020 05:15:12 -0700 (PDT)
Date:   Fri, 9 Oct 2020 14:15:10 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Nicolin Chen <nicoleotsuka@gmail.com>
Cc:     krzk@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] memory: tegra: Sort tegra210_swgroups by reg address
Message-ID: <20201009121510.GC458338@ulmo>
References: <20201008003746.25659-1-nicoleotsuka@gmail.com>
 <20201008003746.25659-4-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="E13BgyNx05feLLmH"
Content-Disposition: inline
In-Reply-To: <20201008003746.25659-4-nicoleotsuka@gmail.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--E13BgyNx05feLLmH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2020 at 05:37:44PM -0700, Nicolin Chen wrote:
> This is a cleanup change to prepare for new swgroups.
>=20
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/memory/tegra/tegra210.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--E13BgyNx05feLLmH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+AVE4ACgkQ3SOs138+
s6EYLhAAgrKUs8Wi2zOoyT/bZ5dTJaKU/pJDV/OQo+eFduvJtx+G5+3GWIq5cIph
lctgWIEw2Nb6p705bM/DJoR2WGyTQ/fec2N0RETk4Xac6mjzpS6fl2AfvtnFlcXN
m+/rc4AzkRA9xIIXGVlb+zdb375iYsUyLh+W9hOliO3nlBXlZtRwTt7rE6o0vuX1
CidKBw+f0k9eYPgGoPq0JLhhWvT8aKwupnytsACw197Vsq/Of4OryZwqcnTBJJRH
sex6ebkNImBep6vgXM95tAYLOdXDMQ//d/eQbBuOpXgqAeKuRqBs6oA40g/A3+LC
opP2uBV1kjIHXu3zfHI0sWGgG+NJUIUjLQRgvzTdwNhLD9tNOxnoZZQOi0ImmcK5
rRfvqt+PgUe1NmKC4ebXlTcSYCET9/7pD76gMQcLut8QghTooDF+uxWmcfcf3uBz
NqzSawjoHk1JQkCAWhaMbHPyrB09t7lFNeIWrB8Ury6y63gl0J8Jp9Z1dwS/NZLU
FcW4COvhxz9m5US7Ur3+VZjhrdiQ2PkKuU7h8pJPMSO7b4nQstYvhksP1psRgiUa
PjvKPhDeaoduraU31cBK9klitx0NxZ032KuJjJ+csv9YrQE8JnG/VMu2/ZVkb/GY
ZDyl8skYGRTO/NXBGPe1xvIv4Rg+a0p4MZIICI7QE/W0Q12XcFQ=
=k16H
-----END PGP SIGNATURE-----

--E13BgyNx05feLLmH--
