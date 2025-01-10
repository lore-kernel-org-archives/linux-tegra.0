Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7470918C928;
	Fri, 10 Jan 2025 17:52:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736531571; cv=none; b=jkIjXGIrP7jCoY9i8TNSWC5HAerBN3wEYzq2OlvV5pNlCeIVY1eGbpqvtKi0IOq5JvvQyKRka3Xf1aiCVEKk6VHO93QCr7hSwqGCwTPY/YWeuFpm/vHh2s0LW74XCOUhRbhwxLkSU0w65viFYHmrxGAlD9Z/cWBtCeKQjYP9Ev8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736531571; c=relaxed/simple;
	bh=v0uFyXlVzhEhcuUR68OM/iKvlGoO3L2ICi3e/MiiJg0=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=S9aUikwiwB+D6ZTqDK3e13AoR6bF3++fOktc0IF6vJOh5xIzzjblB0PcwiAWKlCILiVNaaNRIzHEEIiTvf/e1mCcLIlPkFaV9Fd5U9c481MKZkhjX9LKNvtRMsWa9rDY//EmFuu7yJ1uobYBJfn37uSFbpA51J/9pIyyzONQaao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UyCZ9f5k; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UyCZ9f5k"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385e06af753so1312457f8f.2;
        Fri, 10 Jan 2025 09:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736531568; x=1737136368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cqn536KUzRuEJXYiulKMOagRxQUsLQSSA5WxvtV6sbE=;
        b=UyCZ9f5k5Jx1BKmB/vcR3cmnSQfTjGQi0FA94h1fVUMonY8Cb36bkcyZQGhy4C9U6G
         MQpaAMUn4D5HfvWGljErhjbB0ASI36wJMaykfBrouxsTeQhKp2r25rtLzp1mb6RooTRJ
         18gdJjGeLpv3p+yF4l/+WbyHlisHlSWBGGcmu31KvtzRt0hq5IaYjw9scWT4yEqVZGBM
         pW7V4rRQ4CUynBQA0KfLZc9bVmdRzzTTb+nc5cyhwN3oePSwDDA/vZaECRp3tMRfO7Gn
         baLrpwwFBTUdC8wAECTLT61o9RikFx8hMYC0hVG3kqhjVxxww4iDsq6TYaE9eowVsYCX
         SWpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736531568; x=1737136368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cqn536KUzRuEJXYiulKMOagRxQUsLQSSA5WxvtV6sbE=;
        b=umJ+6CABih0CW+WzxXk2mWdN+svgr2qrIAE6i5eLIKQc/Q1K0Dcd9m2vXO7eJ6N5Pm
         w5v5Cs1WzWAfrzzL3s0Brl/MNDUoZnPqHIIn9AkK8IK7pizfCL8udG3H2QKVkO0uyzVe
         0le6Onw8VG+LmyKtjWQFjPj4N6D0wC3RXLPRq2dqnsb+L9KJG7irua/kjyPxU2+nqwYP
         tYehOiusypU0ujRm/dJz8q+zMwJ/UWk9UwT1NkhSGBQrmQrrSBLpoxbHGLBVOnBIQQfI
         1UPF+ygZgBcJ8fCzGrrqCCzlg2Hv8bE9eJVAa3LiTzsv0UCFkjf2u39JL2oM7cx79Qf9
         Ps1Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC2ogFBjhR4gUJqeGxET2/ScSPvcGwrSOGBV3M2Ns9rNqmKr3zDvSxQDIP6dLoSAB9hDHkSV7hyjZqWX0=@vger.kernel.org, AJvYcCXxhwNqTP3arzFq2/IQJSLvhQR2maZxpBRsLv5Xv+5VSYJC8A2FTyDwwIUNYG0TwouX7+tCyNUmjg3gHI4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyk5afIp1tiGq3jCOFeIHSxNF42+qJ/pHlTZ7IsR+jnAbwRiTnb
	khFrPvooS3Gk5jDD4gJ/JURm3Eo6frkQYiKG2UM+EmVw8E5uAb1ZWjMU5A==
X-Gm-Gg: ASbGncvVCBSJwQEiKchUe9iynYcl0huF9yDIJsRW+CIjYo1dCSw0qx1U9I7q5a1D8Xv
	w2/RKGmugSmIbAp3jGnh53DBpA1dAxzF/1tuo1XplfupF+B+hMmGeRgyBY7JxhSu5yaN6vr9N68
	TOR+mr3hqn9y5yZpOrge8x3A0J2ShBHRVTsvEkcakDXGao5SOKGsqkHy2Kx73r5fIVZCdRYNqcz
	VVAvx2Ttk7bd511wRpXvfNzPsiwK9gTY12NUggV8zJy1tggPWkcwc7on7B2lgj4PpO5za/9cnDX
	U3urpoW6Xqi22zQw3RwMSuWGR9R9Un+7t+P0/GAzy5mayIoX
X-Google-Smtp-Source: AGHT+IGmwMKKCBezsHtMeivwDw2PQ9Dl+b7FG45OgHPssk1g29Yuyxdw9Uq7Hp7K9lXpN+dHlYdm6A==
X-Received: by 2002:a05:6000:709:b0:385:e105:d884 with SMTP id ffacd0b85a97d-38a87336aefmr10245577f8f.46.1736531567472;
        Fri, 10 Jan 2025 09:52:47 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-436e9dc8826sm59284965e9.11.2025.01.10.09.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 09:52:46 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	arnd@arndb.de,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH] soc/tegra: fuse: Update Tegra234 nvmem keepout list
Date: Fri, 10 Jan 2025 18:52:41 +0100
Message-ID: <173653154337.3488930.3320572385594756477.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241127061053.16775-1-kkartik@nvidia.com>
References: <20241127061053.16775-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 27 Nov 2024 11:40:53 +0530, Kartik Rajput wrote:
> Various Nvidia userspace applications and tests access following fuse
> via Fuse nvmem interface:
> 
> 	* odmid
> 	* odminfo
> 	* boot_security_info
> 	* public_key_hash
> 	* reserved_odm0
> 	* reserved_odm1
> 	* reserved_odm2
> 	* reserved_odm3
> 	* reserved_odm4
> 	* reserved_odm5
> 	* reserved_odm6
> 	* reserved_odm7
> 	* odm_lock
> 	* pk_h1
> 	* pk_h2
> 	* revoke_pk_h0
> 	* revoke_pk_h1
> 	* security_mode
> 	* system_fw_field_ratchet0
> 	* system_fw_field_ratchet1
> 	* system_fw_field_ratchet2
> 	* system_fw_field_ratchet3
> 	* optin_enable
> 
> [...]

Applied, thanks!

[1/1] soc/tegra: fuse: Update Tegra234 nvmem keepout list
      commit: 836b341cc8dab680acc06a7883bfeea89680b689

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
