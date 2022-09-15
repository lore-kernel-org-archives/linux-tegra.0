Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9B1FECAAD3
	for <linux-tegra@archiver.kernel.org>; Thu, 15 Sep 2022 12:10:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbiIOMKk (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 15 Sep 2022 08:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbiIOMKN (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 15 Sep 2022 08:10:13 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DC4B90196;
        Thu, 15 Sep 2022 05:10:03 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id go34so41663279ejc.2;
        Thu, 15 Sep 2022 05:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date;
        bh=Mm+2DF8Mo7Se/7xi0leL6LbCETFmkcHoyeYmjEsX7WE=;
        b=iNoJjQVdspv7m0yKLXVJrb4efOtJSSHERmTzFyT9xZLDSyp/4LN2GLTzOR6ypDx4uW
         +LhYeJ1I8QptOMuvtaasDCWX+VMjA32+ODdAUfeidPDRBwFVQ0lmmXxa/N9S7I+wTJGG
         S6bV5syj0z6s5VeZYErVjdRq/PYqW2EEcEf0r9RfC4Gc8XcTkew3oSRKNUQw/sYEl76+
         7F/MFBYcGtRQOwgUW1iDTvl9PhY+yDdGYGG7wvk+OlD9QdE0tmUmEiQEDtvn9WN4UQyT
         xbj5Wsc1oqKpjS9Dp7NQSzWAYebPpbGwb+XA7RhqI/fKDeSwTzgnZS10uUHIYg/Y495F
         WzQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date;
        bh=Mm+2DF8Mo7Se/7xi0leL6LbCETFmkcHoyeYmjEsX7WE=;
        b=lmfGvKs5WD7fiJIczvZ4FhUjDF8jGBlcItS6NmUDWv4/MJVZGqbV++YG5Vrz/zv+yn
         RuZ/XcfXk9sRMV62SOkoJUqxG6qxlyPbKAI3RPD70Ug5M6GCVxjP/V4kpQNuz7QwUGes
         c/UjRYd1iYQGWmdKKTEaRUveWrgRV8FTWw4JHDA6N1C86OOyk+T0FwTRdvUGr36Z+DTS
         NfO2jo6KMagkrVt9r/08PGwAmHw8TmHXxdGtQG6K0IbyLIjXX02ZrYyfX4oiLUlLx5Cq
         18RXanYIiv0sotgWiZoZ/QEdX0q0GzLRf8rrceGnU1wln5SS++WV9jxhSnRYQdhaaxiP
         Pn6Q==
X-Gm-Message-State: ACgBeo0NnJod8hxjb+lIjsAKsLDGQnznQrGe8gFf5wLjgr6HpSW5pRL2
        hFjBGs0hM7s9L//IAGymrAoT1PKXjI8=
X-Google-Smtp-Source: AA6agR7akluhHbNA/L17G/el95vY0mQC3fDf8p1ne3XD+jaMEkWDy68uAbjZAN6V7dObPS9wUm/IEA==
X-Received: by 2002:a17:907:7255:b0:77e:f3df:747a with SMTP id ds21-20020a170907725500b0077ef3df747amr12036041ejc.519.1663243801255;
        Thu, 15 Sep 2022 05:10:01 -0700 (PDT)
Received: from orome (p200300e41f12c800f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f12:c800:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id gu2-20020a170906f28200b00718e4e64b7bsm8912344ejb.79.2022.09.15.05.09.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Sep 2022 05:10:00 -0700 (PDT)
Date:   Thu, 15 Sep 2022 14:09:58 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Mikko Perttunen <cyndis@kapsi.fi>
Cc:     Jonathan Hunter <jonathanh@nvidia.com>,
        Mikko Perttunen <mperttunen@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 0/3] Host1x context isolation on Tegra234
Message-ID: <YyMWFtZ5JTwVw3RT@orome>
References: <20220907083844.2486805-1-cyndis@kapsi.fi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="qlPgB3ZnVYKZSLq1"
Content-Disposition: inline
In-Reply-To: <20220907083844.2486805-1-cyndis@kapsi.fi>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--qlPgB3ZnVYKZSLq1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 07, 2022 at 11:38:41AM +0300, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>=20
> Hi all,
>=20
> this series adds support for Host1x context isolation
> on Tegra234 (Orin). The difference from previous generations
> is that there are two IOMMUs to which engines can be attached
> to, resulting in having to have a set of contexts for each one.
>=20
> Patches should be applied in order. The first patch is needed
> so that the kernel doesn't attempt to use a context device
> attached to the wrong IOMMU when context stream IDs are present
> in the device tree. The other two patches have a compile time
> dependency.
>=20
> Thanks,
> Mikko
>=20
> Mikko Perttunen (3):
>   gpu: host1x: Select context device based on attached IOMMU
>   dt-bindings: Add Host1x context stream IDs on Tegra234
>   arm64: tegra: Add context isolation domains on Tegra234
>=20
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 19 +++++++++++++++++++
>  drivers/gpu/drm/tegra/uapi.c             |  2 +-
>  drivers/gpu/host1x/context.c             |  5 +++++
>  include/dt-bindings/memory/tegra234-mc.h | 10 ++++++++++
>  include/linux/host1x.h                   |  1 +
>  5 files changed, 36 insertions(+), 1 deletion(-)

All three patches applied.

Thanks,
Thierry

--qlPgB3ZnVYKZSLq1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmMjFhYACgkQ3SOs138+
s6HuFg//Zw+zHuUSSm2nTYZM6Nq/HlNb6b2B3jroN+sSGvNVUhChrpiN/Jl4dJDV
T9bO7qYmz5iQ3wKbfGoVwqGtOvuvAy40v2qAljSTd8iFLPDmwWWM8cVL4x83V2Hh
Rg44v6yBJ+lKg8AEoKcLbd00VuwwLyrXl4cKBHyTmR3Mk9Rr4xj5dvAyeb6uwZun
xC2w3jBzBZeaSZRJSqx57TN8mlULvr8MUaM2agQN2jUQ4EObNdZyW3NfLsjh88HT
unYtWlJlWbYmsADPx63JCG16KiQ6no9rqNrq4R5TWdZpTo5rDrc1wENKJKdRe5Ua
ciOmOcI9RRYOCi+13XxDHb4jVttrIfdw7dafCDFv1RjtQ0EzGnBshpe60E6p4Tqx
/bgzfgkEkM4W730Bf0eDbGGc1xmvS1oWae010GxTMQVyx4U74yAMCjP+VubatlLy
CItmx+zyANZxUc/4NXfO0m7ItR64L9IBGMRsuvrQbGqx65Yk9MOPYDTNggGCNm9R
nGi4ipdqv1MsJPavzjTW+DxoFuvb0uq0ldS2HaO9nAM67xSspRf+tKGFuyZcPZZd
C0BPqB9U8Z5WhQk0xiMXUhOjIlxP96UX3vgca5DGi2thQWaAcvBduKaQG5WryQvg
2ZTZNGNPTSmU0ciTeXQ007/bMWfRtgD2HxyLDC8bEDmwFnG4j8s=
=ZApN
-----END PGP SIGNATURE-----

--qlPgB3ZnVYKZSLq1--
