Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378501;
	b=aBmj/8rON5aQlpMImKsqWKM4wk6pxRAEcHi30w4HNZdSzrN25U7Ew8TgS0iNeG7lqjfv
	 eU7uAmSPVFXHla6w3ZuTfHmKKVT7Qn2e5VNsGFNgQTvZQ30GdzIwV9pd8D/Se90ZsCb64
	 hLf32sGn2zjONmgVJKtdN7pvypBjavXnuubtanif0ECZIS3Oc3yuNROVVNIR39/rR3CBL
	 RejBNYF55oQtvhU6GYIU4zu1z5/jweyt2CrTAalHOsQrFT9e6f6qatAuUaQ2ti3+XLVpT
	 DPuR84jrcvsh9YuA8tUg7vz3BOJLMNjEbDI8hyTrHjqslR/k42aQwT0kgB6zgzZ4Wcg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378501;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
	b=d+KjpnUTCF/1V4iYh78IbyCG5CzS6dw3KmsZ8wi4C0RCsBAR71zjWNG2238uwq1rpRp0
	 kVW/1sO6ShCpzBu0OtjCY8wi3CosFgnskuMxjvC1Or57tJsD1clWNhC8lG1Cfv6Z8lKAB
	 z1Qmb/GGbeMmqpjSrTyp6v5LO4tdE2R999sS1N/Hx9dgOC/RVbT4Xj4PjKMM/G8AsI+dz
	 auFgTR5JlH2h+oZwy0e4WHHEicDKZg6pmGOY84ua4Pdm4NGg8XgRzfAHLWkQuND7QxSes
	 4RHS+Rt0rZDet0ma8vraSANF9CfV2B/tFrT9R7lQ0BtiZz+xsd3X5igcPfKaBIQrXJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DA00606A33F
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:15:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DA00606A33F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=mV4S7s0F
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b8786bb305so3218471a12.0
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378499; x=1795983299; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=mV4S7s0FSBQ8EhKjdIitZA7eBN6Dv6QzdU0jpu0+5ZnD+DDNounbp+Lj7QZXks6ho/
         CkkKf4eSnlEVxiOHTa+q/f7D2TYvG45nAJFDDBwKxskEDV7JXZHfdhg11gVqpd26xlET
         aXP/QHgoZL5/6uRwJEqwDzmx1Or/iKhzJdpiaBR2sFldJlww/vtWzeCJ7KCHR/ahnGFj
         5ETgU9nDYRb13y20bff1n0VbzUl2QXB9kWuXpyaE8HQI4Rtg9nHmROccUGs8s+z508dR
         XTQOpLrMZHy95JZMvZjn4QndHdNWHlfd7z9UpZVS7GU4CHhflfL7sT7TZ9AIJ+ocNx9G
         fI8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378499; x=1795983299;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Y+TVwTlX7c3XctTEzScMeDWLIyBaOAtPHRcEpBS/ezk=;
        b=qlvJUp/wAP6vdh2RyrqWG09wceXLZy/wJxOHBe6JyuY1tokXQGpbGVYL0NJJWJf7A9
         9JhVMUe5zkOAHCT6a689HZb21fqKqMJ6LuMztbgg/pwJm52Z0bWVtcnxx0K0VbqtNThz
         0Djgete9EoidCcwQ8vArF+tbZrOiLqIzFn9/n6GELyQLeht/HPk0PdZtlNUbIwN9rZAr
         3ceg/4wqEB/aP3ezDL4LQJRD49uNFzuRw7tG2iappFGjGC+9KWxDUjnDf9KGdj6yj3Tj
         FP37OpLob8oVqDw8molSLg+MSXHc4T4vK23Zr3OmEeILxim6j4p4IxLll13NQwp73SU1
         7uQQ==
X-Forwarded-Encrypted: i=1; AL+hErEBqM9aNF5U3ZBzg2Mu6J/6hdgSFajXnNhXzliAGq6eRprv3UdcI0K3LnfVMjKDeeiT+AlYRAqOkI8XWg==@vger.kernel.org
X-Gm-Message-State: APuU4Z++yX2eSLP5WdMVWA4vPe82iKjcc/I94k+ySmp5kfS1DMzO2C3k
	xVCKfu7o7C/fH0FF2zHpbe375T5bjlQx6CR0bevySxOkr17GKyfILvo+
X-Gm-Gg: AZFdTZfZ8GJldp5W3o9PjYAskAG0LqA8e2ATa030o921fl+OWlbRvzgNk1G+goVbIAv
	iLv7TzWBj+KegLsNQYjgcve+Ne4E3hTCnoSAoq32gqxq3RECj99vk7TinhGzRF4lyx4icouffVx
	YxnRhb7Vz+C7iPLpOiMuHoqDY9t/+GoV1uhzXQvGpBd3xd7AwTzaIvGH2zJXkkmRbjSdsUIoTJ6
	15jZN0nb085YOGgHOfvpJdami86gc7JOcfbn7TyuOfasJMGYYqJolPf0ephr/PWb3P0ldIM7Qjn
	Yxc3C46Lt8WfP6QDNlMbE+8NJUe/Yhi0GWGFIBgZYUV4hq9b3jWyoUcVSdWNGuYmFB3p/jwr8vt
	yHQMX9vv75pHakhJ3YVx6GSxTjSdFdD7ck7bVAnHrcn9S2uhv1VaMJkPRQjy7iphUkLGdXRM6rx
	dY4yeRvR98Typpi9zifW0pZkbNDF/CIYCvBLE4dH4Yt8yY0zj8bZm7FtMtqikOv4cAt6o//i+ii
	T88YmSu9QhqKb+BM4wwtqiBGU6Yqfjeva5hAEJ5I8/vXQ7cc+D0k6HRuC3jfPCmaZgKbUEOeeqa
	qqhbimMqpkPtF4RcD7qj8BrOVs8PD3YSWRB+bba1J5CtdUGNP7vA83CH2N70pDmV8dRjOyX/Xnw
	y1GXgY6eojA==
X-Received: by 2002:a05:6402:1d4f:b0:6ba:95c2:750e with SMTP id 4fb4d7f45d1cf-6ba95c27ab5mr1629135a12.16.1795378499006;
        Sun, 22 Nov 2026 12:14:59 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:58 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 15/18] ARM: tegra: tegratab: Update GPIO keys and switches
Date: Sun, 22 Nov 2026 22:14:04 +0200
Message-ID: <20261122201407.23742-16-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261122201407.23742-1-clamor95@gmail.com>
References: <20261122201407.23742-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update the debounce-interval for GPIO keys and add hall sensor and tablet
mode switches.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../tegra114-nvidia-tegratab-common.dtsi      | 21 +++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index cf8cd037a732a..f6b167dc8d338 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -2295,6 +2295,24 @@ usb_connector_out: endpoint {
 		};
 	};
 
+	extcon-keys {
+		compatible = "gpio-keys";
+
+		switch-hall-sensor {
+			label = "Hall Sensor";
+			gpios = <&gpio TEGRA_GPIO(C, 7) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_LID>;
+			wakeup-source;
+		};
+
+		switch-tablet-mode {
+			label = "Tablet mode";
+			gpios = <&gpio TEGRA_GPIO(O, 5) GPIO_ACTIVE_LOW>;
+			linux,code = <SW_TABLET_MODE>;
+			wakeup-source;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 
@@ -2302,6 +2320,7 @@ key-power {
 			label = "Power";
 			gpios = <&gpio TEGRA_GPIO(Q, 0) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_POWER>;
+			debounce-interval = <30>;
 			wakeup-source;
 		};
 
@@ -2309,12 +2328,14 @@ key-volume-down {
 			label = "Volume Down";
 			gpios = <&gpio TEGRA_GPIO(Q, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEDOWN>;
+			debounce-interval = <30>;
 		};
 
 		key-volume-up {
 			label = "Volume Up";
 			gpios = <&gpio TEGRA_GPIO(R, 2) GPIO_ACTIVE_LOW>;
 			linux,code = <KEY_VOLUMEUP>;
+			debounce-interval = <30>;
 		};
 	};
 
-- 
2.53.0

