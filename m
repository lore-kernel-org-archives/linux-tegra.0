Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BBA52264DC;
	Thu, 26 Jun 2025 23:54:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750982085; cv=none; b=mOjh3p+Sk4cd16UJWbxcQ0LTNmj73fQmriMfgjSxVVoZnQiYx9hTmnONGpgYBdRIcKzQk/TmkRPLJxpv8ysE3GSYD6ZzA65Huqpz4IuaTDP18LwYz1Y2wZ9g4CXCcil+jHtBQJVHpxJurQhDQqo+XL4QOnU6WKY3Aj35ZIU3bO4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750982085; c=relaxed/simple;
	bh=CFacs9i+UTqDxO7PVfBHIVvY7ZeVjXQVXe74/Sv0yC4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m2CddaiN8WH3CP6TpV7hHsDAspyOwS01TGHtgQdpRjbkxz5cTUGZuEC2uQyc4WVdaL31YnCm/1nubabbZdpeSo0PonLyV89J4YwRvW6Lwua1zaTfwkuyuRQSkGXgpm4NHTzxVWGjVemwNymSw0TBA0O5SrR9+6KgYFsgm4srxjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uxqYa8aB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uxqYa8aB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE445C4CEEF;
	Thu, 26 Jun 2025 23:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750982085;
	bh=CFacs9i+UTqDxO7PVfBHIVvY7ZeVjXQVXe74/Sv0yC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uxqYa8aBVwwlmFvw9WxzHaHat+7HF/R3xrkdDKyyO9cghqQLS4Vca0pkDJg7v+uIS
	 AFzNsNlNzV8TA7w8bb57AqS310rKsy+xBvxp5gHLKxlWaZ/4DhrVNJqNx3dYrgNOXu
	 y1c5vlg5Y7BWuIdN9MKZJlcIG0jWO+nDKktIAk+1/S9X/f71ZCrUKB8bEvWsxcHa0X
	 pvefhdBhkaVbv6C2CraB5Ng7GUWIvlyNcpA3NvJ5ApKEEEjdX0AipFcon9vJXZuIk4
	 lJUYdeJu5+U54U/vs9QK7dfZ+72Zl9h/1Ihvj9h5FIUUMS5uUHDMH7QStH63vwHrVT
	 g9LSrWr4F9suQ==
Date: Thu, 26 Jun 2025 18:54:44 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-kernel@vger.kernel.org, David Heidelberg <david@ixit.cz>,
	Conor Dooley <conor+dt@kernel.org>, Ion Agorria <ion@agorria.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	Thierry Reding <thierry.reding@gmail.com>,
	Thierry Reding <treding@nvidia.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: tegra: Add Asus VivoTab RT
 TF600T
Message-ID: <175098208382.1433352.12783238736277076985.robh@kernel.org>
References: <20250617070320.9153-1-clamor95@gmail.com>
 <20250617070320.9153-2-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250617070320.9153-2-clamor95@gmail.com>


On Tue, 17 Jun 2025 10:03:19 +0300, Svyatoslav Ryhel wrote:
> From: Maxim Schwalm <maxim.schwalm@gmail.com>
> 
> Add a compatible for the Asus VivoTab RT TF600T.
> 
> Signed-off-by: Maxim Schwalm <maxim.schwalm@gmail.com>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/arm/tegra.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

