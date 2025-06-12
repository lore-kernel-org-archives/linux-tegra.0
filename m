Received: from mail.kapsi.fi (mail-auth.kapsi.fi [91.232.154.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5051B770FE;
	Thu, 12 Jun 2025 01:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.232.154.24
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749693473; cv=none; b=WLa6UPdcpVBmQ8GgAY4xNk3Ei18WWDum3HcFRcDV7yQdWoQ+iXkyb641fOnmDaWws2kHSHlnzchcMR6akYgXKHlFMTE5M40fZhbT9Exorta5SC9M6Z54LWbfYJ8/IOr5Bztdss97Bq7t/GXCdpscFSbNdCVGdvCfPw+ItziaoYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749693473; c=relaxed/simple;
	bh=A9TkELkIlKIZrcNNPESM/UHkept+MT+PNaOa2I+ZqYU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mgug0BlQHG2vDOvWMk5YLGnM5xKjtT4fiEM0JwOtBFN/pjnmmfkpDkaaGJcWyeZjobtEXqkWDbChKKFRcmxDFVWd19uA6PH2iUZ+jg8Ca8Kg1Slsyu/x5OfbahMxK3oVRhOvVz3bFR9OnnCTHTkvYuQ2/zcqvTJrLtf7uLkfaP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi; spf=pass smtp.mailfrom=kapsi.fi; dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b=I3aYeJZa; arc=none smtp.client-ip=91.232.154.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kapsi.fi
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kapsi.fi header.i=@kapsi.fi header.b="I3aYeJZa"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=My7ku61t0R/YRh9ePPMG3Cu/uUDaAwNFOLS11kIAzO8=; b=I3aYeJZa2lk55Pl6fTG+8F/o4w
	ZcPCbMt7wb6UunSsp0/KS+Esydn0Hy2OmdTwZVIQos5OGtqLa4uutdi2A+eV1+0jFGwaSD+A/ABBP
	yn6vH0UiUOwwu7MKejqcEa99scRqe/INEt3AfNkpV0d3F7pntla3AESfGF8nm2siLVEK8dyrZlLOz
	h6goBYqPXg9AJMQYrx9cgrT65Megs03wDemCGJ/jeKC74iNrWjSY8cgcno0HXOqULibwbY3A+N+f1
	RzG+eN3+9H6Ro00j6ndzcpCR6DYiaoEINqb+iR29j0C0WTpA4qs1kCWg4AQBe1LK3y4YwQWUYpWFj
	h1/+Fhew==;
Received: from [2404:7a80:b960:1a00:5eaa:b33c:a197:a90f]
	by mail.kapsi.fi with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.96)
	(envelope-from <cyndis@kapsi.fi>)
	id 1uPXBH-000k9l-2B;
	Thu, 12 Jun 2025 04:56:39 +0300
Message-ID: <3293ae49-90c6-454c-b2f4-98ea84302c11@kapsi.fi>
Date: Thu, 12 Jun 2025 10:55:20 +0900
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] NVIDIA Tegra210 NVJPG support
To: Thierry Reding <thierry.reding@gmail.com>,
 Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
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
Content-Language: en-US
From: Mikko Perttunen <cyndis@kapsi.fi>
In-Reply-To: <4cibh66elviiatataa45lsfcyeovkqyxe4fjvfh7uqddhsbe6z@svt2dgeafrdh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2404:7a80:b960:1a00:5eaa:b33c:a197:a90f
X-SA-Exim-Mail-From: cyndis@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false

On 6/12/25 12:06 AM, Thierry Reding wrote:
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
> 
> For Tegra SMMU there's no such thing as programmable stream IDs, so the
> stream ID is fixed for the given device.
> 
> On newer chips (Tegra186 and later, or maybe it wasn't until Tegra194),

Tegra186 and newer -- all chips with the ARM SMMU. To add a little bit, 
each engine can address two stream IDs, one for firmware and one for 
data. All user specified buffers are mapped into the data IOMMU domain, 
and these are switched between jobs / applications.

As an aside, currently each engine has its own firmware stream ID, but 
that's a bit wasteful, since the kernel allocates a separate IOMMU 
domain for each. The firmwares are all read-only so they could be in a 
shared one. We've had to consolidate these on some platforms that ran 
out of IOMMU domains otherwise. Not really a concern with upstream 
platforms, though.

> certain IP blocks have special registers that can be used to override
> the stream ID. There's also a way to set the stream ID via command
> streams, which means that you can have different I/O address spaces (I
> think we call them memory context) per engine, which means that you can
> isolate different processes using the same engine from each other.
> 
> Again, for Tegra210 that's nothing we need to worry about. For newer
> chips it's probably just a matter of adding .get_streamid_offset() and
> .can_use_memory_ctx() implementations.

Also need to program the THI_STREAMID / TRANSCFG registers during boot.

Cheers,
Mikko

> 
> Thierry

