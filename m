Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3A53126D0;
	Thu, 28 May 2026 21:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780004361; cv=none; b=qwfCr2zsNBQzr7l8YdGuECSpBw203IS7MDTPBoxczcNhcDkAKMcEFOoUmDN1qu7vSpr1jBvPp8qX5d4Z4A+LfxIOWqsHVufVwQURYFh93O/+hSspsRqABqySYTWzzK6QXExI+oBiBFnhgxOGIn5C7f+l1MXdtdC2f7lbQtY0nvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780004361; c=relaxed/simple;
	bh=1uC4GOtYdAqkCY436kHGjo/7B2CNG3JAYaQna6ZxUCM=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PickTF9hPyG6mb0O8Mtw6/eG+C4I1/pgI9mY5pG9lBljOGNPWrPYafaMUn9C2Zdh1GmOQoEm2NSICYgp9YYj6ynOmof4In1FgXaGqEWPh7x4FbijK/SARvyF5kSFxAEAwvUphyR+BmtcSz/u2ql4tCmLmNss6Q6ol9DqB1str/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LCLirN2P; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LCLirN2P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B4D41F000E9;
	Thu, 28 May 2026 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780004359;
	bh=aQeUFI+9U5uG28D3ldiZij685lhAWodRacWiUVf8boc=;
	h=From:To:Subject:Date:In-Reply-To:References;
	b=LCLirN2PMS5t3SoJ00cCzN4oEwHpZ1iXX9WnnNiPEJ4pg6kFmVsfI9Ywx/dwzQSWu
	 MutRwkmTD+Ei/blYvZ4aO/ECZHYkUqnRML5fopxOmuSxikVL0Le/oDcq6dpeI5TLko
	 VkpiY71muvxK+yDCG5ITreOMFMILCYyCQOTIBTaHgQe+dqxbpf363/ZWqCEJjebqXF
	 WokHtIa2+MGgVWr9rndvP5iSzUk7wewmoqviChZhTh4YBnyCxjS6FEZpnULWQMGxV9
	 IMa8xICHxK0byJnT878B9LZmLylMI0W0yyg1kX3HPtXuAJ4U8/Jhz6n2Vut+2/y7v/
	 gP/gnh/xZaogA==
From: Thierry Reding <thierry.reding@kernel.org>
To: thierry.reding@kernel.org,
	jonathanh@nvidia.com,
	kees@kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kartik Rajput <kkartik@nvidia.com>
Subject: Re: [PATCH v2] soc/tegra: fuse: Register nvmem lookups at probe
Date: Thu, 28 May 2026 23:39:16 +0200
Message-ID: <178000434978.192727.11432364700261124142.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260514054831.2403078-1-kkartik@nvidia.com>
References: <20260514054831.2403078-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Thu, 14 May 2026 11:18:31 +0530, Kartik Rajput wrote:
> Register nvmem lookups in tegra_fuse_probe(), after the nvmem device has
> been registered, since they can only be used after the nvmem device is
> registered.

Applied, thanks!

[1/1] soc/tegra: fuse: Register nvmem lookups at probe
      commit: a4fe834db418046525b749dbefcc790af9c92959

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
