Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6C932F764;
	Tue,  4 Nov 2025 14:53:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762267990; cv=none; b=kb82v93QCPiKPy8+b39A3kNh33i2qw7xUkqfZaXqETXGkAm0PDUzV6PR3fbdV7ypqIr2QUWmRf2d8C/eu7piX1iNWG6b0y2aRGrfcsKe4QJvHb0WNXvpUr3//vRDkvCBSAZufieIYVh55SwDJumftIMhSTqAwTad46jTieOPk30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762267990; c=relaxed/simple;
	bh=XizIkkTML/GsxMVBKobrhmeWIkr7RZQrIiLxjNeONyg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K4aZZ1nWVzcv3C6SB5RfA5tUdtHhbRXbsoTmk+l7QyAEEOcuZQXCBcVXcHLI55mMb2WdBhv8ANp0vVxXbE8oAC/97bW14Ht1zyjbBZLfO4dZh8pWIXEGVHGhMYdi0b7FWh2D56ggsIMjJv0dd08Y23cGKx0gzEnpSpnK+2GhptU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SXfyQFBy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SXfyQFBy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 231CBC16AAE;
	Tue,  4 Nov 2025 14:53:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762267990;
	bh=XizIkkTML/GsxMVBKobrhmeWIkr7RZQrIiLxjNeONyg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SXfyQFBy0uV26wWPu4367b14KJZB3NZl37qclfzU/SfkEAvXzNKwEc2zyRvkKYAhd
	 hQBu2iNhMzHfJTRgZNvJxc7nqnK1ZB/LS/wVobAhkhHilzzeWlcV9yBUCr4Rz815ZR
	 5j8iq71S7HANYsi/k4SXHUl6Z9VPMm67hO9QShg+J8D3bSIa8YF4RGvH5i+7enNC4O
	 Ufz26xSlGrqzpXtRSjpXo3xnJCX/QOHH54EzLQtTqhQJzI5yESSS8vTw27bRZjTqv7
	 AyGozDSlvwkGnyG6avVe5NA5FCef6rMig7AGDV/igcRZcLSc2Sw7vHHX995k+FCsQK
	 wxEByOnvwpzeQ==
Date: Tue, 4 Nov 2025 15:53:05 +0100
From: Niklas Cassel <cassel@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Vedant Deshpande <vedantd@nvidia.com>
Cc: Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>,
	Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v3] arm64: tegra: Add pinctrl definitions for pcie-ep
 nodes
Message-ID: <aQoTUeOhm0kAylY6@ryzen>
References: <20251009142253.2563075-2-cassel@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251009142253.2563075-2-cassel@kernel.org>

On Thu, Oct 09, 2025 at 04:22:54PM +0200, Niklas Cassel wrote:
> When the PCIe controller is running in endpoint mode, the controller
> initialization is triggered by a PERST# (PCIe reset) GPIO deassertion.
> 
> The driver has configured an IRQ to trigger when the PERST# GPIO changes
> state. Without the pinctrl definition, we do not get an IRQ when PERST#
> is deasserted, so the PCIe controller never gets initialized.
> 
> Add the missing definitions, so that the controller actually gets
> initialized.
> 
> Fixes: ec142c44b026 ("arm64: tegra: Add P2U and PCIe controller nodes to Tegra234 DT")
> Fixes: 0580286d0d22 ("arm64: tegra: Add Tegra234 PCIe C4 EP definition")
> Signed-off-by: Niklas Cassel <cassel@kernel.org>
> ---

Gentle ping


Kind regards,
Niklas
