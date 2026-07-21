Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3312847CC71
	for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 10:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784628673; cv=none; b=GiW7Bv3L/ZW7nxlDb2i8mjA/E3KYdZT5YjSb5hpOMY8WKB47r0QSIfBeEHf/X7R8EtUQvKXIdvM+JCRSvKHots+xPKaIcFcYWLuiG5anf9XaU9ndhoBffH+T9Ytjc40N5S50W6M3Ztih030FuS2OOZS3OoTFBG5LDOLiN9D442o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784628673; c=relaxed/simple;
	bh=TUmjXw2M4oeu88E4T00FZuITV/yEcOpyuEC0IVB64Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HM6/mGytvQL7qVHhdB421VnzZSgIIlxO6XSU2VONUqHMeCME8DaHTltWKmd1fC8iHWHnm3n1P7XSLkscGiKiBNHnRaYSGNCFRLuJa2/Nh+mX4Y/5MTTqak4UEumqPcwMWbCoB7j5+2DsWHouvsim8HOxUmzxYDG/j4M82EV3HAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FHbD6DTb; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FHbD6DTb"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4953e04ef16so52396595e9.2
        for <linux-tegra@vger.kernel.org>; Tue, 21 Jul 2026 03:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784628670; x=1785233470; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=103K+HDBGo173ka6xLJ87zAEncnD5tT5dDYUjcQ8I/s=;
        b=FHbD6DTbyIBQiFS8HUcvNehDITQCI3mFTow3teJjPZ+ch3VibWGWrbw728CSrgUz9G
         bfUuAJpatFW7j5n6ceZBL6w1y4nOGiY2bFpjqHDpjL+lLN/njmkwIo2nfAOpOwQT8jmA
         iyUtw/lEJ+nwnBL0+PE7mPXqfYFX+uYqCw5oyP4zpLqQSUc9NxUveY6MQzOoyQ7LT7/f
         Lpr7J0cmWj800ERFUVrCVR7Nvm821jREqK9qwh7UFPH4x/21NFtJvS6gUX0uDxdPd9yO
         1Hz/+V5yLBAiRynz8HgeVaU7D5UXGfhWcpO+t5RrlUSkrytlOYG+id3Eg14wzXegMEt7
         1aEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784628670; x=1785233470;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=103K+HDBGo173ka6xLJ87zAEncnD5tT5dDYUjcQ8I/s=;
        b=NQ5rQwDj9TjfWX/f1VKx3nxhI0WiF4KdfSPqK7Xv1eNHqB+SjBZt9qPdDejjGHvU/H
         eJNKhp5LDQH01ToO+uu58fj5V8jT5jez3B7DK2TG4k+YGoypknH7amOi63cWSyO46UOj
         gxHIChML9WH9zuRsel0gX35bSEFplP1sEgJFyvorZVumL3x+fDJOTSrtPXeAwBCyArZU
         Y7CrtbLdbElBf/R1x6m7QhLqF+NUTDvv6h6r+3qj3Kt4JEcdJLZaHXFkFGtb4Qm/S5s6
         7V/wYanTvf3taWD6O84OtdZ/Kn0bXAMXuWZraT3IleQ1VHqrYgjuegIv2Iq1m6W8GweA
         AaXQ==
X-Forwarded-Encrypted: i=1; AHgh+RosJoiq5L0MHewRjATaBQdb+c1NPhpajmwxEUu8l0zWua1SMGSqjm1hmJdqRHlUZgVM+G+HbByQo7P/Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwI8B1td+I7mQMrWjwM+j6QbiwfjH/qLG/6FoHfSugagXF29oBn
	xLhNYWxxo5WGtgvNNoxkbXjMiQd/YUi5Ynem6u/wRzt1MxGNDoKSFyKZ
X-Gm-Gg: AfdE7clYz8KLPEKsj6Mrg/rbkarmUIIKOXVWYsuKz5cn3XMOzRvpzdu0U2qBOuMWfOP
	d95uMciDmgz0gN3QAXIqKrBAXLybth570+wRvbairYdorYN1XDgbu6qzj1HdxUrGbJm16NF7hgD
	hXVtyiHybqxvxWli8yY3Un44O5hzW4tsuQSX1bU/+b5ZOJaznOVY8wx6uufvUiah/htXHPz5jnv
	PHTVN0KKiQGNkDC8C/QYzDeQHmvxy1A2f+lw1qBTUiHo0umJSwwYfV1sFlF6IbKbHt+42x2Hzo8
	P6c6oo/xHwtGDduxRiP34H10SzZaSicI6AL3pDnZAHuiO325KzdD56ucruvPHtPNKP8PT0+mZN5
	HUPkFVFGCxMpxNDMGnaAQ27MBSl9MuXkWoKhTcxj3MFiPveGmpDnaPzsuYfxeGxpmWG6vWozyRp
	XZVxQeVFsrgqTDogEyJjFlaUo=
X-Received: by 2002:a05:600c:4e94:b0:495:522f:d994 with SMTP id 5b1f17b1804b1-495522fda7amr148264315e9.0.1784628670304;
        Tue, 21 Jul 2026 03:11:10 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4956547319dsm57127085e9.5.2026.07.21.03.11.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 03:11:09 -0700 (PDT)
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
Subject: [PATCH v2 02/10] ARM: tegra: tf701t: Add core-supply to PMC node
Date: Tue, 21 Jul 2026 13:10:51 +0300
Message-ID: <20260721101059.451699-3-clamor95@gmail.com>
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

Add required core supply to Tegra PMC node.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index 5358cdb6efc10..55e9256e80f33 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1599,6 +1599,7 @@ pmc@7000e400 {
 		nvidia,core-pwr-off-time = <2000>;
 		nvidia,core-power-req-active-high;
 		nvidia,sys-clock-req-active-high;
+		core-supply = <&vdd_core>;
 
 		/* Clear DEV_ON bit in DEV_CTRL register of TPS65913 PMIC  */
 		i2c-thermtrip {
-- 
2.53.0

