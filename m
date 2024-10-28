Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79EDB1DF276;
	Mon, 28 Oct 2024 17:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730136969; cv=none; b=O3zovUKGvX3mOZTkDIF29kJci5tqHne2DJTSFfXq52RRBL/kAy5EF2QYABCGxQFn3WNV1o1nZs7NqjSEzTJ/ovtpD7C/8YmJzMkhOjYtePGPoztVDJiqbCaBo6TMZiXh8zkLNFQWxcQCbR8RlRLN+tderHdbZJqmgF+g3G+E3o4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730136969; c=relaxed/simple;
	bh=zY9Z5IRHT9xw7qaJodXtfzgSWkQ7+PoqdO4XTU2/+mo=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=XTa8cgRmEPCklyM0FEwp6PnzI+4fpDPk4mJdXiitgdOTOJCaCmZ7oEtvXSgabRbGl0XK2FDXbjFlhgE1ZE9Ui1CK3Lc8cSsJbNz9KOp1+Scgh9b+OvwKmxE9lnx2wfkSQFtuDhQQJkIjQMZJ90uL1UqHLOoChDcJp5+ehv5JHNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UouPqkWg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UouPqkWg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B67FC4CEC3;
	Mon, 28 Oct 2024 17:36:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730136969;
	bh=zY9Z5IRHT9xw7qaJodXtfzgSWkQ7+PoqdO4XTU2/+mo=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UouPqkWg9tXdCScCm+venH3JyAnLtyPWeMN3VilyH1371oNVKcsFFdHali25MNTPv
	 GfqYJ4j+PwVfCrfvNHfRp1o3MyLLnbdftOLPsfCiwXdUIjjEoZHIIg3JamVIlNNG0D
	 8hAb72Rot/ALqzNwLZxKoP7Gn0Yvj62+FLKwZEHRXXpUDKEz9UxH0MmSEY9wryDgv9
	 1yQt2NdMvk8CG2h9JC4b8FmIgT3bRm9c3LRJxCH2LDI1UD6q+y5XBmHocJUlqQmYW3
	 WTozZ8eEzNqqhPz55nC3nPTvq8I3z0sVWX8qhp2Q7Hn6xTE7n5x2d6pnIohuQUDDX1
	 fBDG1H5ecfrDA==
Message-ID: <07997c4468bbe000a0a21b0106cd9185.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240830012344.603704-1-lizetao1@huawei.com>
References: <20240830012344.603704-1-lizetao1@huawei.com>
Subject: Re: [PATCH -next] clk: tegra: use clamp() in tegra_bpmp_clk_determine_rate()
From: Stephen Boyd <sboyd@kernel.org>
Cc: lizetao1@huawei.com, linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To: Li Zetao <lizetao1@huawei.com>, jonathanh@nvidia.com, mturquette@baylibre.com, pdeschrijver@nvidia.com, pgaikwad@nvidia.com, thierry.reding@gmail.com
Date: Mon, 28 Oct 2024 10:36:06 -0700
User-Agent: alot/0.10

Quoting Li Zetao (2024-08-29 18:23:44)
> When it needs to get a value within a certain interval, using clamp()
> makes the code easier to understand than min(max()).
>=20
> Signed-off-by: Li Zetao <lizetao1@huawei.com>
> ---

Applied to clk-next
