Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D83B335082D
	for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 16:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757606619; cv=none; b=A/SrE+QfsFoMQi5BOgJGAKrRy1XAwJv1J9wzhV1D7mFQRrr3iaDhNO5UBwkQhVA2hKo9Q8MIYJTde92DLfYDN5Mn/gg7Vsa1AcGcplehEn8kEjerkOqTkVfP9nZqkcIpEdqb3pQxmwPGEfT0zjFJRxWQCCx1foqtg/zY/s/GQwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757606619; c=relaxed/simple;
	bh=Py8tEk0Ei0y/z+n+ilOScm0a5cfD6f4JKLzbyJg3JSM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jumys7Gfd/ReEZgMhkq2RmAHSDFlf81gcCLC3fxHr0AHALjo6LHtaos22d13a+FLP6UTGVKHk6HqZnlvIm4LEEJH1hEmx2sb8pnCrfAt7ordxGnqXTkvB+L7JqxrVR8W1sZF5MCTMdtTQ4obdFaLig/fqZ543wZW5+CxijGuUIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hOKFZT33; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hOKFZT33"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45de56a042dso6134355e9.3
        for <linux-tegra@vger.kernel.org>; Thu, 11 Sep 2025 09:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757606616; x=1758211416; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=juu37p0WD4XpFBvsQ98g7XcnhD1Q0GfDFr2izWwlv3E=;
        b=hOKFZT33G5qwUdS2bCdUveD7GF71FSAQlw1KjHOQCIvwLPgsjxR/RRFDS0thplWyHD
         puu6zfKlwzB3DJfXj0HBjhVOF+1uq36WYFDI1HB8es1CJ30FR+5OfSksFmtgqqtrFcbN
         Lrl1xViQ8qno31TnG8wsu/sQ1E0Bi2c6lCSO86rZRllp89kw5vmHUZvEHdsW2LyqB/vX
         xEFrSrDQ2jDgzF6yWHSGCFmR+mEhQSBoaQY136QULQsX+iRCKVDUJ6j5gZ++OhJzVTlS
         6oMG3mRYU5R86Cc0BqvMbu7pfcvDDuzO2WJzbSfNt7b+9kVlIGabXdgu9+WOOZweUj9V
         R1Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757606616; x=1758211416;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=juu37p0WD4XpFBvsQ98g7XcnhD1Q0GfDFr2izWwlv3E=;
        b=tykeQ3tIQTjND8SLzI0YmevMK9xY45v2cMMkKqYXTJ3c3M/YV0iuyuTVFZ42bT7NUL
         oNZ8WUkYhltofHgGzpYml9g3CAyEblcJujYsaIfgfWKz2KNtUF4TBWyAs4+Yufs2MVz4
         ZC+9Ubj5Mcr3AImLr5g/reqGo7FGhqMSZVp4rGnvbGLbyFwQT+1+DOgK7zT2ya31M1OU
         iCFeVYnA2KQNwYWbfTAzik8wRngQ9jYZ/N+O/GecglPhvoQ/YAYJ/oLrRCwU1aHXtMEX
         SOcr1iWy96o0gmbVjHQw/D+SyjPUYcfRULEDN3uaMllPmxmjTYMn0hWiThpNYbkqr0Mm
         EPVA==
X-Forwarded-Encrypted: i=1; AJvYcCUOJCxUcHvS4GV9lfb7BNtHXT4ICwUymsOvgqvgDthGMZYGy4jGhzK3Cie/NlPJRMQnjL40L3itYPVuRw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyIK6IbyR8wD3bAXfRiyI0ATVEcVj85sOHNIfJ2BxxdOFS67ji/
	NPoOJVR6/Dn9HC7td1Cu2l2J8oyLRrqzU3XX/l3QQ9oGHVeu8O3YJmdb
X-Gm-Gg: ASbGncsHLKq0Czkn+D2+O5GI+tUnbFJ5TUJe59Hz2NxLeWayVwmUJpUpepLicWAHlkn
	ZgAU2Khh0KjS4f/1Te8kBOS3BalFzvtjgdEcYZKqYrHpiP/UR+93ihpsQ56PPwYCSWCeVRhX0oI
	Yz/A4dSlqkW2WhL59wcuOjzP8n3FZAj9P/ZxWYOcSJfOnanIkrFMdmhDMrNK09oj6RegFA8q/7R
	9EDj/XfCj2b7NfN7GMFS9Dg4ynq/b/3ch7nkLqUu2K6VLnCvZpMPg/dunT4tEYrKnkHhu7kfSvE
	Kz5dQaCnQKAx5v29VUqSjhOgFm6JXGLfW5p1O42fF4uV9ekb6wqyWNx6mcctEcWZwoT2dX6viuT
	/9rLVwSh6gkzktaXBWc1YwIOKSwLjDAo8UGLmXR7JSSFmUH7HgxLx1Eyo8NJvudeMfEmJ0DpR02
	wSutoEhzNp2ghH1pyIza3/k2uy
X-Google-Smtp-Source: AGHT+IEZsAWaysBc+OQ7PsOUMO9De4gX+5mEaMPhifkhw2MfJOEeCsTWH6E3dD6f9tamKPLvBQt5VA==
X-Received: by 2002:a05:600c:1387:b0:45b:9c93:d237 with SMTP id 5b1f17b1804b1-45dddeb93f1mr166508065e9.14.1757606616075;
        Thu, 11 Sep 2025 09:03:36 -0700 (PDT)
Received: from localhost (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45e01baa70dsm31874215e9.15.2025.09.11.09.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 09:03:34 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	=?UTF-8?q?Jonas=20Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-input@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/2] input: rmi4: fix RMI_2D clipping
Date: Thu, 11 Sep 2025 18:03:29 +0200
Message-ID: <175760648466.2794963.11623532624737227996.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250903161947.109328-1-clamor95@gmail.com>
References: <20250903161947.109328-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 03 Sep 2025 19:19:44 +0300, Svyatoslav Ryhel wrote:
> The physical max_y value was overridden with a clip_y_max value. This
> caused problems when inverting/flipping the screen. Further it messed up
> calculation of resolution.
> 
> Jonas Schwöbel (2):
>   input: rmi4: fix RMI_2D clipping
>   ARM: tegra: p880: set correct touchscreen clipping
> 
> [...]

Applied, thanks!

[2/2] ARM: tegra: p880: set correct touchscreen clipping
      commit: 2fa1118387295b9fa6d70a48011b30184348abd0

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
