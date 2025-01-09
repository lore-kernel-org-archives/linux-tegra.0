Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76B774A1A;
	Thu,  9 Jan 2025 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736463278; cv=none; b=jqUPTbOZLS2Qpvy/0QdK+PP78Q7Qxc/6Cqkwbim7s0c+j7EfgKtTD6bK1a21GLypbvmXmW/rtRuO9jxwZ8P2Qq8NvZwemHSZUR0NuAOPjKvM2usP/rHkSveKZe1jmlqOa7NltUpNvALJy4eggiZKj0xZyGNYx3LuCW6YuPt+h1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736463278; c=relaxed/simple;
	bh=86eS17qLlvfqrKxaqobXK+iP+4uMsU62Gln9pxxozEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TCqb3AgTVb9K2fwlR9hiDMHUdUoeA9ojEjPDF//PEtSGs8KsjYHM0+q6M7tkz4o0ArUsgxRiVosuiGgkDJocdTwA2nybI4CkWr10+iuVyQhEGbgJLCqeO6A2otoSrvAQvAqyZTT2KxjYXDNsi1WvrzSV7RwPS1HWED8oPo1G4NI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UEzam1dX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UEzam1dX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D82FC4CED2;
	Thu,  9 Jan 2025 22:54:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736463278;
	bh=86eS17qLlvfqrKxaqobXK+iP+4uMsU62Gln9pxxozEQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=UEzam1dXGAeXOCMIiWcMXSxJcurtAJcKHcN/u/dv0z2I8CNvv42G+jWPcvQtnXkjM
	 AsQNO88cTeibiFrpO6sDGT60EMfCcFvAV/f7LsJW9ZMEGDQg7LsMUxcEExX8jekdJW
	 4yKh5FThcEJCV9HPN30amhkCqm4AMo8+LaqdaNB0itA3WBjYoGbb0fNHnBwDEZb5nh
	 YIzih78TqKB6K4IgdVrlD7eZaz+JSF56RsM0o7pMMeYO8z6gAmJlj3JOKEYrnIHui5
	 /OoyqkAeyk+Py8dPoTjGqBeoJ5yI31meRuqf9Ne4TuFJDuqZb7LI+P8rpt+AauRHg5
	 SYf3KBIXqtdvw==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e549a71dd3dso2670132276.0;
        Thu, 09 Jan 2025 14:54:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW9l8mO72fYFutGSzghNJgz7GvAEBNKMBOpdUqpGB9hPdcjegXn+mREXCo4f8dgro+cIIVe3Uwdy4oj8ms=@vger.kernel.org, AJvYcCXTuszCsILAVfx58404hxOhwlqNAIiMZLo/QcS3QiTOL+BF0I45ZTo+0Fsp0HDwJYrF0Oh9DDoTzu9UYH0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZ5/1H0vucQVuyQuZ6LddIg5LKsix+m77rgdVuCzIQQbEEAgwb
	CUpibKx98lw5SXo773prTa7MWYuvT8wcQngRmQuYBvRB2F3YmCtbfjUEJz2Lv5JL74e6n1r4LxI
	bv/zdisM6+9VwXzjmBh51G+pkgA==
X-Google-Smtp-Source: AGHT+IG5HG1/6CNvcuH1Keqm2doHJzzNVTXCdWaxY8J03PSbymHlzH+SWYuq5FCI7XWxCKruJYH2Ve4c5r24YnO9/RQ=
X-Received: by 2002:a05:6902:1b0f:b0:e54:a3c7:a313 with SMTP id
 3f1490d57ef6-e54edf415f3mr6643385276.9.1736463277233; Thu, 09 Jan 2025
 14:54:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241115193445.3619074-1-robh@kernel.org>
In-Reply-To: <20241115193445.3619074-1-robh@kernel.org>
From: Rob Herring <robh@kernel.org>
Date: Thu, 9 Jan 2025 16:54:26 -0600
X-Gmail-Original-Message-ID: <CAL_Jsq+9jNNF2yWCbSiiey2ubn2WAX8PdA69+cbXpWCDwPEm_Q@mail.gmail.com>
X-Gm-Features: AbW1kvZCPWZ0ePVuAp2wPpIypayv0F_QgNtby49jFmmImQegWdE-lffw2n8o7oc
Message-ID: <CAL_Jsq+9jNNF2yWCbSiiey2ubn2WAX8PdA69+cbXpWCDwPEm_Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: nvidia: Remove unused and undocumented
 "regulator-ramp-delay-scale" property
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 15, 2024 at 1:34=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
> Remove "regulator-ramp-delay-scale" property which is both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 10 ----------
>  1 file changed, 10 deletions(-)

Ping!

>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index c56824d7f4d8..0ecdd7243b2e 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -266,7 +266,6 @@ vdd_soc: sd0 {
>                                         regulator-max-microvolt =3D <1170=
000>;
>                                         regulator-enable-ramp-delay =3D <=
146>;
>                                         regulator-ramp-delay =3D <27500>;
> -                                       regulator-ramp-delay-scale =3D <3=
00>;
>                                         regulator-always-on;
>                                         regulator-boot-on;
>
> @@ -281,7 +280,6 @@ vdd_ddr: sd1 {
>                                         regulator-max-microvolt =3D <1150=
000>;
>                                         regulator-enable-ramp-delay =3D <=
176>;
>                                         regulator-ramp-delay =3D <27500>;
> -                                       regulator-ramp-delay-scale =3D <3=
00>;
>                                         regulator-always-on;
>                                         regulator-boot-on;
>
> @@ -296,7 +294,6 @@ vdd_pre: sd2 {
>                                         regulator-max-microvolt =3D <1350=
000>;
>                                         regulator-enable-ramp-delay =3D <=
176>;
>                                         regulator-ramp-delay =3D <27500>;
> -                                       regulator-ramp-delay-scale =3D <3=
50>;
>                                         regulator-always-on;
>                                         regulator-boot-on;
>
> @@ -311,7 +308,6 @@ vdd_1v8: sd3 {
>                                         regulator-max-microvolt =3D <1800=
000>;
>                                         regulator-enable-ramp-delay =3D <=
242>;
>                                         regulator-ramp-delay =3D <27500>;
> -                                       regulator-ramp-delay-scale =3D <3=
60>;
>                                         regulator-always-on;
>                                         regulator-boot-on;
>
> @@ -326,7 +322,6 @@ vdd_sys_1v2: ldo0 {
>                                         regulator-max-microvolt =3D <1200=
000>;
>                                         regulator-enable-ramp-delay =3D <=
26>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>                                         regulator-always-on;
>                                         regulator-boot-on;
>
> @@ -341,7 +336,6 @@ vdd_pex_1v05: ldo1 {
>                                         regulator-max-microvolt =3D <1050=
000>;
>                                         regulator-enable-ramp-delay =3D <=
22>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>
>                                         maxim,active-fps-source =3D <MAX7=
7620_FPS_SRC_NONE>;
>                                         maxim,active-fps-power-up-slot =
=3D <0>;
> @@ -354,7 +348,6 @@ vddio_sdmmc: ldo2 {
>                                         regulator-max-microvolt =3D <3300=
000>;
>                                         regulator-enable-ramp-delay =3D <=
62>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>
>                                         maxim,active-fps-source =3D <MAX7=
7620_FPS_SRC_NONE>;
>                                         maxim,active-fps-power-up-slot =
=3D <0>;
> @@ -371,7 +364,6 @@ vdd_rtc: ldo4 {
>                                         regulator-max-microvolt =3D <1100=
000>;
>                                         regulator-enable-ramp-delay =3D <=
22>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>                                         regulator-disable-active-discharg=
e;
>                                         regulator-always-on;
>                                         regulator-boot-on;
> @@ -395,7 +387,6 @@ avdd_1v05_pll: ldo7 {
>                                         regulator-max-microvolt =3D <1050=
000>;
>                                         regulator-enable-ramp-delay =3D <=
24>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>
>                                         maxim,active-fps-source =3D <MAX7=
7620_FPS_SRC_1>;
>                                         maxim,active-fps-power-up-slot =
=3D <3>;
> @@ -408,7 +399,6 @@ avdd_1v05: ldo8 {
>                                         regulator-max-microvolt =3D <1050=
000>;
>                                         regulator-enable-ramp-delay =3D <=
22>;
>                                         regulator-ramp-delay =3D <100000>=
;
> -                                       regulator-ramp-delay-scale =3D <2=
00>;
>
>                                         maxim,active-fps-source =3D <MAX7=
7620_FPS_SRC_1>;
>                                         maxim,active-fps-power-up-slot =
=3D <6>;
> --
> 2.45.2
>
