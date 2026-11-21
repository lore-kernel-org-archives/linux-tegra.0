Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795219826;
	b=KfJkqJ3L2Ma6rVHGO6bRnwsjNlpePvrZrae9HFLCVIXI7eyLjZXgRBLJOaGqLBTeigIc
	 Boj0wcpGCZ/Rcotjf8YWTkYi5KbueOofuUATfF2EgGeAvyYTxOnBFlsQ7hivPNDX+ArTY
	 Q9BlOGrcq1VHWvshsk8+dsyPmdHkxaP795o4WR3/sA8MC46zVGLZ0wG1p9RQCOhTnLYIz
	 2gVlXnQVpzBS9NA/qHtROmR5TkzwqQWFRw5c+qJfWKZzNHnGz5t1ETMyLtoyPTS1aZlYu
	 7tB4OCX2UhvIljR5yFEZlrtTkrBOudggz20k5/3ah++vQ13a4SlwD1/HQPDxBgCrpcg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795219826;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
	b=NNDcyUG3G+S4FRf8+5ULdt7bjNVirmU8BHdMfgaFpdsw1fyBEnkKJJsGE4RK4e4+h3Br
	 +2pHfxlFPeBlvJcAZbOo9Ful5C6ktT9Wjg6tEo/6l9bCyrgcPcjFSzpDJZodGGK+3gDOg
	 6+kSyNfaJ3gEfvrmm5HpIfliGcohhASJXPE7olgdjNhq6qCDMXRVmxmH8NOWPadQUz73M
	 9xmdtzc2Z25MBKCUbpct5HVjPUouaNOJ5q0ygWEgohOx98s60aT0oPZg69T/0+betmOER
	 DsmR2KcOneVUkBPD7UK1DbtqUvKhHqxKCiPjLPdlpAmwot5AqMqAE3Pz0XRfVj3c9ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="rWu/61jM";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.46
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70AC2606BA8D
	for <linux-tegra@vger.kernel.org>; Sat, 21 Nov 2026 00:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 70AC2606BA8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rWu/61jM
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso3149336a12.0
        for <linux-tegra@vger.kernel.org>; Fri, 20 Nov 2026 16:10:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795219823; cv=none;
        d=google.com; s=arc-20260327;
        b=CnBc4viuHhdJUfwLzDSWyoQdzzdIvIp1hi3Eb4ag9e1Y4/dYUVoMWwG7JDgUgEf/FK
         vS8ekfzIQIiSQiJBC8OgIKqCV7RQyPC1ro4Xakd1adv0GcEOORo0DKfd1vJiwkzqaJtn
         4euWB44t3XFf5mHrmJzIGsDMNeL0L3denzmCQNQs/1+bGerAi4AyrLZFShnhsKD8T6/5
         sWQDJe2WoUpimlg4ITFeXv+8RI9jRXNWFSkPTTD7qk93xZr2ZVzt2TIE3XW58DjwkUx4
         h5Ab5DchNEKdPsAYXumONYeX301KtMY6sMDheFClv8GJoAxOkvrMldGIHKJJs8Lc0bAP
         dH4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        fh=UOSzB+Yc4cRaEdK/ca+BpMnFHGirYokwY0vrnS8zDhI=;
        b=jbkD3GX2C3BTw7nF3VHpaDML6U2/iQQPLxzs6s0QLx5zHHPf9xgF6yyiD0sOmXZFEx
         EslAjtWQAqp9BYXxnmCsNW5hotRQsIp4DTa+/X/WLI8lEYz7G3HFTfFI5e/n3HtA1EZD
         W6zJpSjBnBhl5tpSyNzugwPBUz4lZeHU+ZdVQ7IMbb26ursG9YeJEVeC2wx/4HRqsjOt
         Ev7FYat9u8WM81J4gMi6GPsYSToRgdgtM1MpuWMVZE7vMMK/xXLtmJfbC8yqwp8YhsX1
         TLoHmL2e30GbQrg49dxNb4N7xA05ao4Zn1+UTCq2XPDKCpBxnHb+jHXUzUhU/BiXHkno
         XgPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795219823; x=1795824623; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=rWu/61jMhKyJ7vUuMCuiQUvlkSliD77v7oad+tKvc3mo0PxskhgU2oarlrhRONLIcH
         C7hwCw7DkhFUS1Fi0FSKfOqc73f7DCAqeIXJaYqeWe4ua/i4C86BeHZBDLke7PmVjd4a
         vhA7/NktPXU9YECCmOqJUT3pzs8+bsZIXhief7I3hTFaHixljFNONSDfB+TYvmYeXBwk
         3NKHs6jdXfoLnmSx8i0rdzxQZN6EdSt04rLza/oDALWmDwZYp/6bz7aSa0ClSmneFf3l
         2DPP3lW/sISNoTPUtLdMt68jJvaBvYReon4N/wsAN41olGMHIef7cE9/j1YrSHiQ/M5o
         n3uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795219823; x=1795824623;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=btYTkEP0rN7aSSje7c80wAb1D+oRImiOAFk+E9S20/I=;
        b=ZmxzrcbExYlRurM8Gv6kJWXWgancHnTFuEDzOASM00F0RXmlGn7gpkyRvQAnnto37K
         UwZ0P1dxPp6zEOAkmwAm7qf5tT7thaTehjWvm5FmjpBSY+MxdDR5692MuD0N/egOSyer
         pST++tcQjKojDAod8lEvX5eZiCg7oc+YEme4eEXaECzPmePaW/SXBkaZNMU7qjOCpSiu
         q4R+QM95QCtxrhpFXgE9vyLio6oHAQ51Wh6mYv29HT7pLymYZRDtoamVoSfsVJAbraMK
         GhuniI1ly05ayHKMjFusN0CYu5yFJQkHMU9vWKhcjv71Q/BXZodUYcczar5H+JI8rZ3/
         ARLg==
X-Forwarded-Encrypted: i=1; AL+hErFi2rSt+uo29AIxOucsWijA8Mg/0ge6SgQXL7VAdpU4ImFOpPnfquKPtV/b3iGbRNs3vnflxGOpfAFGrg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+qV3VPxujl42Gf7P49u2IG5RnYByZmxWn+fGuhviV1elqxOzGl
	WsNqdyZEzQKZOso6U0zGB6dQFDdnoSsDgLd59wfs1PBYjIWyBaJrx0imyqqE2gci/nTJCm9zfi/
	IO2pE4xaiVp0QXT3pmfv2pMx45JKSVh4=
X-Gm-Gg: AZFdTZcixXhu/gx8gQ5HIEgzSC8k+8Bnz3vGeYi9UQWnmfsbQ4j62AHM/YxC4qIgVI5
	H5OOxkzZAeijsqt5n3CO0vReBwnq0jAPOimgB3BiAwjSQG5uicGmVdmWGtJxasBxYDUdJTLWxq0
	STYAQS29DYuP+p+3iWlXSMnXmxKGpoJdknTCrp3UfuYA31FnnZ2QCdaiXGwztt4RAzGrToOI3yh
	1MkTY9SO3gLiPeqX2Z4SHnPnY5SvYl0ma/zvllSddaUAhOmnglW7UAl41R+dNFtbCkgg5iiOWeY
	cA7yBvT1i9vmC9qojqhfl7b3hDzC1eBIoqaYwr0o+rbY/WHz64LDVYgl/CTQMkhDZ0js8UazyGR
	rE/wE1eh5MgISd8Ctfrkl1j3q/DYzRJU2Vq/4RJ7iCYGNx3lxL4W04EzgnfDfS24Gr86Crtmv92
	Fa7fIQ+6sJnFj4e6Hn4ATmuNXuA9c7NOGpXpIfDp4Iu9wC5iDhJrMM+X6eYiQKoeH02L/NriKcr
	ZRmAb3+6hggLsLZeXDGUIJNYqgTn71xkykjFDOPcPSpzdANvrC50gm/x3LdPfndqDR74C0=
X-Received: by 2002:a05:6402:3514:b0:6ba:144f:ae3b with SMTP id
 4fb4d7f45d1cf-6ba37c76a3amr3704257a12.4.1795219822716; Fri, 20 Nov 2026
 16:10:22 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260921015952.1047410-1-rosenp@gmail.com> <2026112019-remote-retrieval-69b8@gregkh>
In-Reply-To: <2026112019-remote-retrieval-69b8@gregkh>
From: Rosen Penev <rosenp@gmail.com>
Date: Fri, 20 Nov 2026 16:10:11 -0800
X-Gm-Features: Aa3M54p1_AfZUO6TiqmxTg4P4xauKpOoOjWuBAIoMhd1On__6G_1-ybx3Wy-ssU
Message-ID: <CAKxU2N_kX=HoQML1_udexrqM5h1o6-eegNhuZzMORZkSRVJ8CA@mail.gmail.com>
Subject: Re: [PATCH] usb: phy: tegra: embed UTMI pad config in phy struct
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-usb@vger.kernel.org, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, 
	"open list:TEGRA ARCHITECTURE SUPPORT" <linux-tegra@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 4:40=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sun, Sep 20, 2026 at 06:59:52PM -0700, Rosen Penev wrote:
> > The UTMI pad configuration was kept in a heap-allocated void * member o=
f
> > struct tegra_usb_phy, even though the driver is the only user of the
> > field.  Embed the struct directly in the phy state to drop the
> > allocation and the void pointer indirection.  The config is
> > zero-initialized when the phy struct is allocated, so no extra init
> > is needed.
>
> But why is this needed?  What does this "fix"?
It's only a cleanup. That section just clarifies that behavior is the same.
