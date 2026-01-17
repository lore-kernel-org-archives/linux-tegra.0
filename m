Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F5616A956
	for <linux-tegra@vger.kernel.org>; Sat, 17 Jan 2026 00:25:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768609547; cv=none; b=tTTm74wz2jQ8BCCONpFzWVwFaMZnjPOnLjlEY/HwqQ0pv5NrQo+ux7GKjVqAX6BDDtByTDQug9eI4qK16QxiCabHNWrtJ1jweLzU8y49Q7BXnWzLM2IxJyf7Ztrx5cnpR0tRhg8NKlOzjC2K3iQE5joq8SUk7vf9Rztx7tjO1fM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768609547; c=relaxed/simple;
	bh=Id75euKpfQTJco8yENL5IWArmZd3XiPG2kUkByIZOUk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mIk1AEL9aWGI8NGpeZjVHc9NH4CVnJXWYFQf+Sk80cJ7Cnspv9FMr+qP5vMpwSSsAsXUDi+CfYirDKC+NpPxuKUg69KNGVYRq77qNP40FlZmlyuncnyk5DikOsITQIMU5/8umB49UmzXum04oyxaU9JYXXe6/scqMiGS35miZ7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bfDR9dh0; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bfDR9dh0"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2b6a93d15ddso2251904eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 16 Jan 2026 16:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768609545; x=1769214345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cs/w5dukbECq6vP+JVY/PT3LY1xl+bSBRNaUMsBTQvY=;
        b=bfDR9dh07Ax8yCTUpMajEXGrrxJvdyZl6MQIkskM2fNP3et7b2njGJgjGUlc908qbk
         b9WLI6WMyMA18iOAi+BM5A8abDMKOMGM4j8XJTOu5KvO7YzS4/LkPAWn0eNzqtX6hdVu
         rZblcccOEJXr6NdVzSc2lpdeTTizyNf9apFtYL5fEwOlRHvZ6fX+k/kqIBK3mKQTk2eD
         BIjgDXiVes6u27kFXovWrbI6kshYWYc6nDMbq35+X1XNLReJMfE2tmChjqlYeoqxTZWn
         I6EXGragJ2eGeSmccFmuALCUel7GnL6ZX0Azy4n1G+gWRYTZzYcWuzeYvVmJEgcD7/Re
         apew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768609545; x=1769214345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cs/w5dukbECq6vP+JVY/PT3LY1xl+bSBRNaUMsBTQvY=;
        b=EgzRxQCoT4XsNiz2vUedQgfRntL6WihLiJAFFUEhyuEFOll8JEGEVBJiUM3wBSdsIK
         tzgSCVfQjZ2IZnwvOPkIaWeHY3IfKz7EFc42ZvC7gpSuDwMCrMCpO93VatZvGfDjrveK
         8khKGAZIKKpJwJlOR7UYnXCjv+FLmzB6KZUikVuaLU1yXIaXMXfcfZ2BypWtAHfhcNyg
         n5cAqSiCbwFarIxuQoBlE0pJAEnrnSE9R3d8kW7K6rcO6L6iDvH0DlNOQJ4ksXoQfO6y
         UlgRN0xdFFXoHrnuzR+wOggLtFbLzXVCQ6S98J37OWP3RMcecWnPf6VCZvm17sufU2gn
         hL5w==
X-Forwarded-Encrypted: i=1; AJvYcCUBH5aaclqXd+MIW8VtftJpY9igd8CaKnVBd4mBI5Y6Oo4Xz4WIfO5UlKgs3GtBHfHxL9jsIXBT5dccwA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8i4tXDmK0ip4Ey+XXPTB8MsuopDPqoV5G2zRY3n2ovzEB0Z1z
	vlEunJnCP4+Ma/2NEvIEw4Qf8oIHJfeIusAzSRQBBo5TBVIvaPwmhRXL
X-Gm-Gg: AY/fxX6gywsq8dSi+/5wTGyVRMWeIM5RxpyATRmizKKhhVBerxd6jKdRqmveYzLIOiX
	SNjsgqUigvIoPGyG7j4lZbVmqZAUEv6ixIHHI1E6Xs4A8Ji8/dFN6kywwAvSdUiFDqJZt2xx+fj
	8d1d+dvZ4W0Y4phrjgnLsZZg9tW7gZrZvgpvmiVju1Fysu/ZAk/9qhJigmpx9LSvEz4qXe9sPZ6
	ley3FQbljQmLVma7BlHSNvWOAMZ9MgejEBfilB3C103zJ5vRjxA1JQGSyCOhYqU4zw8oWKHthAj
	VrBibdBqk/vXG492M3v8d2fVnSQBiqIFWUUjhQdXXXKr8lFhwT2562s8lac+M8zkYugUQQQAelS
	KeSVxWDzbcSEx6rMmVtcQi4eSvhSIbCwCpSluKIg3c79FHh3kQ22Clv78VZpa5j7sQft1kXR0f0
	mHVhKjjiyxOMHiRdoeMcdedtYI+AsumfWhV5rFBRB9aEhdguQwJn/S0ymOVaBB6w42HUQZ0oH7I
	3GqbtBCe24Pygzudw==
X-Received: by 2002:a05:7301:2e87:b0:2ab:8ef5:df2 with SMTP id 5a478bee46e88-2b6b40f0c13mr3046636eec.35.1768609544724;
        Fri, 16 Jan 2026 16:25:44 -0800 (PST)
Received: from localhost (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b6b3682540sm3944277eec.34.2026.01.16.16.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 16:25:44 -0800 (PST)
From: Thierry Reding <thierry.reding@gmail.com>
To: Mathias Nyman <mathias.nyman@intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	JC Kuo <jckuo@nvidia.com>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Cc: linux-usb@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 0/5] Fixes to Tegra USB role switching and Smaug USB role switching enablement
Date: Sat, 17 Jan 2026 01:25:33 +0100
Message-ID: <176860947663.1613073.5692699224170959766.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
References: <20251204-diogo-tegra_phy-v1-0-51a2016d0be8@tecnico.ulisboa.pt>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 04 Dec 2025 21:27:16 +0000, Diogo Ivo wrote:
> This patch series contains two fixes for USB role switching on the
> Tegra210 SoC, as well as enabling this feature on the Pixel C.
> 
> The first patch addresses a wrong check on the logic that disables the
> VBUS regulator.
> 
> The second patch guarantees proper ordering of events when switching PHY
> roles.
> 
> [...]

Applied, thanks!

[4/5] arm64: tegra: smaug: Complete and enable tegra-udc node
      (no commit info)
[5/5] arm64: tegra: smaug: Add usb-role-switch support
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
