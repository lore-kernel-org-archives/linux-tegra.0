Return-Path: <linux-tegra-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 305A8C38A2D
	for <linux-tegra@archiver.kernel.org>; Mon, 24 Oct 2022 15:12:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232149AbiJXPMt (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Mon, 24 Oct 2022 11:12:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34982 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229828AbiJXPM1 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Mon, 24 Oct 2022 11:12:27 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E30991A208;
        Mon, 24 Oct 2022 06:49:42 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id z97so31446040ede.8;
        Mon, 24 Oct 2022 06:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Um6fnaXpZiNGoozY5O7gXcGXfv/SirCMtpElBWaRQrk=;
        b=IiSP1xqFuUzG4h3Cp7vT8wXyWgtZ29ddcmbmbQZR+SKY3Dox+w2212dO8xqV8ZNpMb
         XK6pOCzJPkTFGNo2wEG23VMhtf/JdZtGaCnfzuAM8Z+FElATM27i9z4+MGfCKV6kl0gl
         +T6fsZQ/uwu1o42YYy1W8mseOZHNz/qOzPjIG69sch+L0iQOiAZ020zoSo19tSsGjjQ9
         Rzlot/fUTyXrskC6wFJuSsL8YxWXhkxSz503GR7M8gCHFYOP9fhnlO0J8/gOdNfCv6NE
         63CWvxCdv2HwndSAWxs4Qkjl170bqNfDA9jF0uDKyMQGQiAJYff9Ze1VZXesqmayXozz
         28xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Um6fnaXpZiNGoozY5O7gXcGXfv/SirCMtpElBWaRQrk=;
        b=UwgjcBxDkLJvHB90T0b8E9smUV0dTU61jBCT2KV1AlG9tbb/c/Z0ocl5J8xBrSzQSB
         wGIhTIS0663FVXRZmDO8aK1rvYuxDRe4kFM+/vch1o6p8Fl0MtQ6B5bmYYRuTbhgFoi8
         zzicMBADSWgaQD29SqdJXFmuPzc1yHVHTVa7EGS2A9x5Bcq0pyW2rUKa2WfGeAnTdo+3
         KQXlSgwCVSmrj3CxqDr5Puu7avoOKW889Wy8n9dJhQ9Wssj5aYuiBJPRkVTdn6q1PmUQ
         gNS+AzjUvz3xbJN/0dP0ILZ8uZQz2+NpFmN/W7hznKDyAOFRh1J7efs0hzvGxv/kkuLS
         JG2Q==
X-Gm-Message-State: ACrzQf3RJTsPpw9BoVkUYVTdPtchOQ5ARp4i6+SdA41WrN4eaM2xkeR7
        Ur+rvRMTu0F++KTkN4zPQw2uMc93YUU=
X-Google-Smtp-Source: AMsMyM5S7wBzzYlk1b/MXtHZZm4vFo03coM0BiEqZdKMat/q/jvisGxXIKoGeThc7DvbRHnSVI8cJw==
X-Received: by 2002:a17:906:5daa:b0:791:8933:f9f0 with SMTP id n10-20020a1709065daa00b007918933f9f0mr27209510ejv.335.1666618446100;
        Mon, 24 Oct 2022 06:34:06 -0700 (PDT)
Received: from orome (p200300e41f201d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f20:1d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id qu16-20020a170907111000b00780982d77d1sm15504223ejb.154.2022.10.24.06.34.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 06:34:04 -0700 (PDT)
Date:   Mon, 24 Oct 2022 15:34:03 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Jon Hunter <jonathanh@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64: tegra: Populate Tegra234 PWMs
Message-ID: <Y1aUS8KK4Uy8q/9E@orome>
References: <20221019132903.157703-1-jonathanh@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rKW4eG27OkPb0QHe"
Content-Disposition: inline
In-Reply-To: <20221019132903.157703-1-jonathanh@nvidia.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rKW4eG27OkPb0QHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 19, 2022 at 02:29:02PM +0100, Jon Hunter wrote:
> Populate all the PWM devices for Tegra234. Finally, update the
> compatible string for the existing 'pwm1' node to just be 'tegra194-pwm'
> and remove the fallback to 'tegra186-pwm', which aligns with the
> binding documentation.
>=20
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra234.dtsi | 80 +++++++++++++++++++++++-
>  1 file changed, 78 insertions(+), 2 deletions(-)

Both patches applied, thanks.

Thierry

--rKW4eG27OkPb0QHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmNWlEsACgkQ3SOs138+
s6FfuRAAo+wPAbadrPY4XREFIt7i+fPYEurG1EISxRyyRWBNRkJIQ3ELQP6ak20h
H+o+y0XvrCyuLKRIQYbnRR4BT0CvdiaRMpgcCcRXSDsvuiyMagIWBge7RHu+xPoL
skkDphqwqkfZWfo1YJyqKOnALoWbQd9j8LBEMsXq4qBuUh8i/uBD4sdSMJqExwpB
dRwyuLOWwUj+9IHxGvmgS98IhJ22+2DRcbVHTMKwBAK6voaY9+lrkU2qmmFLa9F4
1TvJeT/uSAbMHsL52oLDrwRNElBXYRdXPGPPKloVB2eiHmMd3cJAx3fNRlLTZ2l6
TsLfHmDf4WWj+nxWRWoGFJj6A8uR0whSd4rY7KGumjfE5HAQNRoAeA3RQb0VrGwC
n0ME8ePur0tpG52SEAxPspn50V80QZoK21sLnpQtlKiSd0EsSuk92tbjhCpDQSoZ
EM1blTvM+QfFmGpHFdEFEi6HcaRQL7us7KswQnzwKGjiIhGsh/m8fO7+RoqYdJnY
Z4wxm2m2IKyfIUM//Kxh79mlRR+mZqVe/ZQb4iN6zG4KgKXee6acjehNtJcrgD8R
o++jGMoDWT2SLFHtVE0TQwKIrmSTJzl/6WnSdnkgmX4/lVXJazQdo3K5uXpOwZoy
rN7p/TKoKcPmZNi/G06x9M+MVSRwyEsoQx8O8N0WfgrDXKMcHj4=
=ZgkW
-----END PGP SIGNATURE-----

--rKW4eG27OkPb0QHe--
