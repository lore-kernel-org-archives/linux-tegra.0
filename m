Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084058;
	b=1gNT+aTIFDOAVmiPFUibm4WGvGzAa7U8RDMfT5Xs79GvG1IE7g5c4KYP6DRLDYRpdjh1
	 gHZvct7oB6sE9hkdLAhIMiXLWY3LZ6ggZFkTutQPIEOMAKZGnCjH4HQW0hlI0LgL24oe6
	 IuJQXOBqxF/oSlXkgz3SvW/spONMdIsiSqssWO6/A7V99pWGsA4SX7oQ9dS26uZABeL+V
	 VaOrFmCPwCZPu0IXyjXwR5DGr49FjGblzwu92OL/p7jGqiC7aZJdkSwqswIqETktPKAJa
	 hDnU54EiZjgXjtPB2MZbHBR04Po0qq6LVN9OUETNsR3CIQQE/r8woBJKXuHnyBlgN4A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084058;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
	b=oWy9DZDIQBs6Z8AQ7Shq5LIPlE/b820MGQu2NX8Z6GBMuwlkmgO2SAtbm3BedloZXj1N
	 qW/Rvkbt9jTc/laNxBi5pN9iFNec98bbBfTqW3Lk8QUQBNlJ3Al7JhMSm3rigYBxV2/YU
	 fDkMgZl4ur5dxjouxPAHkZuf+mkFRTMDbTbkGl+QLSQAU0CHZ3MBTbvSAC29iHowVv6Cg
	 Gi8fMgxvYG82QJXLRz40tRXPsqg9ahGycYhdovOSj+jqTvLdyRqt8FXK1FAogQT0RblAJ
	 GepGOTm25Cg29akACm0kPCLtu7ATUUOIQrnFrGoQ4fy9E/PHP08204e1H+XP1DSjc3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdTkeEtL;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E600606A31F
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 06:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E600606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=YdTkeEtL
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so20105325e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 23:54:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084056; x=1793688856; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
        b=YdTkeEtLL8Y1nyxDjIKjLsf/YxluDeSEZ5d6kdlAWCIbzAlWEKnDbytZuv/smLkWBi
         xNi9V99FLlNwMWaPKaN+Gntqh2AawHuOMDUnL1YicLxV5ve2whO8abtEnPdq+lF6j/MG
         dNa3HV+fWdTQJupDLPJ0yiKrgH4PV2pVmDQwAMyCvIw+AiiSQLzPSN/YUfBlx/yhJrhM
         duKxU9864eJda80HVDcv2dHBVskc4qsLEqF5TQIKV6gfdxzCQ+9EkInOoaw+hUxHb6vL
         RPAiWNu24DYqNRcxYRzUv7/sDz7AN89CrKUFjqQqNzANUD7P7QaACJ+I5jTdhifdLkA+
         kxKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084056; x=1793688856;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Bzi/nzvXhzox11rm3/brp68+yJUnNUbuR0aBy7BPR1M=;
        b=Q1Nqij8wpLQUYYh0mdSvEn4NvxMD5bj1RQpZ94vzEm1EhN4ucaMD0n560aHlFZIcyS
         J45SY4apP6/GnrXkUBw5hGw0F/mP8CjswkBj5qvi/dtXiJruegrHfeIuucZmZZMFGA84
         gqgrZw0QOVLGgFktXteGQL0H9aR6V5+/UXJQo4CCyWKsGEHfchGTkkX7vOjcfS8l0u9b
         6smJwaqNhOe4AzW29jGb3iUhqspNxCFyWL7nrWp/9HeYMnJGRMPoz5KGqwo2QbFWfLG2
         065O4xyGH6Rj+nNpytI72d1iXb30Y68kv9XXFEWtJSUc598edpLhW1J0xqLSLsJOwQpL
         Cxxg==
X-Forwarded-Encrypted: i=1; AKwUvBwjLzTLZJf+rAm+dc4qcQ96+s4myFEKqXdimoD6Gupz24boR02/q3kO+gh89zgv7cELdIKZyPIyeH0E1w==@vger.kernel.org
X-Gm-Message-State: AFq9FYJTWcsR/nIcYFo5GNQ7c+Gdjhn8Z7mdXQnBx450EN97xjdIl8sA
	xYYZZPoNk+7p4j5PD/9XxpPI70nk/ElowVGtHHA+ZG886E8VRCvFGydW
X-Gm-Gg: AYBFou3+xJb9L9nP9mZcdL1T54btvDHpw70Nrm5s0wniGq2elb080yMPPwLbzgOu4Se
	kdGBVUUROtMChLVs6xWK+EXJ7aDo1cu7KqVRNUSCmoR23MdefjvZYfoK/eTFVXO9VoDEIQ9V+Cd
	yKvmvxdYxzCFiW3HtHvxpmSwR8APLxEEu9dO5AfLMBtUiHcvnOX9SUh7Ew/NrWooGB+xqjKjxhR
	Xl4AnTRehHbTSYpRwhB1OR8nyVOOv+W7iVGSkJgKDh0uMNoOqWqt3eU60J9R8uEAvzou6H5Cy0C
	ymOBRaT4yHjM77pE/3Q1p2+5frSZH19/rdQp6uzETzxEtqOf5ronPPojU8SRmmZd0CLpiKCkZWS
	CXYokeAFkucsG5Xc0uSXUrw+Keg3O4eZlf8Wr8g9jhFIuPshSRJKMHj8c8dpWysAFlYv10jDx3z
	MKlx9I8Z66wgZMaUStD/flmf8GeX6nwh9vySWhXKpZEg3LksQrFK3SA0OMWQNTvBH2Vm8wsbpTL
	q/kiPIhKwS7yddewzwq+ScGr8dUYdNJkAMj6PZzk8O9HQGN9jb/vPh03KdmXrn/99t3tIp2Yo9V
	Eh0eT2yYFld4aDFHGelC/BmJkdlWb5Y6VbdDg6yNujdyOtYFa7x9VtH66k/e70GL12opAcHq0v5
	xGihfxAm6O/v45rQmMssZNETuxmmXzKGtL++XrKB9D8o/yBxriG2pj+jHFNZWKRmds4F9R1m4d2
	o9Wdbk
X-Received: by 2002:a05:600c:4f0f:b0:4a1:acaa:c355 with SMTP id 5b1f17b1804b1-4a35ac803e2mr199062215e9.10.1793084056219;
        Mon, 26 Oct 2026 23:54:16 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecd8c05sm26916356f8f.49.2026.10.26.23.54.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:54:15 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	linux-pwm@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sashiko <sashiko-bot@kernel.org>
Subject: Re: [PATCH v2] pwm: tegra: Fix value discarding for duty and period
Date: Tue, 27 Oct 2026 07:54:03 +0100
Message-Id: <20261027065403.96505-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
References: <20261020133938.191013-2-u.kleine-koenig@baylibre.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, Oct 20, 2026 at 03:39:38PM +0200, Uwe Kleine-König wrote:
> Compared to (implicit) v1
> (https://lore.kernel.org/linux-pwm/20261015085336.4181137-2-u.kleine-koenig@baylibre.com):
> this adds more adaptions to handle the bigger variable types, as found
> by both Sashiko and Mikko. I didn't think a lot about the
> required_clk_rate calculations, but I guess the saturating math I
> implemented should be fine.

Tested on Jetson Nano (Tegra210, 7000a000.pwm channel 0, PWM_CSR_0 at
0x7000a000) on v7.3-rc2 (5b0764a53235), starting from period = 10000,
duty_cycle = 5000, enable = 1 (PWM_CSR_0 = 0x8080003e):

- Unpatched: writing period = 4294987776 (0x100005000) succeeds and
  truncates period_ns to 0x5000 (20480 ns), programming PWM_CSR_0 to
  0x80fa001f. Setting period = 2415919104 (0x90000000) and duty_cycle =
  2147483648 (0x80000000) casts duty_ns to a negative int and programs
  PWM_CSR_0 to 0x999a001f.
- With v2 applied: both out-of-range writes fail with -EINVAL and
  PWM_CSR_0 stays 0x8080003e.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
