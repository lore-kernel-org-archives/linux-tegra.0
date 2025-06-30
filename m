Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21FFE1BC099;
	Mon, 30 Jun 2025 19:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751312164; cv=none; b=HIRMVUJlY/3xPA7nEHn1b0nEdYdOjSoBijq0BJXGa6Dtuh0UJ2AHStMWvRXDau/YSM75AFQsqc432A3UI1B25Bcd4FGa72sAMRnrc5+eHc0THorptPlU8i7HIFEPPafvINt1t3JBUMXkcXm3LildGz20k9tHFPMvqE0M5u5Q5Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751312164; c=relaxed/simple;
	bh=FOT+04yKygWQRm31Jgx4y+/kgvIodzq5eY815kDs0qE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJFPb60YrpEmsCPyDhyCv+Bcbzig15yXHri+KC5lJn/vZfUrcDtapxWK/Ek3QoQP3lEF5x69KDpR4o+gD2gjgGG7O8nFxAd4v7mnH1iCY+5F4hgM1roSTTxrnKgdFejoD/qG3szXlf4WPmC+deTHtkqhdkK9lUQJDb5z94s7MDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IL1Uvf6G; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IL1Uvf6G"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-553b51f5218so5033351e87.0;
        Mon, 30 Jun 2025 12:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751312161; x=1751916961; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTGe2122a4VtuzxAXlw8XXnbiXHTS1iBBm6tnzGbwBw=;
        b=IL1Uvf6GI/rWL+iDga8MwxJgbHzSfGTXV0ucAmarhkPCMzQ1Wlr8GJJuJEZJX8jF8M
         sR/I93GFsWrtlSwdxQDq+FeopA3cC8HH9v9/ts5Wi8zZa4xpW7brWBJ26hzxWfMI95q7
         mxds9odtNJLOxgg0O6HG+8ZyV2LJf+1oRgemU+Ji24IXjcACpuwF2fyTHTIy/dAmClQS
         ltuJgsG7yXpbOos3KlB/NDyA+EUqcNqzVYdODjd1S3ANoSZ9JWU3sAYJfaQ7byboxHCT
         iem+WwFm+DRYhy1/Ho+GdSprFEVXW6OtiHRQRyqpS4SlXVXdDCx/vW9eJfXZtF94rY/8
         vsaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751312161; x=1751916961;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DTGe2122a4VtuzxAXlw8XXnbiXHTS1iBBm6tnzGbwBw=;
        b=KvoBPeSNH1U2RJ0Xo8i6/VBcvL3Hp0rO6AeHssxmHhCMU/6VU+T6gGWkLI2j+eoxyl
         RPlnz+H9PEH4H4RTvhUJUdkLrFZuu0VTZ9YZezM7X0jMyz2+/y1IH8xETFncP3yFb4aG
         MsM6QqS7lZsl4f7eJ/926LD0SDXxawhJzVDlqGpbNglOAkGNsZxpO01bDqcBTu0dbvqq
         iZopPAp5ZhrmliaqKekHWCPtrubDbeX1kzsRYJ2u0ekfc8tNBKJRzvtQgaQgGPDFbvPO
         s69eVwvN3V8H48VV6XUUGh7Yn3rsnIVKMbpnnRzuLZK7L6eDO//oBEAw3bBNZOMqOhS+
         ML1w==
X-Forwarded-Encrypted: i=1; AJvYcCVayEwNfR5j22+Xm5Mb4yNnN7hUdRmzOWXig3/epCHsRyFGiw+UpuAVeZfLM0PsfhpGIoIkRhV9hF7L@vger.kernel.org, AJvYcCW33Gti9WYW6DkC4jk2nxRp+B0g+iSI7e+Iek4wAO668Y2ap5zvmNz1lGc8yUo5VInekKJEAEEIsH2WA/A=@vger.kernel.org, AJvYcCWUITBtY9wZctokp/wScW2uNSr0eUgIdjIYhAuErD3TgInA9fSOW5sec5hD+1vmwcRgU/ksQXOtq5ZmfHRS@vger.kernel.org
X-Gm-Message-State: AOJu0YxbHlawn23YJKYUumR5izlm3tdfM6YDRIXRTzIB+ND0sQjYraEc
	wVz7m7hef3A6QfhqfwHGiNX28w0CVqZt0M2xwnmbtKgmDDbcEJgXzfzksu8Avfbg/r6grwn9ice
	/XC3GH7uHpmQWEHRVeLZ5XUA7ae+231M=
X-Gm-Gg: ASbGnct7lav+70lK2syjj3lt7w1TiXz650pIveAFxvnb5AU1SpqqGGBEUlnmOdPBfri
	lrJyNsJPT/00yCdZ+iiYGuFdm0hrgIf9TPXwEqsVnW6jVqtFxS31DxcqOh39N3DqWUGPmr/yIwZ
	X62szraML6I4eoW5H5A2BGnUxHcEbrH6c0yF6mmjgNfB0=
X-Google-Smtp-Source: AGHT+IGvP6k++MV3STAMJzrC53fLNAqEskJs0/ySC86DyhBjE63P2oqMfs8p5nHBw2b85dLQ1SSt8zZDSUdzDqMF3Ys=
X-Received: by 2002:a05:6512:1105:b0:553:cfa8:dd31 with SMTP id
 2adb3069b0e04-5550b88f427mr4548643e87.24.1751312161081; Mon, 30 Jun 2025
 12:36:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com>
In-Reply-To: <20250526-p3450-otg-v1-1-acb80ca2dc63@gmail.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 14:35:50 -0500
X-Gm-Features: Ac12FXwUmul_Xg0oPGI0aVakSWdS1wT-Na22FrZKLw9t2QGcYkhkQzDUsGoG4NQ
Message-ID: <CALHNRZ-pE4EA=x-7LuJev60=aOwGt2eDf9mGVHWJ8SPGisBchg@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Set usb micro-b port to otg mode on P3450
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 26, 2025 at 8:22=E2=80=AFPM Aaron Kling via B4 Relay
<devnull+webgeek1234.gmail.com@kernel.org> wrote:
>
> From: Aaron Kling <webgeek1234@gmail.com>
>
> The usb micro-b port on p3450 is capable of otg and doesn't need
> hardcoded to peripheral. No other supported tegra device is set up like
> this, so align for consistency.
>
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts b/arch/ar=
m64/boot/dts/nvidia/tegra210-p3450-0000.dts
> index 0ecdd7243b2eb1abba9adbe9a404b226c29b85ef..019484a271c396edc30200e85=
92c713455a8e1a4 100644
> --- a/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> +++ b/arch/arm64/boot/dts/nvidia/tegra210-p3450-0000.dts
> @@ -514,7 +514,7 @@ pcie-6 {
>                 ports {
>                         usb2-0 {
>                                 status =3D "okay";
> -                               mode =3D "peripheral";
> +                               mode =3D "otg";
>                                 usb-role-switch;
>
>                                 vbus-supply =3D <&vdd_5v0_usb>;
>
> ---
> base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> change-id: 20250513-p3450-otg-b947f31843d8
>
> Best regards,
> --
> Aaron Kling <webgeek1234@gmail.com>

Friendly reminder about this patch.

Aaron
