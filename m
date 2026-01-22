Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDA22D839E
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 15:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769095652; cv=none; b=khK6eGkX9UGo4k/LPLu2F/sA2gyCN7A/TUIBV9OcOc1a35sxy2AyJtmoLlxQbOPcGHS4RqtDV4t6Qlnkrvx5Qb7asSeAGN7rtVbZT7ZsrL1I9fzUFBKQ4W0N6463yWIZvrrPQqKPFO78Q/O+88fOYP+kzn7elDME76XQ84X9Aww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769095652; c=relaxed/simple;
	bh=JqgbQNrqQ6UKCxgFx0b++79yzf+5y6xvkz8O9SHBNWQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uneOeG71gXbYSUunKzRz/heo4nrd6PEjOnGswsazMH1xpCW5a8quCzGj/p83+Oc7kDgkrISubMcBZgrnFbBl2uKJUXTwwxvYLyeFOizw2lk2YA2Bqq2NbNXTPFEgveXsTxRRa2hibsL0Y7l71BhJryvXhYXN93cFkP0TlMhDP3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fh5zBYzE; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fh5zBYzE"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-435a517be33so741091f8f.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 07:27:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769095647; x=1769700447; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qx2wv6S0iIG4uGf8KctiDi1tHOu4cYrHv9uyasSr0z0=;
        b=Fh5zBYzEYPuX4wSaw1qkir0fiNmRP8gx9qu+/HwsZxE2dqY/chCBS5gpF4A5plQQ/2
         XnMjZZ+5XvgnWqjcQl8DtCIxxpvGusD0Tnj8EgN6IqvlSxHNzV6SR2JPvJeYlebWizwp
         hvc4LwFZAzK+MNrWScdiyC3Av+ylCQTE4Me5q0XKplWXTdatepCidjVEQB/qX0qbd3KI
         4QgCzLKl5JQUIzym9jFpzhCbabj24Td0Ha20LNnYNPVBQqznqIR8fcCFoJpHSR0TeIxK
         +RJMZ0/+b4jaVbpucVgfIk+bZesx+yNXhuxiHBz272j8FQde//Vd0XiiDYEIOnKcmYoY
         KLxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769095647; x=1769700447;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qx2wv6S0iIG4uGf8KctiDi1tHOu4cYrHv9uyasSr0z0=;
        b=wikCxu6qw0tnnRWxezDVSB5i+12Bqib/ZlLugvOeaHiGgGeFKDpGG6zK1Lv09epsvL
         A75GCcPsJNbIQ4G4Ntrgl0hCIGawgiIsX2/ck0vG3J85TrbygFCjxJslq62TtwVWjeyq
         eocujXYbsrJgITN45iqKr8YXg7L9rHZ5ksE4g89rt/xMiBZs6tTTc5v43OnnGJE8xW5G
         GO7lTEhyzn22X9/2saLnNzCRk+Zgf2Kmv/pZawuhfu7+a6Y2qHcsKbmuLY40A6vmNMvM
         OHBCEh7KfcnxGOsMzqASfeeK3uZ0Ks1fMaUxv56uV1FOLGxDGZ1AnceHup4ivQ32cCUB
         Ly0A==
X-Forwarded-Encrypted: i=1; AJvYcCV0hgglWuU4AN3yOUQGDRSGgTZiExJ2yV/ZsnSDiK8aQ8yhnYrGbyq1HmEZzbWQ7N4FueoYauxopXuElw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzcItyx/f6yVU0rxaRT8Hvz+bqf/goV8B2DRDHpyzfcSh3ugIJF
	2tXwSCe1TO5xxPYmsxVE1X3ceU/n7X9JNgk/t59HyFDNesGSkOqaP6P+
X-Gm-Gg: AZuq6aI6O7MSohqXjTjqMmt3lw1/wn4wif376yFsO7AzVSDzDtpJ2N/0fLiBNHsowyD
	0QM+svSRFAIqqllVyjWL3cM8gUvjToJjgTkGnL2m3yjAQSAUwElHNa7reCY7YEuJynZFzhJ0D11
	UmQov3QxaGrrBJGrO9fYWLW7N57ULn85Bc3CYV28AM9+AU3ILmiIO1ZnEOcUIpwM/Pi1MsRWRtM
	FpIXSO2uOM26rmUVJ5/R2vDo+p0guUxSRd4lht4yxWnHQqC9Enr1wSJOTrb4SoPkfLUH3xeewm2
	IKzYiVrVi+4o0RrEsYhgXSnfWfLAOjdIEX78Irf0G2JpB7lTD0ic8Z7DBIPrWAJVBK/ZrvFB/Qf
	93Jjj2a1Xra0CRw/23WNK1Ij5kR3pDFOI6B6EqaZvkCSPnHY1rGO3lalQ33SVGN4aajWY98dFOg
	SxnYFhg1SGBDY=
X-Received: by 2002:a05:6000:2c07:b0:435:a258:772 with SMTP id ffacd0b85a97d-435a25808dfmr9706611f8f.57.1769095647132;
        Thu, 22 Jan 2026 07:27:27 -0800 (PST)
Received: from xeon ([188.163.112.49])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4358f138e26sm20762642f8f.17.2026.01.22.07.27.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 07:27:26 -0800 (PST)
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
Subject: [PATCH v1 3/3] ARM: tegra: lg-x3: add node for capacitive buttons
Date: Thu, 22 Jan 2026 17:27:13 +0200
Message-ID: <20260122152713.8311-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260122152713.8311-1-clamor95@gmail.com>
References: <20260122152713.8311-1-clamor95@gmail.com>
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
index e300a2c49edf..db4b16a21e86 100644
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

