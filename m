Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC6C64CC0;
	Thu, 11 Apr 2024 10:43:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712832224; cv=none; b=K8ep1UYkDZGSJKZE1FffTXIlyQ/CqZ4oHA3wu1Buh9M6l2cvR6yps97OqDQcI34jUtPAO2rY/J9d9vjofJJbG4xrFIT3BPkguDVYWcOUr3tYVlB6TbdK1ezq1YCF04+YEqNgzi/o2VFbBw97oJ3Ya8wdErAcvPrQpPh7LJ+k0Kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712832224; c=relaxed/simple;
	bh=m3LdeoBk9yRi14Td0QXtvoK4t+hH0qrQBNeHIaj+1hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=J+fDSoktIdrvIzE/Sbc2P8G6e1ZvkJYRQTtnbP1zmYmG+5KhZ9JaaLDqHAeeLfenbEJMZJF22oXc5UDS22zfwVkIr39KMZbpP93O86ELXJ1bR/h3TuyRlTQx1++Pn9PkOcQS7VEJF+EkhHXMFJR2vIhSQ6sj2AodLYrOWPY22Fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jrg1kLf8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jrg1kLf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38AC1C43390;
	Thu, 11 Apr 2024 10:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712832224;
	bh=m3LdeoBk9yRi14Td0QXtvoK4t+hH0qrQBNeHIaj+1hs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Jrg1kLf86SaY79TpYwUgtxmP++Rdv67PaepTB29DEHV8pQgr7f2N9q4PHmCMo1VFq
	 uGw7KLaRkxPG/Tl0VVgXRQxQpoK/0hADO3lydktBP5UdF2FhL/izsi6Bm9qYUs/aHa
	 56YrdjW1Pa5sOd+U/jjBCDwyNUwhDoaBaiTZUrA4uTdg9CdNtRGbsIkraqcaadqheB
	 Qf382IebSSvFHT300DzGjCYH7lp7YrYS9hP3tdHSoLNS7eVYbMeKqwVB6JHNkyYvtY
	 4bXvRIS3ZrctRSSUvROVB8NYK6XwxJlomtIqKGXEsZOURh1OMuNoX3jenBVetlIkkP
	 XdCxUhgtpv61A==
Message-ID: <87909fc5-e4de-4b74-bdac-61a92777f32c@kernel.org>
Date: Thu, 11 Apr 2024 12:43:38 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: host1x: Add missing 'dma-coherent'
To: Jon Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Mikko Perttunen <mperttunen@nvidia.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
References: <20240409082324.9928-1-jonathanh@nvidia.com>
 <ea3be8f7-0ee6-4940-828d-2fc15b9239dc@kernel.org>
 <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzk@kernel.org>
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <b726b5a0-45f4-457c-afad-6235c1adb640@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/04/2024 12:09, Jon Hunter wrote:
> 
> On 10/04/2024 07:18, Krzysztof Kozlowski wrote:
>> On 09/04/2024 10:23, Jon Hunter wrote:
>>> The dtbs_check reports that the 'dma-coherent' property is "unevaluated
>>> and invalid" for the host1x@13e00000 device on Tegra194 and Tegra234
>>> platforms. Fix this by updating the dt-binding document for host1x to
>>> add the 'dma-coherent' property for these devices.
>>
>> That's not really proper reason. What if DTS is wrong? The reason could
>> be if device is actually DMA coherent...
> 
> In this case the DTS is correct. I guess I should have been more 
> explicit about that.
> 
>>> Fixes: 361238cdc525 ("arm64: tegra: Mark host1x as dma-coherent on Tegra194/234")
>>> Signed-off-by: Jon Hunter <jonathanh@nvidia.com>
>>> ---
>>>   .../bindings/display/tegra/nvidia,tegra20-host1x.yaml | 11 +++++++++++
>>>   1 file changed, 11 insertions(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>>> index 94c5242c03b2..3563378a01af 100644
>>> --- a/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>>> +++ b/Documentation/devicetree/bindings/display/tegra/nvidia,tegra20-host1x.yaml
>>> @@ -177,6 +177,15 @@ allOf:
>>>   
>>>         required:
>>>           - reg-names
>>> +  - if:
>>> +      properties:
>>> +        compatible:
>>> +          contains:
>>> +            enum:
>>> +              - nvidia,tegra194-host1x
>>> +    then:
>>> +      properties:
>>> +        dma-coherent: true
>>
>> Do not define properties in allOf. Put it in top-level. If not all
>> devices are DMA coherent, you can disallow it for certain variants (:false).
> 
> 
> So for host1x we currently have the following devices supported ...
> 
> properties:
>    compatible:
>      oneOf:
>        - enum:
>            - nvidia,tegra20-host1x
>            - nvidia,tegra30-host1x
>            - nvidia,tegra114-host1x
>            - nvidia,tegra124-host1x
>            - nvidia,tegra210-host1x
>            - nvidia,tegra186-host1x
>            - nvidia,tegra194-host1x
>            - nvidia,tegra234-host1x
> 
>        - items:
>            - const: nvidia,tegra132-host1x
>            - const: nvidia,tegra124-host1x
> 
> 
> Now only the Tegra194 and Tegra234 are coherent (which are the latest 
> devices). So rather than add this to the top and then filter out all 
> those that are not supported, I opted for the above because there is 
> only 2 devices that need this. Admittedly, as much as I like the yaml 
> bindings, for things like this, it is not really clear which is the best 
> way to handle, so appreciate the guidance.

The way to handle is that you must define properties top-level.

For simplification you could keep the if which duplicates the
dma-coherent:true but add else: which forbids it

if:
 ...
  then:
    properties:
      dma-coherent: true
  else:
    properties:
      dma-coherent: false

Or just ignore the problem. Binding is not 1-to-1 with DTS.

Best regards,
Krzysztof

