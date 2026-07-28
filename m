Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E96A03D0907
	for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 20:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269000; cv=none; b=QPRlHP9o1onT1QvNK9i4RCINT4jnOEahBhsSMm+DRuikozymbKzFeM32N//C41lT/MB+OKMEZTyjrbT5ak5Xu0lggoZoAeUtoQ8Uo0ORyWRdiBhzj/petWLw3GA0wZy3pB6uwRg8CBCtWFPmU6mOujSZ8LoKXgXod9VmejGBnb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269000; c=relaxed/simple;
	bh=9iNjrrVtL3NNUry5XR4/x0JtSnWNg24S//oMYnqZvp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SJTh8dsikVud4pRuJu91GRe/B03B/RpBFBB9mf61XR1zD2lyRNyoO4ThNtQhRvdj7Bzqv13dW0uHB/KwjDZZryqWeb3xcWSXhnbpBILHXQV4Tj8BjC3jdju0uSlWYpaDN640+J6w9DFgdP56EgfNcQLfzY/aWmA9fPa5G9G5dwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com; spf=pass smtp.mailfrom=matician.com; dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b=XC++u4ph; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=maticrobots.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=matician.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=maticrobots.com header.i=@maticrobots.com header.b="XC++u4ph"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2cc61541f8cso21933715ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 28 Jul 2026 13:03:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=maticrobots.com; s=google; t=1785268998; x=1785873798; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9iNjrrVtL3NNUry5XR4/x0JtSnWNg24S//oMYnqZvp4=;
        b=XC++u4ph5xROyX+DsNdnzheTuXpUDCte7rAz/p++3I3ts4C1AAtQ42cbu1bP24gHTS
         P2Ds0aDpTmzekYrMCn4u1PpatJikfYCIAh9X57IfD+ufQ3T3My1CTICNq6K3MdZhu9fV
         sfeXJRfnBwQchTdRKiiYmR7X5RR4jZ9TfEVARgBwHn42F5RjNfhI8xLSYj1q2q7M6Oow
         a2KoXZwz1i4TyBEaHNY6pO3RdafHp2ewopJOqdm05/n+CGQn6Ovnn7LPi7AWBCbBYm6U
         1NWYt5kWlwsRZHn5cUjN5MSn5N3TerDPYpRFdce52pfuW+0FYES6ElQz6CpKs09haFXR
         1l1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785268998; x=1785873798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iNjrrVtL3NNUry5XR4/x0JtSnWNg24S//oMYnqZvp4=;
        b=ZnW2ZD1MiRZ1f9Td08XHnINOjLu5xYHTQefaEXD+Azj/nuQrO0pZuXbB/LlmKBGASm
         MpL7NpR+sr5P6gB8jAC7zC2CQipDoCBOO6kXb8LncRh48TIb58qi3aTyQeBlTVUEZ/Ka
         LUXSDmRFarVw+yExowvWVVbLM+JL4VpYQ2gyT+Rv+frhhjlZb0vCvyVfKJGC9w296X8G
         xdDvO9yNE3N28LlP7gQcA8JMKiFvuhDFWXyoU1q8oPfvd9qs5CnRbAimspVAtHxfTsVO
         LoeDLMQnf/eef0vKwE6IScqpsAdL3Mij6KmPhoRO9B+wg20fmbBFc98htjCvLncNaf8I
         HP/g==
X-Forwarded-Encrypted: i=1; AHgh+RpYknNMzaaKXv0vaFi2LYmcZ9TMpf1zgOjpIlaOnxqw7F4Bj6JQcMtDzzmJCkYee0uM2e+RuQrUcyErbA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz616GOH41bthHaNMa9jLARdtMmahoU0CfcdIVf7zSn9AH1+o2A
	swLDtXVV6j/gblk5brYvtdLnrJrrQ8SctEjmbNDrR5GZqfbVAlQGjE9+AqMoXnhQqQI=
X-Gm-Gg: AR+sD11EZJbNS+Ft4Fp46tYgBeJcJ+8ACNKvdMQogwF1SRHIMGTWkwcdse80AcdByTe
	0shOr3RIoMstCCZF3u/quWew6+oPswKIkfS+qseGcA+edzpguB7CMMFB6ufOZ+lc5pp6ZpgBQ1d
	+9LnVzXbSSQazOsEQJ7kOKzWXgG4odH7InSsTu1m9J8w09wvu/6u/eo/pQ5MTPNOW5cjcU1DLw0
	0bjFLHhiJbiVeTXZ0NU7KC6aupoUwnUmk+r+ByFDthYU9h2zird7rAd4klAsRrAdxVxvTHXdcj7
	TxFTcuxv/xre/revpNnfwITKtYdsJUKqkrKBaA7Iq6hfIvpZp0Xw9d+5gHMmIJMij7xFgjuDJKu
	1Mp5ANkBO9K1QcEP9c+VDYApIlGeewlabnHw5+ItuJNEY2SpEzesp8dmPIAYH8iXDV77d44LbUi
	1IvWuDjQEygRdZ7eh8WCm4Dza981CViny186oVLXAv5TqW/NJ5qgGptP8F0MMMqnb32uuUP56+v
	T//vxyS1Www7ayA1KAZVAvRGYjPJ2eI7XFARQ==
X-Received: by 2002:a17:903:41cf:b0:2cf:4c37:d955 with SMTP id d9443c01a7336-2d015f082famr40755285ad.27.1785268998323;
        Tue, 28 Jul 2026 13:03:18 -0700 (PDT)
Received: from abeMaticDesktop.1020marsh.offices.matician.com ([2600:1700:471:807f:68c8:458c:c1f7:4115])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504b125bbsm1810890eec.5.2026.07.28.13.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 13:03:17 -0700 (PDT)
From: Abraham Zukor <abe@maticrobots.com>
To: Jon Hunter <jonathanh@nvidia.com>,
	Mark Brown <broonie@kernel.org>,
	Laxman Dewangan <ldewangan@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	linux-spi@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] spi: tegra114: initialize native chip selects inactive
Date: Tue, 28 Jul 2026 13:03:12 -0700
Message-ID: <20260728200316.1363536-1-abe@maticrobots.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <9c196ab1-1945-49fc-a89a-5588d1e50046@nvidia.com>
References: <20260725042944.1204409-1-abe@maticrobots.com> <b2a3d65c-d3ef-499d-b56a-82018804f4d3@nvidia.com> <20260728025503.162543-1-abe@maticrobots.com> <9c196ab1-1945-49fc-a89a-5588d1e50046@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

On 28/07/2026 10:34, Jon Hunter wrote:
> Exactly. That's my point. Which is the right one? The answer is
> probably neither, but whatever is present on the bus.

I think that defaulting to active-low is correct. The Tegra234 SPI
controller hardware defaults to active-low (all bits in CS_POL_INACTIVE
are set) so an active-high device is already asserted before this driver
initializes. I checked the controller drivers under drivers/spi/; they
either default to active-low or preserve the hardware default.

A more complex option is to scan the device tree children, check each
item for whether it uses native chip select (as opposed to GPIO CS) and
check for spi-cs-high. I found no other spi drivers that do this at
probe time, and I don't think it's worth the complexity, but I can send
it as a v2 if needed.

Thanks,
Abe
