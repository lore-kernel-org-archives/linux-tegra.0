Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89EAFC54EAA
	for <linux-tegra@archiver.kernel.org>; Fri, 27 Jan 2023 16:22:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233708AbjA0QW0 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 27 Jan 2023 11:22:26 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230257AbjA0QWZ (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 27 Jan 2023 11:22:25 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DDD2B44B;
        Fri, 27 Jan 2023 08:22:24 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id ss4so15057641ejb.11;
        Fri, 27 Jan 2023 08:22:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y4OTyOhq5ph49i2Sy9LKLfnqL2EM/Rj+cmCGMdBMlfw=;
        b=gDkOvsj4AhTDhnfA/Kn+Keq9CFS5AmQp8SUXAJ8gb48RU0fjRQwfo+R08Yjx5rfp1u
         A0+zAslnSpWmUaMoOsonoenmeLthUY3aJ85PiRMUJ3JikBfOfHSsg9h2OLphc5w5uW1G
         smtHqMYI10XofhnqWSpYG4io9JpXpHwf/tJIGIp91dC2N7Roby/nC/lGjc/Uf1EzOZnv
         2kBwYZjEoVF60meKfDKkqC3UofRq8moWDuKJODsTVVUEtuW/tIhvkhN7SnO6RR8LMzfb
         hbdno94WAfN+nSO597u2TwnM1bLVaCczr/KSZpRefNZfHscCnTGfd4iVuB0T/meWU05x
         lsLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y4OTyOhq5ph49i2Sy9LKLfnqL2EM/Rj+cmCGMdBMlfw=;
        b=VpNiXw0Bxtvzsqub2J0cYZvNVhNYaUPhk+x9n06LkD5pW7RmT6bJmU1tOV8Ty+J21x
         XNnf4V3P8q18Jxi5O12TwDOQnQ2k65tDhOBvHMP2w5CD1ScVcL6c8D3MwgFA/HeP5EPf
         43QIjDLx1muPa906E+/A0wEjtMqSuRQ9sI+sUENPWVS7Bq18RJyn4sTIppgEqCGOtWzb
         nnepxPNnIJLyTF0ImX9/k/18YTb4pabQ5hl0thqa1TvKaJaBXUR10lmrMmeI0iXwwgJo
         MLwRMcxS6fIYgmtZiDpM0DF/x/6/pxiwp1aA9n6n+SzVx93HkQYlzNXGyQPrhHVspmcV
         d5cQ==
X-Gm-Message-State: AFqh2kon1La2xBwsKJbiqJQkYR2RCl0V5dtZyjTASG8EfObwwqfPc23q
        17haSKAQjt1u6iAwBtLHJfQ=
X-Google-Smtp-Source: AMrXdXt2OhjgoI53tjT3nvzAVMGrKi73ulioqKoNtQWBcgvgIEJFCLLgKNEfR5QSlEe4xYwFMFtj4g==
X-Received: by 2002:a17:907:6c16:b0:86f:3dfa:4016 with SMTP id rl22-20020a1709076c1600b0086f3dfa4016mr47989890ejc.7.1674836542928;
        Fri, 27 Jan 2023 08:22:22 -0800 (PST)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ja23-20020a170907989700b00872c0bccab2sm2524552ejc.35.2023.01.27.08.22.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 08:22:22 -0800 (PST)
Date:   Fri, 27 Jan 2023 17:22:20 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-phy@lists.infradead.org, waynec@nvidia.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH V6 2/6] dt-bindings: phy: tegra-xusb: Add support for
 Tegra234
Message-ID: <Y9P6PJ9xPVst/um2@orome>
References: <20230111110450.24617-1-jonathanh@nvidia.com>
 <20230111110450.24617-3-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="b0gkupGM8zWoxRNZ"
Content-Disposition: inline
In-Reply-To: <20230111110450.24617-3-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--b0gkupGM8zWoxRNZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 11, 2023 at 11:04:46AM +0000, Jon Hunter wrote:
> Add the compatible string for the Tegra234 XUSB PHY.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> V5 -> V6: Added Krzysztof's ACK=20
> V3 -> V5: Fixed compatible string
> V3 -> V4: Added patch
>=20
>  .../devicetree/bindings/phy/nvidia,tegra194-xusb-padctl.yaml  | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Hi Vinod,

can you pick this up into your tree? This applies on top of the
conversion patch ("dt-bindings: phy: tegra-xusb: Convert to
json-schema") that's aready in your next branch.

Thanks,
Thierry

--b0gkupGM8zWoxRNZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmPT+jwACgkQ3SOs138+
s6EmYA/9FJsPyQ6dWaqhDXMyzc1HR5Pr1gLqJZksMN7R4k/xvryrwbYCO19IfrD0
gilOAeiniIpxcKV4CMr0dvMGI/o9UbrAOcxE85oP2sBiLiUhBQ0QEAFKAQskQOOl
o8r422cr/CJYDC9OAW1xITSvuWwamJAec7n/lqyYvWr4urMlsT6mDZEpNlKCVfNQ
lQSfQcN7mnGjzKwycbt5GMVpupDhPRvmNLSVUey6owxULZBdcrPC0b/K5hVElX6o
rWAkcwh77s3nhwJuPOrREIhnyNBiK3K8x5FM6ncP6l9ndlTHQU4yFVyze0jFPH8c
QQaFAPTn/axKu+mSZxjUK3OEsGy+ybAplBivH6pY3qEX6D2oYUJ4Ie6Jx1GqGPzh
Nkv914gkdMfmB4HdaQOELyYseKrLaEmy6AmTNMOpumKv0/8ucV/19s+cqdLWNlOh
ELjd4CLeOzvYxpA0u1OlOBLNEeBHeg3KY0C9ted8q1RJSOnxLzF4C1ujj+0kFp8U
/zp6FoLkbchfc50rIxLszh9hfRcyoG25H3jXYDY1xenxhv4Iba5sAILts5/IvI9c
ZyenKl3sU/pyQDrv8DhFJluIJotQ606moVk1PxJhRv0Yt34Eaa6+TNszezcPnPWU
kkEf5UXWBofFCYl0f8XVqcFDGmo0tdYTfbi4pK6RSEehe100xVI=
=wD/W
-----END PGP SIGNATURE-----

--b0gkupGM8zWoxRNZ--
