Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57863394792;
	Sat,  3 Oct 2026 20:49:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060600; cv=none; b=d9bK+c9uGhGhPPdQ9OgnV+tJ+dhemFQwRbe+Teu9u0uxAu/B6BdI08zmFUoqfAbQCvm/XYeQKt16U2dpDBh9Rl8bb86sTqQN+PkeM5n/+nayaH1/2t4G9LnBGaoaUWizK+Mr4Ti8o8yqlvqquQGt/9WtIU/lX8p20Bq9cYRGMkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060600; c=relaxed/simple;
	bh=EOR8NLk8QVPqougLBncE75SsvT0KpttAhaYOn6IOFQ0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=p/x23E/ohXjiRXAn0YbqV5VP+3QeFMS8NYpNbfp+S1Sn39sLbyw7xI+Pyp2ieWtfdK8Ahkqtanl0BLDwPjRzM8oC959B66WkYL8LbUk/lMVX3RpeMS4GTR5CBVhL28UDkaR2DfgB0bRSynSF1BwgQIE4EtKFlBcntN5f/1v7TkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dlevTAy/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlevTAy/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DACC01F0089B;
	Sat,  3 Oct 2026 20:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791060598;
	bh=QfrorZ6rtjIFYE5aV8rqfdcw0h5kHOTLW0YV95Dx+kI=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dlevTAy/Djb0/QzspRxSUWQa52YELAFxNCJBgEfimfVmR655NQz+BuUZhyrZO4mb/
	 vUiVzR/OTFX/0QNjN0zDemnAbosBxz+eWOBpnyevGMMytFN0Rjh+uFhYYjSNftB79v
	 o4WmkUJbZnJ2uRuNGU7BNwzdFIWeUDNt+RYF5ygJMAHJuml1Y33xotv6AWDOqYrrqJ
	 73wH1ivZKyzzehoouH3KPEmU20pJBxMtPobtOkSHnZCh+XmhpmtSn8saSf+csA1Wk8
	 mAzVlFQClGg5ZLfpS6wFXuB6I+bASitPAOAg1ii8O4P680REITRJ43KsDCXP2JjaQY
	 V7Np/dDr+Bnyg==
From: Vinod Koul <vkoul@kernel.org>
To: JC Kuo <jckuo@nvidia.com>, Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Wayne Chang <waynec@nvidia.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260903071937.533646-1-waynec@nvidia.com>
References: <20260903071937.533646-1-waynec@nvidia.com>
Subject: Re: [PATCH V3 0/4] phy: tegra: xusb: Add Tegra264 support
Message-Id: <179106059555.240943.9716161970164658069.b4-ty@kernel.org>
Date: Sat, 03 Oct 2026 22:49:55 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Thu, 03 Sep 2026 15:19:33 +0800, Wayne Chang wrote:
> Add Tegra264 support to the Tegra XUSB PHY driver and its binding, as
> part of enabling USB host functions on the Tegra264 Jetson AGX Thor
> platform.
> 
> This series was previously posted as part of a single 8-patch series
> covering phy, USB host and arm64 DTS changes together [1]. Per review
> feedback, it has been split by subsystem so each maintainer can pick
> up only what belongs to their tree:
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: phy: tegra-xusb: Add support for Tegra264
      commit: c850a8821901163998ec4b7932b3d79dbe480543
[2/4] phy: tegra: xusb: Use devm_clk_get_optional to fetch USB2 tracking clock
      commit: 9358936fa13a8d7d9fbe92762ab38271c8dcb7c0
[3/4] phy: tegra: xusb: Increase timeout for USB2_TRK_COMPLETED polling
      commit: 475df243ffcad579c9beb6fbd47b1f9ee1045b7c
[4/4] phy: tegra: xusb: Add Tegra264 support
      commit: 46fc5849823a67a4b480dec59266969a1b7f8a42

Best regards,
-- 
~Vinod


