Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22F9BC433FE
	for <linux-tegra@archiver.kernel.org>; Thu,  9 Dec 2021 17:05:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242270AbhLIRJS (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 9 Dec 2021 12:09:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242235AbhLIRI4 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Thu, 9 Dec 2021 12:08:56 -0500
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D86A3C061746;
        Thu,  9 Dec 2021 09:05:21 -0800 (PST)
Received: by mail-wm1-x331.google.com with SMTP id i8-20020a7bc948000000b0030db7b70b6bso7090086wml.1;
        Thu, 09 Dec 2021 09:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YqY/Y36nXcnj0bmkcGqXt5odfnaC2cWWt6zNOtJHecw=;
        b=JEn70dHkk4UGqm1bO7AhcbwtdSFUulNuKtlYw404qwMY2RnRVzmxJHUt4bvpZGzatR
         yeEPqBcitY8ZgWe9I9hq/9940XMfQiSzVCxEOG3lovIUAwRyxhBocRwpW4nA8I2UkTdO
         anOJEWNOLz14uBGteSnA7fer+DAO5oXMzmuMmM+pL5iRyap+PLZV+WiR6muTwQhoIkqq
         zR5O9QSrWm9Qt87KNgMNMc/WiWta4EdctCgHFVy+A3w5Tsug3xQbLj/XN62Tz/TlR/4I
         plEMtqKXo5kzwKRF6W1HoPgUHUjqsND8Nw14g6yuQS5Hago4Mnlz22DMYo7luSHpcZFO
         NDvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YqY/Y36nXcnj0bmkcGqXt5odfnaC2cWWt6zNOtJHecw=;
        b=JtxqLdRFcvBFG2qlte358GKmzujm+l9dJoD4lWpcWYhldEZVL4DI81687sob3pwPKL
         PSn3hOVuAxHFFYastIXbSm4B/GkDNtqfzC/4muJIvJvpms57+FHX/kr8PkihbaYVuTg6
         MGmiqafsT4l4m4zHLX83Abc65ZXQyeKlJu0SkE3oq3DjYDsJxV4H1mDP0ZaLULnwYOz+
         lePQsUl5n0ahFV/92KrYwVk8i9m/9RU35rBsI0BdPNix/1Og7SsUeCU/6xYk0wT0dxwg
         Zz5YUyQWkZg6AbdOhj7Spc0TZxMmpf61Pw3WaaMpB+5aS9AUe8bWXpxoWKWtgJIr073x
         31HA==
X-Gm-Message-State: AOAM532msqRPuxLlIrqg8sKD9akojudWsOvsqCHOQOlilcpk0o3P3IjB
        JLmY5SlWg1zTs4L6eO4/HU/F0GxNfNHK6A==
X-Google-Smtp-Source: ABdhPJwFlRONBq4Ke5B+KpYrSHsniHurKGp/RPdO6J2HJusKRyF9sUnLJz8uKGTu10oYnYe1Yjz8fg==
X-Received: by 2002:a05:600c:a05:: with SMTP id z5mr8629491wmp.73.1639069520429;
        Thu, 09 Dec 2021 09:05:20 -0800 (PST)
Received: from orome ([193.209.96.43])
        by smtp.gmail.com with ESMTPSA id d2sm376253wmb.31.2021.12.09.09.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Dec 2021 09:05:19 -0800 (PST)
Date:   Thu, 9 Dec 2021 18:05:17 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Jon Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 00/16] dt-bindings: Convert Tegra DT bindings to
 json-schema
Message-ID: <YbI3TUt7+n5RFc45@orome>
References: <20211119143839.1950739-1-thierry.reding@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5mg27+ET2m9wbqHW"
Content-Disposition: inline
In-Reply-To: <20211119143839.1950739-1-thierry.reding@gmail.com>
User-Agent: Mutt/2.1.3 (987dde4c) (2021-09-10)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--5mg27+ET2m9wbqHW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 19, 2021 at 03:38:23PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> Hi,
>=20
> this set of patches converts some Tegra-specific DT bindings to
> json-schema and, where appropriate, adds Tegra234 compatible strings.
> The goal is to prepare existing schemas to allow validation of the
> existing Tegra234 device tree files.
>=20
> I've got a follow-up series that adds more Tegra234 support and will
> extend/convert bindings along the way to keep things validatable.
>=20
> Rob, since all of these are Tegra-specific and given that I have some
> follow-up work based on these, I think it'd be best if I picked these
> up into the Tegra tree once you're happy with them.
>=20
> Changes in v2:
> - address various linting and validation warnings
> - add patch for BPMP thermal bindings
>=20
> Thierry
>=20
> Thierry Reding (16):
>   dt-bindings: misc: Convert Tegra MISC to json-schema
>   dt-bindings: mmc: tegra: Convert to json-schema
>   dt-bindings: mailbox: tegra: Convert to json-schema
>   dt-bindings: mailbox: tegra: Document Tegra234 HSP
>   dt-bindings: rtc: tegra: Convert to json-schema
>   dt-bindings: rtc: tegra: Document Tegra234 RTC
>   dt-bindings: fuse: tegra: Convert to json-schema
>   dt-bindings: fuse: tegra: Document Tegra234 FUSE
>   dt-bindings: mmc: tegra: Document Tegra234 SDHCI
>   dt-bindings: serial: 8250: Document Tegra234 UART
>   dt-bindings: tegra: pmc: Convert to json-schema
>   dt-bindings: firmware: tegra: Convert to json-schema
>   dt-bindings: i2c: tegra-bpmp: Convert to json-schema
>   dt-bindings: thermal: tegra186-bpmp: Convert to json-schema
>   dt-bindings: serial: tegra-tcu: Convert to json-schema
>   dt-bindings: serial: Document Tegra234 TCU

Hi Rob,

you applied v3 of patch 13 in this series that I sent separately but had
reviewed or acked all the others. Do you want to pick these up yourself,
or should I take them in via the Tegra tree? If you'd rather pick them
up yourself I can resend the remainder of the series.

Sorry, splitting up the patches like that was probably more confusing
than it was worth it.

Thierry

--5mg27+ET2m9wbqHW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmGyN0kACgkQ3SOs138+
s6HZyA//S23kGthCzbfunD84j7m6ft1ISheHG5coyaanaQOFCq9hPEWt9QDXJ5ij
joMv8aQusYcOv69XB/ZUNler3LPx2hGK10TDZUAXl/vQoHKsrFLgzqjEQGOkMBno
cwF7SzMFdOkIPtn38QEG9Cr8wq6m2qNKNOUzn5zRU8lfe57wLaMDJ0WmL+Xphm3E
38VTGs+VNC87YLnhUF/6lv3KsssQ5+5s4WhtCcFxKDmq8bKcIVksttuOpQpblUPt
MuIZiHqYrax04I2yd76PYzDtgLw6gQTQWPo1Ckla+5XNUUb3YlDOhKRtLGOuP4As
H6sbeDC4vlmnoqRgJaowy4ckIO/mvwlsQPe+zr53bnVOyUuFO/sDXoH0uIeRk6Hn
SuwzKspIHqbGfRc4JkD8y9f1R5ZCET6EwSV1fdv4z8H1kqxj8WBcmj6zLbmk2aVx
4KdhVrZPu3eWPOu/vaAFzb+GtgQBCiui6INv4tFe8IOeXRf297uvLkvg9n1Emfe1
GcU4ZZrDO2OjrbWOh9Hrl6m+rSItPBxf1aYTsES9JzwDoS6D1k49vLcsikOti0lz
5mIBAF8WgSzztvGgFr/pkRHOEP3VSmZDB1QMz+tdylofoHEXyUWsVXLlx1J2gD44
4KQqYjlX9dOiiZ32QkLZhyICgescA5gkgPdsgg+iGkaUyMKEoF8=
=C2pU
-----END PGP SIGNATURE-----

--5mg27+ET2m9wbqHW--
