Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D48725783F;
	Sun, 21 Sep 2025 20:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758485289; cv=none; b=Sf8iz2tXXtwOoV4qeR4pqCLtiet4wTZd/geZ4UVoQLCdcSH/Vn30GlyCP4hljMieyPE42APeEaLGe5AhhKh1LOQZjVKZ8hBfsjJmebGx2uPCJJ8sF6XqYXdd52r1A87xlHdbv2ElSVkrA+2HSxgqyIlxYcXDmF3wZTyy+Nfa/MM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758485289; c=relaxed/simple;
	bh=JhK7EYIcFoZDxlEsEl//u9AwwpAD2Ir5SVc2aQvCAxE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=AQ/zHua2V/nMCgZrsFZP5dGKmbY3UchNLLIbXtkPUMX6/vwdQU+ehIi1dJSCyhvwC1mF6zC6IUZS0yvsrYt6RKZYtpJP1SXcc7W1tttXnJDqLx9fXSfu+S3cPZ6AOnkKZXKB+8S9vPC3xsjaNKitMwa19FGtYPpynTXj3pQRnts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxioDiRi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxioDiRi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BFB3C4CEE7;
	Sun, 21 Sep 2025 20:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758485288;
	bh=JhK7EYIcFoZDxlEsEl//u9AwwpAD2Ir5SVc2aQvCAxE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=QxioDiRihJpqXM64fWo+FGJq8dV0fkMzt6QxQvB+j0ky3ntrdunW1droBiNEcHllB
	 fpuisUIgea9BsH/Y4gTHb94VjH2DQ0YaOkjDxDlaBfpPJkWnAbqT17N8oOchJmhKsT
	 Slv3kzv3C2cikmJ7Am+tQ78nqAK7YISos79wJjZpIoOeI5cHc3o/YmkZgPvKbmrvgR
	 1ZJk2DHR3ZTZ0ZaFiL2FEiF9IODEsTSs1YDeXmIu6ej0UdmKQKasW8DphCxFCaPZ3y
	 Sr9vaxqbLMwFyTg5En/466EGThtjwHEE6/DvGlkcSrW4VI1PxVpVBhTgcXFEwt9yw/
	 vN2xDxREgy+xA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250906131655.239340-2-clamor95@gmail.com>
References: <20250906131655.239340-1-clamor95@gmail.com> <20250906131655.239340-2-clamor95@gmail.com>
Subject: Re: [PATCH v2 1/4] clk: tegra20: reparent dsi clock to pll_d_out0
From: Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
To: Charan Pedumuru <charan.pedumuru@gmail.com>, Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, Dmitry Osipenko <digetx@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Mikko Perttunen <mperttunen@nvidia.com>, Prashant Gaikwad <pgaikwad@nvidia.com>, Rob Herring <robh@kernel.org>, Simona Vetter <simona@ffwll.ch>, Svyatoslav Ryhel <clamor95@gmail.com>, Thierry Reding <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>
Date: Sun, 21 Sep 2025 13:08:06 -0700
Message-ID: <175848528652.4354.10389254038978524687@lazor>
User-Agent: alot/0.11

Quoting Svyatoslav Ryhel (2025-09-06 06:16:52)
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>=20
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---

Acked-by: Stephen Boyd <sboyd@kernel.org>
