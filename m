Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE4925DAF6;
	Thu,  6 Mar 2025 17:54:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741283663; cv=none; b=XPyw2/PZ78sbtMfPow3P4Go40EZtH32c+eAGzXWy0KfsCAqYvyNpJVf9u6H2sOj2mTR68SnwzilU+nOw1W1/ne1QEHJQOLH3CQlUy9LNFmfmHx4v4pV+3jhoePmHNo2wFP2ujrjiCb/14/6pdJxEpPOvjOiNQ1W+ds8uJleYap0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741283663; c=relaxed/simple;
	bh=6QJEMGm+9MSZAnbjzsImNpcy06EhURuUIPbByRzams4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JN0ucFMTtG6sq1z3f8Mdge409PGjaddtCPxgy+w8U6BzjcG3rG+zj3g1onXFNOfo5jhF+Z3SH48uCLE4cO2smppc4SaqSanHMw/pNIAPYfyNKOctY6j8fzYBtDGyFXNJzGYK71sDRm/jBX9hT9RZImrHaS6YnAfI5W7sKhHehTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=neq2mqZA; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="neq2mqZA"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bcf9612f4so8378625e9.3;
        Thu, 06 Mar 2025 09:54:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741283660; x=1741888460; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6QJEMGm+9MSZAnbjzsImNpcy06EhURuUIPbByRzams4=;
        b=neq2mqZA7BFuYLt2m19GUF1W6pMfpYxYxyIEzO/0GDrKA8vPdUe/6LLNItWRHB/jm1
         /c+V981yZBNWFFp4epeu9bgBKVINxp8eq8HDPH9EISO1k8LuDiIRoyiD5e2NEW8a8ys9
         m+Z6d9s4GRC73NfW51AEUc0yZcg95aihANa1GypA/mqx8sLf81cZ7Tlu2HLOpCOCnqYd
         WE2fxctPB6/onD3YbCrrRf09bhBuE9QlOOTULz1jD8N1UfaIg09oPFKdcb+0h1xCh4YH
         7AeWYs0b9WmZszsrnNMwKWAp+SjlmRG14rftAvREzfiTN0jCqUzYKI/69Ftc4rW4/cNs
         VjYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741283660; x=1741888460;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6QJEMGm+9MSZAnbjzsImNpcy06EhURuUIPbByRzams4=;
        b=V419jJ7STlawiWYZ5BhGKPrbbHqB0eW8jkpey5OK5E1pZZsrcnhMYpjMvRBzpsjTeO
         +XzSo0jI5rTps6Kt4vxQE5cLCVFGJFf9h7609OdcOAaocrYEkSVOulsmZll9Af1iZTX7
         wGjin9WAyuWixEak0ah67kvewlYs2CTV8Ua1VhudgusrpoVZtUqf0/PiO2uFjBe+RHx9
         0oynw654hMOLc/g9fxNCNJGeLaL4fEiWVMpcU8Tnd5/1uk3v7Be26e/pTb3yrD4hBHkU
         WxPjpvjjk6hfFQdJ7Eo3z9wlF4xcbzLkfe6NoOGPc10YQ1Fws7PD98cKIbSIQiocK3BG
         K/RA==
X-Forwarded-Encrypted: i=1; AJvYcCUwClrnPQIu4QckVNo3I5jxdWE+D3jc0mBu/MoE3U12+QsWnmSSTrHgCs5buwuEKCIJvd0ectREmeT1pNY=@vger.kernel.org, AJvYcCVDq1K3PovhgnoOLMTRaxeGy0HRHquOIcRPC1p6qbio7DLEvJHIVB6YAVhogtw2zpVloHT+a1RzN4Ra/hZe@vger.kernel.org, AJvYcCXceV/v0fqWcXAIcS8x+fgCeMUfgMSaQDSRGFlMGWX89/PoOB8KLzmCeMbEXmeeYEBQbIzEF/YvbrWh@vger.kernel.org
X-Gm-Message-State: AOJu0Yw68pwoo1BImtCNYBG12jNBmsEloP4aNX9S2hLlO2EU0o5tJX2I
	R6LLlchJjH4eARufqr6RVRHxNDypQlB2YL6Cw83mOkGOYavxWF7FEZoLiXDw7vGYCGzvRzT9wfW
	70TthfERkkV0Go+3OqapiDJ9wQW8=
X-Gm-Gg: ASbGncvM5S/l3SofiqwjalOoWWaEGHLTejN28wlBXReC2lq44w0cBJIwn9/qS1gI2Hs
	1v6v8CUU+mRViKjfQ8tAjgPlsRSlb1p6B4jo/LNiKHx6l1e86SkyycaekI+RdiOtzoWXWXZYSnu
	6Jhdn3TPTe/I1iH+8KSJCUUTRtY0s=
X-Google-Smtp-Source: AGHT+IGXbX5gWO5r/Azm8BW15rhqNm3gJq0c4dlBh5HFE7mUA5MzJn9NiCBx1LJWR5Ox+y9PO9zoFPWv9sUaTbf1SfQ=
X-Received: by 2002:a05:6000:1545:b0:391:2ba9:4c51 with SMTP id
 ffacd0b85a97d-39132d98bb8mr41904f8f.44.1741283659915; Thu, 06 Mar 2025
 09:54:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250226105615.61087-1-clamor95@gmail.com> <20250226105615.61087-7-clamor95@gmail.com>
 <tob3hj44k6rt6rq2o23fn2dqvq4qye2yezxqbvqcek62c7h6vq@r7jakxxf3whx>
In-Reply-To: <tob3hj44k6rt6rq2o23fn2dqvq4qye2yezxqbvqcek62c7h6vq@r7jakxxf3whx>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Thu, 6 Mar 2025 19:54:08 +0200
X-Gm-Features: AQ5f1JrCq2aWrnGWnxHDsFHa-_q7i7qLoPvG3xBFT1leym5F7gK1dwKaD08Nuw0
Message-ID: <CAPVz0n2vs3oEAJC5qfp-GbSTH7oDBpVzB6+SRM9Uoo-4PFwbMA@mail.gmail.com>
Subject: Re: [PATCH v1 6/6] ARM: tegra124: complete HOST1X devices binding
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=87=D1=82, 6 =D0=B1=D0=B5=D1=80. 2025=E2=80=AF=D1=80. =D0=BE 19:53 Thier=
ry Reding <thierry.reding@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Wed, Feb 26, 2025 at 12:56:15PM +0200, Svyatoslav Ryhel wrote:
> > Add nodes for devices on the HOST1X bus: VI, ISP, ISPB, MSENC and TSEC.
>
> Same as for Tegra114, we're missing the bindings for ISP, MSENC and
> TSEC.
>

Acknowledged, thank you.

> Thierry
