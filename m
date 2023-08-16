Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33C8AC04E69
	for <linux-tegra@archiver.kernel.org>; Wed, 16 Aug 2023 16:31:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243166AbjHPQbZ (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 16 Aug 2023 12:31:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344643AbjHPQax (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 16 Aug 2023 12:30:53 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1E2242721;
        Wed, 16 Aug 2023 09:30:46 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3fe501e0b4cso63606965e9.1;
        Wed, 16 Aug 2023 09:30:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692203444; x=1692808244;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kN+/MeWwb4xpyLHn6J6eExwJrjsTOcWApW30IeVPEqo=;
        b=px18AA6rYs7asy6SZqAwcVWO2kdW9bWI1E18BeawL6K2gYWLBSOEvLDxiE1e+3Oq4q
         kaw9kAyEHr36j6GFxFRQclT5nZN3PIA3+7TG7gjxNdwhPYTBBOb1eha7BOk55m5fX61/
         4BeGvElhHfRkc9Tx9FsqX+HNQri3Ma8egTDbds/45FnaIOT1eqyTGPoUrPTutBx+GGrj
         EsVMXIAxQ2jJGHMhKWKXyEUJ2KQo+XmGdtRopAm+DKFAz0rWW1cP3vhFEa/TsVzZPtd6
         k7wcBbSXUi+2q5aN6C+AoRNt/xwlInOPmVhMSYv5O5SdWnStUW7Hjk/A9aKGU15inySX
         4l2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692203444; x=1692808244;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kN+/MeWwb4xpyLHn6J6eExwJrjsTOcWApW30IeVPEqo=;
        b=AOFQ2HzGW8pDoO0/911s1FiHJZnvlQ2GB6THOzOr2O0zf6c9eU+JoGURkYaw2V0iop
         8m/s70qkGXE0cke0rVXA/FWsSlaT+XPH7slGTJZ+kO0rEWKxQ23RBPx6F7miAsvUm91D
         yt90HK7A2xeC9rrL9ByCa8VaUefkB/rJULWkveVBOuhnrVgm+g3pKfgq+BT/M0zl0Tm4
         FCzOCb4y7gL7G728ls63pGKobG6PnnnqLLWdx4Oo5DMf8cUjobc5Jadn9BjWOmgLrIcZ
         NmNImGcTCGPyCugDAeIxsrPzMcXZUTFMxCXA5cmUzlBV4gc6YKGz0hkGGYZ2tbdqluhk
         Lvjg==
X-Gm-Message-State: AOJu0YyntUoVTMPYZXe4WPm6PBJmJUqpalnmfzYaJjKp3glEPEGtfb1y
        UMQopXwUMhdDDyU/XFkV+AM=
X-Google-Smtp-Source: AGHT+IGJxLxNKFbkcjYlH3/0w0o58okKgCPkAfNoXD1GcC5Lf+eBFktxv5QzHgtRkwknyJtdjrqFuQ==
X-Received: by 2002:a05:600c:1d10:b0:3fe:6f7:60aa with SMTP id l16-20020a05600c1d1000b003fe06f760aamr1839716wms.12.1692203444134;
        Wed, 16 Aug 2023 09:30:44 -0700 (PDT)
Received: from orome (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id l6-20020adff486000000b003143867d2ebsm21884755wro.63.2023.08.16.09.30.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Aug 2023 09:30:43 -0700 (PDT)
Date:   Wed, 16 Aug 2023 18:30:41 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     neil.armstrong@linaro.org, sam@ravnborg.org, airlied@gmail.com,
        daniel@ffwll.ch, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3 0/5] Add JDI LPM102A188A display panel support
Message-ID: <ZNz5sSnxs_E8p_4J@orome>
References: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="elwzFP/2q1XL9FhM"
Content-Disposition: inline
In-Reply-To: <20230807133307.27456-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--elwzFP/2q1XL9FhM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 07, 2023 at 02:33:00PM +0100, Diogo Ivo wrote:
> Hello,
>=20
> These patches add support for the JDI LPM102A188A display panel,
> found in the Google Pixel C.
>=20
> Patch 1 adds the DT bindings for the panel.
>=20
> Patch 2 adds the panel driver, which is based on the downstream
> kernel driver published by Google and developed by Sean Paul.
>=20
> Patches 3-5 add DT nodes for the regulator, backlight controller and
> display panel.=20
>=20
> The first version of this patch series can be found at:
> https://lore.kernel.org/all/20220929170502.1034040-1-diogo.ivo@tecnico.ul=
isboa.pt/
>=20
> The first submission of v2 can be found at:
> https://lore.kernel.org/all/20221025153746.101278-1-diogo.ivo@tecnico.uli=
sboa.pt/
>=20
> Changes in v2:
>  - Patch 1: remove touchscreen reset gpio property
>  - Patch 2: clear register based on its value rather than a DT property
>  - Patch 3: tune backlight delay values
>  - Patch 4: add generic node names, remove underscores
>=20
> Changes in v3:
>  - Patch 1: add Reviewed-by
>  - Patch 2: fix error handling, remove enabled/prepared booleans, add
>    dc/dc setting
>  - Patches 3-5: Split previous patch 3 into three different patches,
>    each adding a separate node=20
>  - removed previous patch 2 pertaining to Tegra DSI reset as it was upstr=
eamed
>=20
> Diogo Ivo (5):
>   dt-bindings: display: Add bindings for JDI LPM102A188A
>   drm/panel: Add driver for JDI LPM102A188A
>   arm64: dts: smaug: Add DSI/CSI regulator
>   arm64: dts: smaug: Add backlight node
>   arm64: dts: smaug: Add display panel node

I've picked up patches 3-5 into the Tegra tree and I assume the other
two will go in through drm-misc?

Thierry

--elwzFP/2q1XL9FhM
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmTc+bEACgkQ3SOs138+
s6GQZhAAidv6lMphxvbthO7t7ZsPU2NIAu7pQuMyhMa5O7ht7k+R//LlxBUBcHHL
eIJz+muY0+DWC43XsM90TZGSIKXBaUlfo9kvHiqWCuu3BAW56csYDKGgaocwzhml
0hCJ8nEo0N2dKa/stZvsk5ZPKj7HWp71eB6zyqeoPh3Ljv616NJ7WC5/zbgtu4ay
pNtXnwYqI8Bai4fwd5cnNsL9gqn++jCb91AG+7v8uSJ0uSg8M43nBi/crGbyKPys
58H8e6NqsogzdpjjJaC+bpTuZ7+4kjiuh/EHV30/TaTimeoyQ9BC8ibYJPXPHSn6
mQPo81hSH0Ps8AtfWZemxCYsFm/aN3LKm8M5dK+ciuDq+8fA1q0NTiU0w1x7FeVc
gx4+CfhBCUn4IFQfIZZ5FhFNj/SkPSqbDYKJ5wHHXMjqxdA8KipO4+Eq75NAM2b2
LvHhvQhDv336l+SGny+lkBl/d2UXba8cfmZFSjmlmGMjJwtkAD/Mv4q8aiutQNWM
shFsW44B40H9C1IDGJzcw4q3BtjjGLwlpw136D2CNhNuV3HzTgBEoF6YyQS83HID
iDLpc5zIaieR2AvOt47JuN9CmORny+AdYimRqde3zEKziLY90thIFXsjaJ6+HVUU
zb76G6jSl0g1pBoyK2cyye8NBEuUAep5r/wi/6Oiytu+IMOFySE=
=tplE
-----END PGP SIGNATURE-----

--elwzFP/2q1XL9FhM--
