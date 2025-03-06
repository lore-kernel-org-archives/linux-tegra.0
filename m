Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3ED419B5B4;
	Thu,  6 Mar 2025 17:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741282473; cv=none; b=focANeVCMMQAEYMZiLHbBfyl0frXWSQcxzLcO2fWMBTIYeKXUEMkdaLsjM9AdRVkHq0YpNL0RGRC1dBAs0PHyStxzgwrjUE2iR9gI0WndS1oPg4WoFCRJiXwa32DnfT2D3vGZjTwYMSyxtc5H+9DcmDVb4MYbZKT6YOa7T2ktq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741282473; c=relaxed/simple;
	bh=QhjZjPi8Pu4MuaZELNAV68zJpLOkhthhs/bKYjykGQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SG0z9jecXSPOHMixivOqF6cjg+dmWA2crPNfDwJjLxwUpv6AQjtGXXruxR6CXBlBkkWmaN8u/gCIc6xeuiO0OtPUf482Udz3G9NNHtHdN0USHCfc7bLWYZZXNFcMWP0d0o8XlJAC8KMPHdk7Xp0+JiBzrRlXAPjdRtOCw01+45k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UuqHSGlb; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UuqHSGlb"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-390e3b3d432so564325f8f.2;
        Thu, 06 Mar 2025 09:34:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741282470; x=1741887270; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klXCq3m5VWm+0HPJRbYO3amBiaqCuvTQ/FZ8TPHnVFA=;
        b=UuqHSGlbudtONVH6pqbW0uEDW3H8KhudYGqeQCMmD3lhPJZfowWJPORyrkpCFC98VL
         iEv4vrS/MqgFGnHl4BvcJO+eXrXKqRuUmK2dEYKuGu+YZGtcn0Xmwue8x5Atf/Rm/WfS
         nEFiuXXdzh684JbPLrLrP/XwQ6J2A7X4vwPSl+Xh10SGlCIojJzY6hfljjGSfdRL8q8z
         rebjOpHprjFM6rt60IN2LBKB1kY7bZbrUuN7YGqzQY5XccLgI2exTpHGcFfBC3SE6UbS
         OOUvHX1srhul+d2io8gxhlOoxk7KVTOXjlgGzbU3FvuyylbNOciDscVpWxsk6QXdrdbf
         l1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741282470; x=1741887270;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=klXCq3m5VWm+0HPJRbYO3amBiaqCuvTQ/FZ8TPHnVFA=;
        b=pRpp2IdCH6DcYsH9soQMNq+aAA5iQWh0ScW3NJ2cygvEvb2I1UGrZCnEfcr/lU4uKJ
         zW0EJcGCGF+EmVeQNqlCJx7rOd2zmnb23gwRIRIK+iVSWf4Ejyxr44JkHljCfTuJoKGr
         qDTJEiGp9ElE5+jfl5mIOIP6ZiOGRaV4doXCFtiOvQXt6JZmJMg1COhYjVxuM07tAYTA
         6mXkK9K9OIiDFwCdMSZ5OCbyWd7gpu5sD1ljkkrNqrSEblf5BqBE1s7feSsBCWjxKgMm
         J2+VV4p8pR6LHcicjMay2pYTry364+uxAjHZC6z64f1lST9GAwEqz4giEqR9Et/ybzcA
         rBMg==
X-Forwarded-Encrypted: i=1; AJvYcCXdXGamYxEEOrjR910gKEGCEeds49g8iowVHBqxm9A+QWiCQVjDe2+54YyTofHU/PXfHsy7eRQyKT6FgME=@vger.kernel.org, AJvYcCXnj7lGDT+z4maV7V+BK+r2VGQ7CNykrYavrlnroiNg0HFjgY7M97NmMyYY72D5Mi2PzH3E9sazQTgMF2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLzQmTq2UaL3wvD4a+28sq/B4EBP1L7cOC2/wqvmJr3gw/aho1
	y7fIz4BouslNqWpTG2Z8gVyb4H8w2EMxWelJiBL6CC4Nr+aWhM/p
X-Gm-Gg: ASbGncsvm/a+anZjGDcBK5zFYh1auw+js/X/Yd9qq6a5uBv/FmJT/3o68uzbaLtZhd0
	rzjKViPLWNDLfUPxGpcfmgh8g6g29oJ9lY5PZVctIYTZbqo9kf/a5CoQZ8bbQvWKEpu0BUBZEo8
	E1fWxzGV2pcvkug6E04G49IOs01cjFtZWoc7kAS3qAJkh09bAvCM0H2bAZVq+MifjTBLXKaduiB
	cJYnE0eAR2W7DctjC6vJ+T1z2G9E2HG24ihhrjDFK7smbc+sOeMqWxPKcSSX3vLz6YHXolGAioF
	jXiEcIl8L5eriZM6CSVH9UGjyWawpT0dJBRvXt/jwz5IKr7OGqFt4DS+AoICkn340NkXYcvr2D4
	Nz9jgw5ihJD0bGlRFb+j/weVWMWDxr3ybydeU
X-Google-Smtp-Source: AGHT+IEnKllRb/k1/H98dNGUZJ9z50/qfSr+qeIFuQxpsKNHvLmqaCrlFdFgoQXYNB7IHYqXWxdlKg==
X-Received: by 2002:a5d:64e9:0:b0:391:2192:ccd6 with SMTP id ffacd0b85a97d-3912192cd5fmr6881752f8f.39.1741282469939;
        Thu, 06 Mar 2025 09:34:29 -0800 (PST)
Received: from localhost (p200300e41f3a9f00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f3a:9f00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3912bfdfbb4sm2738249f8f.30.2025.03.06.09.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 09:34:28 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: soc@kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	"Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
Date: Thu,  6 Mar 2025 18:34:22 +0100
Message-ID: <174128244841.2024061.11431672640522584852.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250305224952.2995841-2-robh@kernel.org>
References: <20250305224952.2995841-2-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 05 Mar 2025 16:49:52 -0600, Rob Herring (Arm) wrote:
> Remove "regulator-ramp-delay-scale" property which is both unused in the
> kernel and undocumented. Most likely they are leftovers from downstream.
> 
> 

Applied, thanks!

[1/1] arm64: dts: nvidia: Remove unused and undocumented "regulator-ramp-delay-scale" property
      commit: 90a1dc90d08bd1b8a324d4272d06d74525f51409

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
