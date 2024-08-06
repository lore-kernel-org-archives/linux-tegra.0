Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454841C6893;
	Tue,  6 Aug 2024 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722947979; cv=none; b=TA1w/Yzm7L+S3TIejpnfCrqqJmj8OL9VqGDAunnYqCb5JCXSESYKb/xahwwjFKkTlH3tkRT1M3j0b4jyacUkH5i2bLOWZ64bPhDcjmIzAdEvoC97UwNaclwCvBFpr7f0yevPE5Xqb0aObwVewc85rqkOBwkMNYnUWUksc0LBfco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722947979; c=relaxed/simple;
	bh=UMkD53dwXebgDbTCqQ9gimr1Ij6PPtG/6PJZqivcVi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ul0wJ+Wx8JuDHJGHH1lILGL6lRlBDE9a/+GYGHPdEgMO94xVtEu4DehNh9PnBoLDwr+nnzQKRsSCEE1rlTBhZ2SrYpP0cSfoHeQtra89inhosTVunI/rNDdQxYhoH1oFSXovffimgUqUMt3kvFmHVp0qe1thkCw14KsWH0bkSxI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zx4uUvwX; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zx4uUvwX"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-a7aada2358fso1095160466b.0;
        Tue, 06 Aug 2024 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722947975; x=1723552775; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pbKgdavtuSiQPpCe2UpOKQlCHE9Pn6uLH46gP1LFqyc=;
        b=Zx4uUvwX157AR490utQ2aiTTFfrZHOrnv8zEyma0OdSbVVfNYP7T0b8Kdgvtmj6tZs
         OnByZ99yFPhwJMBwjm3CXrw9LWqpEuwtmkacbi9qldlid2ai7sVw6H/gwFPCdlZ6aKNS
         hve/6ptaScfwAlt1/v6Ce2JewJBhCX3oqGwe0eyLyVyMPXSOVcN9g1MznsrlxevstakY
         XjYcMZkEHBk9bZhQEmyf/vmjIiouNmUfjRlT3LstmInCFX7KiTV9YSbxyuEhdO/+UMx6
         6KiZjRox1QhP2AiTAbCUzNqaqQ945GHRl5JKMwfLzOQ/JIyv3f3MEkgS7qzB2d/+H0G5
         X5JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722947975; x=1723552775;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pbKgdavtuSiQPpCe2UpOKQlCHE9Pn6uLH46gP1LFqyc=;
        b=qjyQugk4K0WrLONE7hFWcjZUBDwoN7A2Lv5wvfp4IqlP742empO8nebYyIy4SB2puD
         UU6RWL+qCECxnhG/qbTVpIZ4CLT6V4WawFE0Y5Pu/dJgkNNckR9IGMZ/jOVImi2jWd/x
         QeCpvIntpO1Qe8lybWf2VaVcqgyqYUvtFNNbYHkfXT1aisur40GPBEYg3N+00gL4Qa9W
         JJONS7QJNo7L2g0MM0tgKmfHihzNB2SrX+cMc/vKMGcZFAh/wfgw604GVkl3iY9gjF2E
         bYu3vMylvsgd6RDixs6AdeNIB5dWifsH3r79U62OCMwPyzmBdy55d8Wa2/PhvXDsef7j
         s3JQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtQPFBBnU3ZNK3jOwI94P5q/k1bj0vxEUkCflIEnGGMhwOk8BD24tDbMEqZQ8oHhbgeE4nq251uN0oeDpbsGgl87Va93GfYmL0NlkndGszbCh9lnbx0whnYEv0QC3zsA+yWM0TChPyd9Y=
X-Gm-Message-State: AOJu0YwcJ+ksS50wGHa+OGh5uBp4UJZ/1dAbdmzMC3rcRPL5Mc3WvrQP
	zaHxp8XyrhCiv1+AtCpeiqNVAi3nz1Ngekbc6rq+Wp+30IPqsSlf
X-Google-Smtp-Source: AGHT+IHFkemCz0fwo3jeEn4Q/NCzPkkraG0/d267w3Skno7w++ffw8ybO/2oGcSB2/QZ+VV6rzVLcA==
X-Received: by 2002:a17:906:bc07:b0:a7a:a4cf:4f93 with SMTP id a640c23a62f3a-a7dc628b8fdmr1187678866b.32.1722947975378;
        Tue, 06 Aug 2024 05:39:35 -0700 (PDT)
Received: from xeon.. ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a7dc9d8a4b1sm546428366b.151.2024.08.06.05.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Aug 2024 05:39:35 -0700 (PDT)
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
Subject: [PATCH v1 06/11] ARM: nvidia: tf701t: adjust sensors nodes
Date: Tue,  6 Aug 2024 15:39:01 +0300
Message-ID: <20240806123906.161218-7-clamor95@gmail.com>
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

Complete and adjust magnetometer, thermal sensor, motion tracker,
power and light sensors according to available sources.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 21 ++++++++++++++++---
 1 file changed, 18 insertions(+), 3 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 00c3325878b9..9408d6930e68 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1158,7 +1158,14 @@ magnetometer@c {
 			compatible = "asahi-kasei,ak09911";
 			reg = <0xc>;
 
-			vdd-supply = <&vdd_3v3_sys>;
+			/* no DRDY (polling) */
+
+			vdd-supply = <&vdd_2v85_sen>;
+			vid-supply = <&vdd_1v8_vio>;
+
+			mount-matrix =  "0",  "1", "0",
+					"1",  "0", "0",
+					"0",  "0","-1";
 		};
 
 		rt5639: audio-codec@1c {
@@ -1175,7 +1182,10 @@ temp_sensor: temperature-sensor@4c {
 			compatible = "onnn,nct1008";
 			reg = <0x4c>;
 
-			vcc-supply = <&vdd_3v3_sys>;
+			interrupt-parent = <&gpio>;
+			interrupts = <TEGRA_GPIO(O, 4) IRQ_TYPE_EDGE_FALLING>;
+
+			vcc-supply = <&vdd_1v8_vio>;
 			#thermal-sensor-cells = <1>;
 		};
 
@@ -1186,6 +1196,9 @@ motion-tracker@68 {
 			interrupt-parent = <&gpio>;
 			interrupts = <TEGRA_GPIO(R, 3) IRQ_TYPE_LEVEL_HIGH>;
 
+			vdd-supply = <&vdd_2v85_sen>;
+			vddio-supply = <&vdd_1v8_vio>;
+
 			mount-matrix =  "0", "-1", "0",
 					"1",  "0", "0",
 					"0",  "0", "1";
@@ -1199,6 +1212,8 @@ i2c@7000c400 {
 		power-sensor@44 {
 			compatible = "ti,ina230";
 			reg = <0x44>;
+
+			shunt-resistor = <5000>;
 		};
 	};
 
@@ -1210,7 +1225,7 @@ light-sensor@1c {
 			compatible = "dynaimage,al3320a";
 			reg = <0x1c>;
 
-			vdd-supply = <&vdd_3v3_sys>;
+			vdd-supply = <&vdd_1v8_vio>;
 		};
 	};
 
-- 
2.43.0

