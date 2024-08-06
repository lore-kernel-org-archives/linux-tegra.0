Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89AD41C9EA5;
	Tue,  6 Aug 2024 12:39:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947984; cv=none; b=mS+mzpOf/ewB1UsxX0Qg0UiK9zt+IJIdHeMBMSSGv8qUo+7/OxT2FKW34P07FaCa0IIGzQX6PJ7VyJ3qXwJqIW/y5DitmWmaKzSU4uSpPn6lgglBb4eSb2acpcveTzIcOeNTUxRvayAVlMyelXFHMcn8pYEuHDssNJRBD9JiwUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947984; c=relaxed/simple;
	bh=yPMDwHtB6xyMhjDEG6GPfVut3vH1K2hQubaFGpmcOJ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JVXFrGiRRnzeYt39Uua+zVikIvCtYIdpD6e+TQPWBmqiNsjE5iGIIuTokxJULcHnr/cN19nlJmVfIyRmjK/UC57vNj1OLSgMrSWKiNdN7JEZ6RUKfnnq8by6SgqDD5WS/L8iR91Fog49dFYSl/yeTyaiCR1moTrepokH4GAkEmM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UQ8SPXXw; arc=none smtp.client-ip=209.85.208.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UQ8SPXXw"
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-2ef2d96164aso6597761fa.3;
        Tue, 06 Aug 2024 05:39:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947981; x=1723552781; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ch4sivXa7WbxCan6nymUmIb/9rywiOLv8it/SNUMy/4=;
        b=UQ8SPXXwgLsp+R+KrsPzR11KmCxF7fPJS1X3651Y2B9Gas888EONF/TThpJ7lzU0Fb
         irlXNFqwx4+G7F6xXHTmkJdN1C9G7wE6+tjFYKJkzYwZpn+i5aKpWKgjF+cjUdgk0BXY
         d46rG2rMlH/xlvEXD2Fpool+LxKDtldDm56L2GG/mLaCm/XKqyAO6aRx4MHNV1jryVOi
         f+Qf+DDnMOs+eJUNoimqTH9UwLoVtgHQZ3hc+DSFGfZ73e0y6lIO90+KjZgRL/o7Ky6b
         H3c4npxAMIZ+uufxbsjZvLQlFkcFYsVFjRuxoiXawfMrs2cIGqOJvIAVFYUlAnC4wrdw
         eR9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947981; x=1723552781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ch4sivXa7WbxCan6nymUmIb/9rywiOLv8it/SNUMy/4=;
        b=XSIdgswj2g39ukjD4FuwZBqP58tpExQ3YD60dqgMxG/iFrIwCq1a6FDIiLlGxKr7Nd
         Q+uVVWDVV0n8Dymwmi07FBXHroeokC060enHHOWSUpewatg0u9ztR/I+kX4eZwchFSms
         uMZ1v6kax5ZXR0m9boWz2goKYS6jDucFAcpyO7ershMpHCeDf4D3wP0B9uOZjbDVlGSx
         jDe5nIrwaZU4oSvLhXoWJ4DyWMfu18BttUlVJxI/mjuS+Yjrvf4y9wLhir/3TCtzOZVT
         4HfnVl47jdR+PZTWAd/Iop0jLm0561U9om4fXpfqDQ90EqH9diSeSr5JZW4v+tSeBFoB
         6Ydg==
X-Forwarded-Encrypted: i=1; AJvYcCUraeD4He6fxdhFbsZs/VSpGXBp9jgRJUvm3kzBqrZOXPM1iy3KQ9NsU9PlnTzEe14M6C391L0+eZiiMgCWO4jJaR9Ngcer5pL/d6g0clIXwnvY9N27Zu0gt6k6LsZ+XhrW8UXWfW1yA28=
X-Gm-Message-State: AOJu0YwhgkztFAhZ8fhffhjBZff6iG9aL5KmP+cKz72kCAQGUiAajXtz
	eX8yxdokc3ww1CzxdQN85iA2gmF3zaAC4Jw3M1U+q231+oxQOYvd
X-Google-Smtp-Source: AGHT+IHGOafdBabYlP2c2x+Cz7k9sR9kUTAZvDXhK09l1VfhYbB9xjfqGlqK69PXXXc7UJFrWzQktg==
X-Received: by 2002:a05:6512:3091:b0:530:aeea:27e1 with SMTP id 2adb3069b0e04-530bb39b760mr9505743e87.50.1722947980138;
        Tue, 06 Aug 2024 05:39:40 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:39 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 11/11] ARM: nvidia: tf701t: configure USB
Date: Tue,  6 Aug 2024 15:39:06 +0300
Message-ID: <20240806123906.161218-12-clamor95@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240806123906.161218-1-clamor95@gmail.com>
References: <20240806123906.161218-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fixes issue when resuming after suspend made USB in peripheral
mode inaccessible.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index e6d0c834c0a2..fbe7eb1a5753 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1604,22 +1604,22 @@ mmc@78000600 {
 		vqmmc-supply = <&vdd_1v8_vio>;
 	};
 
+	/* Peripheral USB via ASUS connector */
 	usb@7d000000 {
 		compatible = "nvidia,tegra114-udc";
 		status = "okay";
 		dr_mode = "peripheral";
-
-		/* Peripheral USB via ASUS connector */
 	};
 
 	usb-phy@7d000000 {
 		status = "okay";
+		dr_mode = "peripheral";
+		vbus-supply = <&avdd_usb>;
 	};
 
+	/* Host USB via dock */
 	usb@7d008000 {
 		status = "okay";
-
-		/* Host USB via dock */
 	};
 
 	usb-phy@7d008000 {
-- 
2.43.0

