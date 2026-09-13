Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6589374E41;
	Sun, 13 Sep 2026 08:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789288688; cv=none; b=u7HrVy+4FtrBHyRePZMx2hIvmbZJydu2qbDyPSAUJQBcL7k2eOvTkQu4EaJSlIdmBaQQUBHu5tQ559DF8PsM3ay/VjMdPfEFb5n4/OqIBSaSlUQR8MXWmIGJUcBMJrekuASL8lWTp9vWJagGOU4kn9tbCiQTULJ+loED4c5pvrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789288688; c=relaxed/simple;
	bh=ks6KGVcHidJO4aibMpAj4mUKWYZ8dmCrffpI4GsYvDc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dHLYI3lUTcJvQgFcrye5duy9lMI+/BUz1CsP6sTJkYY09WuWl9XDumPcLiqsOqQFmjdzJm58yfgmDAjjEZIQBLWW9EIwqfjR9w0rx/NeDh0FbryPtAYJU1yJj76LdZQlqr/JBSOtQnOW7bZAbE2pXl+AZhy/svAS0PkAFSId0SM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oIaCJah6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oIaCJah6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A85D1F000FF;
	Sun, 13 Sep 2026 08:38:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789288687;
	bh=zYaObIl9eJLvHocuOdg7xLi92zre2V2kD4I8U81J+hg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oIaCJah6w5rhCJBugBBYhg/r/NVGgyOnQAYoB6rHwBxQ6G5I2wN1HYepVZKKjs0y/
	 WqHUMHc8bRb7VjN15mZd3NMCpuuXYuTmVSwg352EDoeB4loa3LHBkhSYTBeNeqLjmV
	 2dhxeJzDYLfJOR+L0bfOapugakqXI/kOqA7pjPXpGhXMR4GaXRizmO4tTYr1lP0Y1Y
	 OKu5w7QM6ZZ9X82GJz67n5sTSIMeg7ZARewHhvMMyCvqnxJ1IoWRHQA+BYmkfudPjh
	 01+zXnwxfT7hZeasAyLzT7cQg6ThsLIg7MyF47XhM0WW4+Is706TLaF4EHFSKTpVbu
	 WPT/pRi4p38mw==
Date: Sun, 13 Sep 2026 10:38:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Thierry Reding <treding@nvidia.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: phy: Add nvidia,tegra264-mphy
Message-ID: <20260913-elegant-banana-rooster-1b28ee@quoll>
References: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
 <20260909-tegra264-mphy-v1-1-ce61a80dc065@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260909-tegra264-mphy-v1-1-ce61a80dc065@nvidia.com>

On Wed, Sep 09, 2026 at 03:13:58PM +0530, Kartik Rajput wrote:
> Add binding for the MIPI M-PHY on NVIDIA Tegra264 SoCs. The M-PHY is
> a hardware block with two lanes, l0 and l1, used by the Tegra264 UFS
> host controller.
> 
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
>  .../bindings/phy/nvidia,tegra264-mphy.yaml         | 108 +++++++++++++++++++++
>  include/dt-bindings/phy/nvidia,tegra264-mphy.h     |  12 +++
>  2 files changed, 120 insertions(+)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

