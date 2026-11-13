Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586739;
	b=jYi8g0RAO5+PO8HlPRCmZfuOQUxEmZ85pvQlGlCj3fyn7UFanO08nqOB65UEkTM4W9au
	 bj5W03LNLeHzlDJeL1Q+5j0UUjSbC8AhmtviwyboDUzTPi5A/E9/QfR0mVI1yszBgCkdv
	 dWDvD89nwIDwlOk1Ibk2RLr0M31+XnQqu0/F9IeF0DQC9JttQTIcQe46/123HxNsk2fN8
	 muqkAvCOO5lUJ0GrxlzTsu/dDoleE1bUsP920ilOQqsrU/q45R4OLXdd4DbUbxtsnauhH
	 l7wg5QpBpn4wfoUNUgpS3PKkyDY7Yt6mX/PDxYZhdg+VPIfoNmr8DdbOId6W4M/80Lg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586739;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
	b=V9ZygxlILp1usUVNzPf3AI8tMtwGP8tMqKPCuuXYxxgJ3DROwojgJn90VnZF53SqdfUj
	 P2ujt9buLSXAICwN2UtJEqnJ9Y5youJi22DPMOeOxHOxJyVdK6wq8zLvqrzDnlXJ973QK
	 hLIc85vzU/k058jMQraYFOcIvgwwBreo5ySEJYPQP7u33kzRs2CgxIeT5/FKuHLsl8X8p
	 2EcK6uLUWb2g/GqkPkVeA42jsgWwHq9YkwNaYwvD4+mdQGjyP3eKPI0ZyX1k80CD/QG5Z
	 sHAWb4BUabaYGNlLpJb8JT5RHFaj8tXiLmvsAv37rwkKDir9Cod3cd6RzELeq8EVSoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="h/xZduVu";
	arc=none smtp.remote-ip=209.85.218.46
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com [209.85.218.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E461F60A2615
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 16:18:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E461F60A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=h/xZduVu
Received: by mail-ej1-f46.google.com with SMTP id a640c23a62f3a-c4682977f9aso237971066b.1
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 08:18:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794586737; x=1795191537; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=h/xZduVukTCl98vPuaD9tn7ALCK/+1HewUEzyNcbAZYa8oxWIHIV7r+j1AzG8JkuLH
         28XeWnnMevEHeKDQ6if9gLfnPgBAOLIU67vCQFebQIKpLAZu4B73xIYiKzNL2z/fIgY0
         yh8YQNaq4KfViS8dBltd+isLo9z/hrM9j2BBzBTh138rsni8UF1HYUOIKwEEHxfAl6NN
         sX3tfC9HW06LxyY6oQqc/7jzKHlbOjQLsPYrwUyhgUO0/buG3XT81pNAo+F9ZWqV9Qhk
         ObmZ+/Y7fFhaeI44Isf4MVJVnjLgQUyDpZiDYXU+eevVWUqan2FhVEtfgYVlQVXTUB2U
         hTew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586737; x=1795191537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HMJ+dwPb/3PV0iTHWqAgN85Hf/aWfKjSW+f/zVf9g0U=;
        b=LquHV56yVCVSWTU66ukS/2WC7rQNuskSzZwnnrUor5ZpADZnQ2/kpv9NZaiqLa5AIJ
         uJ+FyPpOflY/24JHZbCUXA0J+a3gTqYmJYSCKxV+F7eS6fXcsFdpk1P+9z96PNFtsFCf
         J6XVVzsAJzUKeDh+Kg5ulkrekAF5OmGqOFKzZSLedK6w0AQKEVWOxo9v+yA5oEKUvKW9
         N/DFi+b7oz/IHyXeNSDjdGvEC1Ni0M6fL/fti9rN/rqTWbLnEwj2Uf+ptoJqMV4dl8e9
         8D6qHmSA56Prtm7pvdRvAt6frn8QQiU3Dke3Y3RUgIpDLI0A68qoEy1KFa41ABWh946k
         mzrA==
X-Forwarded-Encrypted: i=1; AL+hErF54R21t/7wdYFasDGLr4ko9UGfW7JSA/pG0hwJJ4ldrKvgxiNDQihtEE+h4C2ATyV19Q6n3lOetEJIeA==@vger.kernel.org
X-Gm-Message-State: APuU4Z+68P0jN6TFqD+K7jWgczNbeG1CIZ40VjMA5efv2SIkSf8HiWkB
	9L89zKCLWnzwYrj4JDd+VG4Ebc7gAD/qNnwqt664wqaw2my4Bym0zghk
X-Gm-Gg: AYBFou2SESk5qfbfbia0PNURB7ZS1bC6GiWTbQdfuoVJW/tm7cIyANhSGoVH3SFwD3e
	swgj2MtlqBGeyJBRfWAcGl2MYhIAxVUxU2T9GiVOxjTDkA+VRjWNgcswuMDZxtJcbjiLZxkbbbQ
	6/hJWrWJVBHGJOaQXZmzXrj78UWjCCntyW+1ONCebHXzIwE47sUuKVQL+dParVUdNjfpWkJu5kA
	sEAaHbEjMa7wf4JVS7zseGIJNeg8Kny5aIMa2nTtDfxKYChm/NadRs8u7JXgwglIU0BpPCdN+Na
	6PIYQULBSfgrxwX8X0PDv1IFGBTIa24c56URjGo3PUMWP4mc6cOwNYlWK7wcRQprpAKuZC5DuLO
	wPClxEDxnHm2YNerp6lnv+S/aZ/0ZgZntHuPsgAv9MeWPCMOEODwqjPFtocPOShEVLC/p0LwMwB
	FoH8QeKhiVAYWNKiC3h9/PgRJKzxYFLVKD6rm9ZRxyuuTKaFVZ4OinF5SuGV38HBLZccPYDJrJU
	+Qeo19XKh+tOwvyC2s338sUaH42xUCfPZamYgykFNK2biflKi2IrTRn1hLUGtDhD/IQZQfEvNeJ
	PGFHzDFiUUaQT9qAh2rdpX1r1ivm1UEqeZUBmWyRHMPgp+K/u3BoiYK7aIxaDcmMhB3d5gJLbHX
	78PmGxPdfPa/S5/PsCosScjTzKnjJQpw=
X-Received: by 2002:a17:907:3f20:b0:c46:c3ad:e1ca with SMTP id a640c23a62f3a-c5096396effmr277155866b.9.1794586737209;
        Fri, 13 Nov 2026 08:18:57 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b24b88sm122297266b.16.2026.11.13.08.18.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:18:56 -0800 (PST)
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
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: linux-media@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from Tegra30 VI node
Date: Fri, 13 Nov 2026 18:18:18 +0200
Message-ID: <20261113161819.36847-10-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261113161819.36847-1-clamor95@gmail.com>
References: <20261113161819.36847-1-clamor95@gmail.com>
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

Tegra30 now has its own specific compatible string for the VI. Remove the
Tegra20 fallback, as it may interfere with the correct configuration of
the device.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 arch/arm/boot/dts/nvidia/tegra30.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/nvidia/tegra30.dtsi b/arch/arm/boot/dts/nvidia/tegra30.dtsi
index 1e51da329f310..e1f66240ae552 100644
--- a/arch/arm/boot/dts/nvidia/tegra30.dtsi
+++ b/arch/arm/boot/dts/nvidia/tegra30.dtsi
@@ -150,7 +150,7 @@ mpe@54040000 {
 		};
 
 		vi@54080000 {
-			compatible = "nvidia,tegra30-vi", "nvidia,tegra20-vi";
+			compatible = "nvidia,tegra30-vi";
 			reg = <0x54080000 0x00000800>;
 			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&tegra_car TEGRA30_CLK_VI>;
-- 
2.53.0

