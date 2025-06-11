Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E975C26E6F0;
	Wed, 11 Jun 2025 12:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749643463; cv=none; b=hzSnUpuju47nK1rfYM+sgWjidJRACT5+Eyg9hQR11dLRUoEGoB7kqcWOL61pmT2bb8xjsVIVhyxYe/B4/7tnt8byQ08jtPiPqLPYxKpYM5G4ah62vcucrpX7okOHZS7hJ3d3xEFboCKVsAqC6SVeHVsSxrQ5UjTyibL8YSOqIZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749643463; c=relaxed/simple;
	bh=d1XWIPNm2kp6LPDXGxjYDFYz3Dgz6XKTwrp50cPkDVQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AIyatnyD+zyaylVNtNp8XXFFeX/kbA7vGfVQkO3wmGbq1tfLxCZD6b8FQfBtPFTWKNSMrEy2TO/aYG9nuAoIJ01HrOkpbGadC1Bert6ZkrhT1EeupvBt6Od390mQ4bq4fOQ6l2u5mBDpbeMxcbSIPrma29w75Lkuu9UGkQqcJkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=pea6Ccjr; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="pea6Ccjr"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 0DC616003014;
	Wed, 11 Jun 2025 13:04:19 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 9hPjO_f-eCHZ; Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 9E4C7600301B;
	Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1749643456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=H3JQgS3p43p5THNQw0KB6nL6/rdKYdxEDetoSqTjwzo=;
	b=pea6Ccjr2yJlbBuKzdmYxoS9nbR9av6NMj2oOIxhgJlvvljUstw3g6j6sjQ2q5iiwf1ycS
	fhEkGEvVtyRk6qZSBEvrKie42yw1F4/YJ5y/UEWPR4Z9b14PTHmxWnTJZg9Up/+jzsg3yH
	XptrtAyHblh3mUflMr/V0ZiIB+3JBiQ=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 6179C360084;
	Wed, 11 Jun 2025 13:04:16 +0100 (WEST)
Message-ID: <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
Date: Wed, 11 Jun 2025 13:04:14 +0100
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
 <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <mz5sytol6aw7ouwiimmrd7lqhtvq6nj7pqpxq4ie6em6nwvvkh@2cux3no33gre>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/10/25 10:05 AM, Thierry Reding wrote:
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
>>
>> I have been using ffmpeg to call VA-API with the following command:
>>
>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>
>> which decodes <input.jpg> and shows the result in the framebuffer.
>>
>> The firmware for the engine can be obtained from a Linux for Tegra
>> distribution.
> 
> By the way, have you tried running this on anything newer than Tegra210?
> Given your progress on this, we can probably start thinking about
> submitting the binaries to linux-firmware.

Since I don't have access to other Tegra platforms I haven't been able
to test this driver there. For this I need help from someone with access
to more hardware, I can send a version that just adds the extra compatibles
and we could see if it works.

As for the firmwares that would be great!

>> Due to the way the Gallium implementation works for Tegra
>> the GPU also needs to be enabled.
> 
> I wonder if maybe we can get rid of this requirement. While it's
> certainly nice to have the GPU enabled, there may be cases where using
> only the other engines may be advantageous. Originally when I had worked
> on VIC, I was looking at how it could be used for compositing without
> getting the GPU involved. That's something that Android devices tend(ed)
> to do because of the power savings that come with it.

Yes I think this is possible to do, it mainly has involves properly
handling the Gallium driver initialization. I'll take a look at it
before submitting the MR for the Gallium driver.

Diogo

> Anyway, not a big deal, depending on the GPU for now is fine.
