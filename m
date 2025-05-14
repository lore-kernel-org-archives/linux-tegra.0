Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D07C274FD8;
	Wed, 14 May 2025 11:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747222311; cv=none; b=B77iiXDpK6glOKfcn/exfP4rQBRjibMD/TNWfOaRudy0EdX1lswDtDtNhRdC5wt3iavB0X3tudo9aacw4c15iX9vxGIgh8Sqkrfd8CIKRjBzfMyj0rzV7Egzajw3BErKet0tDy8zowaarn5LjeClT0M3cFgLMNe2Qcx14rX+1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747222311; c=relaxed/simple;
	bh=TjHZy0Qfxt/73KW8i7sJ4rh5wCGHa3DkSz4VAJQCJ6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=oHdPEyX/GrLPJVE0qq8ad4Ut/PozQRFuNEK1R01BPWE6jcq8DHkb8a7OX873uYRhJtdGUr2UvtM7za1ySUzCMAl9bK4vItmV0vSqxcjE0oHTrBARF3M1FIk5lvAKaK8DzkXynqvLELeP0O2rVlWrgpSTFAVbjpR+g+Nw4ChRZvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YB/8ByW0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YB/8ByW0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A74D9C4CEEB;
	Wed, 14 May 2025 11:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747222310;
	bh=TjHZy0Qfxt/73KW8i7sJ4rh5wCGHa3DkSz4VAJQCJ6g=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=YB/8ByW00FbNFBueMKwnoMSXkVUdZ1lwH2w7mN/kBXoW4srl3mplbK9fPjF4daagl
	 qTzcE8/fBtF1q0vw7oaBLgfrJkiBuhzksA6Ck26mrxehzkd9rulxq8RBYQc8ITaPlO
	 OH2s5Xr1kQGhCgTDAk8FNxMqOidG+Pf0bqyZ5yrWynPoxPCFEERHNBcKprKiJktQR1
	 5nLp/HX4ruV1ddcDZv7V7XhxVWrxoBnN/b2RRwfDAKhgaY+gIC4V16DL/K8kTMQzPH
	 LULIOM1SZ1E8RUvbSrSOJFWoo/i/ploc3RUQC2oKSpbn+efWwOrA4cQxBYIitt8RLI
	 l4gMkSqLvlP0A==
From: Vinod Koul <vkoul@kernel.org>
To: Wayne Chang <waynec@nvidia.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
Cc: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kernel-janitors@vger.kernel.org
In-Reply-To: <aAjmR6To4EnvRl4G@stanley.mountain>
References: <aAjmR6To4EnvRl4G@stanley.mountain>
Subject: Re: [PATCH next] phy: tegra: xusb: remove a stray unlock
Message-Id: <174722230834.74407.625250786881304963.b4-ty@kernel.org>
Date: Wed, 14 May 2025 12:31:48 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Wed, 23 Apr 2025 16:08:23 +0300, Dan Carpenter wrote:
> We used to take a lock in tegra186_utmi_bias_pad_power_on() but now we
> have moved the lock into the caller.  Unfortunately, when we moved the
> lock this unlock was left behind and it results in a double unlock.
> Delete it now.
> 
> 

Applied, thanks!

[1/1] phy: tegra: xusb: remove a stray unlock
      commit: 83c178470e0bf690d34c8c08440f2421b82e881c

Best regards,
-- 
~Vinod


