Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793011438;
	b=b1wYTC0UKJDKgMlNg+KK70VwQbReKdK5a9Atw3/TOapa0SrSEdHLKN+kM+is845xVFKo
	 wp0084A4UiJfO0UuaqTijV/qX4ivJjqIgHviIxglaf1MFAUeRPwkZFpyNv1SliWK8Q3dB
	 bhG5q0RlV95/A+kfnk3rXe/r4D3it6gYuX1o++27ggmxx82k8bNTA0/C4/9+8o6VvXK/7
	 NH/atMxduOjpN+7PZge8IJ9686lz8ZEVy6OwRIr2C5HGd+U8Ld6K++aq1wYKMm2fSKWhI
	 FLKTizf/YSWnl8u0avZXG1PX5FZkvIc5hEdWrwDCE39lFZxnMh0q3czoAHRk3hFppBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793011438;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Wf0uPaRwggOutnw7/pw6//TwuSgBGQaNrdvQ/zHEx5w=;
	b=0JPiefG/o16eAbCyUoDxWgkRp75wqwdNkycciIMnENAlTU+1QfEEQAXDL3AtDcvt+v9j
	 yN2D4vevilaDVVe33S6YU0XFfS0yC7nRRheSFuIuhJe3wt/uXlSamV1pn9p0YADpAnyz0
	 +OY7Yw8ipH6YG/8RRTuRtW3bNvs4cihGm3/IhUCZctYRYNBye45PRkff5sROOxH/Wy7NP
	 1gNx183/Tutqx6m1FvIEMUVp+/Nft7uDN2JoA1UAZU7atUiYS/97GDSbT/JpzniFBAMHN
	 b9SRQxHgEqtn14qkVLmN9S2Kz7FBfYMPl4wo0KFM5pe/JR+0lVs1lixkO2u4Ixls6eg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDpw8+ys;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5D9606A31A;
	Mon, 26 Oct 2026 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bDpw8+ys
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7B3E1F01825;
	Mon, 26 Oct 2026 10:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793011438;
	bh=Wf0uPaRwggOutnw7/pw6//TwuSgBGQaNrdvQ/zHEx5w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=bDpw8+yswp51VW2WiUh1P9jbp4Ygh2PYzvQLx8Ul1/aD1+J3+PSCr3CU/lTqC3lSX
	 aNOOMWQwFUPiNQRBm2bO/QxIqDB+Zchx9SClqQfjhCMjqon9mG3eqAMw/tebqlKEvN
	 +1pVhkCSu7nB41rjOpFAavh0oJkWXtkWxTchDdZN+nHn0aoFjxUtGN5hjxdYs14zpA
	 +OmMJK1tpwkhM5A3Bv7IjI2t98IhQNzO4mYqFVGXlnIi/7EJUP7WX8f3fuMEG6AYkI
	 XA/xzsYKyQ1iyL3nZXNWd/lgT9/3XIkeMWfDdND0dVNwBBmABGAEvE9naRIsc+Zmll
	 Vcykj16VfAnmA==
From: Sudeep Holla <sudeep.holla@kernel.org>
To: David Cemin <dcemin@nvidia.com>
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] firmware: arm_ffa: Compare notify_id when looking up notifier callbacks
Date: Mon, 26 Oct 2026 10:43:51 +0000
Message-ID: <179301133069.1771203.5657844869255921300.b4-ty@b4>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261020220902.611138-1-dcemin@nvidia.com>
References: <20261020220902.611138-1-dcemin@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Tue, 20 Oct 2026 15:09:01 -0700, David Cemin wrote:
> The notifier callbacks are kept in a hash table keyed by notification ID,
> but struct notifier_cb_info does not store the ID and none of the lookup
> helpers compare it. hash_for_each_possible() walks the whole bucket, so
> any two IDs that hash to the same bucket are treated as the same
> registration.
> 
> With the 64-bucket table, hash_32() maps IDs 2 and 36 to the same
> bucket. A driver that requests notifications sequentially therefore
> fails at the 37th request:
> 
> [...]

Applied to sudeep.holla/linux (for-next/ffa/fixes), thanks!

[1/1] firmware: arm_ffa: Compare notify_id when looking up notifier callbacks
      https://git.kernel.org/sudeep.holla/c/8ab2e426762d
-- 
Regards,
Sudeep

