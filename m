Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com [209.85.208.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136D834573A
	for <linux-tegra@vger.kernel.org>; Wed,  5 Nov 2025 19:53:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762372433; cv=none; b=dFTzqMt4Q+ngwvbfWfqC/YNMhawG+qtHFDcQXqZui7rJGsIKgJp9iseFw/Z511lg/YrApSFs7ItUzhTDgl5O5KSWDb8hAraRdk94+RIxmEXygLB9BKB+StxdRrVEahaYFpkuuUFmUG4pE7i/9DCKTeo9QdM0jZhPfWO5Dlz+0Mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762372433; c=relaxed/simple;
	bh=YjHRc0oCtToeXXdkxRbxY958tkY+Cnt6dMfLlntrybg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=maXcf/Wl9wAGcbHkTcqBi01k6bMpYqo1lJ6ljHJgBSvB/Y4AUYyO4M9kc7/jl7zp0Q3dnNFiY+gbyY6GkVc8+UO9dr08wPba5h77MZ3MRPf9F2uAhxT3gTYRFn43Y45NJ5R4MNQYg2LCY+6PBeHJkx88eB1TTBrwSxEFXUH3PoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iz2rBexa; arc=none smtp.client-ip=209.85.208.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iz2rBexa"
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640d0ec9651so241730a12.3
        for <linux-tegra@vger.kernel.org>; Wed, 05 Nov 2025 11:53:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762372430; x=1762977230; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T2ChPscr8oI1Jx6/MRLByZw5X39fgOVwMSewdYMEVlk=;
        b=iz2rBexaeZxkjfDXab6Z+/vLf/rqL9s353QnJsf0Hq7ljMS5Yil73otrIKdp87SS27
         5SoMQM2EFyIoUdcSQaJdKCJy0tHaMlbn9D9+ZNM9VJD/b937dw9wTNhaClyfhsOZhKzr
         IcDm35Q6ln+I1wZ6VPGG6P5QhJ/69EOKNflIFVnLq4ayRxycl9uINcA03C0DJQLj8eyx
         0v5pn8CPm9ojlhefcbngPSnvMk8iRCoGior6bRgqtgrWwxuix/44gZULSvQS2UZWaFZT
         6qKR/pErK6sP9dZmtGdW6GaqhzXzp7SO0w4FrOC0wjgGKDNfINZinsaum2F18YLVjPwi
         2v7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762372430; x=1762977230;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T2ChPscr8oI1Jx6/MRLByZw5X39fgOVwMSewdYMEVlk=;
        b=mRjX7G9rKBD2yCk18gnAHZUlyeyfJpewfkLPAFzc0bZUAG2zCeXvWV8RNF9ylgmiwj
         /sdndLGNx+85hjrVK1BNMC4qUQ68CStLrs3k9GPB2mDipogb8Z5Hs59pvw47Dtv+ORkX
         OVcmr2rS2hUdDa3tOerPTbJ1VwMZ6N+7FxbdE/qZIBVJiGZ7HgiCJ7YcGIa2gRt6IXAP
         4UioE+ELhJBR9W82fujx7CUdPiL3ikmQDiEwxgZ6a/+lyzgBf3w7cVbxYWhuzfZB/Qr5
         TAYFQza1wjFjpzH5gCiLtx/kcXLjGw9C9jmG5/AQnhy64N4Krba5J3axj/vFaCqPIJeI
         2h4w==
X-Forwarded-Encrypted: i=1; AJvYcCU6ovnXTDiSE8a5B0vcEQgwwfn4iDMPdqkjsg5gokWvHZBKdoMCaUVwVZJ+FV0FU80S9flxPO6XUXHceQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/tjIAVu6CErzLcklaQI7HxIrAupJZb9Lqml9KHQTa1z9D7bCX
	xo56qtMTC97DTFyX9zTkQE6OI2DgY8UqFQeB8tL717VvicFh0hAovbgU
X-Gm-Gg: ASbGnct/F25zw2Mi2W6w7WW4PQWWWxSR1rCRQFB6haeVdHfL23KuvA7x+gyX7SsnU3v
	lrTtan2mJjWlRaAXwIIrRe1A40gpuQC5JXny2cMs/9kloON6GRZxA6HBpStJ6kQ+r0LMQ3/vZ00
	89P59H1gs05YTL220O2hwybbFoD2FS45EuVQGlJI76fLcWdSWfErv0WLCxPeu+YVb2BAyBjPpG4
	Y0WloWRiWOH/FyMXtRGaPrmaiNd6mPk9Uq7/A9pHg9xqAGjsoY3+SjFSK5OSg01QHRg7EcLomMC
	92S7GeTmIuiJ+qFU1Spjl2s1uy0YTldHWmvntPp2KqxBHbSWiChnJr78o6aE9j7Eu9UgEFmknPx
	J28QhaHF4wZsIBSw22LKy5rKnRsWU3NL/OAB5jhWRzOk2JGNT+BMNdJkR/8SwruDGfr8cNNpTUP
	jaHnsATgAnKoQFTp/g8v0aNNfYV2wfTcwkPE+4+HIFtPhDfUWd9CzEqil1GPYTMLLK3m/lSP4Qd
	kTMMrE=
X-Google-Smtp-Source: AGHT+IFf7tDw59JmEe4bBV8WCMZPEQuZ1vL/zuVOE8F7EZy83a1oNIvB4MT09RIkAfnIeGVbkSTm3Q==
X-Received: by 2002:a05:6402:84d:b0:640:a9b1:870b with SMTP id 4fb4d7f45d1cf-641058b9ffamr3661622a12.14.1762372430236;
        Wed, 05 Nov 2025 11:53:50 -0800 (PST)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6411f862ca8sm8356a12.28.2025.11.05.11.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 11:53:48 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: tegra: Add DBB clock to EMC on Tegra264
Date: Wed,  5 Nov 2025 20:53:42 +0100
Message-ID: <20251105195342.2705855-4-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251105195342.2705855-1-thierry.reding@gmail.com>
References: <20251105195342.2705855-1-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>

The DBB clock is used by the EMC to enable the data path from various IP
blocks to external memory.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 arch/arm64/boot/dts/nvidia/tegra264.dtsi | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/nvidia/tegra264.dtsi b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
index c66ea12ef5a3..f1cf370f6363 100644
--- a/arch/arm64/boot/dts/nvidia/tegra264.dtsi
+++ b/arch/arm64/boot/dts/nvidia/tegra264.dtsi
@@ -3444,8 +3444,9 @@ emc: external-memory-controller@8800000 {
 				reg = <0x00 0x8800000 0x0 0x20000>,
 				      <0x00 0x8890000 0x0 0x20000>;
 				interrupts = <GIC_SPI 141 IRQ_TYPE_LEVEL_HIGH>;
-				clocks = <&bpmp TEGRA264_CLK_EMC>;
-				clock-names = "emc";
+				clocks = <&bpmp TEGRA264_CLK_EMC>,
+					 <&bpmp TEGRA264_CLK_DBB_UPHY0>;
+				clock-names = "emc", "dbb";
 
 				#interconnect-cells = <0>;
 				nvidia,bpmp = <&bpmp>;
-- 
2.51.2

