Return-Path: <linux-tegra-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F9F7EB64D9
	for <linux-tegra@archiver.kernel.org>; Fri,  7 Jul 2023 13:00:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231616AbjGGNA3 (ORCPT <rfc822;linux-tegra@archiver.kernel.org>);
        Fri, 7 Jul 2023 09:00:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229458AbjGGNA3 (ORCPT
        <rfc822;linux-tegra@vger.kernel.org>); Fri, 7 Jul 2023 09:00:29 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37BF610EC;
        Fri,  7 Jul 2023 06:00:24 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-3fbc0609cd6so19031995e9.1;
        Fri, 07 Jul 2023 06:00:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688734822; x=1691326822;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S0tEyMRY0wJEgL0LRi5OxuCMsiSdYV1eK+Ww5nubhkc=;
        b=I9E8fq5cJrGGHhxKAersMUIKvUxWnFGxAKbQFCzGy8emJHCFncKks7Sfc3unVQTXD2
         lG1x5Mo6K4iwvAWMWHHbOI/urz7WJsy5s5mxpaMLN8BK/udjLURTUxeeHK0GWswXPmwP
         Nyq32vkeIQR97oKY5y6dViHppujxfR+3/iYfw+eIPd2XI9lhVLfolU4lzUubFEOHJfc5
         Y5YZ4VQrP8VGJ91b4a0cfeGjsOodD/s7eNTSjVelKw4qUV389Onrch/ilBsjCeBVVe34
         7WFgVizaIHAz/TrC09nHZJXZ8HYebzPeN8GFaBvZEZNXeaNmQ3vd4B6sqVs5eJcfWVYh
         rzsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688734822; x=1691326822;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S0tEyMRY0wJEgL0LRi5OxuCMsiSdYV1eK+Ww5nubhkc=;
        b=VkkJNb0wL37NUaNhNJAud2glVM5HJo+2c9ZDnVFbjCsrtoE7Y9Z75XJG0IT/LwxdaB
         U6SCtx30onmETarG1PjfY307guilUPzwNW2GS76maUyPvo2WMCPfG1MZonHioSpyKupF
         YdliyiZzc4ymHF/xBbJYzOoWn+6Awhhwjb93CrB4L4aG1NolhMOtn4gBQivrqITx2ROV
         gk/2kISPRzNtsJ5X2SFPCdr8UG/WNeL9gSQkEokhaybFA6F8XjkmUrj/OFSAIrJQ6Jtc
         lxeGcx8w/jqqtCkTf461w+Ey0Q7J8k0rkTTGoZvoXSMdVqkqMNuPrp4G/LEWpWicvxwG
         6AJw==
X-Gm-Message-State: ABy/qLaI2izcDqpYvUvWGPlLrmc6MchfrvhwC6ywBDnr84YrcBX1cfbi
        DTR7KrFFFito3T7SdTr5XdE=
X-Google-Smtp-Source: APBJJlGb2G1eIpAgNIPsNZYiwtVXCyK9aq49QJPYhf5vHmH7mdsk6bKNhVt+ix/h16rZveqHcwjXoA==
X-Received: by 2002:a05:600c:cc:b0:3fb:b53c:1a32 with SMTP id u12-20020a05600c00cc00b003fbb53c1a32mr3765656wmm.34.1688734822340;
        Fri, 07 Jul 2023 06:00:22 -0700 (PDT)
Received: from orome (p200300e41f4b7100f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4b:7100:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 10-20020a05600c22ca00b003f9b155b148sm2397838wmg.34.2023.07.07.06.00.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Jul 2023 06:00:21 -0700 (PDT)
Date:   Fri, 7 Jul 2023 15:00:20 +0200
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Gautham Srinivasan <gauthams@nvidia.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: tegra: Enable soctherm for Orin Nano Devkit
Message-ID: <ZKgMZEpE0Y_h6MJ-@orome>
References: <20230706005545.1813584-1-gauthams@nvidia.com>
 <20230706005545.1813584-2-gauthams@nvidia.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rU0G3spu97e5FvdA"
Content-Disposition: inline
In-Reply-To: <20230706005545.1813584-2-gauthams@nvidia.com>
User-Agent: Mutt/2.2.10 (2023-03-25)
Precedence: bulk
List-ID: <linux-tegra.vger.kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org


--rU0G3spu97e5FvdA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 06, 2023 at 12:55:45AM +0000, Gautham Srinivasan wrote:
> Enable soctherm for Orin Nano Devkit. This is needed for the CPU
> fan to operate.
>=20
> Signed-off-by: Gautham Srinivasan <gauthams@nvidia.com>
> ---
>  .../arm64/boot/dts/nvidia/tegra234-p3767.dtsi | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi b/arch/arm64/=
boot/dts/nvidia/tegra234-p3767.dtsi
> index a8aa6e7d8fbc..cb76b08e15b9 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra234-p3767.dtsi
> @@ -98,6 +98,12 @@
>  		vin-supply =3D <&vdd_5v0_sys>;
>  	};
> =20
> +	bpmp {
> +		thermal {
> +			status =3D "okay";
> +		};
> +	};

I cannot find where we set status =3D "disabled" for this node and given
that status =3D "okay" is the default, there doesn't seem to be any reason
to set this.

>  	thermal-zones {
>  		tj-thermal {
>  			polling-delay =3D <1000>;
> @@ -118,5 +124,37 @@
>  				};
>  			};
>  		};
> +
> +		cpu-thermal {
> +			status =3D "okay";
> +		};
> +
> +		gpu-thermal {
> +			status =3D "okay";
> +		};
> +
> +		cv0-thermal {
> +			status =3D "okay";
> +		};
> +
> +		cv1-thermal {
> +			status =3D "okay";
> +		};
> +
> +		cv2-thermal {
> +			status =3D "okay";
> +		};
> +
> +		soc0-thermal {
> +			status =3D "okay";
> +		};
> +
> +		soc1-thermal {
> +			status =3D "okay";
> +		};
> +
> +		soc2-thermal {
> +			status =3D "okay";
> +		};

Why are these needed? Previous discussions concluded that we don't want
to use any of these for monitoring temperatures because they are too
fine-grained for fan control.

I guess it could make sense to enable all of these so that they can be
monitored using sysfs if that's something we want, but in that case it
might be better to enable them in the top-level tegra234.dtsi.

Thierry

--rU0G3spu97e5FvdA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmSoDGEACgkQ3SOs138+
s6EtQhAAj9e5ncxw4XyB1m7IPClAHJI4J+5BX/r9y/AMVmMzsUXUm+ujtfSInosB
CiTOdQgSQCFTfIOCOPrO+6lv8ToJA4i0ci3IY5k/w+gM0r5eJLh0ZLSY/ToxTlgr
Y654zcdpYFQ5eowRqnInDL7tdjxCYtZwgWBwyzuWf9vmbXHg5k6tniqU458SU7CD
Qi3VW9Trhl8TmvrnC6T3mS1WDYAEqgIWsyOV0Iel2TRAyZBFduB/C6KX73eESls3
73w2IQgfeg3KsCt9pnluPc7ANN+WiS1NLtdZuBTaDzthqtQ2HUq7VQVq8HR8/Nlz
xtuIuNiwipockS9AbOzWaW8xw9m0dUQ40T38PbS6cEpSOxZX5gZ412yCqFLsR7sI
XnnBIb8yuixHM84ue5cu/q3FhkND0QARswTZwUw6SWlgf0ZjAUmIk64QEKqoL02R
/Sp1h/E/FUXxI60s8WGBNK0pCCcETkvjKvnn2k41IjwRy14zUv6HOwVjjpGN1jHD
YJhc4EAeqlFQcY0FW7V0Uwu/QrjRonIfqIoG5SKkZoBJKiS6qlXbm/M1byZvyrZg
8hZa7zGzFTeApfoVDSkeo0pwZ8jdvRQHj6uljOhi/MiPpLCsozp048nSw+rbeJS8
nqxp4JUpn1KofMFvmTduHL1qywVohcGTC6uhy5Qew3RuC98BL4U=
=aTvL
-----END PGP SIGNATURE-----

--rU0G3spu97e5FvdA--
