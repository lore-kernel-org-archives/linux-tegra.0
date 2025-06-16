Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt [193.136.128.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD3231EFFB8;
	Mon, 16 Jun 2025 10:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.136.128.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750069316; cv=none; b=L4iHuuZkaUCZ+ZTsbeE4lDgpKL1iIeP2ypppa6L0A+D7nS4d68YVFcFMtKIJnUZuKwxrrmPxhFSn0TjyStQJgEYBSbqU4FJhS9TamDaNnDJmwUifOEk4FeqM0aNh5NSmWLr7FOAQVwGBbY8Abr7Fg730VnLPF1SYz9WxbS2641k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750069316; c=relaxed/simple;
	bh=txzLScPRis5TZgP7A74iVXEx143n98D6lMsGYHpdwUo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jsnc5dRzW2uO8I7lvRgjyFbY3XMS0ryTDDhnS2kk9CL6SmjCMNTKZ0zz1noWB4D5Nf/+9XDQSkUX8CYmNXYCGZQ3gpsgymy5/yyGvhjLJ/t0+MmVpomA6P0DT36hOSG4Lw6xzOS4I7HrgJONqpf2FgIXhop+LQUXxUtdtfGxUbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt; spf=pass smtp.mailfrom=tecnico.ulisboa.pt; dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b=aOSvFiSz; arc=none smtp.client-ip=193.136.128.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tecnico.ulisboa.pt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="aOSvFiSz"
Received: from localhost (localhost.localdomain [127.0.0.1])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 28DB76000250;
	Mon, 16 Jun 2025 11:21:45 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with UTF8LMTP id J8uCpNmvOxAW; Mon, 16 Jun 2025 11:21:42 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
	by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id BFAD6600084C;
	Mon, 16 Jun 2025 11:21:41 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
	s=mail; t=1750069302;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xajc7GE1nfpzbrDK9Eb3NyKjCQlbeehO08PpGsW/Imo=;
	b=aOSvFiSzocsxfUX4y9NZBCFW5jcFBvnoY9SEIH+oBTJZ+1rAzftFyBZPzANESnna/wtiSZ
	E++QYbLUbS1b6tp8QM9AxShLy0uSGDaCGvFSBXylGltPfITRVV+bF8iTUdz+pnS05gLYVk
	/0KDgLjXGyu6qH5tb9P/qqYFgY0Fh/I=
Received: from [10.158.133.22] (dial-b1-161-46.telepac.pt [194.65.161.46])
	(Authenticated sender: ist187313)
	by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 67AA136006F;
	Mon, 16 Jun 2025 11:21:40 +0100 (WEST)
Message-ID: <78cc8814-c89f-4a5f-9a70-08ed69580c3f@tecnico.ulisboa.pt>
Date: Mon, 16 Jun 2025 11:21:40 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Mikko Perttunen <cyndis@kapsi.fi>, Mikko Perttunen
 <mperttunen@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Hunter <jonathanh@nvidia.com>,
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
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 6/11/25 4:06 PM, Thierry Reding wrote:
> On Wed, Jun 11, 2025 at 01:05:40PM +0100, Diogo Ivo wrote:
>>
>>
>> On 6/10/25 10:52 AM, Mikko Perttunen wrote:
>>> On 6/10/25 6:05 PM, Thierry Reding wrote:
>>>> On Fri, Jun 06, 2025 at 11:45:33AM +0100, Diogo Ivo wrote:
>>>>> Hello,
>>>>>
>>>>> This series adds support for the NVJPG hardware accelerator found in the
>>>>> Tegra210 SoC.
>>>>>
>>>>> The kernel driver is essentially a copy of the NVDEC driver as both
>>>>> engines are Falcon-based.
>>>>>
>>>>> For the userspace part I have written a Mesa Gallium backend [1] that,
>>>>> while still very much experimental, works in decoding images
>>>>> with VA- API.
>>>>>
>>>>> I have been using ffmpeg to call VA-API with the following command:
>>>>>
>>>>> ffmpeg -v verbose -hwaccel vaapi -hwaccel_device
>>>>> /dev/dri/renderD129 -i <input.jpg> -pix_fmt bgra -f fbdev
>>>>> /dev/fb0
>>>>>
>>>>> which decodes <input.jpg> and shows the result in the framebuffer.
>>>>>
>>>>> The firmware for the engine can be obtained from a Linux for Tegra
>>>>> distribution.
>>>>
>>>> By the way, have you tried running this on anything newer than Tegra210?
>>>> Given your progress on this, we can probably start thinking about
>>>> submitting the binaries to linux-firmware.
>>>
>>> FWIW, the impression I have is that NVJPG is basically unchanged all the
>>> way to Tegra234. So if we add stream ID support and the firmwares, it'll
>>> probably just work. Tegra234 has the quirk that it has two instances of
>>> NVJPG -- these have to be distinguished by their different class IDs.
>>> But we should go ahead with the T210 support first.
>>
>> I have a question here, what exactly are the stream IDs? While working
>> on the driver this came up and I didn't manage to figure it out.
> 
> Stream IDs are a way to identify memory transactions as belonging to a
> certain device. This comes into play when working with the IOMMU (which
> is a Tegra SMMU on Tegra210 and earlier, and an ARM SMMU on Tegra) and
> is used to isolate DMA capable devices. Basically for every stream ID
> you get a separate I/O address space. NVJPG will have its own address
> space, and so will VIC. Each device can only access whatever has been
> mapped to it's I/O address space. That means NVJPG can't interfere with
> VIC and vice-versa. And neither can any of these engines read from or
> write to random system memory if badly programmed.

So if I understand this correctly a Stream ID corresponds to an IOMMU
domain right?

> For Tegra SMMU there's no such thing as programmable stream IDs, so the
> stream ID is fixed for the given device.
> 
> On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),
> certain IP blocks have special registers that can be used to override
> the stream ID. There's also a way to set the stream ID via command
> streams, which means that you can have different I/O address spaces (I
> think we call them memory context) per engine, which means that you can
> isolate different processes using the same engine from each other.
> 
> Again, for Tegra210 that's nothing we need to worry about. For newer
> chips it's probably just a matter of adding .get_streamid_offset() and
> .can_use_memory_ctx() implementations.

Ok, then in that case I'll keep the driver in its current state without
these implementations if that's ok. Connected with this I wanted to know
your thoughts on the best way to upstream this, is it better to wait for
testing on different platforms first and then if things work merge a
driver that works for all of them or go with Tegra210 first and then add
more platforms later on?

Thanks,
Diogo
