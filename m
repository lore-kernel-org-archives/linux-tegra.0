Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18F3A1EFFB8;
	Mon, 16 Jun 2025 10:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069424; cv=none; b=daWu1quqb3K23q3fU1hsVHl3jcj8W/370e58V9cLIGesIuAEnX2KMChhGyYEFiNJEtngtRJM4YnoyYQydcpWAt6pJcCDqy+TqEMhRYQopLwDd+g/2IQapKoFE3MPi32qJO3cMuggPf0gY2iYj0raFvlis35RKLBSbwtQiYn1sXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069424; c=relaxed/simple;
	bh=fn5r/24vIfXSW53dcDnbu7JV5dkUEKV8ym8AeSPboZk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iWAxfxG5rCFTe3ufLtBTFNDUw3Vj9C6nBJkPIPBo4wZhCRt+EgC5UqaOssybJs+Z4xtBILqWx8ZA9ng9FUSRtmUsckqb0wARC63rP+jOVEn6MFgE/NDLO1/GZhRJbsqsm2FcLZU7rZsYirhTKJ2NhqLgDJcAuYDmKKLPp9dAlQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=T/+qxgVa; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="T/+qxgVa"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 7E1416000872;
	Mon, 16 Jun 2025 11:23:40 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id L9bELFm_BR3k; Mon, 16 Jun 2025 11:23:38 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 3BBF26000840;
	Mon, 16 Jun 2025 11:23:38 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1750069418;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=a5FEJ53jx6GAvPakT/TDuoSkCUkkHtIFeh8HSktAvb8=;
	b=T/+qxgVaciRTgz3aRFCVmufxs6tJvPAEtDig2UMTAHzxEiU/8xOepx9gpMcRzkpdVzVgbd
	DbIo78A4XPfWpeJBzr8sPN1gxXamUL9SiXNUkZnwukwuEGM09ttXUTxpxTFkawE1D8w296
	LZJlVtdTLOCLa7KcynTJ2foLubenQxs=
Received: from [10.158.133.22] (dial-b1-161-46.telepac.pt [194.65.161.46])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 0204636006F;
	Mon, 16 Jun 2025 11:23:37 +0100 (WEST)
Message-ID: <9018994f-de55-41b3-ae45-59cccaaf8603@tecnico.ulisboa.pt>
Date: Mon, 16 Jun 2025 11:23:37 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Mikko Perttunen <cyndis@kapsi.fi>,
 Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <mperttunen@nvidia.com>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250606-diogo-nvjpg-v1-0-5f2c36feeb39@tecnico.ulisboa.pt>
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
 <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
 <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
 <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
 <3293ae49-90c6-454c-b2f4-98ea84302c11@kapsi.fi>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <3293ae49-90c6-454c-b2f4-98ea84302c11@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/12/25 2:55 AM, Mikko Perttunen wrote:
> On 6/12/25 12:06 AM, Thierry Reding wrote:
>> On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>>> I have a question here, what exactly are the stream IDs? While working
>>> on the driver this came up and I didn't manage to figure it out.
>>
>> Stream IDs are a way to identify memory transactions as belonging to a
>> certain device. This comes into play when working with the IOMMU (which
>> is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
>> is used to isolate DMA capable devices. Basically for every stream ID
>> you get a separate I/O address space. NVJPG will have its own address
>> space, and so will VIC. Each device can only access whatever has been
>> mapped to it's I/O address space. That means NVJPG can't interfere with
>> VIC and vice-versa. And neither can any of these engines read from or
>> write to random system memory if badly programmed.
>>
>> For Tegra SMMU there's no such thing as programmable stream IDs, so the
>> stream ID is fixed for the given device.
>>
>> On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
> 
> Tegra186 and newer -- all chips with the ARM SMMU. To add a little bit, 
> each engine can address two stream IDs, one for firmware and one for 
> data. All user specified buffers are mapped into the data IOMMU domain, 
> and these are switched between jobs / applications.
> 
> As an aside, currently each engine has its own firmware stream ID, but 
> that's a bit wasteful, since the kernel allocates a separate IOMMU 
> domain for each. The firmwares are all read-only so they could be in a 
> shared one. We've had to consolidate these on some platforms that ran 
> out of IOMMU domains otherwise. Not really a concern with upstream 
> platforms, though.

Does this dual Stream ID also apply to Tegra210?

> Also need to program the THI_STREAMID / TRANSCFG registers during boot.

Thanks,
Diogo
