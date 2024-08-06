Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0A0F1C825C;
	Tue,  6 Aug 2024 12:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947983; cv=none; b=O/24X+E2l3Uhz3KkcSDsaV1EOQ26Uv8jc5TgnpwHOhoVJ3nMqAR8tEDJ4fvbzgIlax+RolROy50Tl4P9YiDAxIB10evc8AppMIboTg8kmiwM/LP/LTY/IGBhYyXMJ/2hdPNBDsRMXbd4n1frj11e5JYIIhrMTBaF2Kjy+JAVATU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947983; c=relaxed/simple;
	bh=T17tyEhXR87LUZpAQk05MvrMtBbdQ/cRnH7Fo8GgPdI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hJikrjpxc4Krt7GJugiLgA9BjG3GOT0RMo2f08Y5Z4fqrYkg5RGWq1d+Fes70ciO9/OLdeha9+ugmRxCbrEFK7b7tsmltC+u2ctXMB8pq4M9089emPooN48vM7jQgQ/eBx9g/nkWmzt6o/fwrZzKCM6jI+uUlDpdU9J1Kfv8VpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cfKPquyy; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cfKPquyy"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-a7ab5fc975dso35916266b.1;
        Tue, 06 Aug 2024 05:39:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947978; x=1723552778; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nImzIFtx5SlH47PsIljCYVUBx0TjZ87TW5WbJvpRjC4=;
        b=cfKPquyyS7mTWh5PRQv+WwttnfWXJZCDGr6aN0Gs7k5DauQP/493s5/nYCDjotDUPj
         bDGoDxmy+gyKFLaGipxCgcnY2uHAVNgfNhbYKHYvWsc9SPw3cj6pmdJ5sjagv6M0/Rs4
         BO0IwYxPE5eHWq9pD11TfvffFZBPNCxV0gQlnM2ct06DYESTITiAdM7hehBQHSpRttyX
         TGQ2+yJMMvtn79MaAHZqdbS+MFfb2IyW0FCl6H85yITzBA0X1h7C0dzR00QwHwxmhS0o
         Eer5P4lvguYcgsvPW8UASsY9qpFHJYt7sNbplDcudFDhTf1VUKD/KhH40xt0wbNypMLm
         etxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947978; x=1723552778;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nImzIFtx5SlH47PsIljCYVUBx0TjZ87TW5WbJvpRjC4=;
        b=dDsyjlqbymhpK1KY+QT4MaSNjWNiEFMA5d+LU7xrRYPTPpbZ62kdSQm+ijcoiR18VU
         +Jn3s/ihGgcGEMV8O/qYTeuoY5gZTmQ15V1SUbHRPuZjv0EODsos+jSOUKkQv0NjZL1o
         hhj5eLU+VoDN9ASTB1bXh1ggHK4zirMhpK1jfizdkC9FoVKQkN1e18TVe3pgXU8PFq4h
         8uiw9WsOi3vLdYbEvhcmkuXAdbmwez4DIQf+CsuAWzUO+aLBchDGPKJxdqWx5dEJ4J1U
         Tn2iB+d0VUCatnIWL6wZI59BSf0x6dUE9sktYXImqCKjK227uIgxZPPwoTPtRY/Tbq7z
         OBwQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3WtnSG7uEihLt6cvU5k3iWETvHN37xsWEhhv6N27a9R0vW57ZaqJrsO+jfrz2NoPGZu3pyCWQo3H4sHL+b4rLRdoKrpfIYdrYc8g699rNykx96sDVfmZT1TThwtth9WjFdKt9HN6m4SQ=
X-Gm-Message-State: AOJu0Yzx4muMKXlwiznFA6/ssG89WHztuf8Dv/EqEjwYOEnSx9Ie2iDS
	UGDDjM+tQvBgVjRP3+3wkEc/2xADONlxYnljYcQqRFf4rR+MowL4
X-Google-Smtp-Source: AGHT+IEPDyIWBGRteePQrRqq5eQu47iDOoxVZvTe5q/jONVeoncbWcdat+eoE/UgMIfadhyNcZ8wRw==
X-Received: by 2002:a17:907:60ce:b0:a7a:ab8a:384 with SMTP id a640c23a62f3a-a7dc50a460emr1085482566b.64.1722947978210;
        Tue, 06 Aug 2024 05:39:38 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:37 -0700 (PDT)
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
Subject: [PATCH v1 09/11] ARM: nvidia: tf701t: re-group GPIO keys
Date: Tue,  6 Aug 2024 15:39:04 +0300
Message-ID: <20240806123906.161218-10-clamor95@gmail.com>
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

Group GPIO keys into keys and switches.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 1fca3e2e5aa1..eb38c036bcc5 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1661,11 +1661,9 @@ connector_in: endpoint {
 		};
 	};
 
-	gpio-hall-sensor {
+	extcon-keys {
 		compatible = "gpio-keys";
 
-		label = "GPIO Hall Effect Sensor";
-
 		switch-hall-sensor {
 			label = "Hall Effect Sensor";
 			gpios = <&gpio TEGRA_GPIO(O, 5) GPIO_ACTIVE_LOW>;
@@ -1674,14 +1672,20 @@ switch-hall-sensor {
 			linux,can-disable;
 			wakeup-source;
 		};
+
+		switch-lineout-detect {
+			label = "Audio dock line-out detect";
+			gpios = <&gpio TEGRA_GPIO(X, 5) GPIO_ACTIVE_LOW>;
+			linux,input-type = <EV_SW>;
+			linux,code = <SW_LINEOUT_INSERT>;
+			debounce-interval = <10>;
+		};
 	};
 
 	gpio-keys {
 		compatible = "gpio-keys";
 
-		label = "GPIO Buttons";
-
-		button-power {
+		key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
@@ -1689,14 +1693,14 @@ button-power {
 			wakeup-source;
 		};
 
-		button-volume-down {
+		key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(R, 1) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
 			debounce-interval = <10>;
 		};
 
-		button-volume-up {
+		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
-- 
2.43.0

