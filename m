Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C5C7329F03;
	Wed, 10 Sep 2025 14:52:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757515972; cv=none; b=Obl1GX+ezr/rCewGn9oisGCBakYDX93KedtBvCv8SkuhOeQBWtPqBiMz9uUtUoT/e7XazH5j5C3vi0IYXfi3WCnYKOHoTqOeYyGle5gYvboNwz0kpeg3l9yybRnjpZ+fYIKZ50ES4rH9tkirflIqLXjCA3JKSFeuJyE9teU/w7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757515972; c=relaxed/simple;
	bh=/D9w36xr3vyYJAw7zMSUaDO22thiw41rjUYxYDxD94w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKngQf4gfnXp+ywO9FewLQtZQ+YOWW71AV3iGyvG4lvhHjliz70YBnECJrJu50otL97Cn4VlC0afmu4gXv1spOtIUgd0pibetIL0um668mN6KBuq7MEpKr3RycWuVX1dl3pHmE+Je9ZtnZF93dkyBusg9bFuZm67lnCGU7TP7Is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LqLch/HL; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LqLch/HL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A12F3C4CEEB;
	Wed, 10 Sep 2025 14:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757515971;
	bh=/D9w36xr3vyYJAw7zMSUaDO22thiw41rjUYxYDxD94w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LqLch/HLCdVxZU2bDOU0qSlMTIaJR21hb0SaKwpyMoJRthlvSV3ctQIF6bpD8GJLn
	 N7lUfUsSSUcfgxZAup3InvlRryXBX1hKC5NBrn0XMWE2CfCvu9w304v1yno3ulOi7L
	 xX4UDnsiC48qJwAb+IcdQJbIFny2lCbJmlKNR3TXq1+0ZMXuA5HgzhcryQVsqsxd06
	 y84SHJx79/GhIkL1KMm7rYNHLTX0lD6iUdXqFj66CL8BsQ3ypB+wve80QXbLyX+3IT
	 ulYVD8L7HlPVxXJ36C88I/YEgcBu3P6nX3ivlWHk0FYB+BNuC3Si4HaJnUMZbgoaJs
	 Scq5RGYG3WOSg==
Date: Wed, 10 Sep 2025 09:52:50 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Ion Agorria <ion@agorria.com>,
	Thierry Reding <treding@nvidia.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: tegra: add Xiaomi Mi Pad (A0101)
Message-ID: <175751597012.31534.1884891197656872074.robh@kernel.org>
References: <20250909074958.92704-1-clamor95@gmail.com>
 <20250909074958.92704-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250909074958.92704-2-clamor95@gmail.com>


On Tue, 09 Sep 2025 10:49:57 +0300, Svyatoslav Ryhel wrote:
> Add a compatible for the Xiaomi Mi Pad (A0101) tablet.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

