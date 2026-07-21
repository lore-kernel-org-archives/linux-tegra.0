Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E09547DFB9
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628677; cv=none; b=oBj2nLTYCEWd1qymO7IuvPYZrOijFsDrDryTpt0Wzc9kviPBlX1Bwn1tF+3Omzz/oZXZMwWi2h+UfGUUiYiMOBrjVBleHUuTWOr2ViMNNmFCqtoadJztn8fmXZTkRNXZC8ljSl+zGk+cp2lFFh5xFL1igkdv4LE6sQBM3+FkhBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628677; c=relaxed/simple;
	bh=YR8yZO2uKjwN0dfJLiLfLLNLdB1TBEL7rV/MLtZyw6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hNmXAsO/oyeldFiC3iogOJeeZEn8o5vnOAsKYbP9YvI4vZCrK+LdRDxhOQa+4KGcijQIiEqlUdZes4IKoycPeZW+LdGXCEe5MJ3z39pQdXtY6uZsjKn163wVD/6Tzay944xx6KQElpNG+uGWH5jX087QGdOmebXo2YFVg+e675I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TAZWXi1p; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TAZWXi1p"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4954c0833b4so24609645e9.1
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628673; x=1785233473; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=acge6orfwT1o0ryUQhfNkS8hbYdA0DXxX0OZ/V75lAI=;
        b=TAZWXi1pUiHtqsAxO0wY5Otsxqo5S5cAdCZ/WYHorzciYW23xHR7/hM2n+JZoOcC5F
         1SIxFcAk2HobAlARyNFg1ERYyGLBDyIUTSTMiKun8YRJmsey9LZ7PSiXnlk1Q3J9y6JA
         QKZuyhKU5w0D9eGrLRkoCyE3BkUoRd3Z/oHkazGsWvcFkjk8PQGoLsTrL+iNkNnGGMcm
         08pfIaexZx65deLEvVuK5nUdKzOo42Aebq9Ql71sfHPl0HTXDTGC+QkN8RutxOZ4XXoR
         s+bagWd2BBwql4FWRX6OCfPACRCuKQC/OBCoOco2YFDhiPE/d0DR9XduhBxRfkekU6r4
         OBLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628673; x=1785233473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=acge6orfwT1o0ryUQhfNkS8hbYdA0DXxX0OZ/V75lAI=;
        b=GYCJ8myR/Ymj0ATcriCi1NVNY8Mvc9Cl+9nskxZY2giNv8bgY2F4ZLbY9ZdpGfTkcW
         //I8UlzpNB2xCAw9MtG9ZZzxjrUXE8JKaLeSP+T8+44dJjOITjxC/UqRnudtWOB0A4uC
         0SO05EicwccraUYDryqPNfRjNbM/cieAy/IYRIwxAmPOaFk1qFDfkAUo3VMZ8JnkkThW
         wjY+iXjvM+esV4Y3ddjI+r2KfpfWWiBaHxq6mA6DMF2mcQ0/Fq+g9o9ftIKNZwvrykcm
         3V7dEGC+qiXR+wMVw6FXZ7Ss5jwB16NarBNXIxxv5jA2OBQJpGsrar1tRgviMfBPA8ej
         FXDg==
X-Forwarded-Encrypted: i=1; AHgh+RoQobmw3450fjMFNvm/9a90UWzfmF4WRhGskUShY6QYQC2dhdZhjEZrHU9TA71mbhe3NfAac+5ZSw9HuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvDDkjci9wY8Pvenj0QfCM0RpqZuSAq5MoMSu/hu0SoC+ooERN
	jp/i62jSQWbJJB1xRGvwZm01KNlSxvFYW9xEj2dT4D1uG+F2SNi10GJ/
X-Gm-Gg: AfdE7clh6O1YbbPM7cQJdRhA1z5LOi6mQW5XyyjOREOyWzBSy0TAnqTMEtZAPH97wXP
	UYaYKVfmbrIvtpK+9Ny/n9JqoDvVUUnshSIqZ4nahNOf4ydSSIEh57deDPVJoHhuDwF3ZPqZmfg
	enI+87jMVXN08t9aaWY1khQzexh7OXdKK65Ya56955RWDJ47OKS6j2X+SiPe7Wd0YojvsEYEm7g
	+kBmN76+Pac9buxEJKWZdsZC2xwHjfOK6mwuW4a+qS5TbmUP4F0PwDlHNZr7+vl0NSkS7DR++7d
	jP5mutzBWEXJL+m0n2yZZRSIqqJa0gKmDlMMPggSWOvaIdET3IqPCxddyervzqzL+6HXTjUrHr3
	TcIfYQZho+794LOxfVwc/nDQtjNU92J5ES1v20K3d3KWIftNeiT06YDvOj0QQAUsnGeryluZD+x
	4fW407Je+LMSzzyPCzCCtYBXw=
X-Received: by 2002:a05:600c:4ed4:b0:493:aa0a:45ad with SMTP id 5b1f17b1804b1-4954a3ec5f7mr197781115e9.2.1784628673188;
        Tue, 21 Jul 2026 03:11:13 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:12 -0700 (PDT)
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
Subject: [PATCH v2 04/10] ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
Date: Tue, 21 Jul 2026 13:10:53 +0300
Message-ID: <20260721101059.451699-5-clamor95@gmail.com>
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

Schema discourages using "_" in node names. Since pin names in palmas
pinmux is not an ABI, remove all "pin_" prefixes from names.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 20 +++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 00eeedf3ef7a5..a27d3c4f2c63c 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1462,52 +1462,52 @@ pinmux {
 				pinctrl-0 = <&palmas_default>;
 
 				palmas_default: pinmux {
-					pin_gpio0 {
+					gpio0 {
 						pins = "gpio0";
 						function = "gpio";
 					};
 
-					pin_gpio1 {
+					gpio1 {
 						pins = "gpio1";
 						function = "gpio";
 					};
 
-					pin_gpio2 {
+					gpio2 {
 						pins = "gpio2";
 						function = "gpio";
 					};
 
-					pin_gpio3 {
+					gpio3 {
 						pins = "gpio3";
 						function = "gpio";
 					};
 
-					pin_gpio4 {
+					gpio4 {
 						pins = "gpio4";
 						function = "gpio";
 					};
 
-					pin_gpio5 {
+					gpio5 {
 						pins = "gpio5";
 						function = "gpio";
 					};
 
-					pin_gpio6 {
+					gpio6 {
 						pins = "gpio6";
 						function = "gpio";
 					};
 
-					pin_gpio7 {
+					gpio7 {
 						pins = "gpio7";
 						function = "gpio";
 					};
 
-					pin_powergood {
+					powergood {
 						pins = "powergood";
 						function = "powergood";
 					};
 
-					pin_vac {
+					vac {
 						pins = "vac";
 						function = "vac";
 					};
-- 
2.53.0

