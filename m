Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 823F42EC0AE;
	Fri, 20 Mar 2026 22:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774047439; cv=none; b=k4ETeaXEBKrWwYSGTq8DQE9f4v9wVOsfOYbg0jYYkrhyalzCGS5aPyYP5UhfaaTkCDP+TIJfd2zPbTXElRPIPagGtweLHsnyoj2XEy2jnOOFU25dWaXhneIw8Fb5YbfYwPSJHFdPa3nYCP5ZfcOPKAxf4epcgnhR/b3pqKoih0o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774047439; c=relaxed/simple;
	bh=zBrBQe+Y5neYzBLPJtsIXH/pOzUBnoUSrEG82CvNe9s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qyjZMtVRiKIztjsxeEsBaxURWdYHhlOHHucDBTXREN/zEIHCHfjf+F/vRNQhchu0akW0E0QgQ/JuRdY16hed9Xm45eAOMn5XvY2y/Vf6nAPnSuXAqXqI+OnZhMsMKPzXEhcB6WPnMieu9k+YLYR60QMkxbv4znIgSBn7FBRlPXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZu723R5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZu723R5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A809FC4CEF7;
	Fri, 20 Mar 2026 22:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774047439;
	bh=zBrBQe+Y5neYzBLPJtsIXH/pOzUBnoUSrEG82CvNe9s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZu723R5Y+8AqTXckomwefQe/erpxnz72am56Iu+D3TEy3xXPefV1jOJu401hedc0
	 AJ+RLXgGkiKBVts7buywAifRSzVw56Sk584c/WkV87Jqkpjb1BpXJVliz9kONKLv0Q
	 i/2Y0KdvKacyFeZN0hsnH/P/tv6ZdWu/1B5/yLzc/0l+fS+Fs+eTJA/PVE1jfpIuxH
	 Dp/EaaLTBQ6Z/YcNvAqK7o1EZfggPxCpQlAO863qxyCQuVVQwIKKM7Gh/pv03gajGo
	 Aq2bc8gsaYuQO14IDH9B5p7KtzOjPl+OUJaKGSFIzb+kYQAanW4lyA3nD4pfKz23m7
	 I2YS9h/OJ2v/w==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>
Cc: devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Fix RTC aliases
Date: Fri, 20 Mar 2026 23:57:15 +0100
Message-ID: <177404742057.2572906.590263252137366204.b4-ty@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260305151659.703273-1-jonathanh@nvidia.com>
References: <20260305151659.703273-1-jonathanh@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 05 Mar 2026 15:16:59 +0000, Jon Hunter wrote:
> The following warning is observed on the Tegra234 Jetson platforms ...
> 
>  rtc-nvidia-vrs10 4-003c: /aliases ID 0 not available
> 
> This happens because the 'rtc@c2a0000' device is registered before the
> vrs10 RTC and so is assigned the 'rtc0' alias. We want the vrs10 RTC to
> be the default RTC because this RTC maintains time across power cycles.
> Fix this by adding a 'rtc1' alias for the 'rtc@c2a0000' device.
> 
> [...]

Applied, thanks!

[1/1] arm64: tegra: Fix RTC aliases
      commit: 13346b553b49952f0d2b0b5a07f9f1492b811dfa

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
