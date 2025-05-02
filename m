Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6FA255E30
	for <linux-tegra@vger.kernel.org>; Fri,  2 May 2025 17:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746207901; cv=none; b=IdkRNzcHOTrpdKbQpw+ProIEkLdJDC4GyzP83zdP1sE3cxo7PYwE2ev7ZZnOnf1Xrvg+HjDJDVHXPiKrZ5CW28vWZtBlaoW2nv7ROLSkok9TsYiyDaPC166Yf85lT0+OvXmFkLXuUnUtLgjwS3Nlf8X1cPdlXtrEuVoafQvuAAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746207901; c=relaxed/simple;
	bh=XmCGPi5E/4vdLYqfzcEUuIa7Pjd6veLPx7s/gT1s0z0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cmw+646gq0inTQPgEjIROQSFil0VtpsrbuBSDpywgHlfhhQt0sFEE0K0Qsc9HYt/E0gRWR6izkMAtYjYRn4K7uGpkFn0IwdB0wpxZDr2detl0ghwD8XncPrTmU2hYcjPMcs17L5muLIzClreRJxQyEqErEeqEEhAWsLRKo/RyVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZfT8qh63; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZfT8qh63"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-227a8cdd241so30424855ad.3
        for <linux-tegra@vger.kernel.org>; Fri, 02 May 2025 10:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746207899; x=1746812699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dY8M+VLKea8pjpC946v5/t8PrnnUb0Gzxs+7tzVnLLg=;
        b=ZfT8qh63//vQIKv+aV+pTKMNJSSjvLT94HkI9it5Jn5Lrufb7peCm8wUTuJpnfo/ye
         UthcD5b7RleAhGAsixdB2GixpqQjAB9+HqsNmWbGlezGFqSx22VFJTJiSvyrox/n6Icf
         K77bNvG8zu4fY+r/AfpLe6xuF9JCrjvc3chodM/LzqN0ACA8W5wOwNb80cchg+M/n/9W
         BtopYKzjhNzoz/Mjj1rnJQ/MQ5uZZD+DWG+enEdFTzfQhmWwYc69OTs/2/s4v/guugbZ
         AO7otwmEVRO+NBtCq0408ZJf3H7uzWZHmPE7A2OvDNw3geQtrYk0HefqjR5gx+4izAzk
         lwLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746207899; x=1746812699;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY8M+VLKea8pjpC946v5/t8PrnnUb0Gzxs+7tzVnLLg=;
        b=CbUh2weu+9luTDXTqmbk5oIyhHHjYB1dLzJ6jlSbn1DHsBxNZgvLv/ep+At2O5ILbC
         ynk0LaBLqDoOYOPoQ8nkuHccbIXsMPFUA06pSZO3UnWTPJC9qR/doE+NYX8L1eN+35SV
         KkbI3MVsiMOj5ZGckuhaOsgz9wGZlrU8FtSDGB17Wn82ZTtQoDJZJ2LLBx9CyYmKfaXf
         C7UhXq90++hFxsyCnsDzHPEyAl1tQW1PKrOp0O4uReOSSvGgWyihg8tFaanfebCZk+Nk
         H5bryAi8e2NE3/SY3wsJfen5UnusIikXsiEeWFufljz+Wh5DYsnMBkCSQHXmexqkddHC
         9oSw==
X-Forwarded-Encrypted: i=1; AJvYcCVz4LkqNSEA5wMFkbe89GsrWGeTs+ROZV/1gDcgm51b1De3rqG/6xNKUhwrFeGl3GN2ZU1F/mxM94f7iA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyYK7CviTBID9eiRecUiADPwQGMJlSus7ki3Z1hkzWSK0ZW6y2+
	k8M3Lnmuwfg3uCtpe0xC50YeiLs/9knkHu1YHl3NCfUE0MiQ1IJEcsR2+RDLxbbXmnyTnxtiwBs
	=
X-Gm-Gg: ASbGncsTOOORe+R7ALnbDWh2EAcHZ3ElJ0u87YaQKjtT9ySSfRVfK1HSxTTqHdKZaWJ
	2qxiQBlLSaq/BzJ+3syzpILrYWrZmKYEA6chLGi9MQH9bsVuplKsZCpG3ePSWSyVdTYPL4QxEIF
	GHfsJr1c1y8GU2IbnHP1q0kEmZx17Ws8/qdCtLiv/iqRUkaG7KtmEb5vj23atNBZhPlRcjYW1DJ
	L0zRlrJ/aOesp9ub2H1QICeUzNXThzhfJX4KZmubTee7vZ71SM1MCTn8GdhSp2KDF55C1bW4RQd
	emA4vtQTupo5+zRZqRDtJ7Bw6eqbPbeqECkbGen7KZCDNJHKnaHyC6+B
X-Google-Smtp-Source: AGHT+IHXWlUErao4J1U1mlwJYk9ATwc8DlkGhI6ADj3IGLu/xR9EZ4EkOFgQ2fo9wnmS3hLmuShE4g==
X-Received: by 2002:a17:903:187:b0:223:517a:d2a3 with SMTP id d9443c01a7336-22e1032f5a2mr56701275ad.17.1746207898939;
        Fri, 02 May 2025 10:44:58 -0700 (PDT)
Received: from thinkpad.. ([220.158.156.122])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e150eae99sm10608815ad.19.2025.05.02.10.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 10:44:58 -0700 (PDT)
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: lpieralisi@kernel.org,
	Hans Zhang <18255117159@163.com>
Cc: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	christophe.jaillet@wanadoo.fr,
	thierry.reding@gmail.com,
	kw@linux.com,
	robh@kernel.org,
	bhelgaas@google.com,
	jonathanh@nvidia.com,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [v3] PCI: tegra194: Fix debugfs directory creation when CONFIG_PCIEASPM is disabled
Date: Fri,  2 May 2025 23:14:50 +0530
Message-ID: <174620787968.116062.4174884576928380234.b4-ty@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250407124331.69459-1-18255117159@163.com>
References: <20250407124331.69459-1-18255117159@163.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit


On Mon, 07 Apr 2025 20:43:31 +0800, Hans Zhang wrote:
> Previously, the debugfs directory was unconditionally created in
> tegra_pcie_config_rp() regardless of the CONFIG_PCIEASPM setting.
> This led to unnecessary directory creation when ASPM support was disabled.
> 
> Move the debugfs directory creation into init_debugfs() which is
> conditionally compiled based on CONFIG_PCIEASPM. This ensures:
> - The directory is only created when ASPM-related debugfs entries are
>   needed.
> - Proper error handling for directory creation failures.
> - Avoids cluttering debugfs with empty directories when ASPM is disabled.
> 
> [...]

Applied, thanks!

[1/1] PCI: tegra194: Fix debugfs directory creation when CONFIG_PCIEASPM is disabled
      commit: ed798ff1c52f6fe232ce2e24e68fb63f5470ab97

Best regards,
-- 
Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
