Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E9FC192B90
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:25:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609546; cv=none; b=ArPLMSX1UdeytSM6fiJFgbuQ8FfjtzMi3hqsHejQqRZJk4W8pPv/QJtw2+VilUJFHQWDGNIUAQunWcjNAvoFghqND/5g+QKcKsSpMm4cIj2qLQ+9p1maiZhlYYhP1RCHCF++TqiDAaW78AUFSLs6ZzX0vJOR4dyOEzZRgLef7Mw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609546; c=relaxed/simple;
	bh=zMWrCZMndADSkg4s8xix2EZGPZMfvSP6VQAt0nAFJNY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EkE2Kwdp6mvc72NnSOTAlBN4CMiNIYL0cqlkYGHBrwhB092F5boUUL1AHLA1t18QGQDtd4dZ2jg0pX+i7aROb8gZlraQu1o1TKTdqKvM8stjvhvUQgt+2iruz/P3EdlB4+ODrFnszDur+cMsH9OKwhxJAQgKFzi4ug6rqxF4iM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W7qGEHfn; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W7qGEHfn"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-12332910300so1451036c88.0
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:25:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609541; x=1769214341; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=W7qGEHfn7+KVbeYkEa5SCSSN7O7DsBveNX0/+eFiqXIqsdDBoVHKyT33qWCG7HLHdC
         GgYAcvv9eNRD6QN74WoweNIEXlVd6u7Sg0kVlPPn5g8l5knsx+H2oTsxEAwUaY9qDT1M
         w9C+9HXJfG1ukyC7FaPzxr3WzLXDgFcxREbc5hGrkTNofr1vqpoAQSPVS+MI6xksoFwx
         p9FtRp0SLsYy22TdP0WeOhf0tfGWEH06mOEmldKFJUV8fO0ChV5TgirRZRd70QcISHdH
         psA77TBYpVwhM0hTMbVdxljABk6rQwgSXYnSC0rx1OE9wh1BvaX8RffwqNvSVyW+6wM9
         2aBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609541; x=1769214341;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kXSzRKLdZZRDc+qd/B0ftBuEII5cSa+ihfuKd80sVQ8=;
        b=HQfJQPLqYFJ9y8dhxEb+KotKdw5/cDJrXg5hRAm2L9DoBrOpRMMAX9D3KB5f1dTbsj
         jZ19AcL096ZMdLDb33BUsPg6cs2+aJKyEr2DrXAGVz90Wwuejd7YFjLi13WUEsf2G85f
         nJ/SRNjp3nXh5DwNe5pwWh9qMbpRshgl+rWOs/kSF3GZUAtea4HLqhtzWMUFjsFH0Gce
         FKoP3fks+rq9mcRu6+dYl5TdoC0eAb8qTXf/2n/A5t3ec9xgwq5bva+8cjDgmhe3KPZL
         yRjmgPpcyjc3he5m0Auu0qA1u5z5kn/o0GMHjGUPuBQ5pOQg4zhMkWS1v0iVZBCF6GXA
         TMJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKccleXnG7Zae5SDy32OjKxYw0zmwZHAWB1cdp+vWFbGUnJfd/BXDNXtNgp7tcP3IeM1BAmXBKwszZBA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxb+ACCKJ1kyyRZHa7Vjra0F66B92mXiv3yHMXW6QlWRDhan/dz
	rqNmtKm2KVhjU7swPUS2YOI4EqrmwkIlYkIF8nlc6MyYnJk2ue6A2ze+
X-Gm-Gg: AY/fxX5cULG5VK8hXx+dOXwo5lj3BacXZpzMnVLpG3fDnVwqIbKtZR4aM7TDNJfTowY
	3hms/sKhbwRUen6VqSbzxcE1QAHI643BF2dtvtUUWz4ZYvxbAuPFz7L/fsi7G39rFhCLElqg6u9
	JGZzOa+7fC+OGNLjH8EVFp4nQ4yrVJZnduUv7rowjQ0cJDV7arwsvhNrw2vvTjQaSBzniVFAscc
	amgAnWWXhgA7E/Lqd9abjwmsVT/CFxJxNgAQSskQkL5KkyKOr1YZU1vWwCzmcriLiYTc3gPq1vF
	86S/0Iw+wxaKsr2gSwM7K41BsCdyTAjCwQMS2PsaJ89977QsywceYQcAQZ6sXLef1XiULVOcxUq
	UV+KpyBeMMoD9hUQkbRKUaucWfPLhpMjSUnQLZz4zzSIm7IvsHbuhz1ds2uPUYlt8UfgBERIiAe
	QvdTaOsZv0bp2gFE18qDW+3baIfs1B+LxSZ7KeNSsOvZBRZTIS1+MJA1tu1wHpg7/KQXkyyNK35
	6c2iRE=
X-Received: by 2002:a05:7022:225:b0:11b:9386:a3cf with SMTP id a92af1059eb24-1244a782252mr4273827c88.48.1768609541196;
        Fri, 16 Jan 2026 16:25:41 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1244ac585a9sm4287875c88.2.2026.01.16.16.25.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:40 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Prashant Gaikwad <pgaikwad@nvidia.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Dmitry Osipenko <digetx@gmail.com>,
	Charan Pedumuru <charan.pedumuru@gmail.com>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>,
	Aaron Kling <webgeek1234@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-staging@lists.linux.dev
Subject: Re: (subset) [PATCH v5 00/23] tegra-video: add CSI support for Tegra20 and Tegra30
Date: Sat, 17 Jan 2026 01:25:32 +0100
Message-ID: <176860947674.1613073.11085159197676774675.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251022142051.70400-1-clamor95@gmail.com>
References: <20251022142051.70400-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 22 Oct 2025 17:20:28 +0300, Svyatoslav Ryhel wrote:
> Add support for MIPI CSI device found in Tegra20 and Tegra30 SoC along
> with a set of changes required for that.
> 

Applied, thanks!

[10/23] dt-bindings: display: tegra: document Tegra132 MIPI calibration device
        commit: d6e8b796d0d67699c74ee3cbc46601cf9ec925bb

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
