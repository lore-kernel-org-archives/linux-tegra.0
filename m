Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D02AE3E9C0F
	for <linux-tegra@vger.kernel.org>; Wed, 13 May 2026 17:34:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778693701; cv=pass; b=MMndPHNthGSYYt/v70k9eE5YuGhXwSgv2SWmMKQCjP4lp770sQN1Hyh8F67GDWNgRyIg1XDsH6MfWe9cygLZ4Bw6Ak+sSk88TfKJbu6ABjsht9toYAjdUQ4HPBBb7cK2ppCbsxaItLQxrhrqrZdDOvkwLxxMCLatRePyM0D00fg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778693701; c=relaxed/simple;
	bh=6mKKdTvK5cZhpi/RRSOEX613zOGTzbC3S1RaopRBLKA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=d2kMfd7eUyEgzf+aNzbOgMRqpSdTsRW0RgGAADSps6j6wIX9DH4cL6O3F9Z+NZ/df62NB1RSAJtFkpWVChdAMQGlQHTSph2P9pJmPvfe4nWd/6MY5ooCoQ5GNKACAIfVlbynlWq3ctjA0TWqac5ZFGPDawsgyXhi3HHVoXKvwA8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=brbtuFEa; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="brbtuFEa"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2ff5472f263so3272718eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 13 May 2026 10:34:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778693698; cv=none;
        d=google.com; s=arc-20240605;
        b=eADatXgefdmVIoP23SWlblUnQbQ0sc2Qfz8yBdklQdC0+ouxHLsjgmBMXr4AKPmKEp
         J7Vksub6/TsBetTf4g2t3JzMwy1LA0Tr6o315DSIwrxm8IVIJ8IAh6rIuiE6XYl7kuT1
         sp/XJ/Z863e1G70VFs84GLXOl2tzaus8f46kzGRPnR/6S5aHzbA5Ue8ZIe6JqBqGnuLu
         Di5xjZWNTcAYvgLTK2XhKxNkojdU5U+DmeoMXuQ/l+h9/u3FUeL7yD81BlQYFrZrjGVX
         mx+8J/yhcxYkDOg1XOnNQXWBUuj96G6Zw1Ps+CG0d6fwZJcjAfXKeCjaN17/yDENnETI
         lwAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        fh=9kPv+zm+oSyN1xr+MfG4EEThWIam6aDpSYqpPwjYtLU=;
        b=ku6gF4pIiYWRuVHl9+iS2abfRq0pPrO1dWeVvjub2/viJaMuLSGWKGKdsDRn8MMpLW
         elYD8WgmfD4ko8HAPUWLiF5K6MkHleHzqGtdNn9NyM7bpj048UvpOciAtFmmr7OHuLGv
         rCwrfAXHAt5CCE7sNgH3Iwmbwl7iV17ETAjiFmKuLWMXNKjPZsGIlfwknEeQzDqx31jg
         093xHMVIop+SW6OwCraR/xo5VIlID1esLrS2j7hahNTHFSf52JYVZ0QzNeHQOOE0t9/P
         ralH/Bx0LNTmY5Ob5I6UK6UnDJzdWPBcjIRS5eU9JZ+Paa6WgCilGcBsMbplcnIRWntk
         lFRg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778693698; x=1779298498; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=brbtuFEazLvBam8XINvJDXjF4XU7Qkp7fQiYSxPQTepmB8WvWHIRTCVTi9pB7foIL6
         0/W0vSriBFjY2RkGafYIp3N8uXwzdwScxWHoxxZtSCBovdpx7Xs6FOZzh/qaY31Jdj4t
         YTTlWuFH78pT5gkN1IBaUJPpp6RW+DYyC8ZeQJH3a44yTQ/pe6jvRdvWuqzbIKYMG8lI
         dW5AKVf2w3DaVrMJWyNn2iCQS2VTQ9sx+a8YZfbdcW3HIpw/xpSzTfY/y9Abr41h77mW
         1GJBzvBbtWmE0LM1lNMS6ehhYxVqQdGvALg6fD25VRI6iRdjMP27lhMh7XgnHdknCdPQ
         xlsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778693698; x=1779298498;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SpmEe38ixB0yNCM9L2G46PM6Le+IQzZX2ErAyq3Ln7g=;
        b=a/wyFu0fAIioisjqo+CVmTz/gz5Uunzdjbrf20ax/wGDwUy1QDTSv5/qNBUU+XZUHg
         VzFWZhnovoKnAO/GrEasBtHJMg43QCtwaWkAHoTVSinmhRwBFiOVp4HEyUrgjtRfEBhr
         wmvT5cfY04SIkEvxviNiwast9CEhlvwTw57SlHdxhUd/58xZAt0GVT/Rp4tAleK4Ug9+
         TwdtK3+Y6Bs09zzZ7KhrLyvqpRzwzsl+TA06RfuzfX5DxIDtt7jS1FgUBPCT9Z/Anr6j
         Y9lnjTbVCjgNDOu6Mk13QBhcg2KPypPU3jcCb2C3Wy99FCpodDdeTAVHfvRJPKmFt2I3
         lwWQ==
X-Forwarded-Encrypted: i=1; AFNElJ8hw+3YdjaBbq+9SJaA7OHGBcqWgYIaUIjmBZTg/3Y3YbhiwzLGODuR14Vv/pe8WkEBKrCE0R8rvzbO8Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyXC5c/wT4AKXB3i0QArzcwj6mZsNmOFrUrzhoD+oNi1/EPNno3
	k36i3wAk7YUxl5b0p06/qhiByeCqdp+uqe7l6AfwpHd/g/s9ZnVkVgcbyLUPKdVHlHiUhCexrPW
	xsiTW03zl4v9Qs91RoFZ/1Z91tdCk2f4=
X-Gm-Gg: Acq92OG7v2B4myyee35qaWuvRx6O62LvuInCsMY3bBKKqyfqzrP0ffkf2hMsNaYd8G3
	D6eazAAdp5UL1wGnvpxZ10IChNNk4Sr6z7LeFggmMSlV4mpf6mw/AhglWT9RmxrMiBfOOL0Bowk
	DocQSKex/1VFE7d9nvcDn7x5nyrkjoZcQ6g9P9cH28jOJdm0REmVo85PUaUi7YF3bK1qWoZgymg
	GXz0NILcY8hRODnx9Wopw/nejFY6+mgJQAi57xeSZWt9BK/h6xRekJIqKVjWoTdhZKvVn3fKKGU
	t+PRXptRC02TNRl99fM=
X-Received: by 2002:a05:7301:198c:b0:2da:d4b4:c85a with SMTP id
 5a478bee46e88-3011747e13bmr2818209eec.11.1778693697976; Wed, 13 May 2026
 10:34:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-2-clamor95@gmail.com>
In-Reply-To: <20260511135703.62470-2-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 13 May 2026 20:34:45 +0300
X-Gm-Features: AVHnY4Jn_9cXsf7GdBN5Zma5dh7sHSjSA1xGhyeTeuyfFq_71h-4QZdAyPVKUFI
Message-ID: <CAPVz0n2GkucfHqvgusF=K_KakqaJmZSLP=8VYMyVT5HAVDD_XQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/6] dt-bindings: usb: ci-hdrc-usb2: Document
 nvidia,external-control property
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
7 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Document the nvidia,external-control property required, for example, for
> USB lines in HSIC mode connected to a modem, where the modem requires
> precise control over the USB bus to properly enumerate all its stages and
> intermediate devices.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml b/Do=
cumentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> index 691d6cf02c27..a13c1ef49a57 100644
> --- a/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> +++ b/Documentation/devicetree/bindings/usb/ci-hdrc-usb2.yaml
> @@ -75,6 +75,13 @@ properties:
>      type: boolean
>      deprecated: true
>
> +  nvidia,external-control:
> +    description:
> +      Indicates that the controller is configured externally and that th=
e host
> +      should not attempt to touch it. Usually used by a modem which requ=
ires
> +      precise bus configuration.
> +    type: boolean
> +

Would schema maintainers mind if I create separate schema like
chipidea,usb2-imx.yaml is handled? At the moment ci-hdrc-usb2 holds a
mixed properties of several SoC and can cause unwanted/unsupported
node combinations.

>    ulpi:
>      type: object
>      additionalProperties: false
> --
> 2.51.0
>
