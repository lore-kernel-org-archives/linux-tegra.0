Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6AA72E8897;
	Fri, 23 Jan 2026 01:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769132510; cv=none; b=P3aI6wkcbPInz9dfi1ZtCcegUHr1Qtnr76yOI349tu3MedpTqU+DzDDZDk7sJ4fOZM2UAH0STIAW3DAWc2za7RoIr/x9kGg85zsOvj+FxFfvhULYXG1y/Y0S9S/Sm2cn20FBcCdSfsJO61tIWMhx7NkKsb1yQek/Nx4n2yLB+yM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769132510; c=relaxed/simple;
	bh=oNjilOE/dRq5dq0Dva4SX0YHGlllIlzGlLtyxlIdKCM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Yz5Jtd6UPKw+Y4LQyVoZvvxXgkmjetkz6+bwD3Gltsm8QI98NgAFjxXasTZwPQURsI8Uzl3wXeRjQ3RXCCNyawH9ImfiesFw+sKIFNL3yJ97m82pwXoHyY9MqEKyovM/S+92iebtchphI7hR9PzSCPmEAdTcHz5kLObIn18VXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lv8co33U; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lv8co33U"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EF42C116C6;
	Fri, 23 Jan 2026 01:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769132508;
	bh=oNjilOE/dRq5dq0Dva4SX0YHGlllIlzGlLtyxlIdKCM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Lv8co33Usw8jQjJhAI69jkEwgk1TXkprRyXGxi6IsQzVsOJM/UkQBEre44uCo+Q1L
	 S8/FAlHEtGwFFrocDD+T29+FJMlalvJwqWE+7vFSYOV/bFHp4t/jG3bZINgUpZ849u
	 OEjNiIi5QhC/X4WGUgkGjHtMRPeURjwQJIpm9RN2pDBkCMeXMvLiBXaPxbCT8EZzVG
	 ClABQnMnQT5kH4YKo50jcEYUg50g8DdyaREgllg2pAXszUN3M0OO38ql7EJGLJr8Gx
	 kkp+MRy3IEP2boeXt6O8lUv+J/VzMqZk3xuJq8EYDkKjzDKEgLFUsAgjrwnEfmLCLX
	 ZMgxc2RsOS8Ug==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251121164003.13047-1-johan@kernel.org>
References: <20251121164003.13047-1-johan@kernel.org>
Subject: Re: [PATCH] clk: tegra: tegra124-emc: fix device leak on set_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Mikko Perttunen <mperttunen@nvidia.com>, Miaoqian Lin <linmq006@gmail.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable@vger.kernel.org
To: Johan Hovold <johan@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>
Date: Thu, 22 Jan 2026 18:41:46 -0700
Message-ID: <176913250651.4027.13580353440284678626@lazor>
User-Agent: alot/0.11

Quoting Johan Hovold (2025-11-21 09:40:03)
> Make sure to drop the reference taken when looking up the EMC device and
> its driver data on first set_rate().
>=20
> Note that holding a reference to a device does not prevent its driver
> data from going away so there is no point in keeping the reference.
>=20
> Fixes: 2db04f16b589 ("clk: tegra: Add EMC clock driver")
> Fixes: 6d6ef58c2470 ("clk: tegra: tegra124-emc: Fix missing put_device() =
call in emc_ensure_emc_driver")
> Cc: stable@vger.kernel.org      # 4.2: 6d6ef58c2470
> Cc: Mikko Perttunen <mperttunen@nvidia.com>
> Cc: Miaoqian Lin <linmq006@gmail.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Applied to clk-next
