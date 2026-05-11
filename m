Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A17C39901A
	for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 07:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485903; cv=pass; b=X760fFKH20LW36gh7i6wqjZhS8XNYZGCWYRGgjWi41DVWsXHJ4UeeY+/1ve3cGzzjKRecFJpCOlA9kFJ2WG9D9YtF0L35oBycV3mv8QFv6r+eP+beLAhfwCsXzXhmFb2BxycaphykFdUZ7c7FUGXZKWvS3TxcfFqbm3jWtBxlRM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485903; c=relaxed/simple;
	bh=3TxyJdBjozXoaX7elIQwRGx5YoxS42z/4Qxel+LDXyM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdhUEUzR8FZT1cr5XfthIupSQ/ty2QUwAhh8xKZJU2y49Wy5IwKz90bipiZ4K5sYJvXIfgPKbAnRGJkiAeBaCIclySs3byF7RSHzeIM/HCEVq9Qrsc4jr4TQOFpEqBb9B5MAwwpvcp10BmKJqTsBJ7ltoZA+P/GAJ6LZTcQUVWM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RwCD8H7b; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RwCD8H7b"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f68f3b075fso4732961eec.0
        for <linux-tegra@vger.kernel.org>; Mon, 11 May 2026 00:51:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778485886; cv=none;
        d=google.com; s=arc-20240605;
        b=hoMajIjXyZYYWPtruNjLEpypFtdjRj2RdkRjxyyb86ima9jYiSeNLUL9Q9L2YMe3xu
         zHvsa1DZn51xljJGXb/y8A6NABc0iqESS5GDZz6O0RVihCPeugKpmTU9v9kZ/JY35ype
         VCns0i4/r9Us6w5GoQYl5V4GPq5PmCCCBlxj7iWFM8ofS8lXcdARquCl1qW8oNbMjJa3
         2bX4tMwFIDWZwUpeR0P5MyqrlNFWdu7tXLdQOSjrL3q8A6n2c4mozV2uI6kpnmBDkjQd
         VWg/Q66p+h5Vn4U6rpHtudcIZiakAVXJ0gIQKGNVRbTcOFSvv2zypz+qHmT0ItpCsMJr
         PLBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        fh=8KohkkDaT7JBGBAqfyug00tWz7JqJ5yNbCiPTfQKSp0=;
        b=Lqn5Pr+hkTFzGy0MQRpwr+M1aPn31HtrrBfNKZqV/VhgUdKGF0XnnlZjkPsvm0RIRq
         BVMEBAWOxinzoX/6ihoSnEGYqx7NVYORF5hUkiv7httbP0fWzho/YWLQE8l75zW6V8lh
         rwXFBb1MHzI8IUz1wjLhNrZ72TDP+y7Vlrm8Uqjva1tWgybB1Yr7LglnkDQQAqPoxQ0b
         3kJfKFL7Ydc5k146Mc+kDRgwFOGlnW8wcCISIdnuaDKMb561WkVd8UwOOGDYcpiJhN0J
         I+pCrfACViR3bhlER8hmsb82ACc/Z15/WlyjCtchlFtPCV0YlWyIUgVwh8RspKED0d4g
         hISQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778485886; x=1779090686; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        b=RwCD8H7beZi7Lo3TplVvH8Lbt+8O2S5FWUeY+RgnLvLDailmdBjsUA/sZA7M7VRoom
         tcU20WKSH7f5ajMVjZmMzga5qJ7qHcscRvOtvw6MaFAAGJyZhdNFrKaGWMYXneM4hs4y
         Dm+r59bJmyD0oNVXVm7PW6+MclW20l8Seou2Q3nEFFEe6bCHv8Je4O5NEFP+E0nVgqfI
         QNH+hRaJKVXH8lFAdfsfSvnjTQi/Rx3aFFPt26yEtUbAzQA46fnzVVo/y0S1m126oZZT
         ttQRndcE+QH5QxiSBD+sbfx7lU3OTCp2/xuykApZ4SDb11poVhPJsyQsA13vy5NpNY13
         JyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485886; x=1779090686;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nf61Qz0iyi0SuEAAbjE6Oy+qfNzqjz5sFnpbSlRp9BM=;
        b=X/7fCuad0QPN3UjUR7yOOCmTPVVK7trtcvlV2QbmL0w2ihaMkLJ00w+eyroeLneRq3
         AwydYpmEalNOXF32P9tMkrGOmIv9apY0RoG5paiKR+eGIMUq+USrTmFx1qtMXWnH00jn
         LiOZS5+aYECdmWdRlSRv94VbjSgzNwc/dwMg+F+nRb1I7K9k5/obULsR6bSOKg5Q9LHI
         a4j8llvutdkyHf2vcHXKEfzemqcP0bovV0v9Kmmwy11j4xuVc2uDp6ouEeUP6vPvs6SS
         93ijYAtVxNBjZ6+t7rge28XNTP1UH5hKtzD0hGw9odrD9k8eM3dql9t5sLV0FA3F4awx
         YUrg==
X-Forwarded-Encrypted: i=1; AFNElJ+7a7sTxA698mq4K9ThtnHO8sDiFzuy62UzpCr0sIOGfFFNWeZj6Wi15RlbqHc5/A/tw6ZMGAyrJ31CvQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywpm3GNlqj0T2b8j/1DF+hpkux/2gqSVgdvYaZtblszIzqWopvt
	ETKmGe6ZkPaYt0iL4Gai5Jq3cbCPzcyuwWPYZbntr/GWuW9vcALFFZCLqQLBwotWWfn4jYTc2+O
	oyUZ+yjJvoVs2owEBZrjvrNjGV9KyIUE=
X-Gm-Gg: Acq92OFS/xk63JwHHvsAWVFQOkE18Upgq8a01ZI2R9XcGUA8YikL7rVhTyK2T0ksWP2
	Ra+s2rvBEa/7ABj4lidyjUpxjhK3VPsp4RgUq5uma0A493/v3mh7XTiUyanBK3XKBjRwelzLPvO
	cp/vMe1N9BFihQCi352BIvis5nFcF2rfKCxNRNMRR02EVm/8+SSqG9WBKmUDJH08PgikqidIGJe
	wBVDhPjATgVyyX0WiUpA1cXbD7YkyCdMuDTKYylv02UQKI9BLYYQUVZYG2JyNMpZf2juGaTB213
	SxXvDDir
X-Received: by 2002:a05:7301:4088:b0:2ed:6f94:9d9f with SMTP id
 5a478bee46e88-2f85c07ca45mr6503387eec.11.1778485886472; Mon, 11 May 2026
 00:51:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511074752.24745-1-clamor95@gmail.com> <20260511074752.24745-3-clamor95@gmail.com>
In-Reply-To: <20260511074752.24745-3-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 11 May 2026 10:51:13 +0300
X-Gm-Features: AVHnY4INV_9vitfbHSb-jPAooAdF11oStearVfjdQL7UhZxfWb2kxHd0zccUaqs
Message-ID: <CAPVz0n2LhZM7ODtSEVAG80jOjzO+RGvQ6WKTRKR-7H=E6d-kdw@mail.gmail.com>
Subject: Re: [PATCH v1 2/5] clk: tegra20: reparent dsi clock to pll_d_out0
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
> Reparent DSI clock to PLLD_OUT0 instead of directly descend from PLLD.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  drivers/clk/tegra/clk-tegra20.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>

Please ignore this. This patch was send by mistake. Sorry for inconvenience=
.
