Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864B424418F;
	Mon, 17 Mar 2025 15:03:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742223838; cv=none; b=Ef1qQ5oO++3h7A0f3ctN+KvAqOIm07B38asR1WH9dwgMpxf3JDtaqdGSppt6HxFa07/G3VnnaaZ8zlFZtgECe1ysicGQ2J8cTSGDywLANMS+4y/SaJg7PMQSa1ik6RJdo78sB2sJX6VaAtWzJMqZQhvyQwHjAwFMOvVsnMqoHTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742223838; c=relaxed/simple;
	bh=lOTj+aLfLjnSkGWOyTAyxRBbj1txz9yH5T9seX66aeo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mSsEIAQa1zZi4ahR6lIT1MUoZ48jbLIm2OiEESjCi3NqzbrrUuj+IvB1FX176D0t08vqHds4wJg0/vPuZRD1sG922sXdgaaGG1rk8E1m9QxXZMc6q9Dc96LfvxAHtxgq/W6ApwXIf3EOTS+YfQ2rfF9utvmxDDafmeNYJPH1cyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fHcIhep/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fHcIhep/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F4FC4CEE9;
	Mon, 17 Mar 2025 15:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742223838;
	bh=lOTj+aLfLjnSkGWOyTAyxRBbj1txz9yH5T9seX66aeo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fHcIhep/wrcfChNHZOvjO+19Mlu6UZJ6+qB794IUpJDd5p4DKQ6YH/PgZM9rKoCvq
	 OP8EOmfN7TN6doynVZRE5mZ9xuEs4Ss051F3utHu5INXQLeiLi3ZGTaF5gPswHIl0j
	 RLPgO1oyvWYXo8RVaQTcHRc+qO7UgRyB4becD7efGJxPgQ/CAAZSSY9cZd5XUWxNwT
	 ljTqoe3tak0urndwyZ3Ln36deD/ySqsupn5UrC1DCkqBcQtfNTQd5lfW/Jd1pQvcu1
	 4rqfdCXT3WhCLmhsVliTjCh0s8GOgvhSZ+vUPpx4aeBKV3QbFDKhTRjWaHsriP8g2G
	 1htgjkmOpAKiw==
Message-ID: <dde3fd48-f5ac-4c82-aff3-8dae255d4cd2@kernel.org>
Date: Mon, 17 Mar 2025 16:03:50 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ARM: tegra: Add device-tree for ASUS Transformer
 Pad LTE TF300TL
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>, Thierry Reding <treding@nvidia.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Maxim Schwalm <maxim.schwalm@gmail.com>, Brad Griffis <bgriffis@nvidia.com>,
 Dara Stotland <dstotland@nvidia.com>, David Heidelberg <david@ixit.cz>,
 Ion Agorria <ion@agorria.com>, devicetree@vger.kernel.org,
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250315074416.8067-1-clamor95@gmail.com>
 <20250315074416.8067-3-clamor95@gmail.com>
 <20250317-enormous-bug-of-triumph-ba274d@krzk-bin>
 <CAPVz0n3o2=6cXh81CwqzASEcz9AbBmaMeU94V4xAyGdzKcUoVQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <CAPVz0n3o2=6cXh81CwqzASEcz9AbBmaMeU94V4xAyGdzKcUoVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 17/03/2025 12:19, Svyatoslav Ryhel wrote:
> пн, 17 бер. 2025 р. о 13:04 Krzysztof Kozlowski <krzk@kernel.org> пише:
>>
>> On Sat, Mar 15, 2025 at 09:44:16AM +0200, Svyatoslav Ryhel wrote:
>>> +#include "tegra30-asus-transformer-common.dtsi"
>>> +#include "tegra30-asus-lvds-display.dtsi"
>>> +
>>> +/ {
>>> +     model = "Asus Transformer Pad LTE TF300TL";
>>> +     compatible = "asus,tf300tl", "nvidia,tegra30";
>>> +
>>> +     gpio@6000d000 {
>>> +             tf300tl-init-hog {
>>> +                     gpio-hog;
>>> +                     gpios = <TEGRA_GPIO(C, 6) GPIO_ACTIVE_HIGH>;
>>> +                     output-low;
>>> +             };
>>> +     };
>>> +
>>> +     pinmux@70000868 {
>>> +             state_default: pinmux {
>>> +                     lcd_pwr2_pc6 {
>>
>> No underscores in node names.
>>
> 
> These bindings overwrite bindings in the common pinmux configuration
> which has names with underscores, so underscores are needed for
> correct configuration.

Ack, this Tegra coding style will make big even such trivial fixup...

Best regards,
Krzysztof
