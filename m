Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DED01305667
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 13:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792071219; cv=pass; b=C0g5gZJYCsJcxSfrcGAUrM3jx7j72eVeo+9cWdKowsPsOPYHMgjAfaWk7eugWnfE20JvgeL5OiMsSH5Gjgs9e3+AZKF4Xpqv7Xzon68TR7BcZe4X5RNePFLddPtRlcLtIwvN3DnKB7rZg9l1lSURxku9w6rbXXoFyCa/ps5V7cY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792071219; c=relaxed/simple;
	bh=Z5Ri9F4+OVBBIEGoV+Mr5BnCUO8uTyNyHHmMRGWppMs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EnJWHAiI2SGKyaI++9774svJ454VwZ87fbkIg+XOINpbmUyZfZ1djWIwdbV2QdeceFWkK0LOlmcCF9oOsim957+j6KNzpxELRO/WACyciPI0mBaDO57ctSy0R/yBy8tdqRLq14bHfKTKP1YyR9dSTR9RiyJeWH1w7d+toaEJSYk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PAuGi+DB; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PAuGi+DB"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-353804b591eso9293109eec.0
        for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 06:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792071218; cv=none;
        d=google.com; s=arc-20260327;
        b=QPK7NKevPMDTs7FfZ58NjIJ+vxaf9LChygJ19ulNg/cum6mA6RKDcgLuEwdVuRc3Qh
         Ixd5U44bQK48bVYOYiRdufKHZH2zD7yAiNIKY2y5A4lC53nv+OXT50DKEwocup1PSWAt
         RcBl7rGp78EHA9uXIsIuW2RD/Q6prEB3ODfYrAluoiINJcGxMQgvS3VlDpasex8oigZ6
         vlMSGxHK9Q/mumASR1GYijP70yWeWSDGGz8h5LLqSOgebbH7FsaFOykpBl1D3j/oJHvy
         ANnPOm6ivTquoG2ap45KPiMVrwG/ECHTJGfWko4gisi290eZ80K3MdS7P5WmRcjWL+rO
         ErKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        fh=FjCPyUbOqQBi1KtTzzDT/6eegOABbUC7b5Di19HPQ30=;
        b=K9fAONEJFhGfxvXLi71ipJHwg5dHaSja9fTjbqBXTNEPVobx3e3nqtxbxQASIjZL9F
         ceQjrLz4Q0BPwYcOXGgYoEJUBcbbp4txWieG0YSdO1zF/bXRZhG6tbbjqbicIjMYrboB
         Pu/gOSJjzf2cTSAguSi0s5cfwe7jzHrSiCfOESwoDh4+2dMQX9ARaI16g6VQ4RN+p3km
         pf+JvDyu0au2fM1bnoxkaGsuOwpxIwTp+s2gdEnlTlzDsGa3zk3qwQbSZVOYB0lNVEJc
         i4Qietxz+gONPS/gp8cR9LrO9znkYtDG54lMCl3ByR+U3CQYvaPjO2/cv9bvUN4yF+bF
         i0qQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792071218; x=1792676018; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=PAuGi+DBtlHOAXfkTuvEgYPIz9waslOw941falizFo+xSe5yRbqlb0CwWyGRG7sxfO
         rqZ0ccbiXIZV3s6UrBg4hAkW5k10nM4p1zSouygV07q2YjdoIBrZOZG4SLnYrhCbk/k6
         reMDApl7nJGdp3HLpPZFQzwZoZeozOpymd0qETxSV+a8soC6YUhMOHtBhEHUcuF/niAo
         foz+SW23qmoIa0Im0rN6ecC2P6Cc1EzG72j+rXNXX+WXRXFuS+7Y9F4AX6zYo5jqZX1H
         nn249Xm2CiJkoVEWUwbuDy4J/n/XylSd4tpYvN3vBd1ndmnnFYMATBUbchW8GuRTP6pV
         E7Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792071218; x=1792676018;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5OHLy2Mwpp1lBm+AFYiwQam1DsdiOVY0neamvR3LV0U=;
        b=Bz6ER/HCM3ZNxz9yRj3kYkK90bpCxIDBa8r52XKiM4f8a/x7RDqvGIbmeUjUewGKk8
         B8s3zYCmZnaa2vBysi5P7UN3nPpa5TeZoB0yVVY9aTt/Qg8oqAMhSh5adNYvv0Fidubv
         pwT9tqxfkCvAYaWqjiaGRBC3d6/hZGvobtyhCb3w0psl2hUJgX41qyJEIa4keh4suxH6
         ZIvBiKKZ+OXYghlqZx8pZMz7sl366Onh4yFpVafN3DSSL3YF12nEWZ3IFanSxn/otp5b
         EbLUxYbDOzbSjz8i2SO3KCP7+LuclTVdDZFUOqFrdsNee7/4DySEXu+1ylEo9uH2NQhS
         Fyzg==
X-Forwarded-Encrypted: i=1; AKwUvBxMsVEQqYx5b7bJ7mCXhEOxha8MHFShkPGlnk6T5zrPQrVA4N9J5Y+Eaed67bwhbMddOh2A4xcbcePFQw==@vger.kernel.org
X-Gm-Message-State: AFq9FYILGxCa4cuF+vEJ5oFxXW5CEzGwT7G9dpDzSHKRc88wzk3A1p0e
	13g5Z5U1qL0B8RgOqSW+gWcqHdOJsGNX8PNsxd56y6PU6XnbZWjfefqBQb3fzKsPUvPR6KgmRM6
	P/GLMna8WDrWrYfHN/QDVYxHRWkY/Cmk=
X-Gm-Gg: AYBFou1G7Z+IwjZY5sz7zGJ1TiUfXle8XCKEoXrH0Uzw3y3ryCTB+jL3zfLa0eA8itN
	uzAjoIzwWHclHuT3H+7Ua0Bhooum+YPajOf+hZMObcNQTC22MX9DoZwtw70IAckRY/5He1Imtle
	mKTln0uBxh8CdZ3iMahYThsCmIhKQbcWJ3B5GvyZTLEM5ACPgW0IMJgqaBjorkL7omsvpUH9OVD
	wTonb4o3T84GaRKnRqB2XBWn1sID7ZlciHbz03tlybfv7JHrnr6Qf3GxS/FldgCG28w1rGCvTtI
	TszNEOdLKkD3nsyn1szjroazxbJqKPDw1MsYgcbCkzlaxqRUmGaoRJhx4NZPeppVpoSzoFm2KO7
	8Q46e+8cPNcrQheb5uN9TYLM=
X-Received: by 2002:a05:693c:638e:20b0:351:7bdb:6eb1 with SMTP id
 5a478bee46e88-3537e03ce72mr25493475eec.11.1792071217690; Thu, 15 Oct 2026
 06:33:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261015130628.184279-1-clamor95@gmail.com> <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
In-Reply-To: <d3648f08-17b2-4a90-8c23-3036cf71f1e1@sirena.org.uk>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 15 Oct 2026 16:33:25 +0300
X-Gm-Features: AclHuK-Vf3LgaGwxBoiNGM89Hp1VUWFEAhFQiO8r8Dz7zDRcZoB_S-mA-lnEEpc
Message-ID: <CAPVz0n17fZyoR+DPY2fznoFCEQbKeaH_qCSQ4j==_XefuNq5Pg@mail.gmail.com>
Subject: Re: [PATCH v1 0/1] ASoC: dt-bindings: nvidia,tegra-audio: Consolidate
 all codec support into a single schema
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 15 =D0=B6=D0=BE=D0=B2=D1=82. 2026=E2=80=AF=D1=80. =D0=BE 16:0=
9 Mark Brown <broonie@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Thu, Oct 15, 2026 at 04:06:27PM +0300, Svyatoslav Ryhel wrote:
> > The number of codecs supported by the NVIDIA Tegra audio complex is
> > increasing, which leads to an increasing number of bindings with minima=
l
> > changes. The main differences between codecs are the compatible strings
> > and possible pin configurations. With the introduction of auxiliary
> > devices, a definitive description of possible pin configurations become=
s
> > nearly impossible.
>
> Please don't send cover letters for single patches, if there is anything
> that needs saying put it in the changelog of the patch or after the ---
> if it's administrative stuff.  This reduces mail volume and ensures that
> any important information is recorded in the changelog rather than being
> lost.

I'll keep this in mind, thank you.
