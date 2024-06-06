Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF5CA197A8C;
	Thu,  6 Jun 2024 15:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717689358; cv=none; b=IIhuFQ4lvSzTx2wqEXURxqt5V1zdIKF2SKpkOZvTvvr8VQ9twOjvOPZJy8MhJhcmdcdtrqxT1PIE48nc3G9EgMA99nr1aMdXMf8NArvyGGj8Dble5XqEwum/qIrnRFklVHcGih/RK+qGKSAiktFXoCgk4e1UemeYZKBURwQAs28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717689358; c=relaxed/simple;
	bh=uP35Oxyh1Ztj3QNeHlaik7kXpVicdHvBFhmqMquXjkU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s3EeOp0uq6x+1m9STIxjicGAVCaUMhhJKa8mGbgflQkYecc9/pSxWOz7acBDrou3350kYm+7Wh3BjfvCqQ7vsj4xjQ90pQTUHJzI5Y6sX1s+ROvQFnp1iZ/vIzO6AZ+9IZMkRpOGRbe8n+YxbCIEEW2hHDSw0IktpDKQT/GwbI8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AgmNY4dh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AgmNY4dh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 710C4C32786;
	Thu,  6 Jun 2024 15:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717689357;
	bh=uP35Oxyh1Ztj3QNeHlaik7kXpVicdHvBFhmqMquXjkU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=AgmNY4dhOZ66A4t/6hQ53sNAgl+SjN8CXegASn6MZc0UI9Cj/DLXz0Rt2IBCTVtam
	 9/yMon9t7Fan++ZJ1PHsZenboceCuBxKremaRMqw8fL65P1bvaWN275aORlMWTwDkI
	 YEO7cmoZyTUDHyJ5PeVLSNHHe9nP9nK2tEqIIDdlu7fmiNVQzK9gGLxtJp0zgY7rgD
	 WASMyYaaizdxgS6VULQRpZcIyuQ+W5AGJaHJpTKiuSrecQZ1DNcwDv+NeTLfiCXeIU
	 voFxAlCNOTAnPz7vpeJB+4/57pItNMhohEFiOvrFAwssMkKereLb7wBSAzNOZcHfGH
	 /+ihiZjQEl5Ug==
From: Kees Cook <kees@kernel.org>
To: thierry.reding@gmail.com,
	jonathanh@nvidia.com,
	andy@kernel.org,
	akpm@linux-foundation.org,
	Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: Kees Cook <kees@kernel.org>,
	linux-tegra@vger.kernel.org,
	linux-hardening@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
Date: Thu,  6 Jun 2024 08:55:53 -0700
Message-Id: <171768935175.54606.14878127902164737048.b4-ty@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240606144608.97817-2-jean-philippe@linaro.org>
References: <20240606144608.97817-2-jean-philippe@linaro.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Thu, 06 Jun 2024 15:46:09 +0100, Jean-Philippe Brucker wrote:
> GCC 14.1 complains about the argument usage of kmemdup_array():
> 
>   drivers/soc/tegra/fuse/fuse-tegra.c:130:65: error: 'kmemdup_array' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Werror=calloc-transposed-args]
>     130 |         fuse->lookups = kmemdup_array(fuse->soc->lookups, sizeof(*fuse->lookups),
>         |                                                                 ^
>   drivers/soc/tegra/fuse/fuse-tegra.c:130:65: note: earlier argument should specify number of elements, later size of each element
> 
> [...]

Applied to for-next/hardening, thanks!

[1/1] mm/util: Swap kmemdup_array() arguments
      https://git.kernel.org/kees/c/0ee14725471c

Take care,

-- 
Kees Cook

