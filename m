Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C38B33595D;
	Thu, 24 Jul 2025 22:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753396279; cv=none; b=YeZ5/E1IIGVld7xM2Gla0X1IF2qjSGoqnfKn3Ax+vkSe+DdIWlY4H2xSkAGRM030BX2UGcjhfohLEFBZzFJuLVIlKuInmNbxJ4QqaMhL7E1rivC87z5cR+Fp4aMTSJEb4Vj29Rq7OGVB4Spm1u4pdd/gMrAmS9cWaR+DXxYsI+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753396279; c=relaxed/simple;
	bh=B6k+lnhdHQbr7otA0pbQCuK2f1uDWsWwVaxv9jKWCm0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=FOg0lEeyVb6t5FFMEtmb02rI6UG1zc39APItmIqtJIup25ZuT14iWu/5alI2lJA2QhrLdADzycd5VKwHYmG8PUb93B1Om+B8rOHQN58JAW0+/GJGLMMcAr82l8ksTstcoKJpDd3scr9eGpREckApbyUzXigu+EAICW5aMcDzBes=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fTZpgWjf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fTZpgWjf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DFB4C4CEED;
	Thu, 24 Jul 2025 22:31:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753396279;
	bh=B6k+lnhdHQbr7otA0pbQCuK2f1uDWsWwVaxv9jKWCm0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=fTZpgWjf+3ODpefKLFYl+cA3osWgQb/grw6iYZiQCSMmBoUkqBEgCr2IyRE0W6h1T
	 4HuMGCzbvRjDGFysmJQu/KCRMVN/66BzwEdFWn5tqCc7chkw6+vp9hs7iARbanD1OI
	 4dZVRvS0pChT7RQXHZjFCWY5XEjHtVpOASIxw5rFBir/oCMC9YWMszuZzJhLso+a1t
	 3Flrtj1YPaXBPaKkiHmrJLiLyeyUOD/SrYxom5/hELztrhzQkl1gMroeOlD+ZbDRkJ
	 gZl973VszLpEJOcYrxU4WAgc44RaGQPhylUfvVY/9SG9tGVkmO6g9wEPIOGsgmotgN
	 g9DWp5phqsEFw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <bda59ad46afae6e7484edf8e2f7bf23ceafe51e9.1752046270.git.xiaopei01@kylinos.cn>
References: <cover.1752046270.git.xiaopei01@kylinos.cn> <bda59ad46afae6e7484edf8e2f7bf23ceafe51e9.1752046270.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH 2/2] clk: tegra: periph: Make tegra_clk_periph_ops static
From: Stephen Boyd <sboyd@kernel.org>
Cc: Pei Xiao <xiaopei01@kylinos.cn>
To: Pei Xiao <xiaopei01@kylinos.cn>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, mturquette@baylibre.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com
Date: Thu, 24 Jul 2025 15:31:18 -0700
Message-ID: <175339627851.3513.13709484990558545811@lazor>
User-Agent: alot/0.11

Quoting Pei Xiao (2025-07-09 00:37:14)
> Reduce symbol visibility by converting tegra_clk_periph_ops to static.
> Removed the extern declaration from clk.h as the symbol is now locally
> scoped to clk-periph.c.
>=20
> Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
> ---

Applied to clk-next
