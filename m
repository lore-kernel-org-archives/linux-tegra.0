Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCEF93B6BE4
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:52:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485941; cv=pass; b=Wrs0+dmxoCuonsKrbAgdcwsCpGOxPWajKweBfSI3LLwVtgpRIOAGlL/GnutfWzx0rWg/lOUVpsSaqM6pPG5OclofmXAVMsrskgX+TDIEcdQ5JvIo0zTAN7dHHsJA+nMuwIlfH7OvFbLrc3Y1QNnH88iYTvABWmLp0XOIvRUVA84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485941; c=relaxed/simple;
	bh=gZ8uSKeyXSL7MsPeYFybFKjoeB8keoIiq7+A1hmdnEg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LX1YiIrT/iQYEkYJIMZ5x9oynSrdeZS/nd+X/Diw11GtF9HjV8nUDJlDVlYlxWSNS2LCuK+ijjsKEzw7Sy+InpbxxQofquHs89VqSq4uXy65U14f4eUzQy8ppygZsYWrpjMUpHtKXmISQGpTSkevOJgQcFoAMXElOinl85X7WAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BKZeldFj; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BKZeldFj"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2f0ad52830cso5757033eec.1
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:52:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485930; cv=none;
        d=google.com; s=arc-20240605;
        b=YmIKhLxX7tMVWcTwnMRrBzz02kWWZte53hJls/IIFXA2mwSGauayFgFZtEL2SNTVoW
         OXT3j4Y2kcNea5obmjfDI/B1LOz9fikBapF8FB9JjrBYGDzkz6pDtyp4I8a/gFVhC+iT
         Sq9zcIms1yqG/NaEqjtKg8MSplQXsxwcuI8MKdZlfQiUG9ENJ1y7x/cm0b9APvTaidE4
         5dKsW3kNGMwA9gMh1rv8txr2PcSqAgEGUVzETLSJPY8LoQZYlPHGjtb8Lh4W4h2V98Oo
         QKzs0/lNYIihPl36hML1YEGWPtwhthkof4uME/2NFVNwoxxp6qJUcQRXqU1rzIQop3bb
         1tjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        fh=oZhE6kCgznkv0gK7+ZQt+rN3NoU5sjEOvtthPxm0HEo=;
        b=P8k8HSoHHvBNvgcolH1Tu0s9gQF0Yrgw17jBR+OR6jPXqUlung91L7H4rD3ehlDqPN
         mdFQDZlCQO18YR1r9W75NyErzdnnNPYCyyxk25AVph6rHoaq5oMYFClugWF867Ol8WOs
         stVyaduzdzkITN5HgsRCTA1xV2+uIk7QbZbpWFdDMZZ+uqW6dNSD4TFLyldcHtqqoet/
         imk3p5YKDCVYW5OtYlxsy0Dhr+QsNxtPIKxRq6p40OKQfkBmkQtxZOcUdznPK1BdiPql
         I9HBpvdj/fvxbNsOyEXvWy5ciXQXrKCleALA4/RrEOsSouncttdeSbgFqSjifqoEdMLi
         Wa4A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485930; x=1779090730; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        b=BKZeldFj5AL3LkO0kPB+j+l52ccnMSznlh3uUo+Z9oy7IkuTjHUc8SqQU/dr9KqWkM
         aBFtTls83gU2/53pIutv45cVyxSz+vkHrgVZCXnorXu/xGIydkUgsGXiBqVxd/IOZDu2
         frNrixS9jux2JAwA3lNpjQf9ooF/gz8MdV51qeFRt0Df/LrxFmFY7b/lKmE/N8BoE4Qu
         aOYkkrKNwncpiQlZhfgRgNj+p1U8ppAXWjaX/HRBs8FwmljftTcOnhVJrRgVIEqPTo45
         X1cL2F6oD6bYA4XnXqSdPTECSDUokCAArKmlFgSl3yUDinoeRhLy/U62xaLMTZcDsytF
         BkqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485930; x=1779090730;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SHic2oJH49jsGKC2elmibl6ONEIbwrHFjQoTaB+s6YI=;
        b=JmlEgqM0SMpbFCMlKF9DYSzVfVHxyIbIwRv8EvbN7/D82hCVaKq31Fj/F71XLE2cnF
         B8RMoaAh1x6CuFylI5+oJLaZSbinvYOXFfqmqVZwQLAtispOKr0pU7xJ0i/lSJm+I+CN
         8lINn8u+G4mbbz3xpyKsZEL91ck3zgbijeQNeqBG9IskbLgqdEYvZ4rD22AKr08xX86H
         0f91317vHfAX51H0TT9bKqzxPx3jnIvw2RveWAwcxO59QBN17bmjSDxCEjnMcS+mmQdd
         hW/VGVIKH7dpYCF0bAyolABp3b8LAuC6ah+xBFHQrj+rZN113cO7SL0lsdLlQr7Nv5Au
         51lA==
X-Forwarded-Encrypted: i=1; AFNElJ9hqDNdEhSXROnoGFVg9VKmy1AuVSTDdQD2rdWrILerDf9+VltekCzelifNAgWhgmYXmiLEwrRWxtNh9g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvpdpj2k2QTypqj9YsIKwLuaPlMr0VAHu6AdF74l8Mottljewd
	la4JU1lbkYOhpVkUjDbCZdY53RiM7GNcIOMexg3i6pFwIe2vRlrbiwRsYPev9p2ediAs9L+m10z
	ziNAdPKuQ51sOvSBD7bZXPTOhRkLSkaE=
X-Gm-Gg: Acq92OFj9dGaIurkLGV71B0FkW4Nnk0PTBXcp3L1W0TI49sGonNC6OmBKRjfvVh9cfV
	ZH0wHig/N1I/+aikcP5OSqfFMafLLCZi7XvBdBlP2OQXv4+p3oXrmDy1MQ41P3HscDGLRQDrupe
	tenAubNr+Ob9Wuz8ei6n8gCsya10cBS4Qj02sAnu2vsTz4DlvpVsrVJHGN8TzHfjYQg4gOQq4Nu
	ucPLe16CoUXwcqEzQBFtbWjpY/JIT/Nm5YqCjFvSz6FkZM5JyOJ3U6B/V/DYa0fUvG1ERlWRQKU
	ApmNNZql
X-Received: by 2002:a05:7301:4601:b0:2fc:9aa8:83da with SMTP id
 5a478bee46e88-2fc9aa88c76mr1869973eec.29.1778485929756; Mon, 11 May 2026
 00:52:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-5-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-5-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:58 +0300
X-Gm-Features: AVHnY4IivgDDcg6H6JpbYVndDKJmB-ke1DQdhmpnseZc-qoh0dGzWT-RrSUld4w
Message-ID: <CAPVz0n3nFT4RfgzfL0rVi0ZxB8O-Q0v8Syf3Gu+OHSv_y5YXQQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] gpu/drm: tegra: dsi: add support for Tegra20/Tegra30
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Thierry Reding <thierry.reding@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, Ion Agorria <ion@agorria.com>, 
	=?UTF-8?Q?Jonas_Schw=C3=B6bel?= <jonasschwoebel@yahoo.de>
Cc: devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D0=BD, 11 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 10:4=
8 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Tegra20/Tegra30 are fully compatible with existing tegra DSI driver apart
> clock configuration and MIPI calibration which are addressed by this patc=
h.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/gpu/drm/tegra/drm.c |  2 ++
>  drivers/gpu/drm/tegra/dsi.c | 69 ++++++++++++++++++++++---------------
>  drivers/gpu/drm/tegra/dsi.h | 10 ++++++
>  3 files changed, 54 insertions(+), 27 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
