Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676263603EF;
	Mon, 22 Jun 2026 06:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782111060; cv=none; b=nm6nAOCjxfpJmwjZt6IH/Ayg4nQjTz/91eUMyg4wgmSqPucvGOEaElE5J1S4niCiAgpSWPSsCDv02tfg3Ky3wg+Y4Ut9wgg8Jiy8sbxKCw6157xt4merI27Yy2Teo84PFq7wscR8CeG0itjlQTazk2debohusxr8qI3C4lgHIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782111060; c=relaxed/simple;
	bh=XBI6t2bnZZYj1/os/VEWfoxbvu4uZbvKl7Ct/OHPxPs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TrvvBU6XnmampJIJNsEYmr2fN+Rl1PjtDRBwHbVhajMmWooGle9S07zcDBr+okHeAFuGD1kTZCHryuAdMhuZ6ia99e9tywjuf1jv6S0N3R8T/swG5dJdqo4RzWSje2hNMdrichkN9toJ7Pxk8ZJWS3FIUXGpI8+L3WoqKHnW24w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T8e2mjqW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T8e2mjqW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72F1B1F000E9;
	Mon, 22 Jun 2026 06:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782111059;
	bh=NVnyTRPD61W0aRoePmaoS6KjQ8NYkowKjU8NWMyJDUE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=T8e2mjqWHrwlUeI7CmUmYa27JevODNTsqtQsq4r4mXosCju3/qoeFU36cj19otCSR
	 KNwYhYLppbB5TeIdAG4XF3E34sfx1uD+2Pzg0OqFralM1SwnlU4k4BwvhXXf+lFhse
	 Ft6Q8MmB1A2V0OqlU4LAacLotE8QXkpjiNdcsAeRph+2nzPwgNJEYDpWSa0mK5sy3m
	 +uI62ikyrRDAf8lUIhGgYMI+ouAxn0aF9gf0l1OcuQ08RquUP4jBQ4bvjVqxp9EwEv
	 aFZBnah1Hm71Bq6sTLlyporP+X6vS6R0RkDxt7fRiJwLR/BqaAWtdmBazajduWDE5Q
	 YSVShrHAyxdFA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: Fix a strange error handling path
Date: Mon, 22 Jun 2026 08:50:55 +0200
Message-ID: <178211096494.2479863.16578340445085955696.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <308ea09281bd0b3fb0ec7e90e23012c0783f373c.1781983379.git.christophe.jaillet@wanadoo.fr>
References: <308ea09281bd0b3fb0ec7e90e23012c0783f373c.1781983379.git.christophe.jaillet@wanadoo.fr>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Sat, 20 Jun 2026 21:23:14 +0200, Christophe JAILLET wrote:
> The resource freed at the 'put_aux' label is "sor->aux->dev".
> However, this resource is taken after devm_tegra_pmc_get(), so there is no
> point to release it in this error handling path.
> 
> This is harmless because put_device() will be called with a NULL pointer,
> but this is confusing.
> 
> [...]

Applied, thanks!

[1/1] drm/tegra: Fix a strange error handling path
      commit: e60d3f9b4c89ffff5472ddc2829d5e29bcb153fe

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
