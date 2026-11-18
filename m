Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794991945;
	b=NSqCB0UZ5PBc1Nr2tS3YzKK6NvbG/+9GUz3QRW0Z5/Iwd2E9Xatf1bALGxeiolOnMfSZ
	 QygVTn3SQndxIA0t6unmnDyhLymKXqB8ffWTwUkclNIdPSwbpf1GwZZV2/8wU2JZEGiW+
	 AmnXecLHqX7+XytZsgriQxE9LQGkPZ0LjRi9Xxrf+rDEJgg2dOpaXlALHCLDyYRu7aMEC
	 uYmtJQB7CMM1+e37TM/zTZsb8PZ7oPE5wGPsFb+PX63RvGpFXQ3nPua4Bz8eq3slr/S8x
	 FQmaFNijJW3k2PzXLT0vTuKpeDYGTZqLkuc9ZarWC7bzGoylyY82OAgCFaHjsz74PVA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794991945;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
	b=M1dWfFYQCd9CvmKEqiGdiITlVbpPsC6KxrrRHUZ4iFbKPdX3eiVvRDmpyl8ujxK5ozYn
	 bhP1OeJyCz3zhCzI9Ri4+SEvBobryV8NIgP5ZodUOWSeH9zSiiqOHzefMpoCaWm6JW7sk
	 RY82JyXLeFkqTfiw7SdluW45wbyIBos+xosdEjKhDL731Xu7Zj+VnlpPmCJVFGi66YOxA
	 2KYNqRl+tIxSv2Gorw8NX2dZ1I2OLQmuJijPHOTO9/n/fYgI6ZhbY1R7k1A6etLGq5Up7
	 Qwq9+TOCL2FHqHvCpMFUiuulMUAFJWroflnLFur1+/3RtFjbOIAAZ5WXMykJYFoqMBQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4B4606A330
	for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 08:52:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4F4B4606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=GabG479g
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-38190551625so1399489eec.1
        for <linux-tegra@vger.kernel.org>; Wed, 18 Nov 2026 00:52:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794991944; cv=none;
        d=google.com; s=arc-20260327;
        b=GnNx1PytWWGOVpTtpx+8vZwjK7uegCvt7hHF2PVY9Gww9Gzgm3Vp6/9gpayzeoFryU
         uirRUcgaA8t1wemAkhDTiHLzkiDjRHGARdGLezf1rkxZ/QGY+AwUzPh8qfwLOpOoTxRO
         EJs+/1wXyLiz9DZt7d55U9vYucEQE0fHJDEx7nhBNB/ApY8uRV4nD+nlcC2CCqwRDGti
         nABTLBq8zJ8459fhaj4K1+GoRtzTSN3c9KfG5eqRvACHclfZs/d5Er5lOCYelmArTMOY
         2+y7AJ4j8gppvRy2UbeicNrgQQr2ke8rF6QI3LTHGx3UwkKsWpvOlWsxIimGUJCtT5zn
         GzSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        fh=fN0++CUaNtnU9H2iSOw9pkPx3CqV4SByhaGUTf7qjcc=;
        b=HhYfJ9qkWga0GP2rAoOBd+gQAcDKh8AQWRgyfxBseFYYy+ZjNqBO3x6YzeLOPf+Irm
         bA6B9jUCDB8kqdCad3JU6uJEvG5DNl/u8ec4QSmHxBOVE+QjuGZdZGaMHPxhGtW1yrhp
         ao8UqHoPGcldPpRqzjTg8w+onKZP+jHN5tKV/2y1Ctkim+wtj+mOa2m10iGeogcDm+C4
         m2TQXrb87O1vYC/k5IeJfVmuuqYk098XKLU0kCKMlYcvNYtyhIB6jjuxRQbct7hOvOwR
         tyFxwQ8xa3rMVcorg1nWtcJm/2w9cdFOqPHjfthPafTZtri7FUATv06iASrsslPjx7xi
         zU8w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794991944; x=1795596744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=GabG479gc7SQtMKk6DUrhHDQXHroIceWLhNoIHp0kZP11T4uJNV4ts4eVR2bGpM5WI
         8Mhz2biSzc/F7bv3izo8A5vZl7wp3vLTa2I2Lqaf+gLsKbgflvS1ReE0JkPH2eXxg/B2
         rBXOpfodZSW3bGHJ2LZPbpNK9baCxzFl9nHtbLFKA838yANCndxu3C3gYthddFNl9nht
         JzVfgWpqrzL15vRDk/jeYU5loe/y9d88sc6QFsJ76e351jUPEoBzazu5kTzlgOsaaxuj
         klgmv9RQuGyOFaPK//yZO6OuIjOMR+Ov2oYOrE8pGUKIUYb5tqnBmPWNbS1qUBzO7VyT
         NUZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794991944; x=1795596744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIgoSWi3OXpDAQd0fuya5uSx6BuLk2gilrPbc6gW7IE=;
        b=cANlBcNJTvxt8xyNuKJtXC6tpJkGRgZ5UOh6OidDMWnLVc2GfD89jN/c9QX2+GeA17
         Cym2IQ3T1mFwsiTZIyvSNtay7ub4e52jtquQqg6Eu+DRejvFhKf1zguSeZkhZG7/al4J
         lkC2l0uPLId/ovRGji9wpFhGDn+eHcB3LNaDo6MsjuyJeLMTWsfLcRtLcJujr83oZIYC
         noxJO/AZl0xJGCJ64RRWocoS8F9dR+UUuAGFwUc0kLj/T/H9/PhHxr/9x3sqeL/wySQq
         4NzCbxkUixIU1z5T4IbI/Qq3Y+YJgUTRl2mq8TeVvNM5ghqX9uoqGAeaL/+JXlbQDG2b
         EdrA==
X-Forwarded-Encrypted: i=1; AL+hErEbNdGxRK1OsDwEMsMg20ACovdoKIOX82m5Zsf5mqrHum3oNF2gs0RPn2a4GawGGLLP/DmC4UcsMkB3bA==@vger.kernel.org
X-Gm-Message-State: APuU4Z8xLki8nmTkErHA6H462fART7thKurVWu/5eWPu+asIPy+Ac5Ue
	mJ09uc7XO0QBQf5ZgDl9aRouy4SKxea5i0uY7DeDoMizESfdFD0Rr4uYsANs/fvsgWw8xh48TbC
	jStwbSWAZpjuGqvuXwCGTpjikxLFYb6g=
X-Gm-Gg: AZFdTZfMSFCG1ZQcuQ3/A26S+b5YsY/AqgnPXVQgketOR9wedjYC61L+run//8YoQgt
	DknHUwsNMPfJN5M4Tm7jqOC4EX+nodEi06rYp8nWDjdM0eZQt1IQ/IN8qv4oYoUYaMJSzwWea06
	Vs3zW+OKaN/tmVS77xx29jGEYDNGofQ+7xBNfI1NQUumFJmEeTenNkNzBXDbzh039pwoUFs3Ffn
	iycgR5qkJpDOxrcuWomNUaEzDGbbZjG7cyRD4il4xnc8XjJ6Kq6GPqqzCrzzfd6rKtUsigq0aUU
	ydXcY6e+xw3BFA9vehhlpCIw+3asU+Y/eSHXbtCckeb1aX8JoQB08YlzljGiDCHn62vh8Rhncqh
	DNzjksj+rLbh2UX069eq6K5Tg0J8SyHzRXeZ1ITti1LkJSIUyqOwthbmF7JijZfwnxZshxg5pJ/
	hSHm4LFyVe39wYKkPu0PF8ZEHcqgMyGA==
X-Received: by 2002:a05:7300:d210:b0:374:c5cd:42cf with SMTP id
 5a478bee46e88-3828180f712mr2187391eec.35.1794991944368; Wed, 18 Nov 2026
 00:52:24 -0800 (PST)
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
 <20261026222928.GA15139-robh@kernel.org> <CAPVz0n2rkWikz1CZhkKiZnX5P+NdDH0RfJi69AyVTEV7qw_VXg@mail.gmail.com>
 <avxHzF-uiOAhwXIW@orome>
In-Reply-To: <avxHzF-uiOAhwXIW@orome>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Wed, 18 Nov 2026 10:52:13 +0200
X-Gm-Features: AclHuK93RBJ02mfDmLX1EGnWRCzqbB375hZf8dudgwlzH98v_5reAPWSy751p0s
Message-ID: <CAPVz0n2h_uzr1MRZWSxUiPwu0=mXjhOwaP6HTFHDRV9DmF4z3A@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea USB
 properties into a dedicated schema
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Mikko Perttunen <mperttunen@nvidia.com>, 
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=B2=D1=82, 17 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 14:4=
0 Thierry Reding <thierry.reding@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Tue, Oct 27, 2026 at 10:51:52AM +0200, Svyatoslav Ryhel wrote:
> > =D0=B2=D1=82, 27 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
00:29 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> > > > Move all Tegra-specific Chipidea devices and their properties into =
a
> > > > dedicated schema file, by analogy with i.MX.
> > >
> > > I don't really see the point given it is only 2 deprecated properties=
.
> > > Maybe those can be removed? Depends if they are deprecated and still
> > > used or deprecated and removed from .dts files years ago.
> > >
> >
> > The ci-hdrc-usb2.yaml schema contains properties that are not
> > applicable to Tegra, and conversely, Tegra-specific properties are not
> > applicable to qcom, nxp, nuvoton, etc.
> >
> > The 'nvidia,needs-double-reset' property is required for Tegra20 and
> > Tegra30, and it is still actively in use, as you can see here [1]. Its
> > marked deprecated state appears to be incorrect, as it should simply
> > be restricted to Tegra20 and Tegra30.
>
> For what it's worth, I looked into this a little bit to find out why
> this is only needed on USB1, whereas USB2 and USB3 don't seem to be
> affected. Turns out that USB1 is a different controller than USB2 and
> USB3 and it has this errata. In retrospect it would've been more correct
> to assign a different compatible string for it and derive the quirks
> from that, but given the ABI stability it's probably not worth
> correcting it at this point.
>
> Thierry

Thank you for the explanation. Having a common schema for many cases
is great, but IMHO mixing different SoCs in a basically SoC specific
schema is not the right approach. Having a dedicated Tegra version
like i.MX has seems beneficial.
