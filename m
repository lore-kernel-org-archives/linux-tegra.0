Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795378480;
	b=YaUVjmOlpvNXAU/j67CLcz1AkS+SOLZudvQz2y64YphvM49O0EWouWtyECUoXJVHCEc8
	 IyAhd4JdMC+d0BCpvqBWwzv5i5tTtHtdLiwjM/SV770812H5OnVizrcmI2WJl4+bKxpKI
	 VaJQD+FX350PbJ4Ozh607so4wTgqF9+DMIxx4uMbSJ7sbeVnt7VpUMrr064xRhKLQF4Pp
	 798wyGre9ZJ6sYi7kYylBaebbd+65b9/udsG+p4L69X8QUe2WTrtz1rncW8rCnWjxlgZk
	 1ATbP0JW2baC6T/VeUZXe8b37gPRl/1PLO83wbyLPm7JycZb9mULFE+a0239Tzv9UOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795378480;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
	b=Ut+xJ1zcV4QARs7ocxOG8Frf7HUC42zkpI/4gMRGHFXkQyJLaj8egZ3yXL9CgeVwkuXb
	 jr9uZBP18frTz9P7hwqNFI72JjwrB3FCeljPtUI0+DB7ML2yyPYMB5Makf3k1uI/NV/Zw
	 q0frRxkUnxzIO9k3BB7I+PKKnACYq+x5N3Rr9GTmoBbSPxO42RZ65pMV6x8KnMffuz3Vy
	 3nevCNF//nezOqkMtoG9RBc1lqKcfMI5K54pxhEyqFn4ZhG/jU7oP6/EI8jJJpGafcpAW
	 0dvN1xbGJyIXEEcTQX3r0dvefXoWrOaVc3ZjtwlDZ9VxvM9K3rD3FZ01ZoWfd4pKWdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo;
	arc=none smtp.remote-ip=209.85.208.45
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CCF606A684
	for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 20:14:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5CCF606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=l7UTF+Jo
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b87408c797so3185944a12.1
        for <linux-tegra@vger.kernel.org>; Sun, 22 Nov 2026 12:14:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795378478; x=1795983278; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=l7UTF+JokCqBU6VrJpo17WRBv3eGYi4FnWAlc2Xv7GUlRvrFTt8ZEo4zZcogx2mkyC
         PHOD1v4KC/TTLhXKYsMHZQ9y3MLg2KNhTC22emUWRB7tovYJB4JirU9U1YzVR7/f6Wmi
         EHzmM+TMFbPqOzq1XqRjXHGhbwy6dTB3OxOsShl1bwdG7lFdQydmV63KJ0k1Lz/1XWKZ
         PXkzmE4mOSgt7g7DuChgqqHbk26ePf/m/QnC1oflW6BbmZ4DgaZ9no1uYIsNkkvP/MlF
         /Ki4bwJ9masRw+++WgBIUC3W5bqdTAFZB9ews7NXrj4R8j3SkqGhDl2pPsFcArLb+Oyi
         DTBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795378478; x=1795983278;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tAIopA04u3kiScfWK01xQnJoFdVDI60THi9oD6UnM6E=;
        b=mddoK15Z0bily5fQkv1tSK+ko2sRcPA0uXeLmM/g7ToLMN3BByPcloiyXOUEOEk2Ex
         2TR4zsya77P9r7e72Wp1QRMSau6k+P+lqbI2nB/vzYhOn+2yDttjnU//I9P1aOFLI7gU
         2/49aS22y5YjjYSdjUCp0M/ypKFvrDebY3NLmD4JzSfT1oBJowEmvzsMQJWegLafzFds
         xnSmQnMhqZI1pbN0gt4eqJ1pEJShn1m4STuZigEJ35wZ9scE5XXoM72Bpyr3hCmUGz4I
         Of8doETjcRp86e0HjAl5Blx/AoLieuFBDQcdSxscUVvaC9Czhsd9Jardkwh2EH5pA7Tm
         HEQw==
X-Forwarded-Encrypted: i=1; AL+hErFfFcmRMSvnuvJWM1kdcIG/rWqHH9IVQAaU/CVy72+0dhibEqWLnjvaW+8qlY96aqJu4qfghtGeKCQlGg==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ptJmdTMyZPHOE58u45QS/qIz9h9bnRwBimNgQPXTq9bwW65QW
	WbT8crGh4XMLzIxIpOUbD2/5M/VRenB6uoY6DbCIXsvfSkKpRD5Bll77
X-Gm-Gg: AZFdTZcsP9oKCu/RgIcSDK6zV45bHgwUvAdNf4drJSJPBCNdt/M/LodxF1x1zu4PrWI
	RZUjJOEDmsAbIlXNLRit1+oGm9dn2WzUJOI5/5zJfDQ9Qa2MAPAyFZFy4XaVcuSu0FK9EUio5TG
	viGApre5E+74vaMF/cGrTyUb1gQyKwB68wqRUFhwWQ1U5QT2M5PzGvpcWEGKwOIg/yTiO+zEDVW
	b9ytDQfljiRGG4uwDvc60v/AlBAAmUtibPknIJM+ObDltmVWSqGRV3A+qr47NPufFkZMFWVeiBx
	tXsYIu7U/ObFLoXdxWxgz59y4HsyW1Qo12npcjome8OmYrjDaz2dyRt42nhaYeELrKaud9wI/kU
	Tu0qyog+b91/wx231+OrNPM9gDHbYbIQy+15hZV91sBZSQzOKxcDQpu7gqXAPsr2b/J9mKhBwx5
	c05crL3700sSvLgQ98C3XWtO0/bvs8XCF8vczMH+TmPewdp5U+RSukEsTgf9JWyM67gVrbZHL5l
	DVj+O5d+HPNd45OrL+MhVioe/Ltctkr5TppQb0+EPP6qh910u/iFdGeI9nJ0yVJasgEIVm5q98J
	OhfEY0ZoCoe7lxyvpcjevJcienQuVrsN6O3JcA55RPETSmwV1k9rQooXkX8GW9pBCWfZWn7DMdm
	VlAYiXYl7Pg==
X-Received: by 2002:a05:6402:42c2:b0:6ba:9142:da2a with SMTP id 4fb4d7f45d1cf-6ba9142db1emr1776415a12.21.1795378477854;
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
Received: from xeon ([188.163.112.54])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6ba370fa8basm4424074a12.20.2026.11.22.12.14.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 12:14:37 -0800 (PST)
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
Subject: [PATCH v1 05/18] ARM: tegra: tegratab: Bind VDE device
Date: Sun, 22 Nov 2026 22:13:54 +0200
Message-ID: <20261122201407.23742-6-clamor95@gmail.com>
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

Add Video Decoder Engine node to Tegra Note 7 common device-tree.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 .../boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi    | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
index 19f5549867a7a..26f1f7dbcc4c7 100644
--- a/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra114-nvidia-tegratab-common.dtsi
@@ -47,6 +47,12 @@ panel@0 {
 		};
 	};
 
+	vde@6001a000 {
+		assigned-clocks = <&tegra_car TEGRA114_CLK_VDE>;
+		assigned-clock-parents = <&tegra_car TEGRA114_CLK_PLL_P>;
+		assigned-clock-rates = <408000000>;
+	};
+
 	pinmux@70000868 {
 		pinctrl-names = "default";
 		pinctrl-0 = <&state_default>;
-- 
2.53.0

