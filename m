Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B8FF42847B
	for <linux-tegra@vger.kernel.org>; Tue, 12 May 2026 06:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778565986; cv=pass; b=pd38NcxdNwzBcNDM0rxQesniRvoea2dJ1S39XyZtwafG2q962FKbx5NA8dNUtSqR626afNYqWJ7p6PIsThuaeweZiZkZFb3x/bxVCRPBxuR9ga+oEsqre7YQkKt3nCzyUa+o+9uKCjhI7txPMne0PxDQWKerEiLPBWzIS+7p5oM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778565986; c=relaxed/simple;
	bh=yxZL62iX8pebWS6AofBmV9FGACpi7rIEMuv0C7XnSII=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tsvR9aZCy5cBbqkqbbwsPDwPZuhayBCV4gay4mrHHZP4Y0DCnO+OKrTACnEtkCK/J4MqAZXMoyTw2nqoV4MJ9XRli6JDJlETQlgIS3+TUVq58Lb/Asr+nya7oPDfm+XJURG4QSyq6fWHvkvA3mb6QfLhJI2MwOYUfrvwekA8lmg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tEHWRCep; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tEHWRCep"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2f7ca62a3c4so5218791eec.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 23:06:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778565970; cv=none;
        d=google.com; s=arc-20240605;
        b=bslCfBDhOn8wWZKmyUkub0mLan9IHEaFcYmRJaboozgdXmJmthj+QfScWmWLPiVvbP
         qOuw4c1y9Q9bluVvu4VvO0WJ8Qp/enJxSfGzM+j+yEVl0958WvWsHZ53EDW4Jifx0IeB
         EapC0JfZJdb6RYaiR783jia4POBcL/q6yU1oY+qC58IbIM/Zv6ILIGZJwr66pFxoSDqj
         dbCd9M4NuoyZMgOEjL7YvSgaY3v+h81mfYFlG+5+6Gr1bUd8RvifuEROHpC52NFrk0Wf
         0hUqkRhZ05LWRkQ+/Ao+ITFFV/HBDcObAl4m5kwvGVfH66YkcZXzJbb0ik/1RvhyTWSo
         qUCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        fh=R1kV3RZs0nOGiRjyxaYoUlzO3j+IUL5+htkc4HFjKtE=;
        b=SegITW0cEXJauXYe+wAjKE4BjNyWdyjcNfYgbUUAGYPvpRNTLSeXS6qaImNyGRfTRa
         2nmp1kK1iFAQp7zzrpF1W24p1ebaqIweCmL9695muBV30AbU3M1WlWR++56SDQVWARzz
         i13DCrW4syPldUdR/KVOg26Lp57wHsaaHEJPCEsSvy2oKPyQuuv8fUOB9oJl6uhylQHn
         8/FW1I/5GqeLxp6LSPOSx4qN83GnmJ2FAkCoRddOYYKKBywjSQPVRa3QzxSQJaqeLaXz
         S52H31zP/I2gcSH889blC+BREG2dFKh+yLsXbrQ0XTccn9GpzLiQsiYe1hMM0+R33hIX
         lGgg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778565970; x=1779170770; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=tEHWRCepdx5nmp6yIVCYqQVzLmcrQesovgaR9iEkViVeFajmSrIpSEYelr2lD2XxoP
         xh5y8Zvqn+p86e68KD2mvaQiqYvCBtE5yPAPTikVo2xqoL3Tzv1bOvc6AoLsBX9tMQ5x
         bYKhs3w7Wz6+rTS0+0PdymwNuR6Mrju/sIlosbiQTM7eQulfT33DGAwgDmm2ablH56dQ
         bWpBu7X7LqvzKybeZhNl7lGCCxcAzvLmd3Uqv1PZtG5EGNwdM3TqVIVGnx8neXBuwl/W
         L4ZL2IYFzfr7AuRSPKZt2mLvNKX42PoQwoqq4VK13MoKe4InA0vqbgWOu8BlRN8yU7AO
         0QiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778565970; x=1779170770;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CrrmqA1MIjLw7p2PiJAG2cpDnb+P9Y0HrkTx6QFkzK8=;
        b=qZ/xenbVPNcoPFNmHLzcvk59qt4u1B1fv37KCQdvJNRDH15mAJ8t+7K1oYNGW1o0K8
         wgV1Jg9Eoqjf/eInTkruabyGzQqDhYaAWtTNdwPhFq5uWWvYdv5kU+mQBasFXsvIgptg
         yiq7wUMHzHMA4OnNuqQg5nRiPOunSPQEuZDNzPAxqcv5qhDG9JWob7Mko6UQKBiWxEMB
         qK+05qTmIG0F+BhGZnmzO2Y+8fCn8P1Msrb8lRuhFMAxIXA34zYNcv+HlQaEV4cVKmbP
         KAf5ZMcXxXprunXgYys7oewTihfZ/MSBfeGV9JpqlYyF47U/l7oNHybVBR7YwLC9hqGV
         H5lA==
X-Forwarded-Encrypted: i=1; AFNElJ9dZqMc9p42z9n9u7Pw/4vJcHPBEVf/EPwNjPnDX0BRboydpdY4IC5b7wUpgF2j6UbYgrIj1z/KfV2Exg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJK2F8pVG1T63y/hDOAbzbUgZ0zoQh4OGuTMWoEdnKBmZ1n7PM
	4rZx2B3KpN/k6C9lFuIhX0g3cQ8VpArzcJe8Y7JtsohmFOYqCPDcWFY9Y3YYixEy3JUlFjPhf3J
	s3/q7b3n7Nc8gROUIWkOAmAupYWXS4sw=
X-Gm-Gg: Acq92OGTe8Gv4wFtiZk/AHghS6Fw92+plBk6wM6jG/etDiqib6QMjjbat/pS6N1I/bE
	+c8JW86mS8fttpmGXwaCMt/CDJvlhHOaQRe2WPCYILjZ0TudO12Vn73c42ncrbnW7kefVyF4XIa
	dLXD/Qv+rxkcgZL27GLB7vHJBqiHpYpNyL5DWWdKd07idz78qC96Y2sT5oV2PU0y7Bz45B4HLoD
	viGsV3P06Rr9ulO8AzqHcYKM9CoLxfeJziKQn7cR31Tw649/th3NCOHW0WHAQctUId1kumZGCME
	6S6nrvo/
X-Received: by 2002:a05:7300:d70d:b0:2f5:3f62:37b4 with SMTP id
 5a478bee46e88-2f54c080b64mr13761984eec.8.1778565969672; Mon, 11 May 2026
 23:06:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511170548.0065fd07@kernel.org>
In-Reply-To: <20260511170548.0065fd07@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 12 May 2026 09:05:58 +0300
X-Gm-Features: AVHnY4J1P3ErzmBnYdLDEn2tVC5ojwqEMUhGov68STEE-MFG5Dk8UXTF_hePr8Q
Message-ID: <CAPVz0n3wcgaXzSLAMT=Yt=+FC=n7ufkn_CAaKNcyTr=a+7bdTQ@mail.gmail.com>
Subject: Re: [PATCH v1 0/6] Add support for Infineon/Intel XMM6260 modem
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Peter Chen <peter.chen@kernel.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 12 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 03:0=
5 Jakub Kicinski <kuba@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, 11 May 2026 16:56:55 +0300 Svyatoslav Ryhel wrote:
> >   dt-bindings: usb: ci-hdrc-usb2: Document nvidia,external-control
> >     property
> >   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
> >     controlled
> >   dt-bindings: net: Document Infineon/Intel XMM6260 modem
> >   net: usb: Add Infineon XMM6260 Baseband modem support
> >   dt-bindings: phy: tegra: Document Nvidia Tegra XMM6260 PHY
> >   phy: tegra: Add support for Nvidia Tegra XMM6260 PHY
>
> You need to split this more on subsystem boundaries.

Yes, I will in v2. I needed an initial patchset combined to have a
reference point and show that all patches are logically linked.
