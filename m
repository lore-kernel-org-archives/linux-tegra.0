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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4D0C433E0
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D21DD23A03
	for <linux-tegra@archiver.kernel.org>; Thu, 21 Jan 2021 19:19:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726427AbhAUTTI (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Thu, 21 Jan 2021 14:19:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726943AbhAUTJy (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Thu, 21 Jan 2021 14:09:54 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA31EC06178C;
        Thu, 21 Jan 2021 11:00:19 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id c128so2423112wme.2;
        Thu, 21 Jan 2021 11:00:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=d/ziHaJ/3CRX+7Ak8L6tc/6XTy9kd0cfBe4hNikwO/c=;
        b=AoVItIzETjxlFlcIaNNnp30X8ff2ER7nSIMY/AvIZ2B2/uFpej8ETL7uEvOaAkfbVV
         xHuYDlnUevhdF9zBT5pXI11pKCwQoAnq5XHhIJFBtcPGf9SG0nsWuYrpmPmUFwgHya+N
         B/OTLb9xCcfViUiALg0skecxp4H+NE7uhwf5H0gtfZkp5rBj4Ts2yymTagIErt/bAGCy
         OpeQuqHj3DewMioI7mM2iRYLVWnM5TuYGRD7k8oHr67uWiR6AiohOO2/TlOZmAO9T3CD
         xbfzUrH8q82nxOMgd4fC44JltYsnjVTopVA/k/DxPWEUnY4auWMIoraSw7SyoGXlvA0i
         QvXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=d/ziHaJ/3CRX+7Ak8L6tc/6XTy9kd0cfBe4hNikwO/c=;
        b=sUwjbcvU3aJzZ8hecxJIiZ4MKQ1h/roAfmWlHzzGgZ8R8CfSRrAsTqEZAQ0rUqy4wz
         8gHADxB6Cdujt+IoaaITZqIPk8hfNdog0lRUY9pnwG1yqCpFwOIl2kFULbwygx2XrFUN
         5k9yUokrd2YTC7RZ0tCOiRGem9arEEEGIZWrNoj4h2zSN8AuApxbUlQJxAd3ttOcvg9n
         4hAZ0jO92o6Ulxh2NFmb0Q7DayhNiMqd6nIobLjk7apKg5BpcSS0QHSWnyIoTdwm9o/p
         S4cKRH95jdHalUXo1Bvl6B085U9Fxb79C0r1bzB0eM+mvYPWkAlF2bphs79uOwXN1pru
         NQ6g==
X-Gm-Message-State: AOAM532i2+EqGwqYar8kWsv9bsWY6HcBuP8W6cgafHhk0+53IK0peTNj
        KkWeIucjnHxp0QuuYJCGimA=
X-Google-Smtp-Source: ABdhPJxgZ/IjwFq4Y/En1Jx4MO2W/E1hS4TJTyXYAdVydizAYJvZO0e/z5E1QRunLxKU368UllRi1Q==
X-Received: by 2002:a05:600c:4ed3:: with SMTP id g19mr674158wmq.95.1611255618587;
        Thu, 21 Jan 2021 11:00:18 -0800 (PST)
Received: from localhost ([62.96.65.119])
        by smtp.gmail.com with ESMTPSA id w4sm8901051wmc.13.2021.01.21.11.00.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jan 2021 11:00:17 -0800 (PST)
Date:   Thu, 21 Jan 2021 20:00:16 +0100
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Sameer Pujar <spujar@nvidia.com>
Cc:     broonie@kernel.org, robh+dt@kernel.org, jonathanh@nvidia.com,
        kuninori.morimoto.gx@renesas.com, alsa-devel@alsa-project.org,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
        linux-kernel@vger.kernel.org, sharadg@nvidia.com
Subject: Re: [RESEND PATCH v6 5/6] arm64: tegra: Audio graph header for
 Tegra210
Message-ID: <YAnPQO2BZKxnvnZU@ulmo>
References: <1611048496-24650-1-git-send-email-spujar@nvidia.com>
 <1611048496-24650-6-git-send-email-spujar@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mqXVJD2aWFFDAbPm"
Content-Disposition: inline
In-Reply-To: <1611048496-24650-6-git-send-email-spujar@nvidia.com>
User-Agent: Mutt/2.0.4 (26f41dd1) (2020-12-30)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--mqXVJD2aWFFDAbPm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 19, 2021 at 02:58:15PM +0530, Sameer Pujar wrote:
> Expose a header which describes DT bindings required to use audio-graph
> based sound card. All Tegra210 based platforms can include this header
> and add platform specific information. Currently, from SoC point of view,
> all links are exposed for ADMAIF, AHUB, I2S and DMIC components.
>=20
> Signed-off-by: Sameer Pujar <spujar@nvidia.com>
> Reviewed-by: Jon Hunter <jonathanh@nvidia.com>
> ---
>  .../boot/dts/nvidia/tegra210-audio-graph.dtsi      | 153 +++++++++++++++=
++++++
>  1 file changed, 153 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/nvidia/tegra210-audio-graph.dtsi

Applied, thanks.

Thierry

--mqXVJD2aWFFDAbPm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmAJz0AACgkQ3SOs138+
s6FQ+xAAh5sFlbnqM8oTZQFjZluJrD7PLbFf2es+YGmrReDA5xAJXmlq1AhaaGiq
bjsm9rKGYbE7TYu9kfoNBpx5p4zKChGqstucZAoKuMfrcJlgyyD+s7oj0OVVIyjz
TRHfCZFcvZfjK3IaR1Ik5u8ZzkfKvPsaSOeGQuUoMnlyCoEuMJk/PhbwDF2F7f72
ZKH8qDRbXwy8AtibLAG8zqs68RLnh87WgRktXpd/DcHHmWrGM8Gy3/tdCAL/p3Fa
YX5kt/DhyzCcQAo6QH47QCXtwopLo/0tL60MuYgCYbnf0nAsov32w2x+aV2GvN7l
8FHdCfLFIDuQOuyoJgD5cpURS3ydWyWN2FdPOEqEak2kkS14DXePs9/aWr7Nmr1W
ChlUDh2aw9VgmOsp3EGQO3YzcCYu4RQnBaEUw9sGukEy6uZ853Cqa2S+euBou9rY
R9KjuQh4f6eeKuYxJ3vOdoooYi7nlphIejc94o19wnNu7riAy0XopLjcPyTVYypz
vLsHgMhnSsOcb7Zwc5W1DRxL5gGU90dOSChBnNCTsxeiIYRbmK1YXeBNy7gtbI0R
7Yhj5yvd+sSbfTzJNZvrg5rdh3QHXZpMICGJW0SQXmyovDLwTkNpy5Tc6YltOOv6
+F873C2UDSoeGnbRz2wFvpaX/lZI1mbhD5EyyZe7txKRP6eYHTo=
=74uA
-----END PGP SIGNATURE-----

--mqXVJD2aWFFDAbPm--
