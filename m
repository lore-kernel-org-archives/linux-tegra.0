Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 693C2212B05;
	Thu,  8 May 2025 20:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746737353; cv=none; b=M98Uee6162F0CwvtQyFdEdA4YItVwHiNc9NAKvE/cjrNOgXUZK8XHuD1n0u9biI8IK0oTZCO/zVhBDgnaTLbXN9csPmpp6lYexc0FPT4sIJG9CgXOvZ7Ibm+PkCmLJsfh1s1pej3H2Hl1Z7A7wwh+jum/ZqQkAoMUMd8aw3LQNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746737353; c=relaxed/simple;
	bh=+wVH3RsjdR6gApmLBG7aCVYelYUASd+/Bi0LBKbpaFQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=QucMKU5Qz541B76g2tucGz2iM1xGPKHu9FvYy2OhS3m0bGZk5/KB5EJL8nbu3Ivp3SnOJQIoHNuz5af0zQVmSgRe9Ny6SfG3HYkQ7sP0wz8FcXEnCrVKeL/WRrriv9DVmoXyALGMeyVWyNv3+LGaGUbuuI+U7y5C0mijUcO91TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XzUZdjLS; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XzUZdjLS"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso15627715e9.0;
        Thu, 08 May 2025 13:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746737350; x=1747342150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pQLImjLrkfG6X7DibrmXWX4yvLdmaTYFvbkXMG9GkIE=;
        b=XzUZdjLSRq24hTB1m/Aflv2Vno9fb/G5HfGX6s4zFGL1z56zgvQ9mTAm6gzLZx4YZw
         zR5tbLo3cNaTMEkWYkrKFE9e3qgnUZHPi1Yf4EuaRvlyCdjf97IoOxa5aX5xWmHgPgNh
         s1eONqo+j44Ouy+a1EvrAnnk21poN7Mho8V/qs4un+cgYTeL7goWHTKMbl4ocUuHA6Fn
         /hbYY+axxSzO5UeVca6DRL1i5aLOtJo+/DSVjzOW/DCf/1NywS7WoOwTHMqJEPY8u4Q0
         xBfqIheHg4Di5mhkwqEBm2Vv+SIvFBP7eP8WZN0nwzYc4l5NX9hgjxSBM2QzVqbXJ45L
         XSPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746737350; x=1747342150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pQLImjLrkfG6X7DibrmXWX4yvLdmaTYFvbkXMG9GkIE=;
        b=uDRRKGtOnPihMQN0qMzOLMVq2UGguPqIH6FLBZ9kCYdSHC1ilsTf+Anx0DRDVMIbgF
         mfeE2BXRAp5IRnSyljhCwNDS30pMBUP0tnjXOiZQyc2g4rosHeavjYzpUWAVj+CnQcep
         aePiMTJ+WIjVQBwIFQ+I8dyEBnHSYmCfLRteDRIwLvuPvNUBjTZD6XXKQ4WhffWcN9Jc
         zWC9lEoD4Ujoce/6TSK4HHPsgLv0nkH1p11v9GnALfhgLj64+5mRgwQpCgIRQ9kHFg1u
         fdXM5p7PwDACwA0BT53oKQLH1B/liZY/m3ls82pQ8Joet30D7bh9MY4Qz+22nfhMrHDN
         qoSA==
X-Forwarded-Encrypted: i=1; AJvYcCVgX5zUz1uQhKpfzBoLGjj0fhqjdU75VHu5QbOWaN+TMK7VfAi/iYRtiRR1IHwnDMpkxlxgXNKDUWDq0Zk=@vger.kernel.org, AJvYcCXZaCkU8bQpxYR9UsEjZlGUuj6D0LwQwFDtTK5YLMNT6Nkall4idDJyuuzPtufPtj6DfM5CDRAVRKia/vI=@vger.kernel.org
X-Gm-Message-State: AOJu0YynHXz6Iz1w80LXF+UumTIZzWxlh7MgAMeChk6mAG+hpl1Jlz0j
	B63kPK1zHakR0cYhwf/53vRxubTZyPyGFVn6OKEucY3yK6aqcArN
X-Gm-Gg: ASbGncvJAq48folDQvxVaf+lP8XkeTciKp8+l5BDLVqdS5SopOuGPjrqdRRlBIUwkv4
	plJru7cxJS3W4rt+9BRNAhhuMyMyVDiFR4GVZP8IXg5DVCCck3lKFvnq7weWw1xja2Rk8roHTzw
	u0rEYZ+6Ux1xAqXxOnSqU47D2jh+AgsNVkrkTFRTWQcYUxBKL6mgRSxyxSd8OscqMfTDOvZip0b
	Wje2W1njWLJg2bJ1gKVQ6akjLxO/BGPcum1mEGgqrt1PEfv9PNYqvbxmnBPhTJrJmYtV8mk9+NY
	35Ogyk/41tDbEwvDFvb5L2HvbpOaJcRXFxhhNGHYOsTU28CiAd7GgvBOCYQPFYhIkR02pM4a8l4
	3r/GPl/kBdGKJ4wI/xjxCxh50IgSxwHhk
X-Google-Smtp-Source: AGHT+IG/l2m+3N9dBnBHXiI+zBWTHIPHWXhRbjIy5gp1fXKuNEKgyqPtkvu8GZkKfJCVtpVmTcObPQ==
X-Received: by 2002:a05:6000:2902:b0:390:ee01:68fa with SMTP id ffacd0b85a97d-3a1f6444a44mr852071f8f.24.1746737349585;
        Thu, 08 May 2025 13:49:09 -0700 (PDT)
Received: from localhost (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a1f58eca4asm1005095f8f.24.2025.05.08.13.49.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 13:49:08 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Aaron Kling <webgeek1234@gmail.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
Date: Thu,  8 May 2025 22:49:06 +0200
Message-ID: <174673734143.1565269.9238861080685256039.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250501-tx1-therm-v2-1-abdb1922c001@gmail.com>
References: <20250501-tx1-therm-v2-1-abdb1922c001@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 01 May 2025 17:32:23 -0500, Aaron Kling wrote:
> This is based on 6f78a94, which enabled added the fan and thermal zones
> for the Jetson Nano Devkit. The fan and thermal characteristics of the
> two devkits are similar, so using the same configuration.
> 
> 

Applied, thanks!

[1/1] arm64: tegra: Enable PWM fan on the Jetson TX1 Devkit
      commit: 36ab61d8b80d0dca5a62b43c7e4ea12d5a5067d4

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
