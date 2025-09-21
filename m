Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D31F227056F;
	Sun, 21 Sep 2025 20:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758485389; cv=none; b=NDDRwCpVEgXssrt1mUioWrPoeoEjwloIwXn3ow9UOpe7qreA/Ew4gKIDB+JW9ZmRdy2Z6Uz0X7RVpoNwQ+T+w6wJ2593z2u5BC0+trPfV9ovkV5IJxstUPFqIL21P6ZaQcyAs9/H9kCWQdXJ0np4ZNyhxqnh/ZbuMWh3DcjKnVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758485389; c=relaxed/simple;
	bh=rgFu9rZ4J8ai1u7M+9GsgxoCKqtwQR4t1hUg80BS0tQ=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=YNODl6Rmew/NsFeG14bV9Qyzhgu2d+BTDpK/nFztbes3uaUYCrBKKkbwQxLRDgxQL5lyeWicFhwkwYJHnARSXfcZ6LqiR4ETvdqxERzOajzgPCUKY6BZRq4DLgaBeQh+boTLbt/V2Dv036FoZu7ItuYnKfZ7eAhKV6OA00AG/L8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ShxDCFrS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ShxDCFrS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B366C4CEE7;
	Sun, 21 Sep 2025 20:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758485389;
	bh=rgFu9rZ4J8ai1u7M+9GsgxoCKqtwQR4t1hUg80BS0tQ=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ShxDCFrSKt3heIxlCMBg7AO95JVRmQbtlalfedRLAq5sPZUTe0z/yI+kAdpgpCoG9
	 t0N/np4Z3lyFR9Z+EiuPFD15ozwDDuW6zx1qd4E+Vqp9uZpJfpT8A1SVX1++mWujyU
	 X0sMbKSmVX4dcgZmODD9ziYX3UB5kAq1rN99dVKS+IbPKtEfGAGEVzRsbVmGVkIXkp
	 PqVk0L4tezTHmsqkIvuVrtC4KFpV5dip1eDoD66n5QbZndnhQRXAxZ3aaWvt+TMC3e
	 bXaAGk5LHJJubXLSXH4me23b2pyqp8c841QL/1Se/P4YpshdkINjH+P4/jVQHt9JeU
	 EqTKuYaHuSuoA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250426125429.31838-1-pchelkin@ispras.ru>
References: <20250426125429.31838-1-pchelkin@ispras.ru>
Subject: Re: [PATCH] clk: tegra: do not overallocate memory for bpmp clocks
From: Stephen Boyd <sboyd@kernel.org>
Cc: Fedor Pchelkin <pchelkin@ispras.ru>, Michael Turquette <mturquette@baylibre.com>, Jonathan Hunter <jonathanh@nvidia.com>, Timo Alho <talho@nvidia.com>, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, lvc-project@linuxtesting.org
To: Fedor Pchelkin <pchelkin@ispras.ru>, Peter De Schrijver <pdeschrijver@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Sun, 21 Sep 2025 13:09:47 -0700
Message-ID: <175848538794.4354.3781406261491074197@lazor>
User-Agent: alot/0.11

Quoting Fedor Pchelkin (2025-04-26 05:54:28)
> struct tegra_bpmp::clocks is a pointer to a dynamically allocated array
> of pointers to 'struct tegra_bpmp_clk'.
>=20
> But the size of the allocated area is calculated like it is an array
> containing actual 'struct tegra_bpmp_clk' objects - it's not true, there
> are just pointers.
>=20
> Found by Linux Verification Center (linuxtesting.org) with Svace static
> analysis tool.
>=20
> Fixes: 2db12b15c6f3 ("clk: tegra: Register clocks from root to leaf")
> Signed-off-by: Fedor Pchelkin <pchelkin@ispras.ru>
> ---

Applied to clk-next
