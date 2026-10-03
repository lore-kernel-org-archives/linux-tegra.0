Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6C9C188005;
	Sat,  3 Oct 2026 14:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791037893; cv=none; b=o5nGVfm4rVKhKxQ9KX0+uMj3QuaCeqJYMBxf0a2mb9xDgjAvcGiPZKddTkhjXowdQoYepJe4oEc97WQcmMCM6ICRKsIWKa5ZpdHLH3v8XeX9TlbUjBGi3h3ZN7Sy9qHXev9HTQlqL//n9FTbPwCr+uXmKoQ53+BqDtWoVNGvNbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791037893; c=relaxed/simple;
	bh=oFcUmxlz+EHuGP4UKWMdwHTsdai4lwoB/1//Ba7qYU4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tzQ7OVRhdu/t/goMGPv2ABu5UBYSC+8F3hbERDp9GWgVAmHymTTwPyubpu/Hc1hGHxjBITLz9xrhQYMcTVHl7zq6miKXP28Yt0bejFveZgPNYOMGHL5SEu171i2BLdugEvReC9hIsGq0btRdzpY2k2osBMKT/N0Oj+EKaKEkc98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PLmpsGE9; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PLmpsGE9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E95501F0089B;
	Sat,  3 Oct 2026 14:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791037891;
	bh=85VSlzMBZ/eH8Sf9Ij3dGa3YJSvPkW8LRgUERVbGizI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PLmpsGE9c/T69rpv7vmO/ufo+g++I2Hyh6ycU3gf0O2KWf0y3W6F89MJDY01+71cV
	 CjloGXnBQR7VifxMp/TE/JDxVD9FwE7QhPuMO6CbL/sRGz0E6AgBXE3xopnG9HJD1/
	 AB82WDlyvelh0Avo6lQFHSHy0dGMy+ZjG04xX9fDQGZPyKbugZBV7bVBySJKzvpBxs
	 JsKest6WZImHDqR+e4u35x5nh9aChF9aHZJhqXyOoLNp9A30HJp2DRTM8hjaMi7Uve
	 mUgWWPObp32GRb3LYZecjT5kOIROs+CZzi3EOmuloL+lcSFZgfAiewG/X2rB2kJ9ci
	 dFEEBH1OY8sDA==
Date: Sat, 3 Oct 2026 16:31:28 +0200
From: Vinod Koul <vkoul@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	JC Kuo <jckuo@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/3] phy: tegra: xusb: Add Tegra238 support
Message-ID: <asERwJjj3eUMm8Kd@parshuram>
References: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001-tegra-phy-v2-0-3e453b1fb271@nvidia.com>

On 01-10-26, 14:28, Jon Hunter wrote:
> Add support for the Tegra238 device to the Tegra XUSB PHY driver and
> add the necessary device-tree binding documentation for this device.
> 
> This series also includes a trivial clean-up patch to use the
> dev_err_probe() function in the Tegra XUSB PHY driver instead of open
> coding this function.
> 
> This series is based on top of the series that adds support for the
> Tegra264 device to the Tegra XUSB PHY driver [0].
> 
> [0] https://lore.kernel.org/linux-tegra/20260903071937.533646-1-waynec@nvidia.com/
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> Changes in v2:
> - Dropped extra 'err' variable from patch that migrates to dev_err_probe
> - Added Krzysztof's Reviewed-by for device-tree binding.
> - Link to v1: https://patch.msgid.link/20260921-tegra-phy-v1-0-83466bf9a7cd@nvidia.com
> 
> ---
> Jon Hunter (3):
>       dt-bindings: phy: tegra194: Add compatible for Tegra238

Somehow this fails to apply on the current code, can you please rebase
and also check the sashiko issues reported

-- 
~Vinod
