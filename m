Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F3F223701
	for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 18:54:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736535253; cv=none; b=ZQ5FMcUWMJAQ4YOVTFoRM5MBt0reTOGplGsONOb46/a7b4ImY9IybiZfIq1Vjw3QYkmvss8S1ZmgGlKaHvmNig3gLBOwSYBq7vYqb6Pi1DiuOkv0gA/gp4PaGmcAFicgwUZa7xpLxmZxTkvKvcZ27iISqzX+f/Yiyry//uZKzK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736535253; c=relaxed/simple;
	bh=lgZ93V1ZItzIfHK+oQnk1OVdB2OMfuCTvCgeEgjvxXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RPWOLTJMqgh9joyfFceLhx769VahaUcS7+HRZpsmR2zVzv9APyD+zfS1/ICZHlNcO9JgRK0JxyYDAVeyqweLhWL6oyDjf8bF9OPqEQvZIoAQxm3dusxJehYSWTD9J3DI+1NgkkLIZ7WXLEWfM7RoWig43TIDVHuECKwH/lDhmBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QDhTNRqv; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QDhTNRqv"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385e27c75f4so1722266f8f.2
        for <linux-tegra@vger.kernel.org>; Fri, 10 Jan 2025 10:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736535249; x=1737140049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=QDhTNRqvBTNKW6z2LP5XseHteOOOvq3IWbyAv3mdgR//CSa+9CF8pkSMtpsgL62z3b
         5hE0lZuOzhox9nMyzaQbdNaXXkOxWLy/4CqRE1qcHauQY5gxKjIO+OTQLsd5n+Eo+U7S
         dkOLwzK7ukDtapS95kRyB/rE6uYvbtDsuLoeZ04DiOoDPCAx2wb8SMRIXucwu6g/iLaU
         KR1nGvl0N5kSBqQ077sAyEm5CGZe98eJkbAtdSKuymdVyL3+hsXHX884vJoQnH+aWZKy
         NSkdSfLRtyM/wQZvmlNdf9s0wfdt+haG595pTfDIGnpLqOdZKlGAtFoE04YgvnZ98kI0
         +kfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736535249; x=1737140049;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pPmvp85D7YhG3ldAMLMgkFeu1ZL96pzTRc6+3VKf0HA=;
        b=UmrVDF+dd3Nz23Qq5RhWnEpr6+g40R2XVIgDHFLGHNyOA16FSdJBYu7cuw2AfuXTXi
         nFtYA2Vlq/6xX0DuXtQINAk5nSNDMyeo1bjlHI1JCg9QRMGhypx829rNbRlQa8TxpCaQ
         wmQ3gz5zKXmKx8t/LWpxp+dCoVNDdto7zu/roKzfis9TXxBTBEHiuF++J2vcfybIBW1F
         qjyK3R4rMVGdCH2TK2CgK9hP4w7v0CdRdwtRDttAR1MIPlQPMyPqnogWplFAFKDq6gnD
         4nhSQoJFWsYeMB45oR7hj5lV4MZNYCKQa2Gf5yktBq6V3hNU4dvkCbFDHKhsFawgYufl
         r68g==
X-Forwarded-Encrypted: i=1; AJvYcCW53QneM/F+zojjiL8TtOrsxD/khUGEE1lrdMq9hI3WaLJzl2mpwnrW1rtLRU2m/7/5sFskhvhNSscpjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxgkAE4ZZSVyJAvKCbHYUgehbuheIwAZGFi7RYP0WH2FuOTaSsc
	HergJGW/U5hAOd1tiUU4mGu8H4Z951+y8NjuMhIq1pQrtMJhfVsC
X-Gm-Gg: ASbGncuIgmgKPS2FTnBYep89qVPj+LC5gcPK1OYErC7ibyOVQjpcQmvJNZLO794PlzT
	0lxUwzQdRQFaT8q+OlHHhFwt8liJrkTCZc1r0rJfqCNXzUJIYoxNc1vtJMDXNFzx00V1Oi5VesD
	tqAs+OXJq5kjrNRtJL1jl4MYWnl93cHwwKjdcVsfIOIJWZifskJVUZ4jnX4NCDR98Lk0Oq0qp6h
	55+iqpk2vrtRaTr9TYJgiI+WX72W+5idRd9PzwI6oF4xEdEFYDck9j3Ed2Gu40EP+ZUIiztqKgE
	bYOmbNf/6RrO44EtfdJX6lfH0fLaDdcARwns11sGUC0bS7NY
X-Google-Smtp-Source: AGHT+IEFi3PtPR7G4voP3OPwlBAD74nU6hgLY1gXbKic/LuJz/motUj+soaJ5WE95z00Ob/Xtqkqjg==
X-Received: by 2002:a5d:5f82:0:b0:385:e9ba:acda with SMTP id ffacd0b85a97d-38a872fc177mr10677053f8f.2.1736535249366;
        Fri, 10 Jan 2025 10:54:09 -0800 (PST)
Received: from localhost (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a8e4c1ce5sm5291450f8f.94.2025.01.10.10.54.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Jan 2025 10:54:08 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: arm@kernel.org,
	soc@kernel.org
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 2/3] ARM: tegra: Device tree fixes for v6.14-rc1
Date: Fri, 10 Jan 2025 19:53:52 +0100
Message-ID: <20250110185355.4143505-2-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110185355.4143505-1-thierry.reding@gmail.com>
References: <20250110185355.4143505-1-thierry.reding@gmail.com>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi ARM SoC maintainers,

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-6.14-arm-dt

for you to fetch changes up to cec785a7f25d9ebe3a151ddc4f3a4ede7fc0dab0:

  ARM: tegra: nyan: Maintain power to USB ports on boot (2024-12-05 12:42:06 +0100)

Thanks,
Thierry

----------------------------------------------------------------
ARM: tegra: Device tree fixes for v6.14-rc1

This contains a fix that makes sure the power to the USB ports is
maintained during boot. This helps with booting from USB storage.

----------------------------------------------------------------
Michal Pecio (1):
      ARM: tegra: nyan: Maintain power to USB ports on boot

 arch/arm/boot/dts/nvidia/tegra124-nyan.dtsi | 2 ++
 1 file changed, 2 insertions(+)
