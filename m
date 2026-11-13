Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794581850;
	b=q73LjJ6Am4bjBZsoOtO/HaWbIy8mFUZ7whkh/8qiQe6P0aQ/0Cgz88kcNEpJ06xrcnXy
	 rTCPMz0LAORIEzAsOAOnctkup46aL7RL3gTtMP5dKq80IJrEZ9fS8Mc3WC8CBFT33B8Cv
	 Q6NwOq/moksH/087dv71Ri8YFTDgo5VaWCfZNnL97HmDKW8BpO3n+3Bfy/iYzt4bEQ3nu
	 g904EpyRtQd/M399ZFZ1D9E+qEbgEKXFkiMPnXJRxsdvxMTV6I5X7DxOYTPlTPXKw/6Q5
	 Bu+6HrQeopdtOfkc8PJskgu1fxMuyp5I2XYib4vH53+Rr0Nmi3qYbmlUVaE2aY7ZN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794581850;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
	b=Se08IMMvOaQz7IIDORoZJ6aF/PYBoCuJgnIIXMoOgxds2yLmwwulvVbQDAOxCxaxSkn1
	 r3h9xaH+jhWTWfNg0HIHoksYzgHb5o0mgNKJ1NJ9hUFUSc4ZmcZnHCmSi+g5/wXm92FJT
	 0x2AdnRtygU9loKpK77/7YhIDUMSlcdgfT9jGI9JEFd3y04JpKkvNHDYuQh8ha4h943n6
	 BnZ09XRqvfNv5hw3zCZ3be5N4bcP9X67zWbVJJDjN//LtIkh3oPteRSg5uxOcRlHQ86kA
	 MeG3wsfDnf+BPTXU/74C/vWrn79juYES9jXo1bsXlTtjayFfoL36UDiS5bjMOPei7eA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY;
	arc=none smtp.remote-ip=209.85.218.43
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDC60606A338
	for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 14:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDC60606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=K9CSmkJY
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-c50a2efbe1dso180423666b.3
        for <linux-tegra@vger.kernel.org>; Fri, 13 Nov 2026 06:57:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794581848; x=1795186648; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=K9CSmkJYNmtAbvWCYPrP+SDpZMQQ0xdsPYXo8PsLi7q0i7Is28YK2oObjdZIdIT9Hy
         oUZeGt2AyBbZItYfe9wK+vYDeM1J8WQInwUA6ANAfPmVZ6W3eHYOh2uFtetiapb8VA7z
         2hJQEzbUki2GkUe54rvHxcY47jRM7YZ9kawcYDZpTB1ajp4LEuTAmkgk6NQg2C0JRwhT
         FJuYRGnfvm0iGRi94tXz55orMhZs2oscRwq261Ud/F+R9cedJFud5B4MJ3u8ZUVekYRC
         XXw54HRwFyv2zeglylezSoT/W0SPhglx0UvxuGoBYFkIqAwretjToNI1b3jjRZTQzKP5
         Wdog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794581848; x=1795186648;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lZnQS5vzjGFgkIk1Rz40qxA1rsbMTGKx4DvpvdhHSZU=;
        b=sxv8SydEIA6ONKjhmLPH5s8wVKeSMTsE7mjH94FXStaGOT1MwnPPWlvjZ1gUwzHpQa
         g6GKOZGLIaLPXBY6SOUn8ntL06qIzdvLKr5bslW3XsT7Vdw0JR3yDAWYF0keU7Nc5STl
         SGcQwcRjpnwlC+fXhDLTt0NDZorCXwQ+YDAskUAfmM2nUz1md4Y2vtKADL5klt5kteDd
         9grbpFXy55Nvfohhq2mileXfXndPJ2hJFBfAtUZCL1ssG25syIKfqpXsJITxa7KI4xJo
         lLuvhQxlmtp4F3ZhOEpjaF6xHpUH87Fh+BXBizBH82iNv8CzW7Rn7qxMjfkQHNVVWfZY
         OQnQ==
X-Forwarded-Encrypted: i=1; AL+hErGJcAF9dCHGPTH/LYXiOZ4SUxF5JorwLgNJLVPqEgQ8sxZf0sqhA9B63jGNglt/AKka2ubWGOgXoiwlzA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9ZSlAs4dN+yIhDhCNnllPuHrUGtpvIO0X8TMmVKQU2kTWCA8zA
	E2KXRR3sPR+mBDZ/Xp29OUkpxFLG4VjPrCTKPssTxJxT5i7JQxoGxfXY
X-Gm-Gg: AYBFou1JCZXXQ2emSdzkSFpv1paLrS29Gg6MFeRsZQZlbvzI8gtZ/7YLuoPFjZQ4kuH
	KjegvsTcr0QyXONjvb1VMC0wge9WAERqzp/dushnx2R8CqOfR8ZFcjgKD+0NTHbi5LNwVlOjS7a
	vL+TWCWR6pbVLchMi/gGx31Ypwsi9Pd2Jo1ctrV+vgnlaMNOApQ3erGvkKwsnte6KYIt499KO9n
	IjlnIgW5bEG5e8wB2sl9HrJeEznVjjWwmn652wTaZMr4M+kCM0PAk9rQoN+iREgMKawGSR1fLpc
	KR9NOwfaWuLDErseRf6VYiO+fqiqYdXnulXDOkFztco9HuRShmd5O0RgrMvQJzoY9PKi2Pg4IHp
	kQh7Y40OBq1hIGkqJpn+tFwkTbREU5bMjuBJcpog/9xZN7oPFJUdYEckY5rw7vr6J4kpjZU/ciF
	AzNwlV4V04s58ZOCipbUj1KxfTmHdAVzZw/zwlufAP09RYSXzdW/ylfyKLn/GHuWvBlJ87EX/FB
	YIVNU3egwdaa8fahc0KJeat5EJlFj4D4xXLyZ3/LMt/VfPg36WC1OenAjOp1e5N3miDsTNgX4nH
	vqWnmLIClYeuO/CdgjbPT+LVQN7vJSz+AJ+YhaQr9ERhFrswTQhJiqFMIeWvG3Hhq/ZnLjFPVN7
	PtJVPIrQR9N9XXXAKwXTOXlWV1LhWfEvv
X-Received: by 2002:a17:907:3d51:b0:c34:c5e8:1dc5 with SMTP id a640c23a62f3a-c5096312247mr256633166b.20.1794581848001;
        Fri, 13 Nov 2026 06:57:28 -0800 (PST)
Received: from xeon ([188.163.112.62])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b2369asm109937066b.25.2026.11.13.06.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 06:57:27 -0800 (PST)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Prashant Gaikwad <pgaikwad@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 0/2] clk: tegra114: Add CSI pad clock gates
Date: Fri, 13 Nov 2026 16:57:06 +0200
Message-ID: <20261113145708.261530-1-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
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

Tegra114 has CSI pad bits in both PLLD and PLLD2 clocks that are required
for the correct work of the CSI block. Add CSI pad A and pad B clock gates
with PLLD/PLLD2 parents, respectively.

This change is similar to Tegra30 pad clocks and is required for CSI block.

Svyatoslav Ryhel (2):
  dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
  clk: tegra114: Add CSI pad clock gates

 drivers/clk/tegra/clk-tegra114.c         | 11 +++++++++++
 include/dt-bindings/clock/tegra114-car.h |  3 ++-
 2 files changed, 13 insertions(+), 1 deletion(-)

-- 
2.53.0

