Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2F2B2FA0E8;
	Tue, 12 Aug 2025 16:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755016826; cv=none; b=AzyabjJVhAgbwny//vreoK+D1wsw2wVa5E+e6+xAeJ/swdfP61DU7Ta/kJ6uA/FIkf4aE3NFRGaUB/hF8JNYmh2eMfRSFm6/ckZMwQKNbMxmOQveB22+xJ4eKJzcz2arMiZ0WfbiTnbgM+COfVQDgGhXFo8fYPaMOIcHapJMMC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755016826; c=relaxed/simple;
	bh=UxVeqRaMDxxfHBM/tEj+mJBjW5rFRNYTohHU/Unnv/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hJTQRvrmKqzqAum6Dv7vYxLXeLg1O2NRA604eCfat05SWiDnXZLrGbvxa/zxhzMPWlTc+UIZgDx2We6f0uUfjEufDkNyT6G+O7Yg7zEJttPd9ssCOjQrS8KA/sgkKqCS/3QOMqaGVjGUxoQzesLnppOh8XkECVoQV1R66ULEZFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KS6OcwSu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KS6OcwSu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 060A7C4CEF0;
	Tue, 12 Aug 2025 16:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755016826;
	bh=UxVeqRaMDxxfHBM/tEj+mJBjW5rFRNYTohHU/Unnv/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KS6OcwSuKtXfoAyOnf8OE4NZKG98oVea+Mcjx7DkLG9qTzGauP8+QUfZEYihdpb5s
	 uyv/C0HKMg/C0LNqQfHZHTX7bqYcX1sTsq0jnUCododkezlNOqxCz6F4889ssdThFB
	 4xN2N39zWrPuBSSo9a/Bx5wMMPrrbDyzKN0M/vMXmJ/4HXV5tE/2UZ2Hm1MUOEbQAe
	 BUB09ttwWLA5I3CKDvMf2RPzYX/awXVtbbF55+xHjWZWFvk8XHwsEUw4bes1DQbb8q
	 TKPxNN8xT7KuSOlppHeoiWPmGqGBY8B/qcu9CMb+OsVDtvF3ixldGy7WQWZsbpiZPr
	 MGPVYQ3S2NU1A==
From: Vinod Koul <vkoul@kernel.org>
To: Johan Hovold <johan@kernel.org>
Cc: JC Kuo <jckuo@nvidia.com>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, linux-phy@lists.infradead.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250724131206.2211-1-johan@kernel.org>
References: <20250724131206.2211-1-johan@kernel.org>
Subject: Re: [PATCH 0/3] phy: fix device leaks at unbind
Message-Id: <175501682357.633066.13503601845975199477.b4-ty@kernel.org>
Date: Tue, 12 Aug 2025 22:10:23 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Thu, 24 Jul 2025 15:12:03 +0200, Johan Hovold wrote:
> This series fixes device leaks due to failure to drop the reference
> taken by of_find_device_by_node().
> 
> Johan
> 
> Johan Hovold (3):
>   phy: tegra: xusb: fix device and OF node leak at probe
>   phy: ti: omap-usb2: fix device leak at unbind
>   phy: ti-pipe3: fix device leak at unbind
> 
> [...]

Applied, thanks!

[1/3] phy: tegra: xusb: fix device and OF node leak at probe
      commit: bca065733afd1e3a89a02f05ffe14e966cd5f78e
[2/3] phy: ti: omap-usb2: fix device leak at unbind
      commit: 64961557efa1b98f375c0579779e7eeda1a02c42
[3/3] phy: ti-pipe3: fix device leak at unbind
      commit: e19bcea99749ce8e8f1d359f68ae03210694ad56

Best regards,
-- 
~Vinod


