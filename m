Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084258;
	b=4CUbsPaChVtCLsv4+ugLXmcwZc6AN7vVk1ELjdD0AtL6wMnt1mD7uRhjCJoGxni/BNvI
	 S8cbGOadbVrkzT0YesgTvjwbobPwUetrLd7peA+Pga8JfIVQe3336IpcnFiDeo7L2OGfq
	 WmFYEafQQOE8blX8Nxw1g5kkXNQzyn9vdVbIczujlaT/w0bB5jgr386W2LPw8lyKQTD4n
	 rX+egwXPM40pStPpGcvrf4awepkYIjfE+JkKAwS2Dn9MZstUDLwk11n9Cr8Hxen7CV4kk
	 68W1dbcMfu2wEX7GTrWXv6X6Uy66b5HpnsmnvTm0Yg/weZd/U+FMpYuqn70SOoCveZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084258;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
	b=AI8jjIDZmDcGNcDDQRoQNA2AAwd/A0m2sM0Lj0pF98krAf5byP5zEWId3aRxWliiTFpu
	 GTqEMfm1SIGMXTTDE7TpyWxyY8o0zY4BX/tnvqCcf1lVmKdvUcfknmroy7spVAZ2QKwWU
	 3t/GbXeG4eVpPgNsyIwC6mAzMj77Ag3q2QYA8PitKOPwxFJj2Qw4S17I6uWLt1olAfDwr
	 Da+RlFU05jiChLxM/tT0vGjeKefvhawAtzUQoZVk4i2zcvIeQBuGx9Yoq3ie7KH7ZV9mX
	 BvlHQkfjF6h1DDNZasjNT9lm6L+ivgW6CdrzdBirsqmKDms+XSr0gn86LWNqOFQouKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UWuJ9Lit;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD3F606A31F
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 06:57:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD3F606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=UWuJ9Lit
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a35d5d4a20so25664495e9.2
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 23:57:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084257; x=1793689057; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
        b=UWuJ9LitCKkGTEaaIUGD/Wghisf6auEQWKjaR9IxA8JMPvQ2KKQuG4HUqYD9j+3VD+
         rjFQMVOw+k5S1ZQcw5QE8SjBC3mETwLhM5bih+1WI4y4EoTKsJvYvelUDtThKY8qYneg
         /V72cKKSdPk6XPP+RzrYGJpKkzMrHr0z6rs/PBe+WSuRVXRc8/KasiTjlKIrNCwS9xhR
         nnZaTdNS7VUM4PaSMfgqLTrCAE4EU/8lmCy0IlsbcweyoZ77CwOOl2yv8RDH9V5srMZp
         ghmT153AfKK6H+jbHeFRZv6/Aj0EQT2xNW+PAeDzEoFfuqWxk7K+kse2XsIS2gZk3182
         J8dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084257; x=1793689057;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sA/soCd+jAxyVyCbYpE8ZxQ51mVTYvjC6BPEoSaY6Pc=;
        b=ITx1RM5CQZDf8i17FLOdaM4tJYeRLutVGd+huan+OwReueUwGVM2eylgs1InIqZMwv
         k0ZNHOH9zZbiHk+qri0icKVz3F1yMxczvFTf5X356FmS7md3SjygnuNTeO63PZL/pqqq
         1LZKOo8vDddEacjb5XbzKvT0EH9tfOJPxWp28jsMRfZ9FMZ9y3PeMainC/+qHhfelC9Z
         yLi15nK19pYppjXg41RLRl7yNTekv7H6wwdLeAHhbBrr7Bw6R9jEX+Q20+0RCtNcs2L5
         o8rkBj0SVPnPRUE/zyhGJXMEf9INeAh/FH7zIHbPdjeNh+RV48KXwuRuC6zVE7ofYPh5
         E12Q==
X-Forwarded-Encrypted: i=1; AKwUvBwspQLO4rqUG9o/UVKwdfKTQXjGPPuH3heSYyCw2YvO3q8ODRf4ALaky1GZ4MDNCIoYN2xuE0wEpu9rJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIZK3Kyw/Mv1qWCvXNktgI3wlnU1gZ+gZnheEZGZVjb/VXz567h
	rMAh4KN1VGVuq5lyw+JLTHFqXmg7X+wV9GGl1PMJcYu3tS/p8eqdaV96KJ1Az9NRWzU=
X-Gm-Gg: AYBFou2dcvwy9+bYekIK41K2O9JERbMdf+jepN2HhoqTcUJqitR4aYEMiPEGDZkRGcB
	TbYv0vaMqRlpbh0cXb4M+CJ/eHo2ASl+abSPIm6amqCThZ9qrU2nczuyu+PJ4sKcEfxX4aSd4gc
	jEiACnrtxlzuD9XIaUTJhkWMqddSsWHnn4I6GtFiEjpifC8oIBml3wvGwLRdAjbjHW4yloPhbYy
	BhQ0RhOD0vFFAXSUbegmTw7BLPRi0sA794wXeryLxQqzfDfXRm9jsYMm/04yS3R02NUFzgmMGpM
	U5/LCg1Jp/5RF7Du5ul1LvuzEk/nEKW7e7aPRQ3liC0/Mk4Salrjf5w+7syQPpu+EIysIy9nMOZ
	W327tmn7AQFHkND4NvQLGJGS9TlpLKrfh/pDrqNG46u4x6j3FbbS81FAzhPKMxkMfiwttzp4WOV
	0nZ2k8ngNthDqPiWFzCHo5asXm5qYRlnQhW+cNeFRUseTR13kvp/EkRLV/A6cLtsTdML6jBGzca
	3cD1qYq4O/NYQKOf8XnahKPHHF2GLdVjAkI/Zz8DMHWs+cm0/CM65dZwwbsEUFClHRUIeU5Dn0U
	/0vwEKryUCLw4rkHBSTBuYYMKqPt1Hutv3mAWdxeTO3UMGIMiAGm8A/5mH7X1sQfqHAnXv+sPjI
	kpsD25PIWh7iwUXl2ANsVcpkkMDnYaLj1s8IrRiEzmlLfON/ABiyY7LCwkUr9xG0UHG9vmOrcLL
	IGUf1h
X-Received: by 2002:a05:600c:474a:b0:49f:e772:6ddf with SMTP id 5b1f17b1804b1-4a35ace28e0mr174280915e9.32.1793084256726;
        Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2c0458sm243490115e9.11.2026.10.26.23.57.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:57:36 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Vishwaroop A <va@nvidia.com>,
	Krishna Yarlagadda <kyarlagadda@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Rhyland Klein <rklein@nvidia.com>,
	Suresh Mangipudi <smangipudi@nvidia.com>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] spi: tegra114: chip-select fixes and PIO-only probe
Date: Tue, 27 Oct 2026 07:57:26 +0100
Message-Id: <20261027065726.98396-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <179258895296.403962.3492255118456900623@nvidia.com>
References: <179258895296.403962.3492255118456900623@nvidia.com>
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

On Wed, Oct 21, 2026 at 10:14:06AM +0000, Vishwaroop A wrote:
> The delay runs after CS is dropped. A mid-message cs_change drops CS
> and never drives it active again. When the last transfer holds CS,
> the next message can turn hardware CS back on and drop the line.
> TIS-SPI under spi_bus_lock() needs CS held across those messages.
> Multi-transfer messages already use software CS; patch 4 only moves
> that choice so patch 5 can keep it.
>
> Patch 1 is separate. A missing "dmas" property fails probe even
> though PIO works, so fall back to PIO.

Tested on Jetson Nano (Tegra210) on v7.3-rc2 (5b0764a53235) with
7000d400.spi (DMA enabled) and 7000d600.spi ("dmas" omitted from DT):

1. PIO fallback (patch 1/5):
   - Unpatched: 7000d600.spi fails probe with:
     spi-tegra114 7000d600.spi: error -19: Dma channel is not available
   - With series: 7000d600.spi logs:
     spi-tegra114 7000d600.spi: 'dmas' is required by the binding, falling back to PIO
     and completes 128-byte PIO transfers on /dev/spidev1.0.

2. Mid-message cs_change reassertion (patch 3/5):
   - Two-transfer SPI_IOC_MESSAGE(2) on 7000d400.spi (SPI_MODE_0,
     active-low CS0) with cs_change = 1 on both transfers:
   - Unpatched: SPI_COMMAND1 (0x7000d400) after the message is
     0x40701827 (SPI_CS_SW_HW = 1, SPI_CS_SW_VAL = 1), leaving CS
     deasserted high during the second transfer.
   - With series: SPI_COMMAND1 is 0x40601827 (SPI_CS_SW_HW = 1,
     SPI_CS_SW_VAL = 0, CS reasserted low before the second transfer).

3. Per-transfer delay order and keeping software CS across messages
   (patches 2/5, 4/5 and 5/5):
   - Immediately following the cs_change = 1 message above, a
     single-transfer SPI_IOC_MESSAGE(1) with cs_change = 0 and
     delay_usecs = 40000 was submitted while sampling SPI_COMMAND1 at
     15 ms into the 40 ms delay window:
   - Unpatched: SPI_COMMAND1 at 15 ms is already reset to 0x40400000
     (SPI_CS_SW_HW = 0) because tegra_spi_transfer_end() ran before
     spi_transfer_delay_exec() and the transfer switched to hardware CS.
   - With series: SPI_COMMAND1 at 15 ms is 0x40601827 (SPI_CS_SW_HW = 1,
     SPI_CS_SW_VAL = 0), holding software CS active during delay_usecs,
     and returns to 0x40400000 after delay_usecs completes.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
