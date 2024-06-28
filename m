Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F3EC1DFFB;
	Fri, 28 Jun 2024 15:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719588913; cv=none; b=NkABz9kc/LkSxbU0hIvz71swbNkV8Qlae4MszeAkrYo4vffh8lvAt3Vt59gV82zBuIFsXEjQhW5Pc3vCil/Gz8foNVex5vkG2LgxhS4Rm3Pz+u4kvbwuVqGeyYMDXa0dw2Kg66XBhnnrOFvHliydL0xqQV38Z2VtwgTZB5wsIHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719588913; c=relaxed/simple;
	bh=FZ+8r2P/5G2qQt4U6r5a/MbEF59L5zQ/wke8iMFDRb8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=J0te8gNw82lItvP+JVIsTd0/3Od+lNA9NjO1r5pQjdXY/5U/Slb0EvHkdGXrETPYWFwZ9fzi4idDaTgK7XahGW6wi7EUvFzTgb2BHWAnIkY3IzQxUIiJJpmj8j3idjpIRDlasXutzjaV4ooGiUGotc53b2eAbOt3gUVS/KdDW0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MrN6xmTk; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MrN6xmTk"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-52cdf4bc083so1020879e87.2;
        Fri, 28 Jun 2024 08:35:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1719588910; x=1720193710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AII4rZKD49EyVvI7JejDsfFPdOzCOk1hSvPQFvvGxtA=;
        b=MrN6xmTkFnBwAqEkdmtfoqmvxJcRm84rzSqr+9FED7xqnh6W72BT9zLico1hhAbM+G
         Lc+drVZRWPUtF1vQg6M/J5WspBb7FS7tp3SB8kgJgMUkjI0kfD3NljLE+cxO5/UMzIpO
         POz1eUT9z20X7JHXPpQSznBGgk+gX4M1MsnxqCGzJuVbQb9AMWzCcld3hIabQquEK6+t
         RcIWm6UJPvUTgPVBsWbuVawPvqzwrOcyserYFHHnRFL9iozK17J4feQSol/jv3KTmVMo
         qqzSFM+j9fCbr1wJ0oZjjEUM3eqPbnGZDyEI1aqcrLj7fgekTtS6TZNLs9Cny9yvg7PO
         xBEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719588910; x=1720193710;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=AII4rZKD49EyVvI7JejDsfFPdOzCOk1hSvPQFvvGxtA=;
        b=dZk7ox5Er34LccpA05ScJ2Lp2ysw/bFNzszwZbeKpT3Ms4I4d2Nu1sM3VgbfynLisx
         TMO1OS0qy2CdXtNcKL9zZSVkSYQfpmYyUNPwKIfUjO9m1wf0/Fu3xIl9GOxV3AWq3zwM
         wy+XIYzRL+FSFJE8BWA8Su3ZJw6fToxaQGNftVI7jguFcwO1tERYpYW3zLXZRDAosS1V
         t5RKuZ+uX9s/CDlcn0Fghd6JYsYzqR+LLBQajEyWtCkczfD/f724ssscTXcDpJMBAtXm
         K1fwcCoprq/TgSIgbdyEtXjJCQj9R/cDbPfg8J34mInX36z/cQ7v38iZ/6lXgKppS59R
         kCIA==
X-Forwarded-Encrypted: i=1; AJvYcCUJrL9cJHFALrEEO5gch4nJMEUobqRxG+biMuHwhWj/mba9u3JJu5Mpxd/k6X9FvcEeQnbyUhTb6jxv4HHz4qdAf5aaZstpDALnlZku0P44VguJQA+BOmjxmDsQtn6CyCEh55sH1Q+oUr4=
X-Gm-Message-State: AOJu0Yz4oyifvCYwPEsjUmAF4ym4v1kaAHBgawRvNA0gARiJ4mc6G9IF
	cKIREG7N3ELu2ChqhsgFIALZo8+Mf6G1J/CgrFlbrGuDDHjiPplq
X-Google-Smtp-Source: AGHT+IF8rz8A4hN6EnM0HFaEVSVUEauhBRAjE2f6UHiNmcKxfI0rKgvYP60zOvRdQTWP8/etWUeEAg==
X-Received: by 2002:a05:6512:2389:b0:52c:d617:f4da with SMTP id 2adb3069b0e04-52ce0620276mr16352359e87.41.1719588909786;
        Fri, 28 Jun 2024 08:35:09 -0700 (PDT)
Received: from localhost (p200300e41f162000f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f16:2000:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3675a0cd712sm2670484f8f.20.2024.06.28.08.35.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Jun 2024 08:35:09 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Russell King <linux@armlinux.org.uk>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi rfkill
Date: Fri, 28 Jun 2024 17:35:08 +0200
Message-ID: <171958889447.2435101.5942373221568313704.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <ZnzulZBukibZUXKM@google.com>
References: <ZnzulZBukibZUXKM@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 26 Jun 2024 21:46:13 -0700, Dmitry Torokhov wrote:
> Complete conversion of the WiFi rfkill device to use device
> properties/software nodes by utilizing PROPERTY_ENTRY_GPIO() instead of
> a lookup table.
> 
> 

Applied, thanks!

[1/1] ARM: tegra: paz00: use software nodes to describe GPIOs for WiFi rfkill
      commit: 47ac458bb229f8c4864081d173adbcfc55c34880

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
