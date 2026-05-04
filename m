Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D78281357;
	Mon,  4 May 2026 18:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777920498; cv=none; b=qEuH60ZxMq/9lNVVSW/MUxuDaFJ6gXx6VzwIMcvkd5F3aAHDUHOnjn60TdwE5JdOPygW/EQyFwN5hZHFB6xQ7/6BqJqbYY1Yn8nbrfxKYfW8axedQDo1fWgWtg+n5dsMljmBaC7FL+TQMqUIaa8CFkQ5SydK8Gt8AUFjYdgDe5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777920498; c=relaxed/simple;
	bh=v5LRJSGPa4Wzcd4isj16rJQz9u6FYLuITrKAZxYzMpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hvtFJvN3RB5r70JssWBEn3D26jUPvJNMygRSdh7olX9lh8/PN35gO1p71N85SWcyiOxHluuesIZcM0XTdJhI11oW9jo4T39Jks/p4nNrKvC7NWbPLnv+w1PgYluOTOyfN3NXc+3NPeJ0TSgm0VZ2Gh74pzOZHmpSSFtxGk1AQSc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rRNtqx4y; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rRNtqx4y"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 296F6C2BCB8;
	Mon,  4 May 2026 18:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777920498;
	bh=v5LRJSGPa4Wzcd4isj16rJQz9u6FYLuITrKAZxYzMpE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=rRNtqx4yTyxxbkaWW8L6xCLziI+PDq5odSlVJwSfgtLm/nbWM0CAg53o016/9fsuZ
	 Gy9KdbKSKwDH7ZzR6cOjY1YxrGwPPVO+ZQ9HWRSwmhM/hR+PkI7XZk4dSGp3wLGCjW
	 LsRxitN8tv9I1czZeziz2m0j0Uwl24Eam23s/czQJ7lITgPNfVAqeTPAbBsJGjmdcw
	 IpnX6fnp+WGw/8EsvgpI2AeVD3VEgyispnsQtpE4wqSHjlMKA8WVhb24wVj8GJqUMJ
	 xVxQr3ndAKjzW0SflWFwgdMUYDNBgGiAgBfv3qiPYVjaqYgW0vV/vKx5GnNUjzYFc4
	 PYtc54twGIyYw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org
In-Reply-To: <20260427070312.81679-1-clamor95@gmail.com>
References: <20260427070312.81679-1-clamor95@gmail.com>
Subject: Re: (subset) [PATCH v2 0/7] Tegra114: implement EMC support
Message-Id: <177792049588.729047.9904577732201686885.b4-ty@b4>
Date: Mon, 04 May 2026 20:48:15 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 27 Apr 2026 10:03:05 +0300, Svyatoslav Ryhel wrote:
> Add support for External Memory Controller found in Tegra 4 SoC along
> with adjustments required for it to work properly.
> 
> Tested on ASUS TF701T (T40X) and Nvidia Tegratab (T40S). Both work fine.
> 
> First 4 patches of series are dedicated to memory subsystem, while
> the remaining 3 patches must be picked after first 4 are applied
> and are meant for the Tegra device tree maintainer.
> 
> [...]

Applied, thanks!

[2/7] memory: tegra: Implement EMEM regs and ICC ops for Tegra114
      https://git.kernel.org/krzk/linux-mem-ctrl/c/750fed9230ede9e43e234fbbc0d9b23c524a6c6a
[4/7] memory: tegra: Add Tegra114 EMC driver
      https://git.kernel.org/krzk/linux-mem-ctrl/c/dce208b5405f40c36320bb0ee07e9df8f7f2bea4

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

