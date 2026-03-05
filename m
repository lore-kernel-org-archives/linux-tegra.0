Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F2835AC23;
	Thu,  5 Mar 2026 23:59:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772755146; cv=none; b=Y0U7sVpWQaI/VmTrgTjg0GMlv0kbznEQ0KoF2rg0qOVbodP690YfaM4Apry8BXA0ICnPtOpIeVDKicVOWpuvk1f4DhDZBxWfIlXnZZGA9i/UQDzlcP4nyCOgJGBz8klnzyH8LF2Y08Gs7ZzCe3GOc/VKJqnn50DOcAllmxgkRMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772755146; c=relaxed/simple;
	bh=Ah4m7LLMEaYgGTcAWdKvHDt/vYnmXbiN4uWHziw73Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z3yqjjgioms+R21kF7UzjfFxO0gohR6omZQY5dlkdgWGCxSXYYslUF4o5pW3clPkRWfJt5KjMMOvP4uNeEbm5IjwcUe+eZ/++wmTOJqnZ6sQgdD6sepsfjOjqiTqNdWVj75o65gpG4/82bMspN8UPQMBZIsAoaYeIy9kGzJ6nU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=h2LkzCaM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="h2LkzCaM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7962C19423;
	Thu,  5 Mar 2026 23:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772755145;
	bh=Ah4m7LLMEaYgGTcAWdKvHDt/vYnmXbiN4uWHziw73Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=h2LkzCaMShUO6Hd720cQDLdBdPgWuaxD3/5OUAEY4bNLRil+XWHk5MxgIJv++tbSR
	 pBQAVdyaxrE026BsgBDU6N0I34FTudRbro8TPU9NhxYLd+KD0Ox6V1n46+u8UFuXYU
	 XaEuYtb4OLHfUIGbMhx+GONuN0WculrBBewxlck44LwiRLYf3FZikeqptzImb2Lytl
	 PRRJo4ZTsM/nGhlvsbiq9ticRwTOQ1qERTITeT/lXHqqNA9MJ2Tokb0Xwt8/OeQqbq
	 6pwFkEOlldYeNfglGOuWLQ6fqbg/cjzyg3/KYIvIQq+CTfbeiUgAyBnDa8x3NkNeIX
	 SjAWAHg8YLNuQ==
Date: Thu, 5 Mar 2026 17:59:05 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org,
	Thierry Reding <treding@nvidia.com>,
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
	Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	Maxime Ripard <mripard@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: display: tegra: document Tegra20
 HDMI port
Message-ID: <177275514466.813292.350070778005908471.robh@kernel.org>
References: <20260223065500.13357-1-clamor95@gmail.com>
 <20260223065500.13357-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223065500.13357-2-clamor95@gmail.com>


On Mon, 23 Feb 2026 08:54:59 +0200, Svyatoslav Ryhel wrote:
> Tegra HDMI can be modeled using an OF graph. Reflect this in the bindings.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../bindings/display/tegra/nvidia,tegra20-hdmi.yaml | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>

