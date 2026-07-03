Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E594F347FEE;
	Fri,  3 Jul 2026 06:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783061817; cv=none; b=XxMPiDXkVkWwOgGUsgfTX0AsA5yLuqWqr6Hpvr8w28U3OAiMwasVLX+knpWv9iifeeNpC1IZgf3qEyn3ffX1iV8uuWK+F4zL0e2nHX5GnkX7wXwYPR5R8MpTgyYKcPDfKxsgznOMAMdTBQho6cj8FczPs9rtKmib4mgEDBwXurw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783061817; c=relaxed/simple;
	bh=CQDF2Sc3Gb7dOM7YLb5W83nnwC24Xz+OxzSIRNINm44=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aSvSVwZrSc1ijdldUeqGDEBgD4yzfj/JodkkVoGbXTBIH1BxhNhH5nE5H1c3r1JvhYxrQ5NZQ8WkRI556FGTL63TqjQmxi8cZd2cqvCSEiXMsn5GbtuugINBD7oj5vzPrJBftpLBkmyed1L+FA1ErkF3rZ29Jf3nr/W4L+QNvdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ho6F8U8R; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ho6F8U8R"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C18001F000E9;
	Fri,  3 Jul 2026 06:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783061816;
	bh=8faICAmC21GgbYq0rQFfkuCIrtptkFcUCzeneJOMRt4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ho6F8U8RS19eb9osi3eZZg4erE8Ya7LQbf44Ie1EnFjkL9jI8jlj48X1ryrOxk3ow
	 xoWBTa3GZetolR1L88jWafOzFFJiKf8fIhZujRk56I95xAqBUjXn0YKMt16hANmGpw
	 /nYyv8EqMM4LU4TaO3BfiQcZ1fvl7pITKNaLz5JUF4QTJcGgddZWtEqyRA4SCxWdVB
	 iyKsmIh2LcjZ7pThF8p9uwIltAaUiDErjdbhfw51Rb/Ib19mBrRCCjsOviz/Agl6s8
	 x8iqLgWqDbzj6GtUzMZ96IH53SQJeNd4QkoGIiFEeLSN/bOpxtfavfBmBTrA77IW3V
	 jb72a3W9C17bg==
Date: Fri, 3 Jul 2026 08:56:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-tegra@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: display: tegra: Make non-vm
 registers optional
Message-ID: <20260703-hysterical-umber-cricket-3080da@quoll>
References: <20260702-host1x-nohv-v2-0-e6d88bac0af6@nvidia.com>
 <20260702-host1x-nohv-v2-1-e6d88bac0af6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260702-host1x-nohv-v2-1-e6d88bac0af6@nvidia.com>

On Thu, Jul 02, 2026 at 01:10:26PM +0900, Mikko Perttunen wrote:
> The hypervisor and common register regions are not always available to
> the software -- usually when a separate hypervisor keeps ownership of
> them and only passes through the vm register region to a virtual
> machine.
> 
> Adjust the bindings to make these regions optional to allow describing
> the situation in device trees for such virtual machines et cetera.
> 
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  .../display/tegra/nvidia,tegra20-host1x.yaml       | 40 ++++++++++++++--------
>  1 file changed, 26 insertions(+), 14 deletions(-)

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

