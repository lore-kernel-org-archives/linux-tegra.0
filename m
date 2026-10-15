Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E6332641FC
	for <linux-tegra@vger.kernel.org>; Thu, 15 Oct 2026 00:29:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792024162; cv=pass; b=Qt68baWtSh89YWbCKsbObBFgAE9MiTIfbu6qN5mtaGZZDdhz7Jn+GqQhDx9wLnCazE6ntQaB0cJNTQzj6aNQSCcLTtxESDnxfUMTGq4Toysj9dIjuLVhPXjYecgYnoaWf8V+O0LjRY/a8Mma/BzJEM7x4BKoW/agA1T+bVyDbeA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792024162; c=relaxed/simple;
	bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nX4JWfUZAYovAh6NyFY6Axic9aAQJiGxljn05ff1vuDmnJx6tSi1cCGZK8kD3X0+oKnPk3GlNoQBTkaqQA+J8PbA4s774ZEDYXOv23REMu9hG/2xhzsrfhxwNZcl5x6pyfUHB7RhZpSJXX8+sDnfD0W5JWSc7cHcqOteuLMaL6A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CoIxLAUT; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CoIxLAUT"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c2e7496f947so773466266b.1
        for <linux-tegra@vger.kernel.org>; Wed, 14 Oct 2026 17:29:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792024160; cv=none;
        d=google.com; s=arc-20260327;
        b=FyNCxtnLmMB6RliDU2PMbt94/t0C13hrYMoZwuQkyPUHULfkTqsv0fN75+GQYYCbGV
         KoBI6ypQdFaqRg4Xg7gGtlt2ohdo73WaOqDqVxIWDz47iIOcRn0xJAvv8cYj/dtWyV1z
         mzVwtTrH3O2/Hjr8f2jOauG/Wpb4gGDflJEpcJm8+uCNfofjtqfEkBiQYl8G+1owLvKi
         rJAwgMgA+MHh7Cm/2WDt+D1ljfaaxr+q4TTHDJUxf20TNiumQg8VhkJm9AlvQXkNkEPK
         KwMdKLlGdU2vKq90xl2jDHlqCCAJo9kRMyhgJOs3H8I3RMRyyNbmcQcCdjxR04r8rpn7
         lPjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        fh=mTX8ZNeXxyzGhjWcfM4bJzSFoIqQQk7MMyBvYfK4/os=;
        b=M1Sg9OIkdZGk3PZdH40/RCTWxGHLQGQ91ttrOfmZEPR36nQWgqxZ7uaJlxe4JMDh9E
         nss+ofZKBA+uwImaY2L+O7FzjwKldFTONzCwaYRSCb5ASrDcD+i+p5NxvHcs2GvzlaPe
         tVSzcpY+YlkoRGtjugSIOKQEHGy7+vAd/Iwg42IvHa6ayOkkKJP1ZjRgTQkOyrgDis1D
         hAv4mRrw/PXyD7kvhk2MdAjMr7sXr1Aq2fxXnF2+DchFXb6YfeHTjrvaRSe5RXVoyxbE
         sC+SLaxbI4o5THpAe5rocT3yx4ABDlsiH6+umNCuLErddeNC5Jl6sCeBjyeQwvQZhflC
         Xjng==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792024160; x=1792628960; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        b=CoIxLAUTyAxjjdN33ABnWUuSphNtKyTPPi+ECRRnscb2RgKgLcmkBg8l7VR1S0Nx43
         En5ftjHFmWxklKCSrSXRudFD/mH3xuNLD4h37T6EMlMci2d1zGfyzGJCsK7RIkE0uHGx
         S+/g9tF5A0yXpPEmq1zgd68UsDNSC8w/xJPglVkvTJiyEDOX8TrcZkmFi1McVaB41KzH
         DYBMZIFIWcig2EhbDzytrSnh6xKN8cc1GjwJAdtsxBGCrznKA00VKbo9YHCS1+27aE69
         MhEana15zzcoYYzX8urDoIHT2PuJcbgPMLBE3rMOhgDKTlrIjosEB5FwVytbK7Sqjnpx
         FqhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792024160; x=1792628960;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Nw/puDqIaE9dnSoGv3s4kFRu404SPwXvdt4NbHd8boU=;
        b=QVRzKOn+wulN7mkUczMno00cDqgdhR/2jlTjM71ObXaOvhwWmPqZXgBjbeavHZeMTr
         T/HT1TyggVjtbD+9S347rrywJbUKSFxUaPDgYO53AoOxWU6gXhhhOZvJvuOJF8NecUiv
         zEdAWkZYArDugqGp0O4T1JrYNycUifjyedXDrAZhhSHjtfbQeJlot13tqlCvT/nvu43m
         qqOM9d8sbqPfjPt0kvM2pL9BS9JHP9FnstvitHOh7p8m1NHpn9RifZ27tRg2tj3tDkKH
         AdAcQbUiCxJB+SAxzddFV6YCekeiECXHQEJWvi2cO4zNEaW6jMFuHsKKybu95sIweO/N
         fsFQ==
X-Forwarded-Encrypted: i=1; AKwUvBxTvH9hL5jDMv1MInB0ruaNCXjpFtNofTRi+TVLRM2N800BZynMMg2JLmvjvpVXWKWG7N3j5z5Uqetz6w==@vger.kernel.org
X-Gm-Message-State: AFq9FYIIgvwSLNp1/5rUT9RMn4vCDrSfvl6XoIfRuv3ER6fIB1TXQ3y8
	kzJLM7F320WLPJSgqsDL4nNa2/SvxJe8bn2dvicKN7QJzLhSoA3kLZ76Ra21Kjk3+ilUrZrYenh
	IjpfQgBxc/YGMN7coq4AoaFuawpXI1A==
X-Gm-Gg: AYBFou2W+B2Wz/+xywYGuWRl/WpAws8uMIJ0fVMMkL3nAONZ35zqGdiaOWFRMBnk5Bq
	EZupBlQi3vHm0lkgG6WInXYV6VWol82lYxb/xbzHWz7EUMZ69PGN608qhXvWeoWybech6gI8m7a
	w3ZIZRdRri1roC0cqlF1yar51FmsyNYZr1+jH64GC9mjg7rgx5KaTzsAOYcMxzMyB97Uqd5v6d6
	oLlraxqZu4rklwfb70UbzRKP/f095CNwcr4Bmuci8gHylmArMUcwfzElpElbG18KN9GBQSHKPms
	da9px5y7h4+hv6nrMNAoepJZsXgvCqP7UG1/BfJJ0cdJqLsTpQL5YUc5M841dbsJjKN3uhp+KNd
	+Xb7shB6xFr0sp/GIA3USXsjvC1CBFe4V2YrECYap8bAktcHfITGBXgHAeSsq2BxFZ0ZS
X-Received: by 2002:a17:906:4fc9:b0:c35:d261:636e with SMTP id
 a640c23a62f3a-c3667073d72mr666787166b.18.1792024159565; Wed, 14 Oct 2026
 17:29:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011160034.93d011b386c2-1-mhun512@gmail.com> <6bb8cb0b-e614-4d7b-9b61-fdea34c2f793@kernel.org>
In-Reply-To: <6bb8cb0b-e614-4d7b-9b61-fdea34c2f793@kernel.org>
From: Myeonghun Pak <mhun512@gmail.com>
Date: Wed, 14 Oct 2026 20:29:07 -0400
X-Gm-Features: AclHuK90IW_k2_E5rv1a20GLSR4ciHBFo7t509iO_4hXs2Kz5cZZT7wv7oXQqQU
Message-ID: <CAGEsz8FAq11cB=7GOvMGmoWQLZSSuaGoFUNhuKzMogMJ7nqHfg@mail.gmail.com>
Subject: Re: [PATCH] memory: tegra: Shut down Tegra210 EMC timers before teardown
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: thierry.reding@kernel.org, jonathanh@nvidia.com, 
	linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, ae878000@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

The issue was found using a static analysis tool currently under
development, which we plan to release publicly in the future.

I will clarify the wording in the next revision.


Best regards,
Myeonghun Pak

2026=EB=85=84 10=EC=9B=94 12=EC=9D=BC (=EC=9B=94) =EC=98=A4=EC=A0=84 1:58, =
Krzysztof Kozlowski <krzk@kernel.org>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=B1:
>
> On 11/10/2026 22:00, Myeonghun Pak wrote:
> > The training and refresh timers can outlive the EMC state on removal
> > or probe failure after clock attachment, causing use-after-free.
> >
> > Shut down both timers before detaching the clock provider and releasing
> > the timing tables to wait for callbacks and prevent rearming. Initializ=
e
> > them before clock attachment, since set_rate() can start training.
> >
> > This issue was found by static analysis.
>
> You are expected to name the tool or be silent. Reading code by LLM is
> not static analysis. It's statistical guessing, nothing to do with
> static analysis.
>
> Best regards,
> Krzysztof
