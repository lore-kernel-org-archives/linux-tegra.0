Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2A153403F1
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 14:59:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066747; cv=pass; b=nAhx++GpklZTqqwqvZ9Xz6tNnqLh31Q0o7z7dxgq7es9d42OvB32pdyEhJvj3ZbOMtK7qmUTXTjvby+vk4Z88JUZwUaNiigI42VIQtww7Ed6zF5MDSMYBg0m7NQvw3HIpzIsr+POGhbibnL1AW6nriYFTDBnk+sd2eS04DuQWXY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066747; c=relaxed/simple;
	bh=nQCpACxM/NNDWLD8aG1f9Y5eQyxFb13mKb3dIoAiQz4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKhe+PTFAVGtJNlNphmx2h+uvUuHNtgJ3RP1lqmEOCDI33ZkXKhGf2X/a2FyZ8hsm1lRB4XfPoyKDPbcRjxubPgl4swAh5Uwenw6lcpgFSnaYRygl5Mfo0pPt+BRmR0+GL7JhFcAjrlBDVIYHNiLbWlsK8iHcbhxCZF8wfggFJw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gNMwL1Yb; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gNMwL1Yb"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-304cf518c9dso3155990eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 07:59:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066745; cv=none;
        d=google.com; s=arc-20240605;
        b=lfOXAW4vtPY5ODrFm21RHFe4/9tDm3Ez+Rsbqfi2E6Xf2Mj485nbVg4/MRpfDldTOx
         5UBD5m9hL/w8jClafqdw5byHHQbDvNqQgh33mSdJi/d/InfBrfZzWxy0S/EBT9HfBJQv
         efLHCrlqvwJepI7Gs7k0iP0ywRbQpkpypKQJAJxJEiV68KCm6e3JIeLWNydZP456QmPn
         X0pVG4nA4ky0qywl8i6LOKYMCadb329JJNsfC6VqIa/FNq1LWANCK8tetZmfFiW2eKgo
         uoPULueL9APZYhohDdSlExoKZsbt85mfQHz/MLaM7BAhegvxMINLsSOUAClrCp5oobmZ
         e4uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        fh=Q0k5EZqKBKpfTkyqB8KK3Vl/87MMoCUkypWYvHdrFww=;
        b=ZGZmFZYgIlSVWjg6HFfJRvcIVKAaAJptV8pfjnJDeCZhvz7kGRopbQblwn4dUt620P
         NReznRFZ1RlAjhzj8lOeQbGCjKbAGOb+GCX3GILzDmNJnDooYg6XlbTqSiZiY/RIzLWL
         X3shXk8FSBKXzweuVFx4FICBh+BwntOVM8Kkkk+tEEyba5SHfbm5tUv2OkQjtgTUN4xY
         BVkXZvpbexJwbI10SSgHTWrZoFMEI703aUEYaWr7j4ULbaOW76FjswH+sBbGIGsXN1g5
         KAvhWSF1tAzeAUIUqGF71hztBYgY30dLlcL+4wmoMef4eBeVcGTpbYKLoZmjfOjye/gp
         pD3g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066745; x=1780671545; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        b=gNMwL1YbBRZTB7NSZ4KCgt6SbCk7Nhp0rcGLAn43t4CF0eLO1A3IWnkWm/CTuhlCdZ
         JzRwmtVYUdrS9YjadYk7X8Abc3sIH93tG1cfCprE/YmBLJwIcLLuGl9D4yECP64cD2gX
         pXFNiRLIJhztez1AihysMIusiyY0KU9zuVXRv4DuQeix8mcdUHx4Q07Lhd2i2nkhY2GV
         cBYzN7QPh2hXyEuy7TNXjgYfk/T/vIdZwTe75PLkGcZjNgFTRLf716UBbZ95a9Gyxpy8
         h5r5wr88j6Ys0twBVoj5QQkRQdCpgejw4OrsYOlNAaJWCEjieQHiXZ5zFauyeKFT5uyg
         NECA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066745; x=1780671545;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PgXHcM39V5zvAXFHcyS55ak/JoLwnSwxluSWMdfV+ZQ=;
        b=shxMa0Pp54Azy74c//7KgKAWqxNvk3/J75wveDg4XA5R70Yza/Ah6vh3kq2KTrItd2
         OEFkH5+QKAJYuAUcZcbuBaQNwZAv2sF4ckpasNomZxYf0MSGoyVZVT8igCJtpcShpbDv
         5lLUnIvK6kyHTM/JC1WhtQrYA3EcvBMF0AGoTbXN6puxmaLsFbYU55ZgwMoHe1BYBaZF
         PinzOwyVi28gxpNAJJVbpYfB0c2DdAlbUeSjsHIVOpYhWm9F2/RM2XmpbnBc4X36Bb31
         C9JCoDAOzMeX9zqW1yyHJMxlpPrz5cTKKyZv0ykOHwINL8+Gi40jwTz1uZbTSN+g5IyO
         Limw==
X-Forwarded-Encrypted: i=1; AFNElJ9DtebHhPhbw09Yo/2t2oj1F+NZJlV1FNYfosKAEegwMjcPCznlcaOGKKVR3H8ydGLoprjQMf9Nl6HqPg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy95HjmJT25a65ZtYFspknYCRUmg8MC4W6QKNQ39FVHMMZFYHF
	lyjnPsTQD5HTWOmDv4vypupn3SOq0gu3slHT5QbiFNASnhj0pWifeamsBf9w03ZaO+9IGReNiUA
	ctuALVz+TW4ggwytdHbIEtKZVru68ZI8=
X-Gm-Gg: Acq92OEn6Ip7mom8zaAwxjGf++XBSfcEntTAHkZq+O8g5kKjSNiXS8Ce8cd9ZhLzZDY
	H7E2ryoITE8R1AqqPY3bvENNWi51Zn+GMXqkJoRweZPzFbcwcj0zQI6t03YrLvzSvbStH19MLWi
	yXZkZcLOY/Ht2OrseDX9+1Mgf/fCUZtN3u44FA/hQUsFhYTw0XGj3SfJq5kNUa2VRQb9kNdbCTU
	LcFQF2iqBIstQorUke6PpAw6JIvQc/dyn/P13t9FDLrv8y29xYVhZRRQk9bJ7a9yFq2nIExaDTT
	Fmxj/thPUmSMGKRfpmA=
X-Received: by 2002:a05:7300:e683:b0:304:de26:3cb6 with SMTP id
 5a478bee46e88-304fa61b98cmr74574eec.23.1780066744852; Fri, 29 May 2026
 07:59:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523085102.51000-1-clamor95@gmail.com>
In-Reply-To: <20260523085102.51000-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:58:53 +0300
X-Gm-Features: AVHnY4I-sQrdOAdbDInY5d2djINIvTW6pdn0Pji3ZBEmd0xb_C9GzSfWWHFkO2w
Message-ID: <CAPVz0n0+FEpfnuoH9STZoRtLOA2YxD_FvvyVn+WdyahxmEA-Qg@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] power: sequencing: Add support for Nvidia Tegra
 modem pwrseq
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:5=
1 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Patchset implements support for the Tegra-specific modem powerseqence,
> which handles the registration and unregistration of the USB controller.
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - previous phy driver reshaped into pwrseq driver
> ---
>
> Svyatoslav Ryhel (2):
>   dt-bindings: soc: tegra: Document Nvidia Tegra modem pwrseq
>   power: sequencing: Add support for Nvidia Tegra modem pwrseq
>
>  .../soc/tegra/nvidia,tegra-modem-pwrseq.yaml  |  49 ++++
>  drivers/power/sequencing/Kconfig              |  12 +
>  drivers/power/sequencing/Makefile             |   1 +
>  drivers/power/sequencing/pwrseq-tegra-modem.c | 209 ++++++++++++++++++
>  4 files changed, 271 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/tegra/nvidia,te=
gra-modem-pwrseq.yaml
>  create mode 100644 drivers/power/sequencing/pwrseq-tegra-modem.c
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.
