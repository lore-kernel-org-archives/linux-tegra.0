Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 771EB1E1DE5;
	Thu, 30 Apr 2026 08:08:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777536482; cv=none; b=ZbIJpE3o7ZBZHpjA4SZYMM8RLFGOsvzEVNh8l9OR673xCjMXuMbsJSvMWCleA/gM1LaHV+/ogyP/8MJ4l6Gzw0Vc97j4UBWsNiY+oMkq8ESGr7rFGp8Fy1MfSlqthyTbBwZWRdiMr6KkjA/39KgOv0YYC6gkEEg0Qs9651ZpUW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777536482; c=relaxed/simple;
	bh=FgbC5QOm3/4kJbsD7CJ94ymQmwx3jyGbD80Nia62UQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kS3XnuHeaWmVvHDqfp/JEVW4u/J6GI5/APKgG+usoBbqdQ9/vSRXnt4E4ppjGKUbnICFuTHtVcQdtSBTTxvWFTKDILny89gMD0QllmNMPe6mSlgA1TQRBobIqWg/ZhjpdvuyptibaQLnKtC09ORW/EH4zlgDPNYIRGn7FKjENCQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bcoGHE0f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bcoGHE0f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7931C2BCB3;
	Thu, 30 Apr 2026 08:08:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777536482;
	bh=FgbC5QOm3/4kJbsD7CJ94ymQmwx3jyGbD80Nia62UQY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bcoGHE0fxDgHj6uVJLHwAP30yOMVc5lMGwyunIwODscwP/PYonFsd8/3dtyEIgeE2
	 EIwHux0OQKKZrCtU9ixd2mR+mHCR3MDMHnHYNfLQZ4hqRp4iIrWBFjIvcpM6xx9/o7
	 sb9Zr0iFc1XdqNOiWVCserLToEZGf50HvjwixcZeND++a7m+CN0iGpfSufZPF25Mb5
	 SUAdwy69XL3yxOgB8XJUafrkCTeUzIxP+RRvJahhk9R+ySr2pj1IFMekxyMQ/P/Uv0
	 acMAUei8u/1lgg+W05qU6dSbgwyRQ1n18GyBx8yg4G3uPDUNeF/X9iy61qbXmjn4jg
	 1vjZ5NF3zMsTg==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	Sheetal <sheetal@nvidia.com>
Cc: Mohan Kumar <mkumard@nvidia.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] bus: tegra-aconnect: Use dev_err_probe for probe error paths
Date: Thu, 30 Apr 2026 10:07:54 +0200
Message-ID: <177753646553.4064065.6000698741466892956.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260318071129.1758058-1-sheetal@nvidia.com>
References: <20260318071129.1758058-1-sheetal@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 18 Mar 2026 07:11:29 +0000, Sheetal wrote:
> Convert probe error handling to use dev_err_probe() which provides
> proper handling of -EPROBE_DEFER.

Applied, thanks!

[1/1] bus: tegra-aconnect: Use dev_err_probe for probe error paths
      commit: 36df0ef3b4187c69c271af7a1d56f7abb788655e

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
