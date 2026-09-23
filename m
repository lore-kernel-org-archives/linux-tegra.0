Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772CA449B2D;
	Wed, 23 Sep 2026 07:28:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790148523; cv=none; b=FuNUNkV4wSVfwHCykRNlzfDIH51UAlrliDpuUFAn2RyHTNqgw1FaQXiw8D58Do9nYVXvOjGHzyb2nVJiXcES0BpYD2V5g2I1jy/uBbz6bm0WRr1rJKvLoj3LOe23RDz0UpMfim1p1hzAuGlDUESQaAFETDFppdNtoEBRlwpk4tE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790148523; c=relaxed/simple;
	bh=dyyaL52hNJt9646Y4OfdjI42kaJDzzGIdBw13x827qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GdyrLidUN7EVmIpq+P1X0UnIjw7fbHm6Ti1XbwQM0G0iDWBd8Qv1EaicnJaIyBPtZQgzDyzyv6essLNE1KDGOn4QD8vEJmefH2yaCizUW7aOefDKSm8Ai9I0k6FQRcaS2J/fHqg2EypmJR4tUP/SzJL0DMNJVDiEryJY1t///d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GxrilVmj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GxrilVmj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148991F000FF;
	Wed, 23 Sep 2026 07:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790148522;
	bh=gptYRX18yZ3lNNH+Yst1WTPf8NSivdeHjyw/ZEBZf5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GxrilVmjG/urDra3VoKePE4TElFbGRKUx0avZDZwjiGtBafeZTnwtHnd+l338iXde
	 7PkOPJzKLjLPELciJ+QMGpBb4u8GCKKHMqoqpAVuoBfSBzSGXQiU9h+YdpI6Si+0kB
	 1S2bghpdV6P6+qqOEYqjk4G8A+un4sQDD6ZfwjKFqkr7pYFF6wj7ljFqCVoxsC8Ggm
	 oBw0JbWPQeilKr8dbpCe2vcWulh/Xog9JrJeusIPC/7YVAflERriecFUhrJLGUSKED
	 o/QweHHoXySNUtGuBMLUFoqQvo+6BMAHc0D2XuDClBpHAaLeSc26LG7i1n2D81VmTe
	 FnJ9ECLaKoQjg==
Date: Wed, 23 Sep 2026 00:28:41 -0700
From: Kees Cook <kees@kernel.org>
To: Bill Wendling <morbo@google.com>
Cc: Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
	codemender-patching+linux@google.com
Subject: Re: [PATCH] clk: tegra: annotate struct tegra210_clk_emc_provider
 with __counted_by_ptr
Message-ID: <202609230028.B4D7FE202@keescook>
References: <20260922110601.1959213-1-morbo@google.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260922110601.1959213-1-morbo@google.com>

On Tue, Sep 22, 2026 at 11:06:01AM +0000, Bill Wendling wrote:
> Annotate the "configs" pointer field of "struct
> tegra210_clk_emc_provider" with the "__counted_by_ptr" attribute,
> allowing the compiler to perform runtime bounds checking on accesses to
> "configs" based on the value of "num_configs".
> 
> The "emc->provider.configs = devm_kcalloc(...)" call uses
> "emc->num_timings" for the number of elements, which is then assigned to
> "emc->provider.num_configs" before any accesses to "configs". The
> "num_configs" field isn't modified after assignment.

Yup, that's the only assignment I can find.

> Cc: codemender-patching+linux@google.com
> Assisted-by: LLM
> Signed-off-by: Bill Wendling <morbo@google.com>

Reviewed-by: Kees Cook <kees@kernel.org>

-- 
Kees Cook
