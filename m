Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870534321C
	for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 18:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768588749; cv=none; b=JMmevI/cvMIkFWgRGPSId//j7JTNKKggzCnOLKpYD+s1vTVSIk9qqmIMpigcENYKFC5sgXTYZjF6ZKzN6MIaG5nocrALfW28L88fs5SNOtTcSUddhRRsP9+f7z1hAxxHG3xa7KbBBVYGfTnMN08Hj7QBDhU3vyr+WihYW2+onFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768588749; c=relaxed/simple;
	bh=d41syVwVZdKjv7cxV7/aihYb8fxPi9Y3sb0RmDUSMDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iKfcFd2Gxrxq/DE5bK2efKkuf33tv5J5G2RP8l1P0s2Er5rzSiI11bm33RRmT9qBlkih1/MDA5pGMoj5n7r2GQATZ3h4WB/55PWC6+K5QPDiISPQFsUR2IZqj+V8tfh2F/z4JBXT2q1X7chKjwElaCWo26cIkY7SHe3IK27gXuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iFUIXkHd; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFUIXkHd"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-42fb2314eb0so1907230f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 10:39:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768588746; x=1769193546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qtATPDsxWorsaJSHrXqsG5j839hXtsmCTkBX1g557KA=;
        b=iFUIXkHda/MqoaTbXQCrPO43tvTtVMHYPOrm9QU7Q5LrHBNrH7gzLfFTezAiWik7Fj
         uhqGzfiej1o9M6gsFYrlc32cJo5t+QLm955fDlhCi4ClJg7V43Wnflp3jBDxWggtYuyE
         6xTF9LS60E5hiXa9532s6atejPcpc0vHP00q+oeaVbMSv2gGMQlIyOJQT4LGw4A/7rk8
         SfAd0icEf9e39M7EQe6gd+8VNpGFAIWMB+2NcDdqXU0CzyXJ0CKmZwjQRdGQfhMfIt9m
         osHOV/5ahP4fi7rCcaBmMyrqVZQBVBy7RJr6v9fa2bPoHInfxIKMtxAL/YmjO6L/v32A
         4ZtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768588746; x=1769193546;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qtATPDsxWorsaJSHrXqsG5j839hXtsmCTkBX1g557KA=;
        b=dC7v0W59nv8ERf869nqdUHMoy6+NpwRQWok5wqkICOPvrcssVlLmx9oJEazNM9xG/4
         GjZrxbujyFcRQqfDW5N4Z/Cu+mGNmIzm9w/2x5LJNty1bpkXwPrAsF9m/8y8T42fUf8T
         kfJ7FdqK8mP2L0PgLd7u2tS9w6T2VXbwfET9ef0cLhYK6/uJaqJSqMfeQhl9iIccX6bc
         h8gSGrRDiai/d4kh9yKy5RpsEm5b1iKSr5vxl2wtDUluJnQBXmsblueT1QRfREN4f8oW
         ng9PywMyuTCRnjzT3Z2aYpjdv5fmGnvZcEhjQolflRQBeHD2oa0IBrA9sbkHZbhFHRVl
         WGlQ==
X-Forwarded-Encrypted: i=1; AJvYcCX1KikD0uOFtrGX26NX8S4IIIzLmMYRbRRgImfTGtp/MOPRKqiTvrhVtlO3xcYGIFF42O5m91ZA8e0zzg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywgv186L0a71MczBjWLfA0K7+nauw7M0Fp5pVKwsMzePS/tznH2
	gyNLYyhyHO34dB/Gtm73C0ZZ5wJnMlLF+j/ocb2Gi80ifaDHce7YlueX
X-Gm-Gg: AY/fxX70c1cmhXbm1k2NfTz1/nV5x4ZHx+5Rd1+a9hL0xKSYZlw+7JjOe/Nu8kfnQR5
	5OItXCPUwnH8vHpv5WECgqaZEkWB0vQNyz48AolrXjIen++mNUt3Qx2O0rLsDf7AKKmTbTWorW8
	VaFQQBLuAFsWtNVD50x3ue/PPy7PPE+4qC2PijGE+6vmvV07p2tqb6YLbFW00el6XR0w+OM1igE
	6BzMshaEL6YOUxG+lmV3t6+4AHXkSBt8ZVmXWxFyH9gZepme9l1rXWLQ8PKZCjFJpxx1F8U2Wr8
	UoGd/Jij/oq5ZZ4KgI2Pq+9k2B/i/2jcpAVDj8CcKdA8rbuo+C01cTQBiS+AJ+NUslV5bjTCwob
	r/ND8iTWhKtZ4YM5nG8eRqmUK0jJhdyR8qAGUKKuIfvcD4q8ZFi7MK0f2KMJnRLv3/Wytaru7UN
	Md5H7qTiXs73g8Ypjjyx/s3OYkDU5GabGaEEvTDfog2i8+WexRx5GjN3T9iVvDax7fv7M+4y6G8
	hy7LE0=
X-Received: by 2002:a05:6000:26ce:b0:430:f5ab:dc8e with SMTP id ffacd0b85a97d-4356996f129mr5220791f8f.13.1768588746076;
        Fri, 16 Jan 2026 10:39:06 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4356997eb1fsm6846449f8f.35.2026.01.16.10.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 10:39:05 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: pdeschrijver@nvidia.com,
	pgaikwad@nvidia.com,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	mperttunen@nvidia.com,
	tomeu@tomeuvizoso.net,
	Haoxiang Li <lihaoxiang@isrc.iscas.ac.cn>
Cc: linux-clk@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
Date: Fri, 16 Jan 2026 19:38:58 +0100
Message-ID: <176858859966.165514.1542929598310125407.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
References: <20260115050542.647890-1-lihaoxiang@isrc.iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 15 Jan 2026 13:05:42 +0800, Haoxiang Li wrote:
> If clk_register() fails, call kfree to release "tegra".
> 
> 

Applied, thanks!

[1/1] clk: tegra: tegra124-emc: Fix potential memory leak in tegra124_clk_register_emc()
      commit: fce0d0bd9c20fefd180ea9e8362d619182f97a1d

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
