Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E4781C46CA1
	for <linux-tegra@archiver.kernel.org>; Wed, 11 Oct 2023 20:28:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233427AbjJKU20 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Wed, 11 Oct 2023 16:28:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233308AbjJKU2Z (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Wed, 11 Oct 2023 16:28:25 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 836B891;
        Wed, 11 Oct 2023 13:28:24 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-9ad8a822508so41229766b.0;
        Wed, 11 Oct 2023 13:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697056103; x=1697660903; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ajiQCZsbPOI0YVqPS5NSWxeb5/T72xImtw2yRB9hN9k=;
        b=WzoWJ/4m1DH6nOHkQheDn5r/b2dKJa3Ovi1inoyw0t8++90GehjF/W4ZV2QuBY2tJM
         C85ztAaamM23j5qXEsO411iKJMUioDkzBK6iRXyI3eWQxUvV30lNHRwnbrZK+a5M1Gb3
         lAZj0QdsbVliohR+QdQnFtlMiMQ3krneoxTL5/0oBUvXcGt7FfIn6r5+5RpKJP6+1t31
         699x9XwT7xQ5klPVPgwBqIbVEkjkINAt0LMhrPRywUeVLvRhVppx0R3ijGZJr6dFD7Nd
         U081D1DPi4dbpFm8Z0RbrXVUlMCuBomligPrjacF//3DM55SsvtiZDfVa1UAnLs5p4BG
         pznQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697056103; x=1697660903;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ajiQCZsbPOI0YVqPS5NSWxeb5/T72xImtw2yRB9hN9k=;
        b=CoPb5AThpLG3IoXsrO5LUngOtbx1oHvOya4y4XOEjVHT8lVTujUWxXUFWtnIgVCW/S
         isO8VxB3RlHXsmmlbSRFAdjW9Fq4MOOLnwryhtzdbaChL2o4uprt/FKjhvDEDZaSmDb0
         v86TjhAASJjs+UuUlC9YjY7ZMtCT8IXUqRfxi0B2JbXADFnjJArSyMCEGzWML3T6QCva
         7NfCBpFFMXQ9lsYdJRR0TzuonJ/p3csAFnUPFdBHTeIzHYwQg6imFH/wOXd9Sn00YYEr
         Jp2h9t+wPljhgamglXzpuYEfyJdKWVGIq8Bq18x9Pxt5JQ6/hknogp5sIr5XuDVBd4io
         zNAw==
X-Gm-Message-State: AOJu0YwkKF9Szr575F1XseW1N4y5nFqUlb653TKkIMzY/vo3fXFf1jBK
        kr0R4vF5eEIoz00BowyBHDs=
X-Google-Smtp-Source: AGHT+IFFQ8ncd4Z5mbljFmPQ7aeVjaaJ6rr4oIOM3eHCQt79sUIbGntX4Z20sf1OIwTbFuY8d23Zqw==
X-Received: by 2002:a17:906:3116:b0:9a9:e4ba:2da7 with SMTP id 22-20020a170906311600b009a9e4ba2da7mr20212190ejx.49.1697056102522;
        Wed, 11 Oct 2023 13:28:22 -0700 (PDT)
Received: from orome.fritz.box (p200300e41f3f4900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3f:4900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id kb4-20020a1709070f8400b009adc81bb544sm10192307ejc.106.2023.10.11.13.28.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 13:28:22 -0700 (PDT)
Date:   Wed, 11 Oct 2023 22:28:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-tegra@vger.kernel.org
Subject: Re: [PATCH V5 0/4] hwmon: ina3221: Add selective summation support
Message-ID: <ZScFZDZlTcqwjEJP@orome.fritz.box>
References: <20230929103650.86074-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="CiujI+6zDegS36sT"
Content-Disposition: inline
In-Reply-To: <20230929103650.86074-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--CiujI+6zDegS36sT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 29, 2023 at 11:36:46AM +0100, Jon Hunter wrote:
> The current INA3221 driver always sums the shunt voltage for all enabled
> channels regardless of the shunt-resistor used for each channel. Summing
> the shunt-voltage for channels is only meaningful if the shunt resistor
> is the same for each channel. This series adds device-tree support to
> allow which channels are summed in device-tree.
>=20
> Changes since V4:
> - Moved dt-binding comment added in V4 from patch #2 to patch #1.
>=20
> Changes since V3:
> - Added missing descriptions for new structure members that was reported
>   by the kernel-test-bot.
> - Added comment in the ina3221 dt-binding doc example to explain why we
>   need to explicitly disable channels.
> - Added more commentary in the commit message for the new DT property
>   to explain that this property does not change the behaviour of the
>   driver unless it is populated.
>=20
> Changes since V2:
> - Added note to binding-doc to indicate that input channels must be
>   explicitly disabled.
> - Corrected ordering of properties in the binding-doc
> - Updated license for the binding-doc to be dual licensed.
> - Changed newly added property from 'summation-bypass' to
>   summation-disable'.
> - Documented type for the new 'summation-disable' property.
> - Corrected spelling and comments as per the feedback received.
> - Used debugfs instead of sysfs for exposing the 'summation-disable'
>   status for each input channel.
> - Populated missing instances for the ina3221 device for Tegra234
>   boards.
> - Populated ina219 device for the NVIDIA IGX board (not strictly
>   related to this series but related to populating all
>   power-sensors for Tegra234 boards)
>=20
> Changes since V1:
> - Added yaml conversion patch for binding-doc
> - Added binding-doc documentation patch for new property
> - Added patch to populate ina3221 devices for Tegra234.
>=20
> Jon Hunter (2):
>   dt-bindings: hwmon: ina3221: Add ti,summation-disable
>   arm64: tegra: Add power-sensors for Tegra234 boards
>=20
> Ninad Malwade (2):
>   dt-bindings: hwmon: ina3221: Convert to json-schema
>   hwmon: ina3221: Add support for channel summation disable

Jean, Guenter,

do you mind if I pick up patches 1, 2 and 4 into the Tegra tree? It's
usually convenient to keep the DT bindings and DT additions in the same
tree for validation.

Thanks,
Thierry

--CiujI+6zDegS36sT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmUnBWQACgkQ3SOs138+
s6H2Iw//b21u/DRkKk+i/7IngdxzNLH0SzEnEPuQED1vF2TjviBmHCOC2PWh6v3K
JQEePa77FmCG6L46tHZ+kMpnh3mqe+Fce4GhxvsYAHIga8sBGHkM2Kzjpt1/P/a9
OgpHYh/UJoBxRst+dBqgD3ajG8iokGbezr3kDorHX7Lcc7JBdJeai72La8oky62v
kLrCPCOYGYBqFDYa/dMqX5tlsS/U1q5bRijNZXxD5miBb3sk2dW30r8BdfDKR0mQ
SRXdeJYjFTaM1HmrzvoYeZjXMGJxrDXl3akZCA8tTwkPb7S8L/vcHE2ywpVb8IKH
Wx4aB81qMwOJy8/zUs8RdrLe7vAauPn89cnPtxJmg1X4enKrj5PGmMu056eLTQCH
MjdfCpj1tW6COX1iXU0lYLCPyGPEeMAmrxvS7FqhMKm6Az8s3EB9fOJgE5BQcBgl
jxWPPmQWC35EHGIh1U30VP1ZrOsZyn5xJiDOtnf4Ksy0MeyU9m+9IDgJYCx7zL3U
4rf5fXXWRZU1HdgNs9VoDSfEeMF9Iv+5jFow1A94x1M9F7mjpbkMpkLkmFQGKth7
aMnwc/pHoTi9KnmEZRzOynA3tvjKfozQLCc1/LxqDey5NycqGn+iMnTL7qz+FXld
fjZURu2bo7k8i38nAScMFY0aS3WBqUYqu3N2RcoMSNmYIOHJxuk=
=WDbc
-----END PGP SIGNATURE-----

--CiujI+6zDegS36sT--
