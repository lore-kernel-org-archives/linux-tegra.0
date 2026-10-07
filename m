Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 964C9472091;
	Wed,  7 Oct 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791386139; cv=none; b=X9w2X0qz5wo65JoxwYZERgBoD83koUCfgvqRM2i5OFZWYpLyJ2WTGgnqm7yFlqa2bZ0KCTsz10XGFumYVsSW/BhY8wWfRLxA2jvdYqO+B1utOL8kefU2MYD6m3iFcXd8AgismFvW/G/FOKulBDazu7Es7FiB0n6Vx6KRmN5UiGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791386139; c=relaxed/simple;
	bh=caguixF2euRX5YDpB1eNYCjrAD8tvm4xFFHt5ZX1IN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKsAK30yg/26CRP29eks+zwCQJnYwcy2471lnKIo2iO2dqx5ix6p6wYrrFfkLuS7jTeR0XL7V52oW/NI7gCI333hShw/uAXUAQNYwyOsP4lap6HF3K4Vl33h5Pv0mBFcJCdLvBSN93p96B/fm2kVEFZy9C/ZtZZ2pXWxJjEJRFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nty2Uc3M; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nty2Uc3M"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4BF61F000FF;
	Wed,  7 Oct 2026 15:15:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791386131;
	bh=TjVi7Rx1rFn3sJeEh/l1JhFtiUFQYPyDX/et1rX8SSw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nty2Uc3MCI5Zn9Agpj9e+dynGJEtMbnGCx4L9CwvW4rmBgoTn8OFkTqe3SR6FHb5n
	 dP/eytvJ0+NHxSHwgUpjjIZd0Bj25ak8TabWTLcZ8O5BEj8sAfC0TTVwzO/968nj4R
	 PRlcxn4PMrUXFRpVzA/6psqVCHE1bBk5EIQuvO/H3PagWcztCy9cPyrG0Jy5tq2awY
	 eVK2ao5Uv1NfKSSYWh/18G1uFkKcLdD4UsGrOZelfMU2KOP0N+MILcD/ElNPkyx1u8
	 o7/8rRw45AK7KGai7zyHvbBWN/wfuQiNTf4jtjteeXO3zv+M4wtfJXyGfYLyeZJRcS
	 D+TCXjTYvAR0Q==
Date: Wed, 7 Oct 2026 17:15:24 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, JC Kuo <jckuo@nvidia.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Wayne Chang <waynec@nvidia.com>, linux-phy@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v3 0/3] phy: tegra: xusb: Add Tegra238 support
Message-ID: <uf6h4xyzc7c7jp7ekas2frmnynnwnrxpghq5krto6zyhimbcgx@asb7p5h5dqb6>
References: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261007-tegra-phy-v3-0-d501de414710@nvidia.com>

On Wed, Oct 07, 2026 at 03:44:40PM +0100, Jon Hunter wrote:
> Add support for the Tegra238 device to the Tegra XUSB PHY driver and
> add the necessary device-tree binding documentation for this device.
> 
> This series also includes a trivial clean-up patch to use the
> dev_err_probe() function in the Tegra XUSB PHY driver instead of open
> coding this function.
> 
> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>

- Mani

-- 
மணிவண்ணன் சதாசிவம்
