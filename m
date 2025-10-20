Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91729EAF9
	for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 19:36:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760988969; cv=none; b=QtCeO5dQkH0KBJPVzDf3+rB8y2AE2J6BCtARPg1qXjwRQ4+JsDkt9wTSIXeCeX9kKo16Af/fYmtURwxb0U6hnL8hkagBdWRNBGtQ1u6q9Q1RYQ9RhHQMH0CeeobjmKXL9Ea9USv4U6PLyiM03HLVG4eB1IbrgS3/eZ+MxOjn2yI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760988969; c=relaxed/simple;
	bh=1badgIiNTAPNpkcfawu2PFSrOUn1RLnP9k+lZMeoVE4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=swPnk8Tk8Z0YTzoK6iG5Ttf9QKakWrEXtBi5eiq5lRo34ygmXgGiE00jUYwdtgO68aT4fE4iuGLzEKMrCFHlq1ynP3c0RVVmBGlEFw7r7a45SV8PJ3tA2uidghvWRWOXacfslf8+Ql5z7eIVkth2rlqkNaNA04fTfwUBocz3n1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WSK81WXg; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WSK81WXg"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-59093864727so5606599e87.3
        for <linux-tegra@vger.kernel.org>; Mon, 20 Oct 2025 12:36:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760988966; x=1761593766; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2EQCZF24uyYd+K66ud5iMJvTJa8EJgzNd81qWfpbtzM=;
        b=WSK81WXgktshiOyYie0L2ydU9rH/CPH8uS6owYfRq+C11GxEnbl0E1xlnqDYCPf4wo
         de3RB9HIwnay+QRTrVoGCZn8S4QgLLZ6bsOHVyUgq7exSAcBGGDomC27GgnRCrks51uj
         VaAqZ1ikuYKYUro8o4b+/4RBUdR0Sjsveq8CjWrMrHg6kEr/30mkBZGDaEUHERB5gmlg
         D3Z/KuW1YSjA98CVchCW5wYcE4ZlGPTpUy1lNOlVYfDsPj54ccHQV209/vXll/BtG4mQ
         zwyWrkIDMgt6IMaal2oEj5avaA8ReU7z5eIyS27zW/8GNCctkepd1KSwFL5pBauRo3Ud
         15hQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760988966; x=1761593766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2EQCZF24uyYd+K66ud5iMJvTJa8EJgzNd81qWfpbtzM=;
        b=c86EccjrKAbVbjj8IjEyvsL7EkM7uvrLA6XjplOKjTLmNSqh8GKY4P8Rhm+3KSqZIi
         NE7YiM6nrci9l/F+5pOpzVDXlvPX26iyTrjvzyjOj0zjmz4NrNFp8F2Gar7zzdXs2ILW
         zcUWUzGSc58/lrJqoMS9blNhp5Onx8thRNhBvJFluKznmenWeWqqpmOmIEH5Zu1JbSFW
         pa0GZtXe8MN0fHBfaXal19hnk41Gr7xus/xtLW7UqK3VW5xPYEpiliT86WliXQGa3s/F
         lLfr3M7uTVKt6iZ+HVUeh9npQcb3gxIiiYJz2GqL/Jy+wiWPWkBOHjKzOasiekCc4uK/
         KBKg==
X-Forwarded-Encrypted: i=1; AJvYcCU+/BA66HREoceI2Z0v6Y+vRQCP5dT8RHSwoq6INyD2npzrxVVPiWWB/1Y+6W8YVXORDVc7GrtefASTpg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyxmtZDBcM+9Wjnkvx3KtgNe60wekhx1vU7arcehPcxuEXifEIc
	XM7QctJ12v+FywquSgs4kfNYh920iwSrTBTTXBPeMI2cKJkVuW9gFwT3ZoIbCU83NdvATf9WcaD
	znPWI18OUtjHXqfxXOIxM4qMGSHeNSe4=
X-Gm-Gg: ASbGncumUE0ahcHFBxMVajjfRLroe69fnCVLbLYdaivmJrISrh/N0zd39caeADyg32a
	BH6v13SZa+rhRiHjMO75BMOZd2N4Pk/zIbo9AD6FiZJZjzsPBwokU6adx2ggJl7vR3bT4klHL7p
	wYWWMrds30ZwqsbtqnhCZXN/MAt4q0VkQYZA39f4DOvo9U9t6CE/p8n0pGcdCtpY0r8Boz210Xk
	UUoDA9G2J/M25IqC/CW1aC42wRiXUVh/aBNrOk7pbHrUvSSErdu9+5UquS/JJ+gzkeDM0W/agzI
	GxRzyGGyKQCw8ubz/g==
X-Google-Smtp-Source: AGHT+IGJf1d7OGOI2bEsOsRKUAzUwqlW11kyu2gHkb5eSm8a2k5NOCXXslI+k5uFUiRwdMzagVbTM2EzHHMJP+MrdtU=
X-Received: by 2002:a05:6512:3b0c:b0:57a:310:66a8 with SMTP id
 2adb3069b0e04-591d85773ffmr4241105e87.55.1760988965463; Mon, 20 Oct 2025
 12:36:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
In-Reply-To: <20250816-tegra210-media-enable-v1-1-bdb1c2554f0d@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 20 Oct 2025 14:35:54 -0500
X-Gm-Features: AS18NWDrjImObZLOKx397rQyb3hlXNjedT2Ykb-TqO4MVmOUlln0IpbJiO75nUI
Message-ID: <CALHNRZ_KcJmoUp68a1NZau_KAMRczNbtiQ3cbXi7ET-vO=9uhw@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable NVDEC and NVENC on Tegra210
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 16, 2025 at 1:03=E2=80=AFAM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The other engines are already enabled, finish filling out the media
> engine nodes and power domains.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210.dtsi | 28 ++++++++++++++++++++++++++=
--
>  1 file changed, 26 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210.dtsi b/arch/arm64/boot/d=
ts/nvidia/tegra210.dtsi
> index 402b0ede1472af625d9d9e811f5af306d436cc98..80d7571d0350205b080bcf48b=
8b8e2c1b93227f2 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> +++ b/arch/arm64/boot/dts/nvidia/tegra210.dtsi
> @@ -277,13 +277,25 @@ dsib: dsi@54400000 {
>                 nvdec@54480000 {
>                         compatible =3D "nvidia,tegra210-nvdec";
>                         reg =3D <0x0 0x54480000 0x0 0x00040000>;
> -                       status =3D "disabled";
> +                       clocks =3D <&tegra_car TEGRA210_CLK_NVDEC>;
> +                       clock-names =3D "nvdec";
> +                       resets =3D <&tegra_car 194>;
> +                       reset-names =3D "nvdec";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_NVDEC>;
> +                       power-domains =3D <&pd_nvdec>;
>                 };
>
>                 nvenc@544c0000 {
>                         compatible =3D "nvidia,tegra210-nvenc";
>                         reg =3D <0x0 0x544c0000 0x0 0x00040000>;
> -                       status =3D "disabled";
> +                       clocks =3D <&tegra_car TEGRA210_CLK_NVENC>;
> +                       clock-names =3D "nvenc";
> +                       resets =3D <&tegra_car 219>;
> +                       reset-names =3D "nvenc";
> +
> +                       iommus =3D <&mc TEGRA_SWGROUP_NVENC>;
> +                       power-domains =3D <&pd_nvenc>;
>                 };
>
>                 tsec@54500000 {
> @@ -894,6 +906,18 @@ pd_audio: aud {
>                                 #power-domain-cells =3D <0>;
>                         };
>
> +                       pd_nvenc: mpe {
> +                               clocks =3D <&tegra_car TEGRA210_CLK_NVENC=
>;
> +                               resets =3D <&tegra_car 219>;
> +                               #power-domain-cells =3D <0>;
> +                       };
> +
> +                       pd_nvdec: nvdec {
> +                               clocks =3D <&tegra_car TEGRA210_CLK_NVDEC=
>;
> +                               resets =3D <&tegra_car 194>;
> +                               #power-domain-cells =3D <0>;
> +                       };
> +
>                         pd_sor: sor {
>                                 clocks =3D <&tegra_car TEGRA210_CLK_SOR0>=
,
>                                          <&tegra_car TEGRA210_CLK_SOR1>,
>
> ---
> base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
> change-id: 20250814-tegra210-media-enable-576bb6a34b5c
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Reminder to review or pick up this patch.

Aaron
