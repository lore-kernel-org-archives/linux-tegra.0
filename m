Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14E691C75E2;
	Wed, 11 Jun 2025 12:05:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643548; cv=none; b=oWl/ENgWKdHwEUgnEq/PPlYuuDEPAOwXbhRJ1O59RtUtiVFshfYLqJzFrlrl6SbdJ6Q4UJqkQEU1B77VFW1Ef60oNqtz2iJ+BUHKHvv/80y3aZwNZ3vQt7jA+rQWSwriVVSad+aEnBLxvcLFycE0lUZ6Q0Q0Bgk7w9CPEupMnTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643548; c=relaxed/simple;
	bh=uUbMH9O7dMqePsv7+b9ZrvznQKQvIVtcgBUgeHvIZog=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uZBo8H8dp7OEnCdRZpBwXv+4kZkhMqtHB4MjHlgyOihSc0z+3eI3LQlzQbK6uB/g+Bk9dI6X32wnhzESRSrdsO69nE0fEQbB8QEG8MpPNq1Svrwp2hXdwp1J8R4OtQo9Mx+UaAxtG9QB3aWYRHFzuKunTWw8E9jWuIUjanCahQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=BPFWdb+a; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="BPFWdb+a"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 97E146003C11;
	Wed, 11 Jun 2025 13:05:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9o3E2IBRN4VS; Wed, 11 Jun 2025 13:05:43 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 013FD6000870;
	Wed, 11 Jun 2025 13:05:43 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749643543;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EszJrXpVlktwqI9OICr8GM+DRV+5b4sbE2x+AglRscU=;
	b=BPFWdb+aCnHuRF/GC3OJ2b3BiHphnIUEgV8KPJ/adUx4ak/jVjA3CmWz1trzsGp+x2uIrt
	tT+kB5b1jmrV22N8tp48OK9Sp3zrxg4fcWQoPkUpzE5+L7PvLRMXt+CMfAIxSx+v7+I3Cu
	xs0vpmyLy4oIcnK8cDPm2NSs8B++lNA=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id CD012360084;
	Wed, 11 Jun 2025 13:05:42 +0100 (WEST)
Message-ID: <96b721cd-7223-4b28-a3fd-a4d92c9d5142@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:05:40 +0100
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <621a9459-f2dd-4b19-a083-0e62f1a42f50@kapsi.fi>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 10:52 AM, Mikko Perttunen wrote:
> On 6/10/25 6:05 PM, Thierry Reding wrote:
>> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>>> Hello,
>>>
>>> This series adds support for the NVJPG hardware accelerator found in the
>>> Tegra210 SoC.
>>>
>>> The kernel driver is essentially a copy of the NVDEC driver as both
>>> engines are Falcon-based.
>>>
>>> For the userspace part I have written a Mesa Gallium backend [1] that,
>>> while still very much experimental, works in decoding images with VA- 
>>> API.
>>>
>>> I have been using ffmpeg to call VA-API with the following command:
>>>
>>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 
>>> -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>>
>>> which decodes <input.jpg> and shows the result in the framebuffer.
>>>
>>> The firmware for the engine can be obtained from a Linux for Tegra
>>> distribution.
>>
>> By the way, have you tried running this on anything newer than Tegra210?
>> Given your progress on this, we can probably start thinking about
>> submitting the binaries to linux-firmware.
> 
> FWIW, the impression I have is that NVJPG is basically unchanged all the 
> way to Tegra234. So if we add stream ID support and the firmwares, it'll 
> probably just work. Tegra234 has the quirk that it has two instances of 
> NVJPG -- these have to be distinguished by their different class IDs. 
> But we should go ahead with the T210 support first.

I have a question here, what exactly are the stream IDs? While working
on the driver this came up and I didn't manage to figure it out.

Diogo
