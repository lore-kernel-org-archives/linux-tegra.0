Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22A8BEB64DC
	for <linux-tegra@archiver.kernel.org>; Fri, 14 Jul 2023 14:41:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236090AbjGNOlN (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 14 Jul 2023 10:41:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52962 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235868AbjGNOlM (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>);
        Fri, 14 Jul 2023 10:41:12 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 51655199;
        Fri, 14 Jul 2023 07:41:11 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id 2adb3069b0e04-4fbf1f6c771so3417820e87.1;
        Fri, 14 Jul 2023 07:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689345669; x=1691937669;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0GFXfG3reo7gZmpmqaifVMD9Ywczi+5KahuamZ75Qpg=;
        b=VCgUkwRqEbzs14mdFc+Eo5FqElEi3oBLzDQoHowUxSn/jhAjEZIYlY922deghucoRC
         elwcnbxB0d9FyX88KpFgf6EmnWrjuLhhtd09UgQUiMAAPQ02WHYf65OAL3S5s/hDKny+
         3zLmTRn0g5botKmHQGiR6nHjcVREop33+HOznl2qgK1SObbvLk9W8jtVaTCwKbNciiTk
         yM9Y4vu3se/JkDIZyglyyLGSV0f097LPvN1ToubjFwum5MN2Hbao8CxHSSAdSMoGrByi
         EqEaCmJyW1FJDW2edk1NSj5NWUfkXdSs4Ng6rWPsMZ1BpJBjhiB4+e8/WCCgO3uEmfrk
         S/FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689345669; x=1691937669;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0GFXfG3reo7gZmpmqaifVMD9Ywczi+5KahuamZ75Qpg=;
        b=kr90OXeVhDMzugKELEyBXUY6P8BZWfy++36n6jVWbHmYzxUtlKMbAtfaNLvJqMUoTR
         JfhSqbIxErAlNKnniwmagQPEz5sqz3bk9yoepzvl2T6sS9vWPPCXS665CSoQ3vU64u95
         8M+TS7xnTSJiudkTYQTxMK9XePW03HiWj9peFJ0q5LZYk21iiAgeCF+S1i3j3XiDrH0p
         TVs9xSkUI1tZFLwQ30CCk+u9/Kczh83wqvw+xFyeHRgnAui35HYqLlIWlM+7OXZqbPBL
         VwoZeUlGCtrF9yeHFwTm8PtrQaTW4ROFA3RZVz1XBPYWWbj7S+4ihSOuR7JkXX7K9U7i
         JaDA==
X-Gm-Message-State: ABy/qLZx5H47dlxWg0ddfQY04+ITYLo5qngPETbu9sdcIt2HlD95Jue8
        SlIOx26PM5XIceAmAhdKsJI=
X-Google-Smtp-Source: APBJJlHJfBwBpIkWUdrLrSvuoRBoGZo/KBX3W5nddA5FjzV6g/OIV3r95WAn/szGCOGWVYQU3FBm9Q==
X-Received: by 2002:a05:6512:3d22:b0:4f8:5dd2:21f5 with SMTP id d34-20020a0565123d2200b004f85dd221f5mr4457777lfv.67.1689345669276;
        Fri, 14 Jul 2023 07:41:09 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id bc7-20020a056402204700b0051df5eefa20sm5824445edb.76.2023.07.14.07.41.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jul 2023 07:41:08 -0700 (PDT)
Date:   Fri, 14 Jul 2023 16:41:07 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, jonathanh@nvidia.com,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix HSUART for Smaug
Message-ID: <ZLFeg0-DICAD2-Di@orome>
References: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="Gu3ptV3TIHutmV5J"
Content-Disposition: inline
In-Reply-To: <20230714101018.10617-1-diogo.ivo@tecnico.ulisboa.pt>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--Gu3ptV3TIHutmV5J
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:10:17AM +0100, Diogo Ivo wrote:
> After commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") was applied, the HSUART failed to probe and the following
> error is seen:
>=20
>  serial-tegra 70006300.serial: Couldn't get the reset
>  serial-tegra: probe of 70006300.serial failed with error -2
>=20
> Commit 71de0a054d0e ("arm64: tegra: Drop serial clock-names and
> reset-names") is correct because the "reset-names" property is not
> needed for 8250 UARTs. However, the "reset-names" is required for the
> HSUART and should have been populated as part of commit a63c0cd83720c
> ("arm64: dts: tegra: smaug: Add Bluetooth node") that enabled the HSUART
> for the Pixel C. Fix this by populating the "reset-names" property for
> the HSUART on the Pixel C.
>=20
> Fixes: a63c0cd83720 ("arm64: dts: tegra: smaug: Add Bluetooth node")
> Signed-off-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-smaug.dts | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts b/arch/arm64/b=
oot/dts/nvidia/tegra210-smaug.dts
> index 2c608d645642..bcb533cc002c 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-smaug.dts
> @@ -1364,6 +1364,7 @@ serial@70006000 {
> =20
>  	uartd: serial@70006300 {
>  		compatible =3D "nvidia,tegra30-hsuart";
> +		reset-names =3D "serial";
>  		status =3D "okay";
> =20
>  		bluetooth {

FWIW, we need to do this for a whole bunch of devices. I've got a local
patch for all the cases that allows schema validation. I'll pull in your
patch and then rebase mine on top and send it out.

Thanks,
Thierry

--Gu3ptV3TIHutmV5J
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSxXoMACgkQ3SOs138+
s6H/PRAApwqB0Fcc1rUEw82k4uiqOP6c92Vaz0JWj9oLmYmb7gq4qf5ci1rM7B71
jHDlzPqOk8s7I5M9ZV679M5FSgRscUlIkrh98mtZ3XGG5d4EZj29g7wTHHy5+Lki
GYnUUFnpkqhRhzA75ZKgvcSlxguf52U/Ki1NMZ/Y76f0fp5YMOv5FKsYgbViOI8n
HS46C78AGnCi2wsVK5Ygj1+aK8DiRFFED07ehJ+dTuq+gMpc7CmJJ9G0G+0vvxWC
ukhTOTlerZPnzw95hNgilE13DQ3+OWMQMEsXWlfdX2riiA6NqrYmZ1dCkuULNY6o
fXkIoVL8l3FAsuapLBUcjxcKQiXIY4fvfwhQoLaGAIYZ7GhMo2PRWg2iYFMZ3001
4MyxpoT7usVR8CEVCfYbTtL1UaQUAj6g7Y/zKFkhwbJVwkK4MqQTeNNGscV9ruQ7
gKT7KFPpT/OCRUiBvH4K5+Uuthis71vY+YlpnxJMUTVC68cgv+0FEiVhWrMsVbIr
3fi4qUoNsZzFa4rHNh+std224mZJf6Rt2ehcjP/ePI6lbGYErn8em9dQXUp9FnOG
c17KOKsFJutboOywTAXrGBQJdRr4pEnPH+GYPk1cVd8CXEeBlLxofNjkj7QjykAQ
9EJcVQs3rjTUHHBlayPakMoFJ1BdKKcSk0M3QnsxYNoP7zugaJE=
=rdgP
-----END PGP SIGNATURE-----

--Gu3ptV3TIHutmV5J--
