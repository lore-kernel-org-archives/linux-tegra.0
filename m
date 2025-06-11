Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8021B2405E1;
	Wed, 11 Jun 2025 11:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643015; cv=none; b=r8sHr4gNX0sQ5uTj1m/3zkReMTap/2DImeDW6dUjAuyE9hHzhy/b2FCUEDR1Y3KVCaLEKEkJLXo9C21+RGNsddpkkj2zyPB15ozVW7vp4AhIkZQ8FZD7d6ACQJt6CTTXEyNeD8i1EqiQmXK8nw5t8AMSR9MNitpJCRrDzkUVVGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643015; c=relaxed/simple;
	bh=o2Q6JsbeZEg3VnNVA/mc0TjyJ6HDggtrwtpAR64di+M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I//DYnI3QTzjz6fWJRQm8o3WEPoQKu7Dtto11+pFUVPxwC1+EKJB0a8jTCTDdfD7yeT9jd6fhFTtpJn8d29GU9vgZKvnuzZQGwIphj8xpEi20aFsi25mbFH1F3h1/44rY3y+VHS0pBV10hv/TeiO5J6BsNDGOgMUbC/VKlkDWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=GkFzxb33; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="GkFzxb33"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 9EDA56003C08;
	Wed, 11 Jun 2025 12:56:51 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id lqO9FPTecebC; Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 495336003C1B;
	Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749643009;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PJUruQAOGbhUpiQy9dRrHappJl3EfKmSUYgVRieXboY=;
	b=GkFzxb33XyZ+Uv3TH3RQ4jmB6ESz/iLOoIhYGofy+s93P+Q4jGQjYoSkk1PYQ3opDizp/B
	LinPIL7BXJ4BmRHgBEUazzWw9mZ5j6X4K/XgokKnOEHwyN7mfjm4ovKeQGc+fapLp4SO8K
	arhFWeG26mu4WR51Pp7ikgtRjw81Od0=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0E6DF36008F;
	Wed, 11 Jun 2025 12:56:49 +0100 (WEST)
Message-ID: <9ddcd776-28b6-4fad-ab09-d3305e0f960b@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 12:56:46 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <lxgh2rtt2fqbmom64vbmtkly2dqcnivwvlhxt6zscwskhzsrne@kd66mumdaukf>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 9:58 AM, Thierry Reding wrote:
> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>> Hello,
>>
>> This series adds support for the NVJPG hardware accelerator found in the
>> Tegra210 SoC.
>>
>> The kernel driver is essentially a copy of the NVDEC driver as both
>> engines are Falcon-based.
>>
>> For the userspace part I have written a Mesa Gallium backend [1] that,
>> while still very much experimental, works in decoding images with VA-API.
> 
> Nice. It's good to see that there's some use in this after all. I
> haven't taken an in-depth look yet, but from a high-level point of view
> this looks like what I had imagined back when I started out with this
> driver.

Good to know that the structure makes sense to you :)

I still have some kinks to iron out before submitting a merge request in
Mesa but if you have the time to take a look before that and you already
have some comments before that that would be great.

> This made my day, thank you!

Happy to know that!

Diogo
