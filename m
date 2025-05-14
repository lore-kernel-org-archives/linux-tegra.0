Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D9681624DD;
	Wed, 14 May 2025 19:32:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747251144; cv=none; b=rWqu6oyMRXfSwDShpz1IR5dK5AVRfK9sOJEuX5mUbYNUBJk9tQ2OxM2NSpXdODsPsJNeL2YLFGd6SnKqGqJfrTSZIQmKZ2x0DSfY7Nyxx8bYyccFRkwtR/T+eElvouZQ8qcz1YMrQfMi2qg00DUaMWE6TY1MBcC2HY4ARkRhhUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747251144; c=relaxed/simple;
	bh=jgNWTWiWkIwzVlf6pEDhEKvyRN9QG8lqyb8q90ZMvdc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pySTlUKYWXz1wCOaLefg4Vj4AyeauwkcleJIhoZG+BkvSrptScKvmP7cMY90ej5W4dRmu7wG0dNz0g6yEAGOxyS7zoDRtBgnDdre/22YUrCA4YbMc2DOMLKEahKyL4AZ532Mm20q5asHq6X+vW6qZcbc08RSnjJWRkqZgsYltt8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UVsseQZr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UVsseQZr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD20FC4CEE3;
	Wed, 14 May 2025 19:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747251143;
	bh=jgNWTWiWkIwzVlf6pEDhEKvyRN9QG8lqyb8q90ZMvdc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UVsseQZroc++JvR1GiWqQW2iFu/U6eWs21colKYitO+7TcBo9WYuidPT839+DNXRX
	 yRi2HgPXkfDbmSpZc/TW7KOykaUsJLRrsDcvETfebAtyAPXLNOGVXqnPaEpEubmhe9
	 9Thfv1RE/wU0yT68RWAWVuKnt7TYxwMQ2hSF+avKFPL2abZVXTp2VcMwa9ZIJpEh9U
	 LDMMT5l/6yPsVsZecCjmLCgnC5xNtg7eq3Y91jIn+iVYQ3JM2PGweq5JOhPdkbqGre
	 bZl7wbboHCZa/kitlVx7su7MPy2iUltP3VkOmJznak/sbGzZZVdwlsjnH4+MeQEx1F
	 mUWwaQTRBwihw==
Date: Wed, 14 May 2025 14:32:22 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-tegra@vger.kernel.org, Jon Hunter <jonathanh@nvidia.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/8] dt-bindings: rtc: tegra: Document Tegra264 RTC
Message-ID: <174725114145.2870991.544607577077096887.robh@kernel.org>
References: <20250507143802.1230919-1-thierry.reding@gmail.com>
 <20250507143802.1230919-3-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507143802.1230919-3-thierry.reding@gmail.com>


On Wed, 07 May 2025 16:37:56 +0200, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add the compatible string for the RTC block found on the Tegra264 SoC.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  Documentation/devicetree/bindings/rtc/nvidia,tegra20-rtc.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

