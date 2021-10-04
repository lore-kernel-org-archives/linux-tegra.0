Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1DD1BC433F5
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:40:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F20E56140B
	for <linux-tegra@archiver.kernel.org>; Mon,  4 Oct 2021 20:40:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236620AbhJDUm0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 4 Oct 2021 16:42:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53408 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236660AbhJDUmU (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Mon, 4 Oct 2021 16:42:20 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0346AC06174E;
        Mon,  4 Oct 2021 13:40:31 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id b136-20020a1c808e000000b0030d60716239so534709wmd.4;
        Mon, 04 Oct 2021 13:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vG87OCwnXSPMYtQkYwrtLZv1vZrY8VfZISdt1Z3NF5I=;
        b=UY/css+MqoYM8aW/DZ1qUQx6l2gO4CaulGjZA9s6lRKOZPjM6/S5oRNWepWf+icGin
         ZvXp51uvcqjL2GPv3E9ubGum0ghtmpb3i+r9Jzu8rNj5f3K2uxFZQzMLkWRvabzAxglf
         Bmz3hkk1RnG+Kkr8Jo+7G4uCy9rj4GDak887pUMnhYTI21X4i6YsqOOqA+h4Pi/uGYr2
         zwcuzvt59ZUhbrBek3xhL2RU8wHuHXk60z5x4n33CMzAjLr2bpTKIQjZtiWbx5N+tT3s
         +Ns8B185esiKJvreMPA8TkYpwzrVD41SskRCwfhvdE++3VMW4da3/N78xz6d/csLYEVp
         LeAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vG87OCwnXSPMYtQkYwrtLZv1vZrY8VfZISdt1Z3NF5I=;
        b=beGRDBdoeZtpADsDAk/PxK+2GmX62ANRoFjazyFpgDt8pIFB8QO3OAUVmRUBNFyCeb
         2OBLcGOVQCJTV+PGwsVISKklpivtWgrXmGXcs7a2Mual6NgNOt4aoq8nZB/glZkoxA8e
         eteCxcT2M1dqJ0zLin+49+RZ4AZbKBibghB88wK5owa+jzbFp66q1mPBcVM+E3WQelJZ
         mMtP9uk/xDmZG496g9RVTIF6QcHscDN9jDEjhcbq7qRESJvohL9BeEvrUZ5P4UfYA71V
         6lKnL93oLUGVgKEVrqFOi7KPHRWHDlUxd6YErGhBjYkeNibEcE5EV1aGNHT+V7kjV/Cc
         ewzA==
X-Gm-Message-State: AOAM530cHilLUIp4/wH89NOe6v8ILjoWlBcXE16Lxe7yuWP0VrdQ0MdY
        bG+rVazJu0QTB5ll5XVmrlK47CBpa9s=
X-Google-Smtp-Source: ABdhPJzVpha5Ni5pusrZDT3otbLYn1fm44rFD90xeRT0PJEr4YZFWzn7RFHWSB1q/YeVtprzyd2R/A==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr20550758wmj.84.1633380029643;
        Mon, 04 Oct 2021 13:40:29 -0700 (PDT)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id s3sm15410307wrm.40.2021.10.04.13.40.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Oct 2021 13:40:28 -0700 (PDT)
Date:   Mon, 4 Oct 2021 22:40:27 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <treding@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        David Heidelberg <david@ixit.cz>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v1 1/3] ARM: tegra: acer-a500: Correct compatible of
 ak8975 magnetometer
Message-ID: <YVtmuxnL0NVpWYGv@orome.fritz.box>
References: <20210926233704.10164-1-digetx@gmail.com>
 <20210926233704.10164-2-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="H5wIIOU660FrYBkJ"
Content-Disposition: inline
In-Reply-To: <20210926233704.10164-2-digetx@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--H5wIIOU660FrYBkJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 27, 2021 at 02:37:02AM +0300, Dmitry Osipenko wrote:
> From: David Heidelberg <david@ixit.cz>
>=20
> The "ak,ak8975" compatible is not recognized by dt-bindings, it's
> deprecated. Use supported "asahi-kasei,ak8975" compatible.
>=20
> Signed-off-by: David Heidelberg <david@ixit.cz>
> ---
>  arch/arm/boot/dts/tegra20-acer-a500-picasso.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

Thierry

--H5wIIOU660FrYBkJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmFbZrkACgkQ3SOs138+
s6HfJA/8DcxpvIzz6e1sOS0l/gfSgBRJS8cOshg1CdDic9Jzv14b6AOpa1YoFzIZ
DylZAT5gFPV0GpmQGyPNvaat55vDivNxqWzecgbeLW243/NiniLG2dHIiqMYnXzl
OqaAlgi6CWAY9qmCfQBFXDj665No0G/vHsWz6VvwxY/5h7ah/BsKStQVI5T3lp9T
HD+lUx9nX3ZrTT5s54bRMAymtCc7neIv3GwWKjSiTN1UIqOlDJXSB6sR+VDH2Z/a
s5QjI037SurX1MAIs+G5Aurvcm1yuLJpGS7bPl6NjvDDoXcBswkyfM7RJUgfBL1z
/UWMhQpnDDoR6yy3lfghGDw6eR3m8tI/uHX4glLO8U2TZO6m4N6S2t0IGRuUwK0q
LF7ShhY7trzL90mmJOElkxoM9RH27ryZUibNj9lAV2AVMI1awRAE4K8NpzyXpipL
a8lr/1lUGPggQPlkAH2SGCmd8ONFZ8zCFE76S7YjkWc9BAX5nTu7bQg+8RVWyRGf
rqI0O2rQ4InGOCk9if+N6jaQ9rGWAstRnM7/npRt3rbEGRXRu3UWS/EvAO33R927
YLad3r/ippFBdhY/5x4j1gHUSOq5VHEbiSwQqwnTH/8O2cmBlWEgFe36JIUaM8Ce
Ti/ZuQ0IYSA+4lDtEWgJmyQWBgApyzK0Q0QANGyo8CmHKoROPdM=
=fcvv
-----END PGP SIGNATURE-----

--H5wIIOU660FrYBkJ--
