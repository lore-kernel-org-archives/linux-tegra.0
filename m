Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA9C9480357
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628684; cv=none; b=GxENa8ssoQ2uylmjb0bDTUmKOQAbvNiRgd128ij/bVTYDykN78d6CYiZchJh6vBHM+VjAp6Lw3cdJH3DJIDEw1Jr69kaYx/RxJSBKiFU+h1eUEFa1lVj5Kfuhu1+Snu3wkagb2eEQkd2d5i/PPG5ej0QOiBH25jzasqRvcH58J4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628684; c=relaxed/simple;
	bh=U69SQbyV+ssf8xjwsV4lwLr4kMLmiOJVFI6WxgPKEdc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DTSlQOQYZWvBVf91fqlSlBfYjtMImNx6GKaoDFPhhpyyTplCciQr1c7cDtmH0s2AVjA838+fledP8oZlfKBnAG7pJOwWIx9ADkUav/oJgNqjZHrDTA83xi/su8G2Nubc9yKVi4aoO+wU8P7v/lQfPweu3Us10Xm4fu23Qy5ud3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ks22+TfY; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ks22+TfY"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4955aa106b1so19476455e9.0
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628680; x=1785233480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qy12RKts9D31/bxnU65LpuTKsVkQz9PKxgavdVWUciQ=;
        b=Ks22+TfY23zLOXm96eKOV1wFRwvKnUEsmps4Az3glpbiEElH1OkE7x0TNPoRtFHBqw
         sRfoh4yyZ9ezRJXvap6mgMnCyYHGklrVz9k+9PqtaQby6vuibC3u+zgcXWxJobzIKfve
         c0OfsKNXFo+74ymuv8MttJgpFRyZ7PT6wRFy1D3nD58t4I70+gToqnzwhjQ+8ubNJIXI
         /hsnYniXJYN1t01gTyP0Q20iK6z03NHSUhCS0N6v13VsBgEPR7bcxRD2A6hWthZSQM2S
         9etvYmi0iqa2Ns1i28fWpNUS2Osh1h6GqP4B5f71PvE3wXWd1fp/uvh6+IGy0Ja/K80u
         h+xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628680; x=1785233480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qy12RKts9D31/bxnU65LpuTKsVkQz9PKxgavdVWUciQ=;
        b=WjTM2FYCe8L8W+m6mv2IR0OuyhSH7HVSusw8iMiJCOE6INoN6uY6zhsPxnvy32ACbn
         J+Eg4OBdUeGeQt3p7xrZXrS8toM1x8LclLPM5K8wmP9tdxxSnCFP6zVAi25+c9p7MCho
         wxnJ0vKf6fucfMcvVD9S2Y3dncwjEuJ/1tYpe81t9MAn9uI2wkw0+nz/ezcyli7G7Tm+
         ouO4ashk7+A0XEbAclfohW4+uTkg1j+FUnMAp5pUir0p6nv1KNmEvuCV86MELYqQo+BY
         BsqTGhhj7V+7Wajjx7FLYVxWp+9d1c32YkukPT689aF+kpOZiaK98L09CUIySvfQ+vIU
         9DWg==
X-Forwarded-Encrypted: i=1; AHgh+Rprv5APVSDTwFiRlFe7FTnbviQCqNUyYz5y1Z6DrVFhQM6thtp/UP7MTcIeLax6zUl5br8aMq6yQaQxzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwM+Gd6FSnyI0R2QbjumNEIeAjICPtQJQUKSb0U7vKdX4cWWdd/
	aI34TjYyNQ6enMazK9y+gIRC6tfotIkYZ/Z3rsN45b0b4wLTsaR41NNL
X-Gm-Gg: AfdE7cl0W3TdYXYGp6d+kSuR8nwlnek0O8Jk47QyFDkx+tV8HbG0V+MdKenpyMBh98y
	gQglOfnanPoM6uASLOCEeJIM2tmRsofkc1dXA3ndfZWD5MUX3yIAX3tNyOodojauDDD0+oTgz4b
	iefmMj/qhnas6hxA798hI6jUNllgYrXZ7HkfNcCZ9h0og6lnRY/eIssPOWoi0YonNrJc6iFMVkq
	JU25olRLZeesEHekRXuoxZEPQRGqZXxTTf+1qTx5jZhddNE42xp1yZwgTRLFyCBYTXWwiKDywdo
	kHkNRB5EgYAqdGlxKQzGMjcHyIoiqj403ngQhK+3Y4/Nh2kKlAeAZ1ehWGSxc9dFlhjdFCPYfJn
	E1H4UrlO7RJW4vel1UMmIzT6p1aEekNsYsnlI8Qb7LDzDVfXRExbaWeyICNgMtfwFKzupmrQWzF
	sdo6TO7WqR9hbBSqHFfyeJ5mM=
X-Received: by 2002:a05:600d:6447:10b0:495:63f5:7a4f with SMTP id 5b1f17b1804b1-49563f57a9amr46059765e9.33.1784628679879;
        Tue, 21 Jul 2026 03:11:19 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:19 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/10] ARM: tegra: tf701t: Configure UART-B line used for GPS
Date: Tue, 21 Jul 2026 13:10:58 +0300
Message-ID: <20260721101059.451699-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260721101059.451699-1-clamor95@gmail.com>
References: <20260721101059.451699-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Set UART-B line to use hsuart since it has GPS device linked to it.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 32d55c18c7446..0d182fa5c1af2 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1283,6 +1283,11 @@ drive-gma {
 	};
 
 	serial@70006040 {
+		compatible = "nvidia,tegra114-hsuart", "nvidia,tegra30-hsuart";
+		reset-names = "serial";
+		/delete-property/ reg-shift;
+		status = "okay";
+
 		/* GPS */
 	};
 
-- 
2.53.0

