Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606000;
	b=VrCFwdYF9MAbcagJ3nmxFDMPpQBiBQdRzkmEM8xD3DaofhfTVlEpWCqgbKHAy0xTruTi
	 fxGSgizyB1dVP9kG2+vn9QiodU2l0ZZAVY3/XxJNn9ido+txwY73oiLhFNz7rBQPTYYnE
	 DzAOW8h66gLb2mkUeNWtC/6WKa/3vABIOFtSUPCxm1fI6RrHelOCL3np4bQqCViGMNPVk
	 f4kCQ0l4Ce/4+GEi5/YDg5IynI1ElbsmrDeRUTfo2NgHQnpp0svX6/UVDZXW4M9hb4smG
	 xkWpu0NKYZT7x4BoNW9slESoEDVwfd62MHntvm2TfECFj99qIvMmwBkvAjGLsfZh4vQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606000;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
	b=33xKmyn1Ki0noKrYN05hVt6YVlyLN0EFqY3tInLxoOmhLbNT1qKxMzGWFw0JRdqD+IPW
	 n7rIxO0SaCRGBjDkc9GrggFtitfxdkqI+7zc5dIDPuSStKO+I6hCZ46v+sCn4iBtGKpHX
	 Z23PYswqwFk0e2kD45k/QufAnkN3uajlBLcYSpm+n3ftlmrbbex8oC+8LCcUP5oux24c0
	 HeQUddC+p1cVMldee0ZxzLV9qMqsxpbvtNDzkzrcYVaRvyr6//8OSUSVDqR8/mrBkzV7u
	 v0GATMAgc+mMZvbnn71+GGsFLGfHyOD2i/Y+iv67fKuyznqQVfcQNePuTR99R0wHBPQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz;
	arc=none smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E6D60A3829
	for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 11:26:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E6D60A3829
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=TlDfi6Fz
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b88bc47e23so7237234a12.2
        for <linux-tegra@vger.kernel.org>; Wed, 25 Nov 2026 03:26:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795605999; x=1796210799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=TlDfi6FzLVQEOp+ixHcB5vNlbsGUZwa4mcaeOkjd0jh97u/dAQPOd+fuIXap9g6xTE
         AwLzQC2AQVty73GXcw/9igtE6XHnnlMq9jJ4lgp+wwa99Tl5lQn/dXuLJ84uHaT/PFST
         Egd2SPXKhqhF7vOSWOPQ+XEVOyF7I9XoxILp+628qqpwvs1XkoL/LGvq+wQbbkVdtOVt
         38te5+rV7/JDiIkqpzLnigVcVLJsMttZn858RdW7lL2aBk9ZtNMwRkW3WNUdKbwaF1Lm
         +tOC+jz/q1dgHHIfaPAr4ZUYHn7ha59kQ3smCkNx7N0u1KROSCXcFhJ6IJsGV3QxTAlj
         CXog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605999; x=1796210799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQWld2rf0aUSCLxpuKReQRUF3uIzkNsM8ey4gCHu/88=;
        b=HEj0JhRlZu7sHWG60M1Ox1lY3G428oF3V2KGBUvv8NFIkxzUCP3aRxMA1QwS7PnAdQ
         iVUePIszlGhNrxfbkPrT2barK6jyoTQYPG7/TkqBLgxsz/5EASvxw96zEajjHJ3y79oB
         lF3h25jxjURCDLvSSR3ku5/ssrTa0j23/ukGuyNelVx1iHbcydbQpfC4HfTWIVPaSDB5
         1Slsc/BLbZz2eunmZxnX4EsIOObrl0VlVMypSc+IDXSea2vS6ujSutrkO1mgbk/PnlRw
         e/5hm2V9Uicq2W1SBQL5J1+aYqGUsVgPHkbIjEdfzMITy/XXOV3s7JCMt5PGZRJebFHB
         GtPA==
X-Forwarded-Encrypted: i=1; AL+hErGUDwA4pdLGLPZQpNsdPqoLF22v8bZpH7L798gEFscIbTLMlZ2UtFwwKx9eSy8id21caE62bDAsL+NH5g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8usTt5sc4RZKQPyC9KyNN0bwYtNDQKCkNyX2gU2BWQNLj6g9ME
	LFjL4yPSNl1+EsAFKZ0k6ty+iyuy1iXcj/2QRtoNmSg32kBnJKMRPigg
X-Gm-Gg: AZFdTZeC/6wEEcy+mYBi9Xo1g7aUB9kGfNMWa/ckXioEvyZVrV+W+83BoEihU5qqB8O
	Ai7clTUndcJCPMvXKNc2rhmuZxCJQXel6TKxQdWa5cvsaIh/p2rWWaAKc07ws2R6wNHQET6ROgW
	raASjcXNilPedc+pjtRhgWSNcNs/br45eexGFseYqLLvioKuwkE9/TYHGjhk3Gxx/dFHulSBmVE
	Nx5dK9wCT47TKXlCFyFJ7owQ3qbrqCeSk7ruIsfrkD+Uy9+fjJKp7ou99MYBms4XLb8j66C+Ld/
	7hFD6rRpHhSVtCnOrXC/sjb1wdnnsRLmSpun3u7pbCzF8ySMufCeh8GyYg5/R4GwH5ebZ/GfjfB
	JgthngXMQkXHbIs0dYX0mcoW7nh/CpQCu4HmxPGr4kDqX6dJWnj8cb+8YueMh6FLqIGgqUf4VcO
	no0672btQoC9Sl2h7RrZB2nKhSxRoaUnVn05kmJfxo8AXf+I+NKymcxEWvcrzkXGXd/h9br0rR0
	wKvZzy1chYr75K7xUhiicCiStfvvt7jbPcGhf53Z0g1PgNKyXR4H6Pp5Y4hVADMlZYesSU8F8QY
	PK5pJLQEIAQC5Uxb1vZnCoVzIAhJfTuOVJH6F7E4LQDrK1F7smRMA0G70g5Ri+KFl8OklwpwkZN
	iC0RRseymVA==
X-Received: by 2002:a05:6402:4009:b0:6b9:c43e:19df with SMTP id 4fb4d7f45d1cf-6ba37ed9a8bmr12269161a12.41.1795605998897;
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6bb1b93a8efsm1202907a12.7.2026.11.25.03.26.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 03:26:38 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v2 7/7] ARM: tegra: Add CSI node for Tegra114
Date: Wed, 25 Nov 2026 13:26:13 +0200
Message-ID: <20261125112613.237333-8-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261125112613.237333-1-clamor95@gmail.com>
References: <20261125112613.237333-1-clamor95@gmail.com>
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

Add CSI node to Tegra114 device tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114.dtsi | 34 +++++++++++++++++++++++++-
 1 file changed, 33 insertions(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114.dtsi b/arch/arm/boot/dts/nvidia/tegra114.dtsi
index f2766c11ee6c3..61120658f0687 100644
--- a/arch/arm/boot/dts/nvidia/tegra114.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114.dtsi
@@ -53,7 +53,7 @@ host1x@50000000 {
 
 		vi@54080000 {
 			compatible = "nvidia,tegra114-vi";
-			reg = <0x54080000 0x00040000>;
+			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA114_CLK_VI>;
 			resets = <&tegra_car 20>;
@@ -64,6 +64,38 @@ vi@54080000 {
 			iommus = <&mc TEGRA_SWGROUP_VI>;
 
 			status = "disabled";
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+
+			ranges = <0x0 0x54080000 0x4000>;
+
+			csi@800 {
+				compatible = "nvidia,tegra114-csi";
+				reg = <0x800 0x200>;
+				clocks = <&tegra_car TEGRA114_CLK_CSI>,
+					 <&tegra_car TEGRA114_CLK_CSIA_PAD>,
+					 <&tegra_car TEGRA114_CLK_CSIB_PAD>,
+					 <&tegra_car TEGRA114_CLK_CILAB>,
+					 <&tegra_car TEGRA114_CLK_CILCD>,
+					 <&tegra_car TEGRA114_CLK_CILE>;
+				clock-names = "csi", "csia-pad", "csib-pad",
+					      "cilab", "cilcd", "cile";
+				power-domains = <&pd_venc>;
+
+				assigned-clocks = <&tegra_car TEGRA114_CLK_CILAB>,
+						  <&tegra_car TEGRA114_CLK_CILCD>,
+						  <&tegra_car TEGRA114_CLK_CILE>;
+				assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>,
+							 <&tegra_car TEGRA114_CLK_PLL_P>;
+				assigned-clock-rates = <102000000>, <102000000>, <102000000>;
+
+				status = "disabled";
+
+				#address-cells = <1>;
+				#size-cells = <0>;
+			};
 		};
 
 		epp@540c0000 {
-- 
2.53.0

