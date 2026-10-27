Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793091126;
	b=sKVg4laZSd44piB7E2MIk3mmo789cxTyDIdpeIJ83mci9Av4j0nEeMQbwxlS/vsLguhX
	 7CANY6rhJw4Ht7b29GdhduvERUvrF+LByWLK2TS+PIiVaDizDc5Lpi2i19Ct7nFa6V21H
	 Zc5W/3h6D7U8f4O7fxmGySmnlW46cCiQFUaddIWsC//hIsF0gdDaF43DZ50UPUOneYqCU
	 +oxtpMzlaT3loppPgWRMP8RdHK+yezMRWeTdgwi8KghIsCg5ZMSUnOymGHQ3ABGYrlJD2
	 ah93XdnP8FjExXKtNJoqziaLAVwejDu+pWbNjpIAF2g5wWbQD7vmw+pef8WM79mRg7A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793091126;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
	b=4DQW7GrnKHhUboCvz6Hv8fiVJwF3dhuJSkzM2XnqWZy+Q8ufhnKxSOh9l2J/+8ckAfAK
	 5fLZ++h3tBUMMUd+arjjPn4o85MZvH9/kWgVVH1TBmLmlDU1EyOIGMEKedV0dLetIp2UP
	 aGsdlPHSZbOv97mJBAInY1UNkgRUie84upHLVawfy8hC3RHB+1BFOjlagP848pJ6EF53M
	 SZWEnrZ2M1wSvaRahL5GVW7gXfBB4sP4F9aL3HN3ec3ByTCQAgz6rPElxfhyqJk+DbMbW
	 luLkMc2Zz8M08VZGbq0/ZJB12h1+4hoSkvQu9bH2fBnvQuTzH+xHheUWCRJTaogQNkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8188606A321
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 08:52:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C8188606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=pUf0+7wZ
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso11358923eec.0
        for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 01:52:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793091125; cv=none;
        d=google.com; s=arc-20260327;
        b=Fr55TsepKdGqbhp9Vk4S/VCY39usbbRcnckooUc8igfPPG0fcvwlXIocXKsauoGp0l
         AHvdde1abZnmtEPhBPLq2BmC67suheQBDyVoYPaeqbNC6RJosuRsmEiLVj1OlTFfMOvl
         98KlYlxhs7sAn3pZE3Vis6ZVFk6+kyY1gASEJyxGHmtPrbg9MtA2xOUxdnEQkN2UMqXb
         qunJM+uGCR18MfhdAiRMl1wLBj2GV+U64SZgEhkhQA/g5P8dmO+Wk/+pGzd62x5En311
         KHt4kKLkIZZuQw90W/g/js5sWWo5LMPGVVsxa133eXVRh4K7aSY943P4XDBOFwFA7qAD
         EUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        fh=f42yx1rpu9abadSuIAAJIFTr9f5n+4Eu48lWLjuR2y0=;
        b=O6r8eWMaL97J2mz/DTeHLMDO9kd5spqQ8R7fBGYKruPKv8YNqHA/iEOuzAjMO0k4Lu
         RMSzVOu3KjOVv3l10UJXxm+JSCZuKty9BG/wnAa2j32u2sWTUZa5hLR5MKt0VRvcx8CF
         M7BQByAbOJbTXEwJWzIzYfnwXxAq58b/ijfP5F4nFh2V8POHXS1J83YGRhIcFoIDwbo0
         OgL15IchKj/PR0orTPa2UVz0XKYSRtlxz4Yfdpes8CRHPKnpic568cEVoRSBujII/DGc
         FObiEQpjmCp1xJ8NDOWSOjlw2/yPlbf26w8SiUgoqFsMdWqzrRiK0+/ivYrO/mTxJKqA
         1E1A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793091125; x=1793695925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=pUf0+7wZWPc6vb08pmDR5P6yk7mSd0eNZggr2tJrJzBo7w39uEiKa1QXLZjKmWm7M2
         lND4nL5vqeLmDtdnhvuFcc0vihOhPvYKaLsfE9Bm0ztBkLkB82jqwgxcK0mUGN5F4HT0
         Yqab/3TcmGLFulnpxU5OwJi2wlujE4b54oEC7pPMBoxOyUitR1v8ONiQjoWzoRTs91Gz
         ar2IIukgQB0zJMUt4nOtS62GihnblGXHDNbM7czAPOIgkpWaxrl2p4PVrut6ORDx+vpd
         EhZZyqKNwyJxUGDJ/rfbjW5Bx0ZaZRG2zdnaTiXAaiQxEDeGAtFAkJxEEF4fgs774y7Q
         jLpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793091125; x=1793695925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=544Vs5W0iQqaMJeYnY15/Vfb543TMzE2RWHWwProMBw=;
        b=EZlD2H1QNpxFOiHOE64oUnYvU3NeGwPuUFxvxTTM5pi+wGWd709En6Y23ISK4ghkT5
         ZHnB219aSjHX9G6fSV6Fdr1TL0GPGbfgEhXiwov4d8LkurY1N4JKjLQABqsPp362oeUp
         /6i+cfsZWbb51b+QN3txhd5SsC2jP8GfdVE3ZAyNxr6IiKdsYdKoQLMV2tl4KOhbYAwy
         pKhFFZ6U1VIJnWvmkiIbIFxiRxhjedn6AFvZ0dZrZSKYV2MbHdsVn+lXeXvZfyZ2yqdp
         DQ7ugWP6SYpBwgmERkfbTLox5QOBlTcO4WccWbFEPEo8C/YoXSs2PHEpsN17qhR6qyP/
         TPLA==
X-Forwarded-Encrypted: i=1; AKwUvBwCUzYIFu/bPJSRTQLdkWBPuDvk1jGwY6+gQb/0u5tUlNtKc8ZfmZC7Ba25pz7a7BnfqUQyP5U3YdyzHQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIawpjPHlQuzwcCkSeueT2ygWgPt27nXFQDYKjqfOZrOfNxfOiU
	3yRWMqyq6Ds34ydHXHWdC8dqjqWUJbghzXeOxDJp0jSb9S9s2RwE+dG8oM91ApoJbqxzL2y55f7
	cDBtiFeeJlmw9msuLBfPcMEKMtSd76/4=
X-Gm-Gg: AYBFou1WbckkZqWN0VFCkpu+hVMrfGBuuyx3dl+sXLX6afkfmRc65sBEpsxWgYvcnpn
	oQhZQvIkEk22CFy5D+vJ87OGQIXUODyVUBykSB4V55mkibDNM/977D/Ck2kp2X8PBq7oGRrMlld
	gQgun6PSlg23NHrD1ntawn57geitvXMSY6vidTb2XRePb6pI49qIf5la90DvjZ0kzDjBFJPftJH
	v+JWE8dSUChM5W1Cx8gn24+/hLxuIumWE6xrSaFhsh4TlSFQ+XHIb7yWsbZd6W/jsmXYeDv9M82
	w2StkEQLsnVMm5mZmsoyhW8KJ4N84DdzfdS7xXea5nM8C1rhmuHaTnd29cG7Os39AwTUQbtwMz6
	J5e0W0SKEqAoQYRjh31PyZthr592LwC9w6oS+O1KgrlIBLgtkdPoKhjxrmxEvXhWPzqe3jQBMVO
	kDmVdsFNC4AR+jdX0=
X-Received: by 2002:a05:693c:8110:b0:359:2edc:e1d8 with SMTP id
 5a478bee46e88-369e836b39bmr13749085eec.5.1793091124761; Tue, 27 Oct 2026
 01:52:04 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261004165204.205660-1-clamor95@gmail.com> <20261004165204.205660-2-clamor95@gmail.com>
 <20261026222928.GA15139-robh@kernel.org>
In-Reply-To: <20261026222928.GA15139-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Tue, 27 Oct 2026 10:51:52 +0200
X-Gm-Features: AclHuK8LjCWDpNP4DuV4ZuevBx5z2yzl2RQeYjmP-HIeitxouPX3pu1AzADU8K4
Message-ID: <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Rob Herring <robh@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 00:2=
9 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > Move all Tegra-specific Chipidea devices and their properties into a
> > dedicated schema file, by analogy with i.MX.
>
> I don't really see the point given it is only 2 deprecated properties.
> Maybe those can be removed? Depends if they are deprecated and still
> used or deprecated and removed from .dts files years ago.
>

The ci-hdrc-usb2.yaml schema contains properties that are not
applicable to Tegra, and conversely, Tegra-specific properties are not
applicable to qcom, nxp, nuvoton, etc.

The 'nvidia,needs-double-reset' property is required for Tegra20 and
Tegra30, and it is still actively in use, as you can see here [1]. Its
marked deprecated state appears to be incorrect, as it should simply
be restricted to Tegra20 and Tegra30.

The 'nvidia,phy' property is still used across all ARMv7 Tegra
generations + Tegra210, as the Chipidea driver has not yet been
converted to use the generic property. Therefore, while it is marked
as deprecated, it remains in active use.

The example I added is from Tegra30, which in the real devicetree uses
both properties, so I've included them here as well. With your
permission, I can remove the Tegra-specific parts from
ci-hdrc-usb2.yaml and tailor the proposed schema to better fit the
current state.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/tre=
e/arch/arm/boot/dts/nvidia/tegra30.dtsi?h=3Dnext-20261026#n1146

> Rob
