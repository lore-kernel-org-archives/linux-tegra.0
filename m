Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17DA321504D;
	Wed,  7 May 2025 15:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632702; cv=none; b=nmZiIeZln9BAPIr0ZCrheIJfRl08iCruxkDKKWPH9J1eybaZCR3boUDGzMwz4CfCrdunaR6EChLiVb3OTH/tlSyLCARBTek9wFdMGORCA+XLJegT8CI6dszwD63QwC1vhOpmcLst/1Rgm1J0o+ldJx8vzSjSs30QZdvpnCySiaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632702; c=relaxed/simple;
	bh=IpPwe4sDGsovYZM0+/DOIiNIo5tp1kutwmQemRZEX3c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=czOAiPWIBpVMdt3f67C3+MiJ3PVM9keuMzzheYmVsUHwtpz8NT2m/4UahBwGn9/ZtdROhu2W/v8anF1NOEzEMCxVvhzlU4cKb0iaXblV7WUc+QIdhKvHJj1Ao9pF8enAVuGYOlXrs1dTLM5Ide2rCEdhUVw1wlii44cSJ66q4qQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bUZww/XZ; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bUZww/XZ"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-39c266c1389so15086f8f.1;
        Wed, 07 May 2025 08:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632698; x=1747237498; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
        b=bUZww/XZResdVSLjRlv+1T+oa1FL0vpKuLM6Utrlk/l0hz/4Nz4+NVeskx3/TFJKrM
         df0lUiXEXIsghD6IAIGu/5DAlmWJAWcxvX79sbdwIcS8qniR4aXxdJYbPs0dnbgp0+xI
         Ik1TNJZA7rsEs/AnnflvhwB0Q6ZRD5hL5l9psYQKVz8TYcAlH401I/QfPfElht1jyQga
         pRKLvE3yzbvfidg6rOg81k4wb0qTnecQY/6xoT82znw95IsMrsKsKUqf5nC/WXx3/Zvh
         tMJgrabvq1pWUppE55R36V74WpzAiYGMaEw1QLJ95rNyevBz3jMarRFM5dyGjvyJwykd
         h4Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632698; x=1747237498;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=byHNTAzoVmJ12jHVr8chWlceaJLIIt4EKT+rNT09G+c=;
        b=chpfTpVIf1pwfHwQmGIkVGb0V9foBeQnf2QEEC0IRXSbEVIvugucMA9fcLMmUW/MZj
         ofsfjBVn/RkCloslyfsbXcBYjAI4VZ92t46r0IS7setUoKL0CBVyVa0mfREf9crqeCH0
         IdmORXfC5iSucKETk+h1TLyO+w5IJDTXl+oCGcDU7yT1cRVTRmkjRsZQ7ilrfhSN971n
         bMbt952rS3sUiGcY9VbzSAqhxqehpgt7c1qWRcNhO8AOfudtBdo14X7rckS3iBdAb/Af
         ueXpj7g+tLYmTWnnhdR12xWF8Rw8mzNT346NRxX+byHiR3NldCgWheEErjgNFJVB3MI2
         7P4g==
X-Forwarded-Encrypted: i=1; AJvYcCV6a2k5uVMXfXxi+y1abx7aHWhCvSBxxy5wMdiqsWiynFesy/4u1X+E+woifCfRaDTcnybufS9BdrWr7zU=@vger.kernel.org, AJvYcCVHuLyD5w3b2n1crcd34WLpqwhIFVu/rQCwsI9c1DG5QHl3/Snc4JOy0vcu7/B0lwuNCyAEX8tkgTm+1PQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3izatg9L9U8Cc7y55cLV/k61gByLuGYHpklURteBQsACNdpoH
	DsL56z3sj0fq2jvy454S1UYd5WScHhcxrS+CCKs679lVaxh0U+6r
X-Gm-Gg: ASbGncvqAgI6+AVrWjrHMvAAZeRKs0WnfOSmYm2rg88tkHnqa+ddpXMQBsm1wyc8niv
	tSDvX31j1zhLJaLeyNNKLXgY+dnN/adTZ0/0trWKECTQt5SHIvD2/at74JhZjArqSL5XzbodS4Z
	r0gcW+G3VhSUWBbRiR5kdBGI++Rbp883bZKSaMQMYFyeKwdQg3np1d8ZvkcbxKJFMWn89CrW+Xv
	vaUsHVCDPBEsuk8DxsrghGjodAWOROxiA560Yz381r4YLtjL0FZLG1h/RdvpVuihgVry07stfXK
	+0Y3GEON1Ips2mVzJ9iGJL/vrhdTfD4qYaoGSvXUdXIsXO4yazZGBrq7M5ns+npnkmfK76V9h+m
	lOihavcwWJn+yfR5dv3XePUwn7+U=
X-Google-Smtp-Source: AGHT+IHfJJG0cs4abjEiWvnxwVTISrHAZEF9OSHQcqWVHkiT4B5VkyD3vvSWb6GVCRi9QWsDxzrI4Q==
X-Received: by 2002:a05:6000:420a:b0:390:e8d4:6517 with SMTP id ffacd0b85a97d-3a0b49bee22mr2812986f8f.21.1746632698276;
        Wed, 07 May 2025 08:44:58 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a0ad54f105sm5672659f8f.85.2025.05.07.08.44.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 08:44:57 -0700 (PDT)
Date: Wed, 7 May 2025 17:44:55 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: shao.mingyin@zte.com.cn
Cc: laurent.pinchart@ideasonboard.com, mperttunen@nvidia.com, 
	airlied@gmail.com, simona@ffwll.ch, jonathanh@nvidia.com, 
	dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	tomi.valkeinen@ideasonboard.com, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, michal.simek@amd.com, linux-arm-kernel@lists.infradead.org, 
	yang.yang29@zte.com.cn, xu.xin16@zte.com.cn, ye.xingchen@zte.com.cn, 
	zhang.enpei@zte.com.cn
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use
 dev_err_probe()
Message-ID: <lihaxdejm7rvuurpoj43hf5zcvrfqlztdwxqs6p443jt73noqt@iipbc2udbgo5>
References: <20250402193656279azy9TKahAE5TQ5-i4XCQT@zte.com.cn>
 <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="rt7ige55tnphtzlx"
Content-Disposition: inline
In-Reply-To: <20250402193758365XauggSF2EWBYY-e_jgNch@zte.com.cn>


--rt7ige55tnphtzlx
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH linux-next 1/2] gpu: drm: tegra: dpaux: Use
 dev_err_probe()
MIME-Version: 1.0

On Wed, Apr 02, 2025 at 07:37:58PM +0800, shao.mingyin@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
>=20
> Replace the open-code with dev_err_probe() to simplify the code.
>=20
> Signed-off-by: Zhang Enpei <zhang.enpei@zte.com.cn>
> Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
> ---
>  drivers/gpu/drm/tegra/dpaux.c | 11 +++--------
>  1 file changed, 3 insertions(+), 8 deletions(-)

Applied, thanks.

Thierry

--rt7ige55tnphtzlx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgbf/YACgkQ3SOs138+
s6H2ZBAArFAuCN0WTxbq9wpDNT3hPLUMpHA6Sdh2TFEGIklk5Hj+oHTcSPS5AV9q
uvfJynPiWqjRY4dTAs0J+6IH1R7eo/Qm71jvnoPS37oAteCO3hQqHeRVGgWN8PoH
vWwKaO4T/ipB8rcUfqv8TH/b74FIchpMB3/K5oaalRKjPlYEs7rahimhPq0utf7u
GELGnbPiXftDKLXxXkeQ+sXdVcvIINIikGobmY2khF9oxb43kN0JlRqxnnNF0lHh
0+j2q2TMEGQRr/V8+avobslZXYkqyuBOa/RaWNN7W3Y4kBOEXNxOn3GoN3hkaaol
WrXzjMX2k6OVU+MLYxR5+G+OWNRVXg/GK6KbzE4O1zJcJ5zhWssqThv61Nt3cqgz
nby8EIlFfV+/Yjus8iTVKE2HcntU2vbi0PCB2HHdzkVGwyha9nx9lprcq83N4HJ5
rKg3m+FP2tnrT5/JBg39FN5OftZgjN7q63WZwaly3P90pP9OhGKKDGE8+HGpzOea
mxVEb+8MwHag8/vNh8LHLxMLTTvNb4mn/pbmTmtFU4v/sDnsFtS0zcTAcDiY7tsL
0n/8gjh/ELimcnCQMWe4v4RGb2bCxSIFupwn2o01Shq3RgppcL+yEng2D9cJ+NVV
TdDxber+/HIqgTWDWoMkq0D2FUZG0pN3DPMF0FXUIQDGQAy17Qs=
=2Zbo
-----END PGP SIGNATURE-----

--rt7ige55tnphtzlx--
