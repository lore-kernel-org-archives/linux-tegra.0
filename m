Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 403D92EB10;
	Sat, 16 May 2026 10:09:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778926195; cv=none; b=KKbSLJfokWz7Y8ZErwGdSHDOXP6x5kr/SLgeuwTyVoAqs+2goZnxQ+JgfQQZoBqGaVRFmyEcOe7l3gX+FZGWVaNWqaPd3P+POlqzFUZ2clm4KsSukqi5a6L908ETcSxYu6IKPzNdLqbbXE61zjMksksEYx7qaNlkXkIggI5AtW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778926195; c=relaxed/simple;
	bh=jt+/+A1eUmlY9go1il/cICrFK2cN/3rDf7lknui0NyI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Yd7MSYsBHz43QfnUibg/kVpj6OxMq4+1xoVqNnC6gSDBUkFk6F2HU3tta/k1R7tYDV521AO0FHBs3Dt3H1q+6tljw0P+ImMzlwnRRMy0Cik2bOFFevbxkgvlF5MlxYNxD+ViOf/VnOaWnb+7UJXqTb0Fi2ezH2lCAfllT3SeUl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IWrH7Swb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IWrH7Swb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B2BFC19425;
	Sat, 16 May 2026 10:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778926194;
	bh=jt+/+A1eUmlY9go1il/cICrFK2cN/3rDf7lknui0NyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IWrH7SwbaB+LI0I6mOsbP2FSGr+CZW9dCQn58ip43QzXMsh2u/4AiB+AY/Dt0wngi
	 1MWZpOPYlVWzDAS6LleGJB12NR+x43+241BauXEzq8MKBB9VSozIiXHdXEiEZkcADS
	 j/zF3ef4nIZpr9BOzfTHcfUYpJ32Y03Dj0i+DJ+m4bSOs0sgV++1L2YYhifxVz2pnZ
	 lqX168gjU7myrYDhzIDSmgdENfNLFMeTP4cj0HF1FWvKWUEiUV2pjWw6bxh3JZanSp
	 0XzmSTDj5l7zFCLMnm5DXDju+HZBjNY84e6aX0dSswG2yLuOyg3FzNe4yEd5qCScm+
	 Mm6vwUzACmTcQ==
Date: Sat, 16 May 2026 12:09:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sumit Gupta <sumitg@nvidia.com>
Cc: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org, 
	conor+dt@kernel.org, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
	devicetree@vger.kernel.org, bbasu@nvidia.com
Subject: Re: [PATCH] memory: tegra264: Add full set of MC clients
Message-ID: <20260516-cautious-smart-ferret-230db8@quoll>
References: <20260515171911.1929868-1-sumitg@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260515171911.1929868-1-sumitg@nvidia.com>

On Fri, May 15, 2026 at 10:49:11PM +0530, Sumit Gupta wrote:
> Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients
> table to cover the full set of memory clients exposed by the SoC.
> Client name is used for MC fault reporting. Clients managed by the
> bandwidth manager in BPMP additionally carry their bpmp_id and type.
> 
> Entries in tegra264_mc_clients[] are sorted in increasing order of
> their client IDs, which matches the order of the override and
> security register offsets used in previous SoCs.
> 
> Signed-off-by: Sumit Gupta <sumitg@nvidia.com>
> ---
>  drivers/memory/tegra/tegra264.c              | 564 +++++++++++++++++--
>  include/dt-bindings/memory/nvidia,tegra264.h | 287 ++++++++++
>  2 files changed, 819 insertions(+), 32 deletions(-)
> 

Please run scripts/checkpatch.pl on the patches and fix reported
warnings. After that, run also 'scripts/checkpatch.pl --strict' on the
patches and (probably) fix more warnings. Some warnings can be ignored,
especially from --strict run, but the code here looks like it needs a
fix. Feel free to get in touch if the warning is not clear.

Best regards,
Krzysztof

