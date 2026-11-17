Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938638;
	b=efCJTI/EbxG7dnUuAD3EMK68IlG44wf5llloX7mLHixQ1L7R/KFRwsocrGQ0LsVk1UPS
	 lyQwKrAIF+l0Cyi1rtqdcxOkAh7IVO1H01b6SkYJN78Pop857C1CvGy+sjL83ryj13eoA
	 S+/9tsPbj8vsU3ZUYETpHLOZdVe/nM78ypCDlTTA7Q9e1vUcUGCBYp7Y+fF9o19f+K6NH
	 BA2v0Kts0M8PfZcXLgBvGYPNRonZ1vc9tE8qS3N1nkThZK7r3RoJwgpeJs+vXfFoBvduw
	 AzBn9NfMKTzhgXxRHAEXBiwssBlixdQycOjHgFzQmSMAh4K1rNju5BB0fRRWPuUPx9A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938638;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
	b=UzI+5sNM1i987PXHbdAPfAYm87wOZzmpXTAdGPyiTyRqfxQDS3xOYiQ269qUmIz1887Q
	 4psG/mp7uBaq4t6YRZHM1hvo4iTWSGdUr4HFO9Qx1oQv92IwsrAq595SZdx5IQTYd7Me0
	 i+IbqZkxIZVVXCQ4MSyVSwO854YomcPmpe0xCp77U4A5efcLACigkQLjf+QihIxJ5ei+t
	 b4LaWLu74z/C1ZtMRJJxxFgu0SkuQMp5dqA2mq0/FMWrpqBflhPytxj+RKKnNhBGROI3L
	 Zu4xR3yY715+vHxiKTciY1I0PSOhads79Jo3WudYNh7ws8r9ITpW+kp8TIX5sKuPvQQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1877B606A32F
	for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 18:03:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1877B606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=YpD0FpDD
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso1633915e9.3
        for <linux-tegra@vger.kernel.org>; Tue, 17 Nov 2026 10:03:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794938635; x=1795543435; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=YpD0FpDDwRYk0+tTDmxkLlPBd1kyejPedJ5+xOxM/EcL4d4r+LLb1C5UTFjzFDbyHn
         lc8CA8zc0kpx1QqrFK8MRm45z69yXPEqhaARuSnbcFGPXf3Nm01/FQG9hmhjRE0Tv44X
         zlRDlB916srIukvu4S0uA24/EJktwNQboQh2nKfSB/sV4NNph8SJ2NzpwcXQPWC0YJOM
         Jb5+XQj7vndiTD9RboYhHMRDqX3dUBW/3OK3h5jSoNG7549u7exgeuds6ElelV5mZlII
         E4IVOAL70g4E4TawfnDbnk4kKgLd18gvQzUpvMGuT/GT+QYhyeBFkrUg2TFRLOjx+4y8
         wCCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938635; x=1795543435;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0VS5qw0tDHXtIn5LwXxf+fwugty/kad7Ay611ZyzaX4=;
        b=EpxxeYrI6yK87tk5q8AR8z112QEnJZ08jRAs520g3HK0h4VLPVJjjVWshJdLJN/DDW
         wruNjw7v1gpc/SwPbd0eGiCBRlPJpqIV2q0T93JS1tLUytKoa/ZZ8fs/YZ6+JLPI+MjA
         j9IT4VvvrPgHe3qz87wYHicSbKyvvjFxULASEu8F0lkvlPSIdHg9ipF/VBzvy2SXQjQd
         HricwNoX0IysjFwpAJ1RAVfsT1nhW1qxQLOqKhbqb+YVpzayqJFor+gHESRzAkBpUSVw
         0vQLtgxHtGsSds5Xu0qZHxdAFpG+60jm8QZ5XSH7OfkWtuCH45pXTE2GdGxk249fPMRY
         X3TQ==
X-Forwarded-Encrypted: i=1; AL+hErHMUiqjfWHfqhKQN889gKdrz1tRXaaAIZU2zf06XvFfbnZjRn0U3nOWOFNyMcZdJFxQCMgGf/vrA0N4Gw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+lBDTRRF3+JSe+L5XSDuvNJZpSSbpfZpqylbTPV2+c5r4NBvEF
	Uv7VJXr0uCjngBYYhr+dwkML2mRRzqD3p5P9AqcOq9bbwbWr9pm/W1EKoTmyWLaqV7M=
X-Gm-Gg: AYBFou1iAQH2uRc1GZQCEtimT8c+4yySbtkjzy6Ma1ilyEPCsQoeCXhKz5+puN4XDQ3
	vOMa9NTzbUoiLfsHnjdmN0Ae6cgMxx0cRITHKyietDvDrZYjgQlF7wybG8+QJPgABBAbB3O3Jkb
	YKHWs75x4Tw5wPMQRb0xKp2I5TR6Bzf0QJUoaNc1RhGKnjEUm9Sqo/WjQGrACQ3bajCye0BZV01
	19m5pOqOkDgBbV6n8rppn0Z6abc0XlDc+2ln1iZLndofc2JOLLw9V9MYWTlPCGLYBNHs18150Ka
	fruwCclhNTA+uaHv8eT4iknVAF89JGBOsDorMpyRVMs+a+Miqdsq4ZbzIRz1gWN67R1kLQdePge
	wwTX5HtufiQxPbcM1Qz82hb5mFFimwJRII4z61bA5yuemQeeX4QBl0tOEATjMACscFEaPrSXr7P
	crfL6JjO6a2cYlLtHpEm1QqgIL8hdF2jgTsFuHuR1Gnj7LdoTm9JD9N3OUpBToUMFVx3JnRCaHi
	hRwaeuTfXoQFumD3eDwjoMgiuDz5Er4zmQobj/NeEr2dmntQGRYR1mRu5KI35TgBIl7DUV0KMSL
	nQ6cs/Rw0DwqrrQP4z7gi1wVdXh+hAVAiu/FUqsIPKblT+Y0
X-Received: by 2002:a05:600c:3547:b0:4ba:73f:ef5 with SMTP id 5b1f17b1804b1-4bb55aa4fa9mr306817705e9.34.1794938635593;
        Tue, 17 Nov 2026 10:03:55 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7843bd79sm81197935e9.14.2026.11.17.10.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 10:03:54 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
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
Cc: Jerome Brunet <jbrunet@baylibre.com>,
	linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 0/3] clk: tegra114: Add CSI pad clock gates
Date: Tue, 17 Nov 2026 19:03:45 +0100
Message-ID: <179493854888.412784.10630903001767923804.b4-ty@b4>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116150239.264139-1-clamor95@gmail.com>
References: <20261116150239.264139-1-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Applied to clk/linux.git (clk-next), thanks!

[1/3] dt-bindings: clock: tegra114: Add IDs for CSI pad clocks
      https://git.kernel.org/clk/linux/c/61b67dfc9c24
[2/3] clk: tegra114: Add CSI pad clock gates
      https://git.kernel.org/clk/linux/c/ecb755d4fe97
[3/3] clk: tegra30: Remove CLK_SET_RATE_PARENT from CSI pad clock gates
      https://git.kernel.org/clk/linux/c/4d55ffabc35d

Best regards,
--
Jerome
