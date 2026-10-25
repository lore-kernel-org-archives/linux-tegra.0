Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792918331;
	b=Sjzjpu/wHxh2pKAvm0uXWsu+KHavKFwhHldAOf2W87RCjKh+ZoS9cJd5s4iG2sXFOm75
	 yX9OYSIv0y8DJ1FQGH+twIlT2nKxYVud4sMUoqqGwdQfw1616u+5ajx0FOA2xYgYnBFQ7
	 Qg32VtDP9iObhD86RZStvqxHY9tRNa3lzPTxpluXJmzbqM+Fx1O2Wlcrz6JZao/s2uN/V
	 +qQmaOuuezYKs87g8VO7PvL7Z6xzE8F6CQzyA6QX5BijSgdqtGDccA9AqyrMdaN6+HG17
	 UAZvnmt8QGFFIWvoMJPtnKtK31lFd9lyZoJnRW84lTy9grZQZcT+A2HFxn1hlaOX8EQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792918331;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
	b=nqdBRvz9A7e26iJQB+9WxWnJQd0xis6On4lry0m4kOSh/cxF50BDsNo/+PhyWu/ShsPV
	 cBfEYo+ZELgLSr9uG4SYMF46fopJBs5r+ADmiW/a8+zHysOQe/y+1qH15Yy6FeF45Bxtd
	 bV1eqCki/RSI1Em+yRHMXZxQLFzIeCHv3U+SsQnFUPFxJyeMs+4LsRSDkMGxJRGGSidJz
	 JmHswFrXMYE4Q1OlcK7fJvIF75kTYUhYZWQdxziUE8jC+dq9EN1cuOSXcKmeF14S5Y/3W
	 fibyYwmjoUe59NBLE0KbA2O9jKCBWtnkx+LkI1vlcQHBY5ZNLy5QW4zPXeQyZzqvT3w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38175606A31B
	for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 08:52:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38175606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso5862290eec.0
        for <linux-tegra@vger.kernel.org>; Sun, 25 Oct 2026 01:52:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792918325; cv=none;
        d=google.com; s=arc-20260327;
        b=JfaR6lwYOa9Bjt86YbExodrHw4rQ42ElzbcbvBbGmg2ho9EX7+WzWqex6tJaWksTBA
         7m6NdED/tJxB4dXk3s4ox6zxUtHJQ0vK7s+TOSRzP2MH5aEGGUylmJj0SMNIwGeUjbSP
         Cn33Ohh9SpyD0ZocLO1oTNu/4CLD27Z9wbv7S5/44PmZQq9sPZiypt1Czwj15n0z3YUQ
         Q8ppLwtPjX53Xi/XKX89kwlHvURtqDrDxXIG3fs0Kt60kX8eEfue+m2Ibj3uidKbE9J+
         CNah4lIoMneuWoXs7uRNir2lSXUI8WIMDWtXxFTbDCPsnV+zl32LCiJMaLzfjIeoOIEk
         jjhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        fh=BPlWDtCxJ3iEC+RMBzwa+ZXb7cuQ2eHQpTioqnz3rQg=;
        b=Pr15eTh3cZ1CTs0bAa5ygKdTXYCk00oJwSWRUOvzMjPEaCvirWtnazKYm4c5ONpo1R
         G4idfKzE0KF5qLBfvEoZ0tCZyzOzof5NUaLf8iHZNx78+YzS3jmRXawXDB36dT24zV1g
         WFWYP6AJ7OV2vdA6vcCc6bFC1TquTGv9HpDIps8FT6J+arngq1yzS6klG3fYJicYqXg7
         cbfaKeFuKb6KZNRuZTMqHNeO76bpLaeGs1zvRheD+GlY3wamDUbwtI5tNkcuoafJFCyW
         TCwla/u0ZvG6HKvqe5YS3SVSyS0lqwPv4/Cb6JdVUMmNI4CcX4+YVkvmc9/7/+dXhdsH
         gcdg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792918325; x=1793523125; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=fHuKXae/GVi8tRawUFa4lbNSNPGpcGy3etaTNS3Eq865jP6HTXqyTAU7pQ9lO5hztV
         L5T/ZeoFN1auALf2FXwqBPd7bBS2wagtMIyz37ToFRQMa/WXNVD2BEtbTGUextAR6OC6
         m8uMdrEus0LGhKtjw18ZAw7Xky2dQ1k8endaHdCWWVCVIQF+aZ43iOE+gZdVkiSA+7S9
         3rYxkMEDMFtqfVnmDFJ2mIM4OYrdYpqdVvaZ34/8vJ82aQJ7/B8SKZdFeN9aS9WzZRwj
         A/dKaDDRhdAcXB5yS5wm4iH2pYAGPR/KvcqTD1AaDgNBeRnCRbeFzhw1rqQLW1Veeq0v
         5J4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792918325; x=1793523125;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bc41FckTcBQthvtCzkFLVNCK1+fJ08FUf/3Pl3O3aMU=;
        b=qHhNrmHhTVGV6TTSQ7f9wl5nt2yd0YaPPispn4tIRKm6CxUggfnTH+tku0jMZ8cNQV
         BfGGdSTVMn70oOtrg319BAi6P6FznD7FrCbEnOIQJCO7Y9XbpWXuRq9iE02qF783Krv0
         v2ZbTy95p8X8NMJP1kJ5F0HraSi1JMCsmdXg6pLgDpkfSJWNdpXOirHTQJw/L9zE/G8K
         xXrJ3sxYeMsmiknUD4VAFQls2AKLvxuYVYPCyTKVXBAleGv/veg6DZYG3rY2B9HxS0Gd
         tAD1yXXdree+OMwoP25SMB1Ibr71h3bA817wtLf7f74waYF6LpeHzVYH2Li6ZAlo+ghV
         Q1oA==
X-Forwarded-Encrypted: i=1; AKwUvBzo0M9I+Q577bMOukq/JXFrS6mobjbIzVxj0KAjRCttYXAl76lN0+sn5F5KZbQAIS+CC62QozctksKiHA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLowIxXEiXr3nYrxv+wbOeS4J2Jn7mn6N9Fv9eAsGeIC++NvlIB
	nEKeoD2DsiqrfFsbj94xPOMh9ZwA1vo/lX1PN/sNNC+GGpK2Kw6cfPAavbYhAu6Q9uwSUbl+DJ4
	z6Aj1Iu7Kv36N/eiuTUGPypumZNCFGs0=
X-Gm-Gg: AYBFou2Q0k3qTRRxpqkUkF6qkI70TDWk5v1HPcxoNhz8TGnt0OK3O19ux7MZFEVELvn
	CYttipeS6fuKWtmvQmDCI5s3BhqWOQXEmOW5+YYGK66kiPColKl3+XkTy87XxVIu6LkRZ3yJ7HU
	15SXNHRGQXmSgmpMxoiySv3QwZ7Nh1HdHAZNfKHhphHEdgLiAopg2ZNNUHaUBRulhOi/RcOfrnc
	qLav1ttIwmHwQKsxNAtphMEOvbLaE4jDg+a1TG4c9Wn/BHPNdnrbPsM4ZtqQ+rbXLkG+/0edB5/
	ViG/MsZ6fH1QERV7Nwk3b8TQYBrDvPD/Zd/l7wJlWaTHQfZznZUW/lY5VTErYmSDjom8VL3uMzx
	96s6rOvnZgfSoyRVff5BaylNVksBrPx+pmeCPKHuMFMm2bCEjQOjxbGPaLXE0E9RDIWcqcg==
X-Received: by 2002:a05:693c:66c1:20b0:35e:51d6:9f6f with SMTP id
 5a478bee46e88-369e84f5952mr5827731eec.27.1792918325200; Sun, 25 Oct 2026
 01:52:05 -0700 (PDT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022132259.240717-1-clamor95@gmail.com> <CAPVz0n3Vrzb96iR5ZW8zvmruZ4aK0hKGKpJ2T9Ys+bSPCtLWHw@mail.gmail.com>
 <CAPVz0n3gzV+gAu_gzp3oTG9VOu-YiNSiQA0SdCFApKsi0dGjKQ@mail.gmail.com> <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
In-Reply-To: <0g7damfVTZ2r6s4H0kv6Lg@nvidia.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Sun, 25 Oct 2026 10:51:53 +0200
X-Gm-Features: AclHuK8VdLvGZN3upYS8jizoanUHoPG-jyCBtPV5Pp4C9VbRI_nvkyJWhb9qq0g
Message-ID: <CAPVz0n1G0cDuUj7WRfj9YRgvMSd0sqSCjnir2p=QxUGu5BWTXQ@mail.gmail.com>
Subject: Re: [PATCH v4 7/7] drm/tegra: Add support for 8-bit CPU interface
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
	Jessica Zhang <jesszhan0024@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BD=D0=B4, 25 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 03:4=
6 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Friday, October 23, 2026 11:14=E2=80=AFPM Svyatoslav Ryhel wrote:
> > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE =
11:26 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > >
> > > =D0=BF=D1=82, 23 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=
=BE 10:53 Mikko Perttunen <mperttunen@nvidia.com> =D0=BF=D0=B8=D1=88=D0=B5:
> > > >
> > ...
> > > > > +MODULE_ALIAS("platform:tegra-dbi");
> > > > > +MODULE_AUTHOR("Svyatoslav Ryhel <clamor95@gmail.com>");
> > > > > +MODULE_DESCRIPTION("Nvidia Tegra20/30 MIPI-DBI Type B driver");
> > > > > +MODULE_LICENSE("GPL");
> > > >
> > > > No separate platform driver or device. If a separate struct device =
is
> > > > needed for some technical purpose, we need to create a minimal sepa=
rate
> > > > virtual device, but unless there is a strong reason to have that we
> > > > should be fine with just the dc device.
> > > >
> > > > Thank you
> > > > Mikko
> > > >
> > >
> > > ATM, I use bridge framework to describe interface and I am attaching
> > > it to RGB since it basically uses RGB to transfer video data. It work=
s
> > > pretty nice so far.
> > >
> > > You propose to replicate how RGB works just for DBI?
> > >
> >
> > One of the reasons I used separate pdev was to be able get mipi_dbi
> > from it using dev_get_drvdata() from patent (dbi bridge in this case).
> > DBI framework seems to not have a way to pass it in any other way,
> > unless you know smth I don't.
>
> Right, I think using a bridge is fine; passing the mipi_dbi interface is
> properly done in other ways. The direct parent devdata link is a bit of
> a "poor man's bus", and sometimes it breaks down, such as here.
>
> MIPI DBI is comparable to MIPI DSI -- both have a hardware channel that
> sends both pixel data and commands. I think we should follow DSI's
> example and have a DBI bus and devices while keeping it as simple as
> possible.
>
> The DC driver would register a DBI host and the panel would bind as a
> DBI device. The DC driver can then supply the mipi_dbi object in a field
> of the mipi_dbi_device.
>
> This is a bit more complicated than a parent devdata pointer but much
> cleaner, and follows the existing DSI pattern.
>

I understand your intentions, but ATM kernel lacks any DBI type B
framework. No hosts, ho devices, noting granular. Implementing
everything just not worth my time to support 2 panels of device based
on Tegra 20. And I am talking not about time to actually implement
this in the code, but to upstream. DSI framework is huge, copying even
part of it to wrap legacy DBI interface and ustreaming it does not
worth hassle. And yes, I am a poor man, I use a parent devdata bus.

>
>
