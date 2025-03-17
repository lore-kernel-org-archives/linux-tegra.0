Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D4838B;
	Mon, 17 Mar 2025 11:04:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742209476; cv=none; b=RrGvGEzb1jiRvKlAK/D9qWYoBBUMnrw52zYQcbjzWuaheBypyhP+PatKXwUP4OV5WuR/+YJm3pdTLYVsx64uT0YnCoeXrHoRPgviNSwJ4oPFxVjSPfIXO9B17HUIAJbEtdBNVpyWa7v62Rz5YDZSndCJA5oIyIoF7dxJ1LfGdv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742209476; c=relaxed/simple;
	bh=QXTVGOAPy5hRygDDTJj9TyzfIJezRj6CJVWEBaTw1ow=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WRi3kbZOXt1j3J06/Go6Izh8Ft2xXo0Q6s2xIMEzwCHI5KlNaXB14FvF0bZmi9Mw6lpaa0Q1st8vOl34N+5O5j4M/XjVpPjfJQ91yHuMsnuMT/VIBV5M48pE+yd9U/MaF/VaI/nre+Wgjp11dpD68oYl1ifHbjfkGXXEWCDlRyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7gZXT8f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7gZXT8f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD653C4CEE3;
	Mon, 17 Mar 2025 11:04:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742209475;
	bh=QXTVGOAPy5hRygDDTJj9TyzfIJezRj6CJVWEBaTw1ow=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D7gZXT8f2U42lKykhvauBxQP6jZHlVyGXQX1ZEez8nGc6JGdwqfoUF7CHTuYvfU+W
	 ETcTXGBYzn5i1iueQo2b5Ceg/JFX9EofVn8chjkCkYNu45VO0kzd5WvhB/1iDwPPDi
	 Gfy44xUWeQI2TD5HesFA5feiXI4TgK2DjKf+0vNx9AmTilN589hC2cqxv1VqoVcFPM
	 J3FNuWNTL5NUQXIXYp34pzlqlXIyyUaUCldMumXMwCxxHh3W401H7bsgvqEtQv9mTY
	 NITVNVBFmtm7zXSviMnVgB4nsOKroMAUDQzQ7dIVOnxvVcuGlzJ4f1sKI39SQGYR02
	 9YhrWynq3nskQ==
Date: Mon, 17 Mar 2025 12:04:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Maxim Schwalm <maxim.schwalm@gmail.com>, 
	Brad Griffis <bgriffis@nvidia.com>, Dara Stotland <dstotland@nvidia.com>, 
	David Heidelberg <david@ixit.cz>, Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/2] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
Message-ID: <20250317-enormous-bug-of-triumph-ba274d@krzk-bin>
References: <20250315074416.8067-1-clamor95@gmail.com>
 <20250315074416.8067-3-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250315074416.8067-3-clamor95@gmail.com>

On Sat, Mar 15, 2025 at 09:44:16AM +0200, Svyatoslav Ryhel wrote:
> +#include "tegra30-asus-transformer-common.dtsi"
> +#include "tegra30-asus-lvds-display.dtsi"
> +
> +/ {
> +	model = "Asus Transformer Pad LTE TF300TL";
> +	compatible = "asus,tf300tl", "nvidia,tegra30";
> +
> +	gpio@6000d000 {
> +		tf300tl-init-hog {
> +			gpio-hog;
> +			gpios = <TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
> +			output-low;
> +		};
> +	};
> +
> +	pinmux@70000868 {
> +		state_default: pinmux {
> +			lcd_pwr2_pc6 {

No underscores in node names.

Best regards,
Krzysztof

