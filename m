Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793353351;
	b=iaWnSn2rwczhoZ2FJaulJm2JPZJ4i7mx9i5YLf9/cVuUH6NHqP3WDNRFFb+T1OYzUN1y
	 hxZgCUTwsNLOGuTKtsOOvWeqbU0bkKXcbt7DvAIeHPeyZyXt94jucin7qqi2gkjhKEbO8
	 dpaoiqmvFDUwtjMVNlGfXrTGwHrez6+OSXoB8mh1Kxuz6560wVwF2Ve8uhJFTgE5gKgSU
	 zrB3pC5j8+V2L77D3Bk6CkyzYOd6SZ3cdG8v6mGusZnnN6Y3Gg80kzppUKLlbsMjg8Uti
	 STV+rPZKVIkgtED2VH6oKnrJfSu2G1nPYVn15fjlxBR9zLHfkEJ/httImVcs0DOc+cA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
	b=3J78155Bx4cTlfZQep9aj0wNxaJljhrWiHegIwaPK5d1eWsCvn8eRte5WSukV1nVvthF
	 wfs3Hr0GvoBlULJdBYIwNK4eFARyIWrENRDJbJ+1vrnTCpKXT7pjMxGe80Dot676m3XlA
	 oCg6cKtcB78R36QA3spG4vSnPPcALetI+Ols6PbJt+piWkxoWuaB2GSBXM70Zlhe8pMPl
	 hYlWgyINf1XK9dNzPeFrQsy8/4AkOLyxcsBpcKndoB1YTiFMeks2HympIkQ54ZMSe+5W5
	 Fv/lOPd9phD/DiQtE0PB1irUTT4MUT1TTbMtHxhsDKSMM/i9DvnmTmcw4B2w91mi7dg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="VDvo/8AL";
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944BC606A31A
	for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 09:42:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 944BC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=VDvo/8AL
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535a54bed9so837675eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 30 Oct 2026 02:42:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793353345; cv=none;
        d=google.com; s=arc-20260327;
        b=rQNS4v0BIc9CeaJp+ZNLUgQhP8ddWv3/Shl5UQrkVQQbdw2v+WAwNfd8ca/+Z967P/
         tH2PxTaRT9NOXvI79oNSv1RGfcSvrudZa8uB+hUlEr0+Zr6Ob9eotVTceAVILOvCkkEi
         HZqBsw5gvBoui7+mukkboa6RTjIFFa/KpsoCyNNwosEj2N53FIqszPjvLu4GrNFItXYb
         kLSaCep7B3Iayp4Y73W6453pcD4uLQFhFkavJgOYkWNTlxfapVXWV6T62n9Z+n78gGvN
         NJrr9pefZ3AS+T0p2zmJkf6AEkK3ccBOzO7tsMANeL8DuxeCgd6nqrtsAE3M3Mwb1LOb
         spSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        fh=IosaIngycmXQhFpVTHd4jslndkt2FFpFOr4aagJf3ko=;
        b=sx6XnkdJ/0aXAIxRWFLh9dkSW7bHWNT2Fne/Byf1wVP8JZ6bCLPHIxf/LFR0N3OlkU
         erKT9A6xercKCX5zrg5nGwvyIQmOz+1EtuC7xhohpTogGzN/Ck/x4T438t/uT3uYtSpV
         84POQXNusVswqx4+o9v1/k07PQ0FF3qSZm1hZ/J8pzO4TBAEStjGQZdF7/3uG8yGOic7
         u/SbvReXn1307qAR+/6CvUFp8RlymjhL27iIIkN/34VGv2X8jd5/LRful6GEXksNNSA3
         z2xfMFp13hUnfi39fp8M02qhmIDJTSKjws3k+M1qh7z+i9kqQaJZsBeWUcRDyhEZMMvA
         DN4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793353345; x=1793958145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=VDvo/8ALUv2o8vLeBrFjgi8x3hH7i8hY5DwpCSk7vhJILEgsq4TzXiHzvm7k83zNTV
         udkGFuGOUraspN0Nacg5Ghc3c16IApQsRqOaDzzJ/ElVmieliY16mbyUuEWAM1ybuQ/V
         T2P0+B36wbYw3INCWqsEKpVMKVuOBrlxmNh2siJ9dpzo2J33PlWRLE/4s44nAMEaVng3
         O/7Ob3zdUjUnrhk74MT5Lkd2I3Hnu4punHB6tcGdawA4Do0SI1R+ANYc8CmGTN2C4K+2
         eU1vHiRoX1/naqUdmPws7e7NckwbH6li5mI+L28sU9q6vWsh3uFaCTn+1rde1AOPFoGC
         xTig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353345; x=1793958145;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GDGY6UPfJWemExMe2Y2VGpgaiOOBAPyHFBWs4EkVRgc=;
        b=hJsrqV+z75r2JModZgDYvpYU10I6ukagnB3HqSvYnw/FUEaYsFLm/olOoIYt3oLkZc
         bViVF7tvgkuFZK70NnPZDR58WpI0toCX1uzgpmz2XVVE7XC8yvJKXOdbV0lYJYjoVVS6
         ZAoVRVHjuOuZ2jiOFymo5AVBQn05MiyBYcG6volqWie81G2MFYaKQmfqWpOONKrD+wg4
         /l2jgo5aHd+3sCoO8hd027pXYp+BOn5kmIgoodw32ZuaykJ7l096GOQ1eFse2tBl/Lu7
         yotdKTOcrh8BCSe6yKk8Hr7F999Obdrye0/IM9uVlwGbQuG/oLgfAS8kEKEe2fX4cU/l
         oZtQ==
X-Forwarded-Encrypted: i=1; AKwUvBxDu1xhae7AlRJZb3IUfaA1RrhfPfMAoyGqp6Qf7XScMvX4RjCYw+mPskcthla6k6b3gHULqqjNm0h2/Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKbFiw3nxr4yMCpeyrvzy7uGfKlHIKk0k/u/FyBWH4X90TI2cEO
	Rz61HojQT9gsMevA1x+n0Dym04l4Wi3A/yhfPJKux2X6SofP+TQX+mzZHL2QITpKKeajbnbuVu5
	a467vQCjBq8V6cV4nHdMoZo0ghzdrVDg=
X-Gm-Gg: AYBFou0sR9wrJO6Ovc5pcB4YJNFSOAqLRREWi+bps2jQ09CUb7SNwXm62morF45WPOL
	klBV4UY04zgRt6pQE08KZcYNdD7GOamymYTklMHtBEQg53wp+B93qEhDSzEtzuMOAPIn02Yi6xj
	gqq2/ODwhB59CYzRfl4VssPOyO8aHyndXDjVaqo89wyHXxrnFsTp/JCNFQNCjujYJgW8eV8OaSr
	3/F7FB/CIz2s/dkzZzFBDd1NiJu8LS7YZtVHb5fJIMWJ/pqVW6Wam+M8RvMlvsE6XsegRa2irXI
	Vsy9hFQDCEQATuoLr09OOWTuoXkjkit28NKX+vEQrEnqGrbraVNBEVyyH0mQpda4ub4a6NkKOuV
	32u9rusTSx9VrGGOqLISXRCxBfpALK3cEynsW39NJ5dZDSRPGEH7pDUs4jxjurpdjrZ9TSQ==
X-Received: by 2002:a05:693c:41d9:20b0:368:4acb:f8a with SMTP id
 5a478bee46e88-36a4242f5fdmr2867529eec.17.1793353344529; Fri, 30 Oct 2026
 02:42:24 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029152909.234584-1-clamor95@gmail.com> <20261029152909.234584-2-clamor95@gmail.com>
 <auRjGM7briuvXDEg@houat>
In-Reply-To: <auRjGM7briuvXDEg@houat>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 30 Oct 2026 11:42:12 +0200
X-Gm-Features: AclHuK9xo3P5XZPZURXGSlkxvgjF2BR7aWoJEgrYiYo1jUomIQQhlZvP6BUv2IY
Message-ID: <CAPVz0n2=sgbzBfvhGOoRFXeOzKDvs9en7QD0pHc31r5GzgCsKA@mail.gmail.com>
Subject: Re: [PATCH v5 01/11] drm: Add MIPI DBI bus support
To: Maxime Ripard <mripard@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Jessica Zhang <jesszhan0024@gmail.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, dri-devel@lists.freedesktop.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 30 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 11:2=
9 Maxime Ripard <mripard@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 29, 2026 at 05:28:59PM +0200, Svyatoslav Ryhel wrote:
> > From: Mikko Perttunen <mperttunen@nvidia.com>
> >
> > The MIPI DBI bus allows modeling DBI hosts and peripherals using the Li=
nux
> > driver model. DBI hosts are registered by their respective drivers. Dur=
ing
> > registration, DBI peripherals are created from the device tree nodes
> > provided by the host.
> >
> > DBI hosts expose operations that can be used by peripheral drivers to
> > access associated devices.
> >
> > The original code was authored by Mikko Perttunen; I have aligned it wi=
th
> > the existing MIPI DSI implementation.
> >
> > Co-developed-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
>
> The SoB situation isn't right here. The author is allegedly Mikko
> Perttunen, but you don't have their SoB, and yours isn't there either.
>

This is up to Mikko to decide what to do.

> Aside from that, which MIPI-DBI type is this supposed to support, and
> how do you intend to support Type C panels we already support through
> SPI?
>

MIPI-DBI Type A and B, which have NO support right now.

> Maxime
