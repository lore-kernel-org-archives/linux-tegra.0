Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AC3D1C68A8;
	Tue,  6 Aug 2024 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947980; cv=none; b=aEmvlgKHKNNR15t6MWxX8LPBezhHV72D6orY5lRTzHGGgq3fN6VXY+S+FUFEfe3gZ09pZt9MAsgurgckTGup2MA79+w8BRQNbJS9nkqvVa5DIvIRUMcqagLwbSHq5cDyWbpJiquczYjwvbJY1AIOSw30HxCS4vX5w0oe5+6Vo3o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947980; c=relaxed/simple;
	bh=FG0CWI3frJuLXmDFESQ6naGhg4keNi8LPsQ6uxiKCjA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TavdhXe6NB0YSlJ+uuuXfi7kSRCMeE6zvUC62dyUqk/G3BFuZvNjce2D6gb7aXfHtOBByLqNL2PTeEe2+0zD7DWVwxhoT6lvohsWzWCt5+ahaNgr4NGijT/eLdXpLFQKDkkG0SGkIJRbzfqO/b5GjY/VPHPL5QCKvo7zG4q+T6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XhXfwlQu; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XhXfwlQu"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-a7a9a369055so53562766b.3;
        Tue, 06 Aug 2024 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947976; x=1723552776; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1yCmeZ3HmgSBHr2HFKYpmDOXo9tclvyrx1ct0pzRQdU=;
        b=XhXfwlQuiQ18CODVup+3H9CABYGJLu8enV2GL7jYb0aQpgxHtPyeDwTq39PyqKLe6G
         9q+iqJpoigG5mtamQVXDif7F/uJpYssvxrL7p6cZmB7dqO0WBifDYw+MbvUnKf9JpiZH
         Gk5P5BIdMo9VAjTxJjeeStyTmpj57xIrS5HZbXJ6h5pt0UHoypKldZ/25iamVKzn7HH2
         yfw5Iln8BzQ3HyHFuySFOuie6rUK7y/t86PYHW338SQDb7RMi6cSc87N9JjsyjKlV9O6
         lUCGvwAm5c3jzDoKwfeNLZeu0t16yV2a+BMubUcRR1aZ+PMVMM8VVpFpZqZw9z6GRuZO
         q0bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947976; x=1723552776;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1yCmeZ3HmgSBHr2HFKYpmDOXo9tclvyrx1ct0pzRQdU=;
        b=jZIHWb0SK+QP5HmPMR451/Qfy7Am9JrgS1wMrnevX16vmVmLf2pu6vEihkl3as7GWR
         fj4EnKJfJ8y6Fo4Zet/8hbUBk4Sd+rwtHUeUsRjvZHiSGNamlyb+07w5liMvnazEB5f/
         S1IXyVsd/5yT6kog4rwZGX+Z+56He/a6gw/PyDR9/Eb2r0OKSlDAyAZg9sVQGy5OrkH4
         K91Vm2V5lgi87Y9JCKtfatlJ9cXqo24OSKTEh62ds1/NdoLemT1gFJsGGjl7yqRT8yGO
         FntglB3DuMmY5Pr+X6GHCgF0JAhnLa+GfgabkfZHdKQGRTBauznDVmBMCtETDYPVL2iU
         BV5w==
X-Forwarded-Encrypted: i=1; AJvYcCXaiOiGjxgtrFaFS4r/LAuJZNafJokkNRw1z2kpqjVaI00c3DsANkGLNtVD8me48FiUgFEDU36ZJ04FAwq2FJ1MwyY0UqYbCZCAgdDV8/1cHGbeIEhx69HPpmaXf96BrPQkoNPrswOtJ5w=
X-Gm-Message-State: AOJu0Yytm0BxHq8dofp4vUG/0n9Ou5ERXEosfWL5K7rSy4zR+U9w1dwd
	cnpqTeZ/JXWjCuqLUwO3Xa0hhh2ySN6nMIv/Me80qN6fUt6iNgHA
X-Google-Smtp-Source: AGHT+IFdaDKudEfOydl8pcUOyhA04KoWvMAcStS3/LEXzAA008zlJr02PLPGVadmSvF7xj07C1Xaiw==
X-Received: by 2002:a17:906:794d:b0:a7a:bc34:a4c8 with SMTP id a640c23a62f3a-a7dc519103cmr969940466b.69.1722947976327;
        Tue, 06 Aug 2024 05:39:36 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:36 -0700 (PDT)
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
Subject: [PATCH v1 07/11] ARM: nvidia: tf701t: complete sound bindings
Date: Tue,  6 Aug 2024 15:39:02 +0300
Message-ID: <20240806123906.161218-8-clamor95@gmail.com>
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

With these changes sound works, only UCM configs are needed for
complete support.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 9408d6930e68..9596cb495c10 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1172,10 +1172,11 @@ rt5639: audio-codec@1c {
 			compatible = "realtek,rt5639";
 			reg = <0x1c>;
 
-			interrupt-parent = <&gpio>;
-			interrupts = <TEGRA_GPIO(W, 3) IRQ_TYPE_EDGE_FALLING>;
+			realtek,ldo1-en-gpios =
+				<&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
 
-			realtek,ldo1-en-gpios = <&gpio TEGRA_GPIO(V, 3) GPIO_ACTIVE_HIGH>;
+			clocks = <&tegra_pmc TEGRA_PMC_CLK_OUT_1>;
+			clock-names = "mclk";
 		};
 
 		temp_sensor: temperature-sensor@4c {
@@ -1517,7 +1518,13 @@ i2c-thermtrip {
 	};
 
 	ahub@70080000 {
-		i2s@70080300 {
+		/* HIFI CODEC */
+		i2s@70080400 {		/* i2s1 */
+			status = "okay";
+		};
+
+		/* BT SCO */
+		i2s@70080600 {		/* i2s3 */
 			status = "okay";
 		};
 	};
@@ -1656,13 +1663,16 @@ sound {
 			"Speakers", "SPORN",
 			"Speakers", "SPOLP",
 			"Speakers", "SPOLN",
-			"Mic Jack", "MICBIAS1",
-			"IN2P", "Mic Jack";
+			"IN1P", "Mic Jack",
+			"IN1N", "Mic Jack",
+			"DMIC1", "Int Mic",
+			"DMIC2", "Int Mic";
 
-		nvidia,i2s-controller = <&tegra_i2s0>;
+		nvidia,i2s-controller = <&tegra_i2s1>;
 		nvidia,audio-codec = <&rt5639>;
 
 		nvidia,hp-det-gpios = <&gpio TEGRA_GPIO(R, 7) GPIO_ACTIVE_LOW>;
+		nvidia,int-mic-en-gpios = <&gpio TEGRA_GPIO(K, 3) GPIO_ACTIVE_HIGH>;
 
 		clocks = <&tegra_car TEGRA114_CLK_PLL_A>,
 			 <&tegra_car TEGRA114_CLK_PLL_A_OUT0>,
-- 
2.43.0

