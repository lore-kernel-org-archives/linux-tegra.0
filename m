Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 123822797BA;
	Thu, 14 Aug 2025 21:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755207697; cv=none; b=UGqV8qIisizdnuKsgLAX/MGO5TdfTQPyLmteNohrKy4feJ9AFHcYG0fgfgC/JEbbmPXphcxdnqO+TAfq+9kvqmXW+bBgxImn26ccQj3God7puFNulDJmt9ZMyRfV3KtAGIScC2DDgmZiqQjqUQEpYd6tASzOG18pHY+f7ZTVPNg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755207697; c=relaxed/simple;
	bh=L0W28G9AstwMamKC1/QPTjtg2Chvse9UFYqxpJi5Ua0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=p4hjq7TRC4o4Weq/+Gi4GOWM+k5l14ih+vz1qIQzHBdn8OopJSIbLwUKA42uYh8WM4DvE3sKuDazQuN21OD7MXPoEK91j1yMNRnqN2zEKfgaPpVnqWaFYfYo9ui4ff/uTYrQEYbID/s5ntIZVnPOnW4y0jwQzWqs7pEEPY6HTt0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fQy1QfcY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fQy1QfcY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CD6DC4CEED;
	Thu, 14 Aug 2025 21:41:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755207696;
	bh=L0W28G9AstwMamKC1/QPTjtg2Chvse9UFYqxpJi5Ua0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fQy1QfcYi6G3NyoT6dV/uFuKhUVwGc/zgCUhIHB2O/gGhcZTYoiyBSRAJMoTtW6IH
	 Mv8JRu4/L8/krgBguoxJiTDbfYh02bpG6YasNnvVaqEGUmr6eeWSq76Jnm7AC0yZDq
	 /WBcdFDcqbPbvmfgkXscAksouv7UA++PYNWKCCVfwh98wMOa47Pt783bYrtexfMYX2
	 Ly9jLXoCjQSquoOoAyH/yrUrkhpAgzN6e0myG8IkavImtvB6FzxkSgBnnYqcUTHWJ2
	 MZDPcSs60Rrmyh1TFHy0DG8YFTg64dPkMI1EOs4v/lqgdBeB6xdiuRpt7kjDZ72e7f
	 dGgF+Yoo3357g==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250813094003.552308-1-liaoyuanhong@vivo.com>
References: <20250813094003.552308-1-liaoyuanhong@vivo.com>
Subject: Re: [PATCH] clk: tegra: Remove redundant semicolons
From: Stephen Boyd <sboyd@kernel.org>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
To: Jonathan Hunter <jonathanh@nvidia.com>, Liao Yuanhong <liaoyuanhong@vivo.com>, Michael Turquette <mturquette@baylibre.com>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Date: Thu, 14 Aug 2025 14:41:35 -0700
Message-ID: <175520769592.11333.15146346000732948341@lazor>
User-Agent: alot/0.11

Quoting Liao Yuanhong (2025-08-13 02:40:03)
> Remove unnecessary semicolons.
>=20
> Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
> ---

Applied to clk-next
