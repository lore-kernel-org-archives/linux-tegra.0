Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C218235AC00;
	Thu, 25 Jun 2026 09:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782378658; cv=none; b=Crf0NpjXsnIdMGa4GQLeH8J8+cPx+QH78Cos40fHeL9nMoQUcBl/udKdC/jZb1hqNTcxMgaD/zMmfBRKrJddT9JFAUZxbgkK8eIHOBDKrHj3TTMCerj7pfqwFfIKtePyd9Bf0PO3eFeLCDBWotgScUiqgk+GZTu38zG+HBvJOdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782378658; c=relaxed/simple;
	bh=EEaqe3TRKfme8RzVn8ZkaFwHH+V/chUQWSAhkIpHVjY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BacEqXWkqJPEzEi4ySEUsJyjxk701BY/ovYDthyM76bdaa2x+M0sSz4aSgsZsoXk8Nh9RkykqdEiWlq5rSmQWd3riQeB6p9tW+xEXG2efvufa7vKjFBJeTgtnL6HdPFE2/gKCmzSXlTvn3ebsISBMBl6b8R9q19FqFzD5w/T43U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ktEcS4VW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ktEcS4VW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC0B1F000E9;
	Thu, 25 Jun 2026 09:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782378657;
	bh=iLx8ln11wcjxDTT91LufbpmNFIPlBMRXuf4RMTzBOps=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=ktEcS4VWzwqsIIe2rbKsWUUpe/NaEKU3/lCiiuzk74P78/O40Ihq/2+HXEqj2k1oF
	 bMdR0Iak231fVf1Zv4IyoGTcnjGfsqp6Emi+JXcraI8H5PapUPjX0Ep7wD37ffyOmK
	 Wa98rnlhdiyx2vNXJvjy43l9SekV3iT3AkfO8+8ZTZi9Z91EtD2KWgZiPGLo7lS6on
	 KB15glZrk0xf/9ZOXiXHuizbwgShDZOgRESD8+ZEjNeY0D+RzDx5I40eyj9w3auFmx
	 FOZ+cm22xk2sEQI6WTCSgmXxbgpw67vYg9ZGq0EIYR1ObiwRjxfC2uy9j0BnW6tSfE
	 ykYI23oQ5Famw==
From: Thierry Reding <thierry.reding@kernel.org>
To: jonathanh@nvidia.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sumit Gupta <sumitg@nvidia.com>
Cc: bbasu@nvidia.com
Subject: Re: [PATCH 0/3] arm64: dts: tegra: CPU and cache node updates
Date: Thu, 25 Jun 2026 11:10:50 +0200
Message-ID: <178237831284.1973065.5359477309361980355.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260121104536.3214101-1-sumitg@nvidia.com>
References: <20260121104536.3214101-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 21 Jan 2026 16:15:33 +0530, Sumit Gupta wrote:
> - Fixes for Tegra234/264 device tree CPU compatible string.
> - Populate CPU and L2 cache nodes for Tegra264.
> 
> Sumit Gupta (3):
>   arm64: dts: tegra234: Fix CPU compatible string to cortex-a78ae
>   arm64: dts: tegra264: Fix CPU1 node unit-address
>   arm64: dts: tegra264: Populate CPU and L2 cache nodes
> 
> [...]

Applied, thanks!

[1/3] arm64: dts: tegra234: Fix CPU compatible string to cortex-a78ae
      commit: 2e1f4664c1be73065070d8b380a3c7440f98f6a4
[2/3] arm64: dts: tegra264: Fix CPU1 node unit-address
      commit: c003ea35f934a9e6672ea02778f07f08cb6f13ad
[3/3] arm64: dts: tegra264: Populate CPU and L2 cache nodes
      commit: 1199de78b2ca6439e83a565fe39eb4fed67d70b8

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
