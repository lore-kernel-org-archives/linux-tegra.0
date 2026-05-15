Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E013B4EB3
	for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834268; cv=pass; b=tBjSrYFC7u77OhWlpkMBSH3k2YSGj9D/kVr9XvFLy0oje1BAz/6iAH7Zpovt4XW5VanM64mFc2MYcBG78VCVQEepo/IdLbHEADSqSDBFRcWHzK3+9x+ngec2cTYsCMAiSYo41gCY82YMy4MW4Xgq2CWjHU6y9ZbWRWUHqFRaq5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834268; c=relaxed/simple;
	bh=unrCV9BlS+NT2H9YcNFBIBdPF5SnAoNci8LrnilLGqE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TzxO0yggEKxdu2VCrAFHRmgpWtA7ha20Cz0kI44GVyrIkKZrMGgfdzB3KAssCSRTlft1xgfGu2YWhcEEcvWcS/h5Wk5iupe1EZZnYsN1Zuq/pHWix+jxMQ9xex0Cs83MoU3FrK0sHGQDTfhsu9paKzRYV0AUjQl9pkZySBwt/tM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J6af3o+k; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J6af3o+k"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30246cfd41aso3784038eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 01:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834266; cv=none;
        d=google.com; s=arc-20240605;
        b=fUqe5XqlLUxXy4CYNG6HF+mrp2HZ1UAIeuAGN6wa8tDtDqFUeAKseWhP0GkyFxjnIc
         Z5/lz7Zd3Em4DO/ubQag0zrs/aKPT98j4GnXsP8kKKaIOSBRPDmEA9Zi4nfkLkKqwPqo
         so+Akc4rZl2AwHut8B/BJFTTM+awNKFyCm4zOzlCv8969qWP9E7HZjMqkaT9+QG2iCYI
         KM4+hh9QRzM072JWwUyRoB6luF5nAZwXYSPWuYuImthkBysSyVQRoK0LIucXfuMIGdYq
         fgX5hXBa0DZsQayKtpS0knCEWB+Vjbn2Uyi18pNrdOczp66bGo7h60ALsx+b6w1za0R3
         cxzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        fh=dwZKfYgfqg+kSppHVjc5H+xLvFgOu/c9liHLecXza7k=;
        b=fREUCfTMKfEP75LiQRv+XiOI3E2xmyPl0o4JZcSARuf/QAC0J31EFH0MH9bnHz4ik7
         Jy7pBB/xsDs5udLEAUWSYs4GfXYBe/HWBhYKnBL72XypkNswAYo8NbrmRm1AcS7kTQ6k
         9cvpjPgYxkSqYm8rx6f8OVx8oMa6lutODHQDG8qSit2AhmVrn2i7WdBnJR94OKzd5m8q
         m9GR29rOihpypxJmEimvXqXEhhmA27YmXed34fz9SYtrfuxc1vM46v/zwdWhc0nAtj7E
         gu1jnU64+bq4ZcD8DPRMUpBxpeHw7VmUU+W0L9mUw0vZSxCd7DDfbw2NekAT63pqpdVo
         MT3Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834266; x=1779439066; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=J6af3o+kBsvRvTtp5InCk67+NlrHIgODsJqzwPQ4eeD/BCnyKtt777pgo+ofAPURgL
         HzF6jMMLQnZwqvEoSifIHHtDcnqLkg6tfXFJUMNbt9wOlNkvosQUL6rDxtj5EHMRtLiW
         ZSCWHveKvVYdi/LPIbok9bDg3toxM2bFzpJqtF51ebmOrU+3nQM18F81oojcUr+8CwcR
         NKVd7SskLjzvNNJ5ePGlIbeneLV81gyGLhDuLs0MTDHogUxdE/GLW6nkBHrybnLzlgy9
         HPz0FxaBnNMkD7G/1UMHm15/7xFBqsuWpGyGV03ic1+IxCMQw46To/ZPmsY8SN2Xg4oJ
         RrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834266; x=1779439066;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Me5hEq/uVA2vry/WusH3UXPaCOwfFKJKOpGLMOeOsm4=;
        b=MqcsTRZTqZwQHkEKa08hPbRdOGBJo760Goddnb1mG8KYd1NJtVPBkz/WZjmWPYveUz
         2/bqVwQc6zysMsXFdYhonMklzHbjCN+HRIrZRHkKfY0WrLi235UCCBXrS7dSWpPabwT/
         pm9BsryfSFl3CiNd1fuccqLMRzELXpRWB6+EXVVHPV4Tnnf0TAqN7S/Z0m4Nj9n1W2Jm
         rWNAV5/J0L7wOVLKW56+2+j3Zs/T1BSw7Lw6TS/7C5f+EQBEAtR4gL23fLih3aOKCE9/
         pvINS5z2/ubGgyOHrkUDYfApb50zxeGYgsomXjO7ZVLJHlumpFLYsPaZJCRLXeF8jqKP
         8+5A==
X-Forwarded-Encrypted: i=1; AFNElJ8XsxGVB6uKeMD/7nRp9IrLSZa8lXaYfw5QjAo9yp5mazab2l5aFFc89+hQcBkdOzYtwA+mgoV2WBtUAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzkJ9uWWwLauJswpGAbR17T96IJRzFhbGENGBdkWl2JAs2V6+hP
	fqWiJDECXX9Ozig72NyuwNAlHCyx/UlhHhIOpuxNc1z30fqlGGl0sBBthiUbPk3vam402gmy4K+
	LEXIaD3srtgfLTbKqIF7CzJve4iVBMag=
X-Gm-Gg: Acq92OGORlAOg149cZdUEQPpwvomOTXbqqkEtfQ0pX4iYjq9d14EBZRJcbdcVrwqrcR
	L6TnfjgQgHvVIRMGZYXHmrQfDlLPYBbvXIo1YP0Xv/zAZxaIGV9PTByZbqepg3tgUYLja3YEyzS
	PGL4Et2FSEq8JhE42b9npAXrJ+ZfqQiLfTHSs7HyJurpYcE3RfsimZD0J1OSo5bAY20uAS7C7gJ
	PBJYdNlUyfIvbU6n6cIw+IYxi78h+Y8arlDcEwGR8jBmjTmF3ER9o7Z9g7Y8N4iB6XftCNediFa
	BNeX9Emv
X-Received: by 2002:a05:7300:fb83:b0:2ed:ff78:2c12 with SMTP id
 5a478bee46e88-303986b7f00mr1545456eec.34.1778834265492; Fri, 15 May 2026
 01:37:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-6-clamor95@gmail.com>
 <20260515-utopian-malamute-of-patience-367e8e@quoll>
In-Reply-To: <20260515-utopian-malamute-of-patience-367e8e@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:37:34 +0300
X-Gm-Features: AVHnY4LfeFEmg-csCdRMVtN73Y-dqI06XuWSB80BMJnQTmRPDx1qbsh-tCMg8j0
Message-ID: <CAPVz0n2wrAdU0JKx7eb7uosCcoGayqNchK591VPph-5_nBAMXg@mail.gmail.com>
Subject: Re: [PATCH v1 5/6] dt-bindings: phy: tegra: Document Nvidia Tegra
 XMM6260 PHY
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
0 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:57:00PM +0300, Svyatoslav Ryhel wrote:
> > Document the XMM6260 PHY used by various devices based on the Nvidia Te=
gra
> > SoC, describing its usage
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../bindings/phy/nvidia,tegra-xmm6260.yaml    | 58 +++++++++++++++++++
> >  1 file changed, 58 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/phy/nvidia,tegra-=
xmm6260.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260=
.yaml b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > new file mode 100644
> > index 000000000000..0346433c9772
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/phy/nvidia,tegra-xmm6260.yaml
> > @@ -0,0 +1,58 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/phy/nvidia,tegra-xmm6260.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Nvidia Tegra PHY for XMM6260 modem
>
> XMM6260 is Infineon modem, so any combination with nvidia,tegra is very
> confusing.
>

May you please suggest how to adjust the name then? Thank you.

> > +
> > +description:
> > +  A hardware configuration used in Tegra SoCs to provide proper intera=
ction
> > +  between the application processor and the modem, as well as control =
over
> > +  one of the SoC's USB lines for the modem.
> > +
> > +maintainers:
> > +  - Svyatoslav Ryhel <clamor95@gmail.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: nvidia,tegra-xmm6260
>
> Also here.
>
> What sort of phy is this? So far looks more like a software construct.
>

Infineon XMM6260 does not work as an ordinary USB modem, it is a
standalone CPU which just exposes itself to AP via USB. In order to do
so, it has to have control over a USB bus of AP which is dedicated to
it. In case of Tegra - XMM6260 interaction it looks like this: second
Tegra USB controller is set into HSIC mode and is dedicated solely to
the modem, modem controls this USB bus. Then the main XMM6260 driver
performs power and init sequence and once it is ready it calls phy to
register controller. Phy has its own supply, controls USB controller
de/register and using enable GPIO sends signal to modem to proceed.
Additionally, since some XMM626 versions have a few steps to setup
exposing different USB devices, phy handles controller reinit for each
step. If treat XMM6260 as an simple USB modem it will never init.

One more benefit of having PHY is that modem driver itself is generic
and PHY handles SoC specific configurations required by the modem.
Since this modem was used on a variety of different SoC's (Exynos and
OMAP for example) they can reuse modem's driver and provide only PHY
which handles modem interactions with the USB bus.

> Best regards,
> Krzysztof
>
