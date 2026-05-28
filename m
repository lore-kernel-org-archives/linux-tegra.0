Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CEBF30E851;
	Thu, 28 May 2026 22:00:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780005635; cv=none; b=W1d3E4DXJpNCIkUDcOIhonPqZnR9GORdQ3bcqHzrqmTO9CQb0eqRndx46LOeBVF0lELdJ195KW5aR0CMEQieQuSUguH1h0ITB5VZdzQrzi8npWHvjSirwcljxSfEf9id1z9paeJykpDP/55iktlBK76HbI85Poq5BKL4oRk3W8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780005635; c=relaxed/simple;
	bh=3rzXEu472SRPnSJA9LzqCEetJJXjqpUQ7iGOuNYaO2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kn7DfuRWqv4JRdRcCtps7mD5CoAFIVvRsjK56rnD9ibRhTkQZl5j+PITjRFyRmY8hW+BowkgcWq+n8pMwego1een+k3B4iPpVxMfooHZH2mi0MY8EHQNplxvvvDcUYpku8KDiPHgiHsh6xb8tXbK9ZW8RbFvSpsqWsyKOjbex2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RH0CJNqy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RH0CJNqy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76E9E1F000E9;
	Thu, 28 May 2026 22:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780005634;
	bh=0hNnZcRAjq18rN/s3Mk1xKZhzHX6qsi8DRN6+TVTHWQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=RH0CJNqyluiw0zyeM7XjOV6VZc+y2cGfnZCYc6bm8iGoukvgh7Vv2Hfgk5s6Ye9qb
	 8f94w+e7AlTFYQodUYldUlcTo+hOTABE+CxgKUOT2vgQgzpZANNQZA5c/O1GoLOxg3
	 6Kzfhrc2OBtzfCGVnJU34eVebAfkXbF8mrSvJBuiaBKPwUSyvbRzmhtvcHxKnjryiq
	 SkIbIZkG+x2MONVl/zCNjQJKx+RCwI8tCH1mq+haTa/E43PZYpGmctSGQKM2GGmN5R
	 rSDpmp5QX8wkxC1d3I72ymILpWCTFhYBj3ZR6OjnyMGzoLwSNDX11L7k+qnyPPMzNo
	 88tdIkaZ+3JLQ==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Sasha Levin <sashal@kernel.org>
Cc: Jonathan Hunter <jonathanh@nvidia.com>,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol
Date: Fri, 29 May 2026 00:00:30 +0200
Message-ID: <178000562210.195906.9139534565360798145.b4-ty@b4>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260426000314.55529-1-sashal@kernel.org>
References: <20260426000314.55529-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 25 Apr 2026 20:03:14 -0400, Sasha Levin wrote:
> kconfiglint reports:
> 
>   K002: config TEGRA_BPMP selects visible symbol TEGRA_IVC which has
>         dependencies
> 
> TEGRA_IVC was originally introduced in
> commit ca791d7f4256 ("firmware: tegra:
> Add IVC library") as a user-visible
> bool with a prompt ("Tegra IVC protocol"). At that time, TEGRA_BPMP
> depended on TEGRA_IVC, requiring users to manually enable it.
> 
> [...]

Applied, thanks!

[1/1] firmware: tegra: Make TEGRA_IVC a hidden Kconfig symbol
      commit: 55ee4d297e3929beac865714b681a4f25759868f

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
