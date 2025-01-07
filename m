Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562C0198A29
	for <linux-tegra@vger.kernel.org>; Tue,  7 Jan 2025 17:26:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736270815; cv=none; b=PbOPEThSwA4dfLisQzdWRO5gHMeftEnArGxEv4nzJsAR+1IVEPjOGg92/hkZ2klCO0l+wn2LI/ZX+7hAXzbZ0eBgZNU/3bDqt3WfTAU/Dk3t/SzOMlEiBQ+Jmdzh+2FnIx4ompRMxqlsa1EkJiUzhNM++TyBedI0Qoag864JPcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736270815; c=relaxed/simple;
	bh=xaI1MzU8YqkwNIXSUK+vtpERhBgaIIyYpkmxq2xzGL8=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=ljD7cgkRgf5xhs4V84tbu0ywQ17WcbMlUxPwEO0tsZ4vIGS00QF0RNhcBtSnPmhoG5C9h/Dcwo9g8/ipzgQT6OZ54YS8S6llZcBNmrmlkSFrLfsqvmjvzPhx3HGspFY1WwihTdOQ9bQAh6jX2Z9eWxf/KMit2dxLT7IH3F6c4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=HQtwcsli; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="HQtwcsli"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2163bd70069so41520065ad.0
        for <linux-tegra@vger.kernel.org>; Tue, 07 Jan 2025 09:26:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1736270811; x=1736875611; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=AnFDI1orT78UbMz4dvewuX8lguog+6111daL66A0sXs=;
        b=HQtwcslilz7PxsY/C5UXbZhUXVXjlGP/rf6ND2R1lP3uJOGBxO65qbNN5OP+MCttzi
         AgR7US5LG+0R4W5hhblCHeRlDg6FgzrW+d6RpTOHAMuoA6P9kFG57WMmqPICIUZe7UiO
         ov/+ZiaZe4xsArAf4r+dkpTK2oP8ZTYHi1tY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736270811; x=1736875611;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AnFDI1orT78UbMz4dvewuX8lguog+6111daL66A0sXs=;
        b=KlnmCtK/wwfHr+nSq3A/Rf+XDaIQkDKNvGYZNnM+kbIIw+fj1DAFzc0weBL+vncQ1n
         jgX6Y8taE/CeAnhBC097l3MRfvQTzjR2MxV0M4ZSJ5y3qVo8asyYRp6rZQAEZqF/UEd6
         2kPLqUKkixD1gidtvFnDNxN/uPrl7RXF8yv9X2cyUhlzg2D1/5SEUu3FfYTz2aho2AZz
         +MamM/xZDma+gXBpDJtOIUaSv9E9E4H4VvJGIsufmIxhIjL5NEPr+S2vEpW9gPeU+etH
         qw+5QAW4GP0cpHHBlWyu2aD9xkuRtLwvWatgOxPMRuzbHviGk6nVW/QVZaXy6T20l7hT
         OvEw==
X-Forwarded-Encrypted: i=1; AJvYcCX8FOJncKye5qG9nd2crgWCZR5mzLcmIlidOO7fotO/8pEXe+QrLRAgodFpjMaOGA2P7aAqlU0v8ajBtQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyEQbPn0hUlg3GIPlqnU5abS09VA3OkKojtkT8PsKNrfD6elLk+
	ASKNrT2IjbKwNbLyo/x0PrZfnYF8YGeM6SmzXCPNqLJ47nYP4A9oOX7CC8ra8Q==
X-Gm-Gg: ASbGncvwIGj6gV9W+R66FxAuvFvbAKJYRWYIRHG62LoyNNYSOOlfABvZOMJ8HAnZuvl
	ZU114g95IxpTqD4G/CwcWvj7aQtc0D3M2MfoqPNV8YuT1wup62rHTebRM7QrYnWOk1CdH2hMv0f
	H96JsW13cMh4VLJZJP+ncORSqc1TnYUPilSn7B8jDnYtZveqxWJscR7NvNb1OkzTRpCfdRwxZs5
	BZa79/arJ1K/zTgPD9BFAi3OxFrABORPGYHScwbAUH7QdQTNP90bqwwAiLUg/CBDGFs5OD1KuMV
	l101CJsSatIdBrstbi9/
X-Google-Smtp-Source: AGHT+IEPaGgB9Qa+1DpEpRgPYql8+QmamIMyRh5C1Rx/DzqtHoRCh+8H9eqIioceJgqABRLUqu9iOw==
X-Received: by 2002:a17:902:c408:b0:216:4d1f:5c83 with SMTP id d9443c01a7336-219e6f26814mr803886345ad.47.1736270810779;
        Tue, 07 Jan 2025 09:26:50 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-219dc9cdeccsm314093865ad.144.2025.01.07.09.26.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jan 2025 09:26:49 -0800 (PST)
Message-ID: <e2d33d2f-6b30-495e-a089-b1185b22130f@broadcom.com>
Date: Tue, 7 Jan 2025 09:26:46 -0800
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Correct indentation and style in DTS
 example
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
 Andrew Jeffery <andrew@codeconstruct.com.au>,
 Justin Chen <justin.chen@broadcom.com>, Al Cooper <alcooperx@gmail.com>,
 Broadcom internal kernel review list
 <bcm-kernel-feedback-list@broadcom.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Magnus Damm <magnus.damm@gmail.com>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Benjamin Bara <benjamin.bara@skidata.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Ahmad Zainie <wan.ahmad.zainie.wan.mohamad@intel.com>,
 Del Regno <angelogioacchino.delregno@collabora.com>,
 Tianping Fang <tianping.fang@mediatek.com>,
 Jassi Brar <jaswinder.singh@linaro.org>,
 Biju Das <biju.das.jz@bp.renesas.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Francesco Dolcini <francesco.dolcini@toradex.com>,
 Macpaul Lin <macpaul.lin@mediatek.com>,
 Alexander Stein <alexander.stein@ew.tq-group.com>,
 linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
References: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Language: en-US
From: Florian Fainelli <florian.fainelli@broadcom.com>
Autocrypt: addr=florian.fainelli@broadcom.com; keydata=
 xsBNBFPAG8ABCAC3EO02urEwipgbUNJ1r6oI2Vr/+uE389lSEShN2PmL3MVnzhViSAtrYxeT
 M0Txqn1tOWoIc4QUl6Ggqf5KP6FoRkCrgMMTnUAINsINYXK+3OLe7HjP10h2jDRX4Ajs4Ghs
 JrZOBru6rH0YrgAhr6O5gG7NE1jhly+EsOa2MpwOiXO4DE/YKZGuVe6Bh87WqmILs9KvnNrQ
 PcycQnYKTVpqE95d4M824M5cuRB6D1GrYovCsjA9uxo22kPdOoQRAu5gBBn3AdtALFyQj9DQ
 KQuc39/i/Kt6XLZ/RsBc6qLs+p+JnEuPJngTSfWvzGjpx0nkwCMi4yBb+xk7Hki4kEslABEB
 AAHNMEZsb3JpYW4gRmFpbmVsbGkgPGZsb3JpYW4uZmFpbmVsbGlAYnJvYWRjb20uY29tPsLB
 IQQQAQgAywUCZWl41AUJI+Jo+hcKAAG/SMv+fS3xUQWa0NryPuoRGjsA3SAUAAAAAAAWAAFr
 ZXktdXNhZ2UtbWFza0BwZ3AuY29tjDAUgAAAAAAgAAdwcmVmZXJyZWQtZW1haWwtZW5jb2Rp
 bmdAcGdwLmNvbXBncG1pbWUICwkIBwMCAQoFF4AAAAAZGGxkYXA6Ly9rZXlzLmJyb2FkY29t
 Lm5ldAUbAwAAAAMWAgEFHgEAAAAEFQgJChYhBNXZKpfnkVze1+R8aIExtcQpvGagAAoJEIEx
 tcQpvGagWPEH/2l0DNr9QkTwJUxOoP9wgHfmVhqc0ZlDsBFv91I3BbhGKI5UATbipKNqG13Z
 TsBrJHcrnCqnTRS+8n9/myOF0ng2A4YT0EJnayzHugXm+hrkO5O9UEPJ8a+0553VqyoFhHqA
 zjxj8fUu1px5cbb4R9G4UAySqyeLLeqnYLCKb4+GklGSBGsLMYvLmIDNYlkhMdnnzsSUAS61
 WJYW6jjnzMwuKJ0ZHv7xZvSHyhIsFRiYiEs44kiYjbUUMcXor/uLEuTIazGrE3MahuGdjpT2
 IOjoMiTsbMc0yfhHp6G/2E769oDXMVxCCbMVpA+LUtVIQEA+8Zr6mX0Yk4nDS7OiBlvOwE0E
 U8AbwQEIAKxr71oqe+0+MYCc7WafWEcpQHFUwvYLcdBoOnmJPxDwDRpvU5LhqSPvk/yJdh9k
 4xUDQu3rm1qIW2I9Puk5n/Jz/lZsqGw8T13DKyu8eMcvaA/irm9lX9El27DPHy/0qsxmxVmU
 pu9y9S+BmaMb2CM9IuyxMWEl9ruWFS2jAWh/R8CrdnL6+zLk60R7XGzmSJqF09vYNlJ6Bdbs
 MWDXkYWWP5Ub1ZJGNJQ4qT7g8IN0qXxzLQsmz6tbgLMEHYBGx80bBF8AkdThd6SLhreCN7Uh
 IR/5NXGqotAZao2xlDpJLuOMQtoH9WVNuuxQQZHVd8if+yp6yRJ5DAmIUt5CCPcAEQEAAcLB
 gQQYAQIBKwUCU8AbwgUbDAAAAMBdIAQZAQgABgUCU8AbwQAKCRCTYAaomC8PVQ0VCACWk3n+
 obFABEp5Rg6Qvspi9kWXcwCcfZV41OIYWhXMoc57ssjCand5noZi8bKg0bxw4qsg+9cNgZ3P
 N/DFWcNKcAT3Z2/4fTnJqdJS//YcEhlr8uGs+ZWFcqAPbteFCM4dGDRruo69IrHfyyQGx16s
 CcFlrN8vD066RKevFepb/ml7eYEdN5SRALyEdQMKeCSf3mectdoECEqdF/MWpfWIYQ1hEfdm
 C2Kztm+h3Nkt9ZQLqc3wsPJZmbD9T0c9Rphfypgw/SfTf2/CHoYVkKqwUIzI59itl5Lze+R5
 wDByhWHx2Ud2R7SudmT9XK1e0x7W7a5z11Q6vrzuED5nQvkhAAoJEIExtcQpvGagugcIAJd5
 EYe6KM6Y6RvI6TvHp+QgbU5dxvjqSiSvam0Ms3QrLidCtantcGT2Wz/2PlbZqkoJxMQc40rb
 fXa4xQSvJYj0GWpadrDJUvUu3LEsunDCxdWrmbmwGRKqZraV2oG7YEddmDqOe0Xm/NxeSobc
 MIlnaE6V0U8f5zNHB7Y46yJjjYT/Ds1TJo3pvwevDWPvv6rdBeV07D9s43frUS6xYd1uFxHC
 7dZYWJjZmyUf5evr1W1gCgwLXG0PEi9n3qmz1lelQ8lSocmvxBKtMbX/OKhAfuP/iIwnTsww
 95A2SaPiQZA51NywV8OFgsN0ITl2PlZ4Tp9hHERDe6nQCsNI/Us=
In-Reply-To: <20250107131015.246461-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/7/25 05:10, Krzysztof Kozlowski wrote:
> DTS example in the bindings should be indented with 2- or 4-spaces and
> aligned with opening '- |', so correct any differences like 3-spaces or
> mixtures 2- and 4-spaces in one binding.
> 
> No functional changes here, but saves some comments during reviews of
> new patches built on existing code.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   .../bindings/usb/aspeed,usb-vhub.yaml         | 40 +++++++++----------
>   .../devicetree/bindings/usb/brcm,bdc.yaml     | 14 +++----

Acked-by: Florian Fainelli <florian.fainelli@broadcom.com> # brcm,bdc.yaml
-- 
Florian
