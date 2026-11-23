Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795448209;
	b=z4G7Dbushmkdw6RA6Av3KbFPqy1JVWeyh+0iWWtMzk7tpPjkCXt4SdvuPnqLvRvEo8MG
	 31K70e1i8ySiEVxiQztf4BsI9kIiUfRwqLYVUwAGhAGQv5MWPbDrh1KnHGPQDnT8LtglQ
	 xnTBzw3gC7hylB46ek8WcyWTHUBsRD7P05Gh489lOI5+2Jpoovfv3YBHrde2E9Gx5R0jU
	 b+7TU5Fu6p3l1b+4ZnbeKW6BNV+8HS9tZoLM0nN9343+81RtERcjjSkHogJS0yZ1Yej4I
	 RUjTpubtVAZ3SdzackPj9crjAZc1VoF/y/Dn9xRlOz8VM0MOGh0oFmnvIMjWHzTpn5g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
	b=uLCVDilZ+2Sr9PYHbeb5jb3vq1eo3abV+1t9ZsKA+mzPbIFqUotXfe4yuZAbzPe9ROp7
	 oa+6dRD4dqjK70cBeb9so2PZCYGzWInSFaxwYHNG1MTf9KYqiktO7s4+6YyauM5qjeaX+
	 cbxR659mnFh3ho8B8GilnWPJoDA8MHUZF423i32f5SsNF8vgoBU11ob4aC2r6a+MPJ+Km
	 HvtqEP8sFS6egOHnbOp21x10WXLBjiYc08/WwvPOtOYiEg4J3JAbm7uH55WXt3CAdLnBC
	 Bi24xtkEdT00cA3vZudNywTpIuopLfNt+9y+7pLf97Ux25eMkVd63J1aP2Ot8bJTmnQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F761606A330
	for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 15:36:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9F761606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=rhVeuiyD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-38699cf08dfso3315168eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 23 Nov 2026 07:36:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795448208; cv=none;
        d=google.com; s=arc-20260327;
        b=nk2It3v8+ARYfUtEpyshFu+Pkdl/zPqcVxMPvQjKxzWfw2mXcEFD1fmDJOcc+R/A33
         jGvBhwlipq5t0NKgD2JP4lg/E+LtDPvm0Ybq/ADGVpnQP69plchG6p6xENt+J2IbOQfJ
         7Y4UCOBFH/Ds6/ZOtP0QW4UWCeL+emDDcWRaGqeqJ8Q4uWiPoRv3hbxwoT3IZOcKRUli
         LG1EHQzSDal4pf5gedioLqOpNvksvGswtOonB1/eBWuWjFzOvQPTJk3z2RHjfVh2zAhY
         8lfjj/wWHo8YoN1KoCJu8PUASRYHer4/vZVVWqjBfkGlBg/1E6xYOu6na0jmSkRNeQPL
         gutA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        fh=ky/+7ucJCVUR0ufgR+5D+yh9IEQ6s6yssSOjErhEyE8=;
        b=iUVE5R/gMLR/D1u6GaIDXP3aK7CAtUv2gsFKGRdiyQGQNgGkQLRd2PvpP0vl1zbAWW
         AOfE0tYiL3izFq9ZQPYk2qwY0kEGMNx5q6BERlWYHIlwoWPwQ6horJXpo9QwWVGWUGCj
         wn0A7R0MZPPysfDM4uF+JrfOok0QL8E0f9rGkHZFnGJrGfjIGIG/pWYifzELo3MB6aAN
         ejbodZYBncXuwROCJ5K1Rau69QB3PObTLxkPPZr7g/h2NdBuyjvsws1ywVrDJErmAfA9
         0Qw40Jcm7dAXuV5g6HAjk05lYtCUqohiI93UEnzu5jECKdUlen8Gj1e6CbBVKxDgjvsS
         uKJw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795448208; x=1796053008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=rhVeuiyDGD6m7uUohgi9T0W/7eHgowCSzNgM6wFCIaF3tFDNkwX7vA3Ae2675ZGqR8
         zB6651frVOqzOa68J7FiE29B0IyQMmWvjYyPZYUxc4c7V0P4XfXFAed6Ww6FwyAIBHXN
         i0Gaexq7ulQrJBhDuPSVE2JVDW5nQYgL7VDuFrqsMlg4h1ZN+4tpb7QIsnoZNX7NuWl8
         hyJKkfxmyGDo1tKTEzjKYm0/aQ7KGPBLo1SN6/HXQQa2lImCFF/O/58GXvDDk0qWo0f/
         9qgqNhRcbxIqjiwJKCsQ4s7o1m+upIyOc5+6Oghf3OGv0MaSzHXP68pGCZJe3K11M1zS
         VaEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448208; x=1796053008;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7pmbTprJSDMNaET1p8KH97keYwTTHp2TnWKNbSbIQnY=;
        b=UkVcRcEVaDmaGqFvVS7g4F8r8vZcQidi/vASdH9ChUsFvnJvrZfZfGFmNmT5DFwpG/
         5jyl+r//rpBop+wNpTvOvdNvdQyiWPqVEraf25fsq0VNpqm07m4yKcfHojvbgzCpSxBi
         v+3B4gslqvCgbAg3k0OuhlqP4Igas4DQ1GlRzsEhWTIZBT6+DdOzmNoFb5oplqZDFjYJ
         p1B9uexV+p6baFJv0vK5xvqBXtRWR3GL5I5it2wiD1Tdy5kCBDH+FpdndxOVdQ/t1kve
         30Mx5dt7NRkAu9DOFc9lKIoWYr5BcuN2mD9eYU2rROb9wS0it5pGmy3mezaeUlk+VQHM
         t49g==
X-Forwarded-Encrypted: i=1; AL+hErHM7v2pBqjuYgxu/T5pj4RcsSr80z8pVBeyUwXVn8WANKUT+wKLjnmIMvnpW/pm701Hs2P0H3LZkSx26Q==@vger.kernel.org
X-Gm-Message-State: APuU4Z9A+XXN84iI/ggFkMEZFvxsXIF7uMq/Qpw72Vw76wOH3iV62AOX
	Qx8WCU3TXNTRga6enxvpNVVM5qzXpMRY93HV7iGzWkpvhd0Z+26POZKCf/nsc6Ca8QQ1F01gGc4
	gFc/Kzxp6aWCqVp6RfGe9hR8qFJnTp8U=
X-Gm-Gg: AZFdTZdvErTQI4fpJ9cCmwEfCRcAw560iuvsjjiTI893WuoTsltlg2oidkcVIU0Rh2f
	3EuvtXY4GV55yT3p40VntS6e6wUsaFCU2kfAcxah9H8Hd/uWuc8jbtV/UG63m/upQl7Lmvh+5bV
	GZ9J0M2xwMWU+PbLfOZqRBpkhQuH5VD6Bf2UEnb32UXfeNTUsU3G1z27cgGpZYG5fj+X59hFzVN
	nYzSGEUWaoiuiNqdHDsF8s056vb6oBFwHOZR2wHSX7VLYDsC9DZaeNCYg3jK+smdWXckKx/DM3L
	SNFgwiHpZM3zX80YAt+SInDxdMM/K8PZbyRBuz79h8cs5NPvPIzpNArkk4/+gW7m0GFfVoAIKmq
	pZURxXYBQjuNjs8G0pDOvrAYnPKNKQzIml7A7D5M5gOSlOzCljcotW/wpXL7+2afFP6vZe6yohh
	pLFhHVLHkfH9D4WrnTPCBG5s2fLXIhRTI+ykI10TeMZEmX+CDeBto=
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id
 5a478bee46e88-3856c4b844cmr11761769eec.1.1795448207689; Mon, 23 Nov 2026
 07:36:47 -0800 (PST)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113161819.36847-1-clamor95@gmail.com> <20261113161819.36847-3-clamor95@gmail.com>
 <20261123145520.GA2412988-robh@kernel.org>
In-Reply-To: <20261123145520.GA2412988-robh@kernel.org>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 23 Nov 2026 17:36:36 +0200
X-Gm-Features: Aa3M54rUDkGOVQLPkkzUTzUHY6vBcwEurritNE5bPXzc3P_S34AV-IYkX1z3J3o
Message-ID: <CAPVz0n1sOsC2N+MWEZXN3DYGBgLicS=+e-q53KjBYcJtLiWXRg@mail.gmail.com>
Subject: Re: [PATCH v1 02/10] dt-bindings: display: tegra: Remove Tegra30 fallback
To: Rob Herring <robh@kernel.org>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Sowjanya Komatineni <skomatineni@nvidia.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Cong Nguyen <congnt264@gmail.com>, 
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>, Dan Carpenter <error27@gmail.com>, 
	Hungyu Lin <dennylin0707@gmail.com>, Hao-Qun Huang <alvinhuang0603@gmail.com>, 
	Yury Norov <ynorov@nvidia.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 23 =D0=BB=D0=B8=D1=81=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:5=
5 Rob Herring <robh@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Fri, Nov 13, 2026 at 06:18:11PM +0200, Svyatoslav Ryhel wrote:
> > After further investigation, I have found that Tegra30 requires a sligh=
tly
> > different programming model than Tegra20, the maximum VI clock differs =
by
> > nearly a factor of two. Additionally, Tegra30 does not require the
> > APB_MISC workaround.
>
> If the clock rate is a function of the sensor or input resolution, then
> wouldn't the h/w design prevent that scenario?
>

VI clock rate depends on hardware. If wrong clock is set HW may still
work, but be unstable, which will result in unpredictable behavior.

> Does having the APB_MISC workaround make things not work?

It does work, but my main intention was fixing clocks since Tegra114
does not work properly with 450MHz. That was why I even start digging
into this. APB_MISC workaround remove for tegra30+ is more a side
benefit.

>
> It sounds like things worked or could have worked with only knowledge
> about nvidia,tegra20-vi, so I'm not sure this is really justified as it
> is an ABI change.
>
> >
> > Therefore, remove the fallback compatible and add a dedicated compatibl=
e
> > for Tegra30 VI.
> >
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> > ---
> >  .../devicetree/bindings/display/tegra/nvidia,tegra20-vi.yaml | 5 +----
> >  1 file changed, 1 insertion(+), 4 deletions(-)
