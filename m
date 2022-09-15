Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 139E3ECAAD3
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Sep 2022 12:29:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229572AbiIOM30 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Sep 2022 08:29:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbiIOM3U (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Sep 2022 08:29:20 -0400
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 465B59A995
        for <linux-tegra@vger.kernel.org>; Thu, 15 Sep 2022 05:29:16 -0700 (PDT)
Received: by mail-wm1-x32d.google.com with SMTP id o20-20020a05600c4fd400b003b4a516c479so3183554wmq.1
        for <linux-tegra@vger.kernel.org>; Thu, 15 Sep 2022 05:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=dIhmOztaznx7BT6qLf5AXl8Gvx0fWxoBWAWcPUBGLtQ=;
        b=aj163k2FVpLT84e3A6zIH7ocD+eiNqnw6GhpwAILGq49ZrTnnht8had2TkJCHKS43w
         6TFGd5u90XVRO//npOnmmN2hciCM0+U0SNPDS+caegnQG+TiaNfGr8C8MQGsWmYwP6B/
         nAGMTMSJ/3GHafyjTbawuYqBzdm2siamP0YiV0sQntSsWTy+yvsedG9Om7XOwTUoauoT
         EjdpoIcOvbWJBGUYs7X/0jU5JJSUf/aoI2YRFLtMGZKZqm3eKQn+WQHjnzOBxgZQyao/
         WLx8lnnsEIAkJi/2kajMNaivx68e65iCGoLtG5aTMI7QIl+W6sDvTygS1kr2HfSNAlWY
         cauQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=dIhmOztaznx7BT6qLf5AXl8Gvx0fWxoBWAWcPUBGLtQ=;
        b=tmNhpZaOwAURfSkVgZuFRVRHjruA56yvkcZVP9Tj4FaxBlY9apf6YOLATzuumX7fih
         HgGp8/RKEfftvvA1Epo9utx4ifZG9QjzorxqBmkT1dFR10beirM8wGGPUeURkkvdpRFJ
         jbEx6ofWo03Pt02/RxZazCTcFy+CQtHV7bLG+2AFIb6xmeBndFLxMhrF4uHRjHf6yte8
         L4vXfNU7YmYMyGX4/HbCR46zIY+PniGFeoWWm5EjTXWLwk8zh36bfAVjVT60+erIUQDd
         /7W5XmEvjvecTY1r8HmAuNGO7tLaAPkMOBlVM4rhmvt1pMqf/GuevOd6DBO0M8zFz3/V
         mIcA==
X-Gm-Message-State: ACgBeo1yxxFhs9ytB+YNko9+FL44mC2Zl/6vtRfB5aJhgnZYhxPJIilP
        DFfMTRsCdATp97DGqFNO3aw=
X-Google-Smtp-Source: AA6agR6hk8eV4H+QXg5Ah0HgYB/O7RHbUQbkfC8MG1Wen+RbA82DRyTZrXePyhXlgJAo/oOjp4yqKQ==
X-Received: by 2002:a05:600c:1d94:b0:3b4:7b91:7056 with SMTP id p20-20020a05600c1d9400b003b47b917056mr6419144wms.18.1663244954922;
        Thu, 15 Sep 2022 05:29:14 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l4-20020a05600c4f0400b003a3170a7af9sm2983480wmq.4.2022.09.15.05.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:29:13 -0700 (PDT)
Date:   Thu, 15 Sep 2022 14:29:12 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jani Nikula <jani.nikula@intel.com>
Cc:     dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH 4/9] drm/tegra: convert to using is_hdmi from display info
Message-ID: <YyMamFFruFOiHmxJ@orome>
References: <cover.1662036058.git.jani.nikula@intel.com>
 <1bdb744bc1079affdd108b34206efd2f21adf7c7.1662036058.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="XKa4wu3+ppraBCu9"
Content-Disposition: inline
In-Reply-To: <1bdb744bc1079affdd108b34206efd2f21adf7c7.1662036058.git.jani.nikula@intel.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--XKa4wu3+ppraBCu9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 01, 2022 at 03:47:06PM +0300, Jani Nikula wrote:
> Prefer the parsed results for is_hdmi in display info over calling
> drm_detect_hdmi_monitor().
>=20
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  drivers/gpu/drm/tegra/hdmi.c | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)

Applied, thanks.

Thierry

--XKa4wu3+ppraBCu9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMjGpgACgkQ3SOs138+
s6GNXQ//RVAZ9qkjTlTHb+uVOZsn/g7+wRfHDGR/Axr+J4TSjAWMg7Z8ejW9iWq7
x1C6r0fF2pyIblsBbt3ff8BdYXBflMu8m3I8W2092VJx4hYsmQzp55UXxaEVF93D
wQ+/g6NktB8H6RxPgyUUchax/yN4GbQdMeuezYzLSC7CHMWP0zBEwl1sNT1JvbXQ
qhi05lX9ek3nluhrq6iPRRzsISDk2rV8DWWIq62/pGz/STuEjrcOID/m6B3gU00g
cctpUPRDsqyzAntm/bCemwNghuj9bqCZ5Rlm+cH7gM1sKYLV2wn7w1UkVUPQmJC0
NuQ2EVo9LDvx4lM1DwqIf/rTAkNsfiWbiJcvgilk+gQkRR7S8abvG2MsGLYK04vB
wmghDjedgh37M5dNzCJnoidd7VWEwXZouTPqT/Frp202yziUqcQFAXt+3Roj5VnN
fvMaKD4FK1fbt2TdoJIDb/b8LmZI1HP++qV5fE44HDIpzxnX5DXWm/fwtEMCia9R
WSStolAAmEIEuxA/sOQtwD1llkIDm8byo17h1EMcO1H0bliswA/LvPckFnWy9ydv
3QRxzyvvLFtmvQD1ECb/ZV3DoZ2Bi6Xy39x6EruWWZ/RCjuPcqJY4w2Sbt8x3B7V
0o71cqZppdPJcA/ObQfQfkHz/6W6007cNnQak/nM4Fzq7RWJRqE=
=k/Zs
-----END PGP SIGNATURE-----

--XKa4wu3+ppraBCu9--
