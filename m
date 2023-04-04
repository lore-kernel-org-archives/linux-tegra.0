Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76F9EC761A6
	for <linux-tegra@archiver.kernel.org>; Tue,  4 Apr 2023 11:28:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234892AbjDDL2u (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Tue, 4 Apr 2023 07:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234295AbjDDL2p (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Tue, 4 Apr 2023 07:28:45 -0400
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com [IPv6:2a00:1450:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49F8D26AD
        for <linux-tegra@vger.kernel.org>; Tue,  4 Apr 2023 04:28:44 -0700 (PDT)
Received: by mail-ed1-x52d.google.com with SMTP id w9so129201556edc.3
        for <linux-tegra@vger.kernel.org>; Tue, 04 Apr 2023 04:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680607723;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GAROgpan+mwPyFcTNeZmR/RDUcG+1TwaoFUvfzQwO2s=;
        b=CE2yZ/Xlt0/yFSWpHLMZq6Y8n7YglFZHb8p/Aw3LcMWlgKDIJae3SRp5LAwUxQRzD8
         HFAnHl51tZ3QKScaJf2D+HTXSkDP4LJXT7DdrQmM7pB0l53gOgJOennWRKB+jdTGdqen
         Jj5p+TM5InEUdZhNdkryWm4Y2ksNr/wtSZNu0Xy7tNRco3w898rXxnkAN34eY5qaB6lI
         AeOrE8CodOgSDjyfhtw2W0eOGuGwS0HbpyK2tuHwiy5Yx2s9ITwcoENOShmsvlaEoRLW
         sFFbsBWBHxKYcig2FVZnBb4cZ2ZMqgSCLVk6AgyMmc9bNs36FEbhX5G4Jeo7WmrgeNAk
         sEXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680607723;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GAROgpan+mwPyFcTNeZmR/RDUcG+1TwaoFUvfzQwO2s=;
        b=LLEXyXpk+7pjjWX3uwCg2eCrziF1GOT1ucSOeaK5q2n9J6abCYD6lZtkPbjRYE3giN
         29yTw8rUFbev1gVaxW3TVo/X1drCH4ZZPhkd+yGd11qqg4obUiZUQXFg3E7ATOASeN9W
         DeKTJQ0Gxtjahu9gto6/1l2OH1P/BqSvri+/A5Rzi5acURNPIgJheGq74X2PZ6aWNTNB
         74n57J9uSHZPy4JT7pdR0R0O7wSgr4gJRFZarAmQjB+9gXEVsJ/qHiX8LLIenmLgKfAM
         6LjxMIDTWxjkK0a6J7O6ct7Gjn6YhMCTWuv+Jmt7+EP+PyrksT3+tHovZ1tJLIlbyPF0
         kuQw==
X-Gm-Message-State: AAQBX9cIAadxOGvGZOG0Zb/L9se+ro+6F4jBFnsdv5EvAzqehkpK9/Yk
        8js4IIJtPujo7u21dkdd24k=
X-Google-Smtp-Source: AKy350a3HaZbq9zmPPxoUXNg14ovOLIP8X+tiQRXiqfd8kyqaTgovy/otZVQQrvTYV/qgeLiihFmaQ==
X-Received: by 2002:a17:906:14c4:b0:933:3aa7:57a6 with SMTP id y4-20020a17090614c400b009333aa757a6mr1968333ejc.12.1680607722761;
        Tue, 04 Apr 2023 04:28:42 -0700 (PDT)
Received: from orome (p200300e41f1c0800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id k11-20020a17090627cb00b00930a4e5b46bsm5771868ejc.211.2023.04.04.04.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 04:28:42 -0700 (PDT)
Date:   Tue, 4 Apr 2023 13:28:40 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Ville Syrjala <ville.syrjala@linux.intel.com>
Cc:     dri-devel@lists.freedesktop.org,
        Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Emma Anholt <emma@anholt.net>,
        Maxime Ripard <mripard@kernel.org>,
        intel-gfx@lists.freedesktop.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2] drm/scdc-helper: Pimp SCDC debugs
Message-ID: <ZCwJ6C1WHG0iVVSY@orome>
References: <20230329171402.2772-1-ville.syrjala@linux.intel.com>
 <20230403223652.18848-1-ville.syrjala@linux.intel.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="vj1AuGXsMTxBMTZ1"
Content-Disposition: inline
In-Reply-To: <20230403223652.18848-1-ville.syrjala@linux.intel.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--vj1AuGXsMTxBMTZ1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 04, 2023 at 01:36:52AM +0300, Ville Syrjala wrote:
> From: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
>=20
> Include the device and connector information in the SCDC
> debugs. Makes it easier to figure out who did what.
>=20
> v2: Rely on connector->ddc (Maxime)
>=20
> Cc: Andrzej Hajda <andrzej.hajda@intel.com>
> Cc: Neil Armstrong <neil.armstrong@linaro.org>
> Cc: Robert Foss <rfoss@kernel.org>
> Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
> Cc: Jonas Karlman <jonas@kwiboo.se>
> Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
> Cc: Thierry Reding <thierry.reding@gmail.com>
> Cc: Emma Anholt <emma@anholt.net>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: intel-gfx@lists.freedesktop.org
> Cc: linux-tegra@vger.kernel.org
> Signed-off-by: Ville Syrj=C3=A4l=C3=A4 <ville.syrjala@linux.intel.com>
> ---
>  drivers/gpu/drm/bridge/synopsys/dw-hdmi.c |  8 ++--
>  drivers/gpu/drm/display/drm_scdc_helper.c | 46 +++++++++++++++--------
>  drivers/gpu/drm/i915/display/intel_ddi.c  |  4 +-
>  drivers/gpu/drm/i915/display/intel_hdmi.c |  8 +---
>  drivers/gpu/drm/tegra/sor.c               | 15 +++-----
>  drivers/gpu/drm/vc4/vc4_hdmi.c            | 21 ++++++-----
>  include/drm/display/drm_scdc_helper.h     |  7 ++--
>  7 files changed, 59 insertions(+), 50 deletions(-)

Acked-by: Thierry Reding <treding@nvidia.com>

--vj1AuGXsMTxBMTZ1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmQsCegACgkQ3SOs138+
s6GsXg/8D9UCUi/fBwJqmv5OJ/ABJwg9vRF+wYUrky+mYzGugSeEcePKaw295uKY
aGnxbpBnx0vKSs+G7sb8E5ccoMgl/NpsvkttAfRLEku1H/cCpLODZNSXdszBlxt6
4UplImiSbaPSu42ZVOWrJOBYzUiMarii5ajM7y03XZTLWmbSG/1NoZuf0RLaVaJt
QuNjjVAMw7OX1nMPJcfrzz2yFtxXj+MlL3sgKpyR6wPAyPCqWdi7lQkmob/UwulD
mqCGfugR/J786r/HbLGqm+7HAB6ctBpAJpyh83FgWY2lIAxlkp+bSS3j18LA0D6H
1a9DPI3ay3oATOSDzfq3wBG8cpmqd+ySQ4n50+jFEi/+v8ggRf/NIuNuutaD5VJq
SoMyO6L1eN7uGQz/oSkBxBkO+zh7orZZI1I6Nqh4HhtbTNFnZVtQP4xIlYFjaeTA
ugvMHPuoYbiqgzgnEyQDkblvmXwYSl6K2hmePeX640A2bDSeb0GY2CqYW4mi56Xs
8LOM+uMH9mRvLIz73dz4rgOpVxJnrrmrDQdEToJPbkqr7Tu6cDiLABM9qScC9SEa
szCfZuToPH0rtsL2J5pbf2kdxb4ozzlVgzoLRKt2qSnMBYPw+K7aoCR4XZiHfhqR
p20ybBF+h0FvHEZ0uAENreC2jJ0V+sT770JAx5ulk6emdjr72V4=
=sVLq
-----END PGP SIGNATURE-----

--vj1AuGXsMTxBMTZ1--
