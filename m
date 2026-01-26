Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7636733031B
	for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 10:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769422515; cv=none; b=dS+uPIxksGGEHH7/JLHo652Li7mxRM4Ezm3m0hP5U4oqAuYxdRyA8C6RZjBHwXt5RkTIoiCcTWf9U69fBQUtbtfsq678USg6ZXE5eHFs3frEGzXejakONhOSnds7XQHwgiHIyuYGduRfrIgXAjrxaSIVfafPXwgjhohN2qVIysU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769422515; c=relaxed/simple;
	bh=VAcTrN4SEtCtkSuzww4o6pK0mdDw8d4krQPbqlihmNA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TULmlW1tJGHSs3XwAsUKEuZVQhCdO8KOUNYhDXZzfGKycSFYnNcV1sBrBBPSiOn11/l6LPtuFQpJEuKUqqs0m6vFo5manXABe4UQlb5vBrjVXPNTLPMcfvEedQ3uKN41BjkW8nA7sh0REBvA9OvO8yzk0Fv7T3VsMD7j5lVjM08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OuzNbhIS; arc=none smtp.client-ip=209.85.128.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OuzNbhIS"
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-47ee974e230so39123045e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Jan 2026 02:15:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769422512; x=1770027312; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60kkHg9EpcHMwtWKY6bs7zqhBr9lwoD5Ih0JKegSxHA=;
        b=OuzNbhIStQnMFOQeqYqCOwS0jxXjQYkGHZuh4nVKHCmrVOGxB86KHRmjw/u/JI2cAC
         pjNnmRdMLLvleIwGdc6s2wvjpHsGVPm4n9yWr0dmjIhag3p+W8Ly+nVj7kOyOSY9O13t
         /Ib6QcLTZIrDEKbahoraiqThAFTy1eogzhvxAyfUQ6NASgsA1D8Kutg8GuRBGndSXci2
         eBNaAV3i3NbefE0SgWR6pU4ckvuMUdkLQz1urW3x+06L4X8qgB6tfus/1eVdGSQ3hO43
         El8h4si/ywojQVDgwfLNEwb7UDOBkYgngiuc4fKKR1JYjnkZqqAAmOaLGftzGYIEZFDM
         cHZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769422512; x=1770027312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=60kkHg9EpcHMwtWKY6bs7zqhBr9lwoD5Ih0JKegSxHA=;
        b=S1YwTWwy5JDEcDRFsgcHuZ6Pq4cb2S73lc/EdCc46PTxSThAxZqTWw/JbGlwL9r00S
         r3XIsZfQ1T1g8thaVCmwYC2jcPEhD+KT5JLdJQDekpXfPVIccCQXBrPBsm3sEoVNMR/8
         86kT0eoSbLZ1M2rnRBd2CLkNzbAM0nSF22bHL1LeOm7xZNYHCS+OSRyq0lq/OrojTzFx
         T/ZdauLsR0strYh/WgClqKhJLGZKO6zRYfDIYI7R9RwB6O9nVBAIyduzXZZ6BPCIecfJ
         g7z2z++y0bMArLmM1rwKk/gMTGMSTog8Cajd3hO3BUuFzLR9EvDsIRI6KsoeNbL+amHj
         LgHw==
X-Forwarded-Encrypted: i=1; AJvYcCUB6tIl/uqJQIic56H/K8qKLTFwyDe0USdDAHuJ25sxQCsoHtrcheQoDxDE6CIA4fuPYPvIMcaMPx0BhA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgUglOKHX/1VseWbNzrJhxauGrsVDjX0mGSyPq7qwZn6asYBQy
	iAXrvSxL0JUvLj5C53DqKMh5NA8nXBg46gA+acMr4YKNNY+lXmE7Mdiu
X-Gm-Gg: AZuq6aJ+UfWHytTMADX+mJ7oM212W/199PMYXdcOfoL7qGEBMQ5i5acgAVQGZJuEoy+
	VG6n2LeZjaZMw/eCf4ady6t9SsonfTqGJWcdsFz6aW3kNH0aQvLJxbGuhRK4QYCjmYXbsCLl2i+
	RE0+A2Q3Nk/4ViWa7E1f5h06AG9Hw+iLZu1HbD3fg9zzn7TyDvZ2QhCVqXB74pkKz1WNkcB8BJX
	EpOlEoF6SbZV/kXci19KfPYdHIRmmTO1pTFTJS6rcCswEWNYXFlWAgFxwQwvc4VvD/Ts26GhEaq
	AwSr/eoVt1/4FQBwbhJe/UDdKVQWJYCvLsTzmMuZkWdlgkEGP7YFXmUuMWVO63nD3Sv+h5jyF5e
	5yVMAoB51IJOUTwivxw2BF56dyC9P5sbx553weMgZXgcj+5fddfUPRTjbUt463OIA24GBiYyx2i
	oF
X-Received: by 2002:a05:600c:468a:b0:47e:e946:3a59 with SMTP id 5b1f17b1804b1-4805d06c77amr59044075e9.34.1769422511702;
        Mon, 26 Jan 2026 02:15:11 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4804d8a5c32sm319771795e9.11.2026.01.26.02.15.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 02:15:11 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] ARM: tegra: lg-x3: add node for capacitive buttons
Date: Mon, 26 Jan 2026 12:10:17 +0200
Message-ID: <20260126101018.24450-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260126101018.24450-1-clamor95@gmail.com>
References: <20260126101018.24450-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Both smartphones have capacitive buttons but only P895 supports RMI4
function 1A (0D touch), while P880 exposes buttons area as a region of the
touchscreen.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
index ab8f5cf317bf..414117fd4382 100644
--- a/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
+++ b/arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts
@@ -109,6 +109,12 @@ rmi4-f11@11 {
 				syna,clip-x-high = <1535>;
 				syna,clip-y-high = <2047>;
 			};
+
+			rmi4-f1a@1a {
+				reg = <0x1a>;
+
+				linux,keycodes = <KEY_BACK KEY_HOME KEY_MENU KEY_SEARCH>;
+			};
 		};
 	};
 
-- 
2.51.0

