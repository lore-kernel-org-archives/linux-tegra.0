Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24F130CD95
	for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 11:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785498099; cv=none; b=fwzwmVI+ZB6lfO7G5B/kN/3LvkxMxqRhI9yC+K9XwxCVXmtTCJo/lV7xdoQ66OBXnKy5fkrcWYVMRLmQ+301qGhbHKPFWeS8/4wu5fvaZeWGJufWUuw9NrE+eyRxrHyOGiWWeNoIQPHkIZGumN6PKISxq7ZtkPXwPnbPU4cM8K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785498099; c=relaxed/simple;
	bh=Q3lDkaOYkbkHbtNIKWgGOeumJP/9Qr2VFUZkFA7SVQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cY6D5cgZP3v4KN3ap0JlQTdcPc4KzyVGRluBv37vSsH9WbUq4cXhONM+811GU4kN02QgC1OAMJs9G/MZndyC4kNytyq0/F+sZm/mUzzTFFo+tDsopGOmEZFOHyBmHSBBbBBQSV2LPl0dRwKTObCOkYXLBodPWyLgbVZ9V+tcLaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zv+C7adA; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zv+C7adA"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-47f703a9d05so556626f8f.0
        for <linux-tegra@vger.kernel.org>; Fri, 31 Jul 2026 04:41:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785498095; x=1786102895; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nex6rH5sX+Zb7tHZScdW1Jdevf5eRc6w/3MVUCniJEU=;
        b=Zv+C7adAbUSoBS6GPxm286kZYSUJn5Nbfl8LppsVjj5gGnd/JWk7u2b01lI3zyWzEW
         5RdZq3TueiyGCD9l9v0sUGxwqjs+hWhvzUy3mNiV/6FITtH2bjsmRc3c1S54XmWEZKgw
         gA/oPQtKq1wcP5POCv6KixuDXBqrw+Wq9ydGH9b7feOylAjdor6B5sUu22eUF6JtGdPW
         ZFwB04w7FGYZOvF0LOOMCvlYsjmjpl9WVqKoh9Ne1A7aCPsUWlFdDYKm/Vx+OiUJWy5J
         uwn0Ew40iT8Fy2zqz1BNMl842wVnlVEQ5DRMuO/uytNaMgiriyyer40TUZHXGGDcyLAP
         isdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785498095; x=1786102895;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=nex6rH5sX+Zb7tHZScdW1Jdevf5eRc6w/3MVUCniJEU=;
        b=o5xmvi56Zylpk/1XlzWCdCTS72Bg58RXJeEE3LMB8tB6tVyLSS42Hmk0P6RNzVc60f
         po3kc7RSaBE3pg9GSPSWtyir9iirtdv/7D7dH0T9GueU3cJePCgyrey26v2Gu70Hix2P
         zu+h2Hqclj2hZi5FmjfHTbPh0RNR/C1ZcTK6xOpQsE7SfqNgYNmIeae8ZuqS5HbjlI1y
         AmL3FjnA8UpQIXkBFbS/LaVkY1PA74uHaUZsZqMcdyM6NmqW/eCyCqXHsphKU9bfLj38
         bOHp3EGTe0kwyw1JCuNVDbg5OtoyNfxtSQHiZwPKbVCwXjbwhnBiSQYUIz3oC0FLg15m
         qPVQ==
X-Forwarded-Encrypted: i=1; AHgh+RpmWfVEV9LmJg0ZUPBUPLPO9oybuKInKM1p/Pl//fDbDnqgwgUqc1pt6Kr0vpgzKSD1wMWuHjqhtM71eA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwULPPPjopdxmYdhyUH58uOhGT/ImD5ew6LpvXscUUvLv3Zl7KH
	aR9iDbXefMh4f3GzzTr5Af3DG+8d9oeZw5lIA2GFIGB+ySAzgfeLgtKz
X-Gm-Gg: AR+sD106RFH29jxP6F7C4pHPSKDQhskUX1sf/Lqwgn9c3Llv5A5QprUpEBDvf2mjgRv
	jbh7RPkqgo7sDAWJ2oKujcPETUmtYZ5985/6Pg6yEVS2qT1LrlRI/+BWAAqdG3doPwnQ+LK+5Ut
	7G/q5ZjbT29vVIPXODtaDvGhZ3B2hfslVY286qpCUGwa9vAHJC81GsPLUsgCYOCKYGmcGekEQAZ
	2Xzp/OnAfC/vTpNn542prs8c0hyRLd/eKdyHsaJmy6R5wLuESrtpCtxC5FAwgJ/Otk54w2S/gzF
	gV5GA948V5T8ZLx1RWyHYZbaMX3wPMbavibGmdxpJS+smMLukOQXW207KoEDO3BR5/mJng5P5YU
	iZnCXrLg0rmQ21UgR6OGPaYGNbKw6gybchq5FndwItakYJIYzUrXmWDngBdKyydrWu47QV1PIH7
	DtDeTjyPD+ksTrmstrYk28DNf4LV7H3BNCOzbsjOlB8T6K39NKn0BES4V5u1B3k9w3mVnwCP4RO
	LdUUt7au1H3931U21sv
X-Received: by 2002:a05:6000:2989:10b0:47f:93a1:115f with SMTP id ffacd0b85a97d-47fd2b76dcemr3150221f8f.60.1785498095006;
        Fri, 31 Jul 2026 04:41:35 -0700 (PDT)
Received: from xeon ([188.163.112.51])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d0064sm3769336f8f.5.2026.07.31.04.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:41:33 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/10] ARM: tegra: tf701t: Complete power sensor node
Date: Fri, 31 Jul 2026 14:41:04 +0300
Message-ID: <20260731114106.169398-9-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
References: <20260731114106.169398-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add missing vs-supply and io-channel-cells.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Mikko Perttunen <mperttunen@nvidia.com>
---
 arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
index b71a02b3fd86f..32d55c18c7446 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
+++ b/arch/arm/boot/dts/nvidia/tegra114-asus-tf701t.dts
@@ -1391,6 +1391,9 @@ power-sensor@44 {
 			reg = <0x44>;
 
 			shunt-resistor = <5000>;
+
+			vs-supply = <&vdd_3v3_sys>;
+			#io-channel-cells = <1>;
 		};
 	};
 
-- 
2.53.0

