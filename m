Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 171F827C17E;
	Mon, 16 Jun 2025 10:26:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069602; cv=none; b=cYcMAvuotvti5zUizAddfaebnO4tCCyvOHRwV/Vf/yyhz5oSxqZSHfV+1xsruvf1tk4CTu5/BcnUk3TX08xe2SXFsykBs+Iv104B2ag2gUloFSTOeJczgVm8HMpF5wcKcS7TXuTmB4mv35ZuqZZRUHLns61GKh2Olk9ufTNS4+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069602; c=relaxed/simple;
	bh=eRNVQNJrQKsKaSgrcVUtf9wi/rXFfzY1K5e6M/Slas0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=V6ESIVDLmy9P2WAaf/P8b+PUQcFOyb8qqY81sXAscOm74OUWVLdMVBqQBZKvLK7kiK4SiRdxuN/NiJ+X52y7DBdiVWpnqKDnHmJDYT21K/roH1fjmoBtpb4J8umzaK+F32MqDFCaqY/P2dv00UQ2Wk/mx+DBO19tOfDrh3jyUpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=KIvgy9AJ; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="KIvgy9AJ"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id E41C76000849;
	Mon, 16 Jun 2025 11:26:36 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 5p7B0SOzlH1y; Mon, 16 Jun 2025 11:26:34 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [IPv6:2001:690:2100:1::b3dd:b9ac])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BFB626000856;
	Mon, 16 Jun 2025 11:26:34 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1750069594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cZ0d2s6TcJTo/RRpHWcWEd7a2EXHbIrKmLMBoTXec24=;
	b=KIvgy9AJTbLwthP0BV70CqKk+W28m5DHmojb7PFeZ7hvBP3gt2oF5meCNCmjRq2EriHFj1
	46eunM1/qX7yppgCkLjJQPI9xgkiNMAsB0WKJSpeVv64nM6kSafloZRqoaENJUyEaVxf91
	6/LRDUZbtamqGYyqDDC8j3wRGVMKp9Q=
Received: from [10.158.133.22] (dial-b1-161-46.telepac.pt [194.65.161.46])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 79C3D36006F;
	Mon, 16 Jun 2025 11:26:34 +0100 (WEST)
Message-ID: <1ee42017-63e1-4b01-ba1f-8f548cba8733@tecnico.ulisboa.pt>
Date: Mon, 16 Jun 2025 11:26:34 +0100
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
 <00f678ae-0b66-403c-bd53-6090e5920b1a@tecnico.ulisboa.pt>
 <c3un5kjfepprcjddchqmecik27huepuxejs6vckuqb3dshrcba@s2jcf23au62n>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <c3un5kjfepprcjddchqmecik27huepuxejs6vckuqb3dshrcba@s2jcf23au62n>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/25 4:10 PM, Thierry Reding wrote:
> On Wed, Jun 11, 2025 at 01:04:14PM +0100, Diogo Ivo wrote:
>>
>>
>> On 6/10/25 10:05 AM, Thierry Reding wrote:
>>> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>>>> Hello,
>>>>
>>>> This series adds support for the NVJPG hardware accelerator found in the
>>>> Tegra210 SoC.
>>>>
>>>> The kernel driver is essentially a copy of the NVDEC driver as both
>>>> engines are Falcon-based.
>>>>
>>>> For the userspace part I have written a Mesa Gallium backend [1] that,
>>>> while still very much experimental, works in decoding images with VA-API.
>>>>
>>>> I have been using ffmpeg to call VA-API with the following command:
>>>>
>>>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev /dev/fb0
>>>>
>>>> which decodes <input.jpg> and shows the result in the framebuffer.
>>>>
>>>> The firmware for the engine can be obtained from a Linux for Tegra
>>>> distribution.
>>>
>>> By the way, have you tried running this on anything newer than Tegra210?
>>> Given your progress on this, we can probably start thinking about
>>> submitting the binaries to linux-firmware.
>>
>> Since I don't have access to other Tegra platforms I haven't been able
>> to test this driver there. For this I need help from someone with access
>> to more hardware, I can send a version that just adds the extra compatibles
>> and we could see if it works.
>>
>> As for the firmwares that would be great!
> 
> I think both of these are things that Mikko and I can help with.

That would be great (as I imagine you have access to the hardware :) ).
Let me know if you have any questions!

>>>> Due to the way the Gallium implementation works for Tegra
>>>> the GPU also needs to be enabled.
>>>
>>> I wonder if maybe we can get rid of this requirement. While it's
>>> certainly nice to have the GPU enabled, there may be cases where using
>>> only the other engines may be advantageous. Originally when I had worked
>>> on VIC, I was looking at how it could be used for compositing without
>>> getting the GPU involved. That's something that Android devices tend(ed)
>>> to do because of the power savings that come with it.
>>
>> Yes I think this is possible to do, it mainly has involves properly
>> handling the Gallium driver initialization. I'll take a look at it
>> before submitting the MR for the Gallium driver.
> 
> Okay, great. But I think it's definitely something that we can defer if
> it's non-trivial.

Perfect then, in that case I'll skip it for now and open a Mesa MR after
taking care of some final details.

Thanks,
Diogo
