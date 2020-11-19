Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41232C388F9
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 10:42:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CA480246D3
	for <linux-tegra@archiver.kernel.org>; Thu, 19 Nov 2020 10:42:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eRFdj+Uv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbgKSKm2 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 19 Nov 2020 05:42:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725905AbgKSKm2 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 19 Nov 2020 05:42:28 -0500
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB114C0613CF;
        Thu, 19 Nov 2020 02:42:27 -0800 (PST)
Received: by mail-wm1-x342.google.com with SMTP id c9so6684999wml.5;
        Thu, 19 Nov 2020 02:42:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=/WONwk1Hznyqszgzhf5qjgOB9DvKw5VGORxSmu4+MKA=;
        b=eRFdj+UvfzGwds5oGwr/4cHpPz6kn8I1nEmfy0qfrEF5n70moLdo5kKaLmCf9W/mNY
         d+lrEuKio5oxayKqHkbmG7mX8DrFalYExO6rhsHsbDHTEJ0up029sRkYdI8sIjZLi054
         Jnk38oB+9zrGEazBM2E/UgAqpi+CO8hC0x4BwI3h0Ut7eDdaRcmzi+vxPZBB6tjKebRr
         8sYx+kB6vg9MT49hmW/sSWO47F0JdB5ixNYgD1b9niNjleRe7SFTpkraKwIZuGerI/8f
         2K68DNLLTFASnFhojfSpv/numHzINs0LqKHqJBMSMx1zmWfvAB1Z3kanSPoGeavE07Ub
         IUtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=/WONwk1Hznyqszgzhf5qjgOB9DvKw5VGORxSmu4+MKA=;
        b=VtravYydtvbTyMXt39G+fgH2mUM/ydHtdiNkBGrtgJmJjbuC9Bpx2ymRo4GBFLToBJ
         5U6jMQtL3oRHdmxt3tlTV7C6EYojU/F0cMjL+ENFzKumF2Zq5zL/sP2uC/pwXhaLcQ4V
         7SAwkDIDKy9Z14/m6m37oXDyguWjsg/A2Y1Vip/MsgNZtF+0QG85aGjBHgWZK/cA91cC
         WZ+uK1+nolqb0hKFF8a2dHdrp4Zc8vS7xAYunf2W6cY7wP3jurPYsxiiOE/T2SnRUqBI
         oICSySX4ryh7tsTetBK6xGRtMBRmM5SXqFLbbVgi9K/ivBMpRntuxyZGxdEAIr9G9pXV
         j5WA==
X-Gm-Message-State: AOAM532oCOPOzp54j/jRPdavGkyyX1XORVf+3GY42X/2ylU+sHb7jJre
        v/WETO3ek0jerOFHl40qPVs=
X-Google-Smtp-Source: ABdhPJw8+Y9LRkMlJt0Eijs7lVZt7EnNnkOlXMLpkOFCCbQXI03qicotYJCJimOQkZZCGzFJ6Kou9g==
X-Received: by 2002:a1c:490b:: with SMTP id w11mr3823868wma.101.1605782546625;
        Thu, 19 Nov 2020 02:42:26 -0800 (PST)
Received: from localhost ([217.111.27.204])
        by smtp.gmail.com with ESMTPSA id f13sm33363763wrq.78.2020.11.19.02.42.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2020 02:42:25 -0800 (PST)
Date:   Thu, 19 Nov 2020 11:42:24 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org,
        Ashish Singhal <ashishsingha@nvidia.com>
Subject: Re: [PATCH] arm64: tegra: Fix Tegra234 VDK node names
Message-ID: <20201119104224.GB3559705@ulmo>
References: <20201118160458.659517-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="wq9mPyueHGvFACwf"
Content-Disposition: inline
In-Reply-To: <20201118160458.659517-1-jonathanh@nvidia.com>
User-Agent: Mutt/1.14.7 (2020-08-29)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--wq9mPyueHGvFACwf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2020 at 04:04:58PM +0000, Jon Hunter wrote:
> When the device-tree board file was added for the Tegra234 VDK simulator
> it incorrectly used the names 'cbb' and 'sdhci' instead of 'bus' and
> 'mmc', respectively. The names 'bus' and 'mmc' are required by the
> device-tree json-schema validation tools. Therefore, fix this by
> renaming these nodes accordingly.
>=20
> Fixes: 639448912ba1 ("arm64: tegra: Initial Tegra234 VDK support")
>=20
> Reported-by: Ashish Singhal <ashishsingha@nvidia.com>
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234-sim-vdk.dts | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)

Applied, thanks.

Thierry

--wq9mPyueHGvFACwf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAl+2TA8ACgkQ3SOs138+
s6HnUBAAjjPXSbIhIkf8alADwJrvzITS9Fcq/iQGk4AYdmFkhWVo2LswHLeTCWwo
HfsQnwExEYaUiB92b4miSnCwAdq6nrTMId44XgaVX0oo9WzwJioMsvCFi896TzH+
Jm+cYEHz+q2yAdJuYBTUrKp6Gcr03X75/FTNK47k8n3qgHQkAvLs0H4orLuciZQ+
ITmhCtgrvEG3UO2C9RahEmBk5zIpdGjICIPBOU28AvleI8lyvuvBJDWb1aS/cTZw
su1452dECW+XW2rCp4m+ronK5rN8HgmKRA8Tygx+xY84ScfTGZL9r2UMx/IZiJMd
y+V+RY5vota5dRLojDyZUHE0boSk8OBLoCGOZOJFVJ7R63GlH9p15OQ9Jsfki60Q
NfytqEPBdmefttskD48XGQQUQcjF5qd44+pGHavcBcwSpAk4jXtU2ufUH8HWouqb
KmC9oHyggpWvruQv/LDkEhywQwryMOEJZTezhBXOOcZB7DO1mTj/JOx93Ig2hqYv
pOchnWBLO7VD6cjK2c4NydUAJaJx+CzMbdFh4FKkbENGFkWabhXZBANJvKZcC/kd
TAkRV5Ft4/EcyXP94JDk8T2bzVJxGdYS9VIhfoqzckLqXuHdBlXrpsJPN2gG+lSw
x9fgHa6BZhv80H+XiOn+bSq2PdHTnXHgPnF7nQz7wHinyuYbpIQ=
=3jwx
-----END PGP SIGNATURE-----

--wq9mPyueHGvFACwf--
