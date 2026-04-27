Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A4C2AD35
	for <linux-tegra@vger.kernel.org>; Mon, 27 Apr 2026 06:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777270896; cv=pass; b=PusUxcY0ImMYXPlfFnQemNH/3RgXbg5R8DOQ9JIFC26jhIGJBsNOOYlCj2xDbL3Qo/BirJVNkN+oesDN2Klb/42+lNSM+OgXjl7oqjSAA2rje+LFI8ybeQp+fWtot/w5kJPidT6aW/dMKP3PrfgrUBP2vxtkGVCVwJSOF3iwKx4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777270896; c=relaxed/simple;
	bh=cJx4Ml0i3L/4hVMTEGvJHmi/r9RzSaVF+1uTD1zxi0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MqmIAf1WjfHZ6S6eJY6TBDAfAnK5CRJqdBdMNYupOaQoddj1AU8WU5e1O5RxES8ihI6yJatynYKWsFJy4Qkp+/IJ0vVoZbp9jRPQ4meov6113McSq4frYFidXNz7Hc1x7GJ53ZSRorR1PhYXyI8ohRMUGGRBARwn4kwxTb4lvvs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JT8mIdXC; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JT8mIdXC"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-48374014a77so128840405e9.3
        for <linux-tegra@vger.kernel.org>; Sun, 26 Apr 2026 23:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777270893; cv=none;
        d=google.com; s=arc-20240605;
        b=jbA5zsG6/K3BnJwNI+b2SJtwPnswbjR9k5mhct3IxdFXsu8F2UxfOnkHLAphu6eLl/
         RqZDIl5aZplGJB8IDLFkJiHBod6W8JJs1DoEYBYr9LhN4d4B2Sna95YNo65q/NtJG4M8
         x6hSvup2yFnWUP3qBXnx+paRqKAYafENjxwbDy4/1tuxqz5tNmCgz3NgbrYMLNBgOGZJ
         a+3Lb3mqIAlYflzo+wa7jTVAoyqNbPTfIfYNR0rK4HQFCtxsHXuATzHhL/2IzpYZ4wdg
         1JF5tf0v7PaCfQEDfpjH0rVwLPY9qvEgAIWx3/qrjS9v7DHUa+F2GjBF+1AlwpTwxCqE
         UgvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        fh=gwISWGW/RKRxWeV8N9ySoRbS3UACUZCzRV1mKTTmj0s=;
        b=cF/gZxG49nncdHeVUsCKN07ZRlKac41Fmm+0o4LH8NPw72sOkG8Vs0p00Mq45dWdL6
         IRMHfPZoZPTNH5hB1Lzeqx+uwT8zjDA5Ub0JZw3dYXXYSPXAFeRIsSP1F9o26X2IBG7E
         UyM53e1G1SBN2aI1TIIih/jTkC8exnZgd8IOlcXdVCNs2qSuGJQPYBfi0+9mzK0cKJgg
         KWSFdWDcLYAje6LwG0P5AfaeLFojkkLl7BFL8sx0mmfVFbs+TlP1mTK/yraPoTaCeS8B
         qR+z587ALTJnWapfONlAVrQ93BdnY+iGSYLs9iANpr13G7MbotVJWXIf/oijIH2UlpBf
         xIsg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777270893; x=1777875693; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        b=JT8mIdXCyQoxPslYfAOKsy2ze0GoAHoXcGgpvYEbVtjPDG8qEbvmp6AwAUJF/IIU3D
         BQX47sE0KuepkVvoi9T5faY7UrbrVM28/Br/FChmuwfRWffs4f3kAKAnxV8PEyXHAN/U
         xpqe4fIqLfXkZ6d594GMoMVovJmFXXuLjbLQFJ5xKGkBbc73ZlSogXG5QRh3gPxV0qeH
         2VCokMAr4RyISO6CpPC97holDlCZt0dM+R4TJR78iJCD3PB8LHW1WtfLia/3TLc3dLi6
         p5uu0Pp/W9S8UVI9ncddSCuMgADXSY4fLq3BgT1walwxJ50LjODNvTf+guFfiw7doxps
         3hXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777270893; x=1777875693;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=26Nw5FMPOIdr6H5yY5vEPu6PrXUhZvl0rF4GQFiyc60=;
        b=Dw1sBqUc5l1v7lxLfRUK2qu67Xv1GOIW4N6d4jGcMLODCu7oKj6GOrZAjkiPpzaieJ
         /U8D/3Dtfl2w1uCB8dqJ9ieNVZ3wPGVOEeBKHjWCwIP3YQ9P46ki2XqXKbwWfitYnWk0
         oJTZpazmnMQ+fLiQ8Br2rvOZi0JaUfE/i/H3sBElGS8K4W8YI7xaqgUgu9JfynrQIE4e
         qov6tqmFEh1ymf9LMa17SJMQmniqDB7LT2jMtL55owTN4peN6YR3i9O7A1x64lIGCUNf
         8Vsicggs4pZ1QVy2TE6B/TaxBuk2DTUxXRwweNp2HkBKgZSoDZTJ10ZbtaSwybPEb+h9
         rhPA==
X-Forwarded-Encrypted: i=1; AFNElJ9dGO1un42Wk9Gcq6X9z8lq+kNEtsaIsr9iTXQPsYv/UIgizfzUD2I+KD8qWF/sJccGmxAVf1uweY+BOQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yya4dzv6brjbeYg0oxjUzV1Vtf68cCa8f5neHiQ+ZoKBfmdtfpL
	quapYZUR6RLI6SMdQdw954UQ9otYqF1S5obTOjeiHrNx411ZdnoK1pEjIHlDyAiAFq835t9Jm58
	ax4DVGx3pZ3wOvJEs0DwpCM+8ny5zcEo=
X-Gm-Gg: AeBDies47eV3eeeK/ax+VU1ZvnqUSYhKpXTmZ9sKv4WG4BDNVXhNNjUY8z9Ny82llzo
	NYkWfuaob6ry4StXMsA1S9KVS0fW4N/deqGXszY4LdmeZbkhIHZjJsOLX4tpF8yLAkmuAldQspB
	sOOtIyJS5m1zUQpReacitA3CGAVIBDOFuKRn/eH+owee5pp9SHWWAhzViosKNt9jBPgDbvmAW1e
	4Wz0QPeup1g7N3HJxAjfvdy8MOgcg1gt4TP8d9a4z3SUzpO/3NKP6/S+NCFWkX5tQ+98W0dXFIA
	BHfcmdgYDt7GuHgyOy8=
X-Received: by 2002:a5d:5f82:0:b0:43d:7d6f:f540 with SMTP id
 ffacd0b85a97d-43fe3e237d3mr67161314f8f.45.1777270892625; Sun, 26 Apr 2026
 23:21:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260406083404.31359-1-clamor95@gmail.com>
In-Reply-To: <20260406083404.31359-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 27 Apr 2026 09:21:21 +0300
X-Gm-Features: AVHnY4LZgxzaEN3NV5oR0MAlVNP7HdThFbK1ln2A3qtcWIQrHlR3mniE5zkfnow
Message-ID: <CAPVz0n0--Y5PGM_DDw549fWTu+z9COLmGHAM-a_ysx1vD1HYuQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/9] ARM: tegra: complete a few Tegra30 device trees
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 6 =D0=BA=D0=B2=D1=96=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:34=
 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Configure camera support for ASUS Transformers, Google Nexus 7 and
> LG X3 devices. Fix RTC on LG X3 devices. Lower throttling temperature
> for LG P880. Add panel support for TF600T.
>
> Ion Agorria (1):
>   ARM: tegra: p880: Lower CPU thermal limit
>
> Svyatoslav Ryhel (8):
>   ARM: tegra: lg-x3: Complete video device graph
>   ARM: tegra: lg-x3: Set PMIC's RTC address
>   ARM: tegra: grouper: Add support for front camera
>   ARM: tegra: transformer: Add support for front camera
>   ARM: tegra: transformers: Add connector node for common trees
>   ARM: tegra: tf600t: Configure panel
>   ARM: tegra: tf600t: Drop backlight regulator
>   ARM: tegra: tf600t: Invert accelerometer calibration matrix
>
>  .../tegra20-asus-transformer-common.dtsi      |  22 ++-
>  .../tegra30-asus-nexus7-grouper-common.dtsi   | 128 ++++++++++++++
>  ...egra30-asus-nexus7-grouper-maxim-pmic.dtsi |   4 +-
>  .../tegra30-asus-nexus7-grouper-ti-pmic.dtsi  |   4 +-
>  .../boot/dts/nvidia/tegra30-asus-tf600t.dts   |  71 ++++++--
>  .../tegra30-asus-transformer-common.dtsi      | 159 +++++++++++++++++-
>  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts  |  41 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts  |  46 +++++
>  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi   | 157 +++++++++++++++--
>  9 files changed, 595 insertions(+), 37 deletions(-)
>
> --
> 2.51.0
>

Hello Thierry!

May you please pick these patch if you are fine with them when you
have some spare time? It is ok if they end up in the next.

Best regards,
Svyatoslav R.
