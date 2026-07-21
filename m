Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBD3247CC79
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628673; cv=none; b=vCeM/3sFRjV05Z4ggpjwa4NehfzehU10pBUjJ8XzNFG2STp8QD6SLeoa9u7MkzYywgOBehynJhiLbI8hm/m/1nEqp0JYoF25cmwHH5zm6oD25sMMBXARXhJYxnTmgPQ3qCFrOlneJJpJolTxAcuazZ3i8GSlbZkPLvSZ6Zd6w04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628673; c=relaxed/simple;
	bh=usrp+FjtSQZcl8J2j5C1lL1KI7lHh7LNpR3MIeGSSIE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S8EapcS6wziVj8ypMrEhKgfwSzsoPRu3xW4tYS50qi8ytcTsNzs9I0VEDHccY+AyCWR5uSJ6M+sDPx7YuntCUuEczlHLUp3mqWV8UcOveMp0jco1e8pclehZ5ssF52VKGmSdeamAlPEMNeB2c5hsao7Aufk5Xyn0oOd7feaOC00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jQT8v1vn; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jQT8v1vn"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so25009965e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628669; x=1785233469; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/m4WPR04y0hiYiGJWdv07CkxY0CSTEb3AZvblsAiZL4=;
        b=jQT8v1vnV1Vels5NltXo3vWI6eNumVnWFY0VfT2BAx3u+Pn36C0fE5HKwsSgtkiVA5
         UKhNUFjFn3WCBUZmpV4i+kkYxoFs2VmLkbtimY9juIX06BSIBYhpKY4P6fKAEyIARdMb
         tCEhuXyl453eqW9I/VZPhK2JxcLbm2jeW/gtU0gcwZkUn4sje01ltd+MuC5OihhVFzs8
         Xxo0B5zdsoDkBEvzCjd+DM5sBL74cFuGSdw5isXRzcXbsbUcaJN/pWW09riwDH3gcu1W
         u04i+4cHWjHmNuNMUA+BHOIhoerjLIZio5xT0lbp+DKzvHzcGCkTYK4qE81O311GY72R
         d4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628669; x=1785233469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/m4WPR04y0hiYiGJWdv07CkxY0CSTEb3AZvblsAiZL4=;
        b=MXdmf7e4TqbJw56ikWVXkxAFE7nw6DTXZp+H1Ou4Y000zJQpp+jCukemJJJlfLN3Zb
         V5xH1x9VYxpOvZC8UYKGOb+62W1TwdVWNi2yL/pJwXRyO/M9v7yugnyRqdCp7HwF9ImO
         cxFI4k/duZRgbq6e/dA05kbAwqjrl6gF4bbxfBN0/6bLzGNalMPGerJF7o6eKHM3zALv
         byZISNLNvzDat7o6mnaQqr8C9uAsL+RZ16v7H+vlDVlvHjyqXYQECVe22AZqRsU7TyFa
         QgJicrw/T8HXbrCCdTp6GZ7eckaAgPvH8QFT7RlsmFzldjjOfbwxCQaiWdQFYx1BeqhI
         jutQ==
X-Forwarded-Encrypted: i=1; AHgh+RqLlK8LcaYvUoZE5OicKVE+xWhoG4Gxu47wZRQTRQf5qm+jlB9AJaOvcFi4kSACNmCzJ8MxRzH3ah0Rqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUWJm6gU0V0CMatfcVankgMbXVI9fGFtyWWjXBCZIWo82sUqmT
	r3r+7KTnrt6/9mWq3FsU/QQYXF1Veh8VhLGePbGr3pCEYpJQZdb8kYWq
X-Gm-Gg: AfdE7ckXnJxkzAnTeazkGOCTL7oMUdnRbszyOIsNllrWR33YMn9/dATpHwE3XGn8UOT
	ho1phe+HJTUd8gG2pGm1m33lkfkWSrqfEd3yK8+k26xHll2N1WZREbCJKOBFmPpIX7S1Dts4XU2
	847lpZHrut5xZ8f8ZhGD2CtZ7yhN4GKMGjo1lmCxEm7ip4KXuXyVC8hhp3ymCDKtctpTEJ7p9jo
	9yIiZb7xqV5eavJJC2w56wjHJGQ2vCcwa2zdK7/Shb1NCUS9hI/rsTVZDIIBX6CiWQXJ0gTl04Q
	CrAE0D65cW4fcLhhh7zuTB0o3CKX3G911ZOqnLiMF5OwNif94ucmEyudC9p3ncRV/bfWVemFd0G
	m3JSJFdAcH4ym59Dm0L6z0VYtkIYM9KRJ2mKyrXhPrNqcwUReKwoDsKT+u+3YWBiO6GOZCn/dMA
	aEJ1kQf3B3Op8z+92b+OarOOA=
X-Received: by 2002:a05:600c:6d82:b0:490:b8c0:d470 with SMTP id 5b1f17b1804b1-4954a405ea3mr143177785e9.19.1784628668927;
        Tue, 21 Jul 2026 03:11:08 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:08 -0700 (PDT)
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
Subject: [PATCH v2 01/10] ARM: tegra: tf701t: Configure CPU DFLL clock node
Date: Tue, 21 Jul 2026 13:10:50 +0300
Message-ID: <20260721101059.451699-2-clamor95@gmail.com>
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

Enable DFLL for ASUS TF701T since it is now supported by Tegra114.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index f02e2cf65fe82..5358cdb6efc10 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1621,6 +1621,14 @@ i2s@70080600 {
 		};
 	};
 
+	/* CPU DFLL clock */
+	clock@70110000 {
+		status = "okay";
+		nvidia,sample-rate = <11500>;
+		nvidia,i2c-fs-rate = <400000>;
+		vdd-cpu-supply = <&vdd_cpu>;
+	};
+
 	brcm_wifi_pwrseq: pwrseq-wifi {
 		compatible = "mmc-pwrseq-simple";
 
-- 
2.53.0

