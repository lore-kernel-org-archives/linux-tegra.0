Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9FD196D8A;
	Thu,  6 Jun 2024 15:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717688224; cv=none; b=CqBEemiMncSRwy2CMiXtI+xY9d4WnPSwBTJ45lXpqx8pAUTEPbgeG6S4xIhU/bqr5HRUwIYCKB6/0IQPTYRi7LBY6X0yzInWoMF7wI43OnHVOgk3JC4+CA7supaHiaGWxr34Qxso77fkT1yMIOuIZpqzHLNBWSwCgBxjiOOH888=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717688224; c=relaxed/simple;
	bh=8IRaGIAu5SixgtXpZ2x6JYooF0GyoO78DkGRYYTzrFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YnKTKRaatFxeUoFlywG/yOn1b5EMkUMdvXV43vqmA0bhDjZJYcF0oS7IhguCnkl20PrVwgb6CY42K7XoFKHTXHRkMlNPW9fJY8nHb4Mm54C27EBW67j74IDWWe9OGZFtVHbmR2StU+ZiGRK6agKHPNNzqnB9rE8XMSnTFqkej0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UUzz+siz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UUzz+siz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-57a4ea8058bso1249327a12.1;
        Thu, 06 Jun 2024 08:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717688221; x=1718293021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z0CcpV2wixNBBsWnqllQP0w7gH4qVqjZf0tpOhmRG6w=;
        b=UUzz+sizx25Y4gZSFOr/ufy/QH8647riNSzX7lFGnasTv387VRQMb4m7Fhofo0i9IJ
         z0s8mcJn+CNItFxK0bI1SdP1tCP3l6FUYmvLhc8dR3gx7gsSWEaDBrxurUP0MJmox7fw
         DpH22f7C34ueKtk31Qh1TGm12qBpva6gQvrJsw205qc44njrQf/eRJ4z9P0aTwa9n3gr
         W+H7Fn4cR4A5BTn3VWHNVC2GAzTCapnOeimT1jM4vXZ3oqMjQ28OVwwNTuoneoir4lMq
         pBD06RrvgLy5LPkzTJZgfXBKirmo0231kzKk4ln0K359xod6VRDFfZMdEPyN2oI7sGRD
         t1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717688221; x=1718293021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=z0CcpV2wixNBBsWnqllQP0w7gH4qVqjZf0tpOhmRG6w=;
        b=bL97zJFZ8JgNVAQlzSddfmGtxvPFFteFCEsYFYsFpc2bMprsbxms2o61rMosfCJyo1
         oZbLPFC9rhd+ZXD9/rzASfKyWcXBWbDtgSHQL16txf4Tq4VaOw88b6qFIDegAt/hfC+m
         MYpFrVKFJGMdDZ04croIKtXAQ1VcO9Ym6z9NzMo7ApFwXGWzSA7ZQYIwHdif1tSx29MW
         fqJXlXkxakK8exq+U4HSvpyOAxtKjZjmzblyDCGPEKLuxZLLZ9EoNVT2uKZqoQgZG01h
         wz3X3YFkZaHcAGueWKRNgTTCQObyAprenSz0j+6fkk5imncj9wcm4qt3yLbnywwKsNCm
         lfcg==
X-Forwarded-Encrypted: i=1; AJvYcCXJ2tSPG/QR8V2aTKNbNfJDEGiiWtYHkUPH3WH0GtLuAB6O26AiXQZm7b2B8H7QYNVX0/kCmHt/6EFTQgdgzbnZVv58wRUUwz27yGxI6jmhq0lEGqfkrK7+01Z76J7jyzEqVy/vpzku8s90Oj8=
X-Gm-Message-State: AOJu0Ywh7aEDmq9ZXeWf6zx7Ovx35eP9lH5MtUwc216x2jl+387Zl5+C
	TPrW87yFGRHpZoQFNwebM9QJjBucia+rPFktm2MilKmkJy8S7zk9FYPRS4qpRy8HUtZCd4hCPKB
	qrqtdErNg6O6Kr2wYipTOkT/CNCo=
X-Google-Smtp-Source: AGHT+IGYy+6jXYj5hB4bCe72oEPd7/wFRZlO4muopcqbCwOTrV/F8kNYcHgUnvaExo6oahDVN2z3XOtiHpb/dYfZWqU=
X-Received: by 2002:a17:906:349b:b0:a6c:717d:b97b with SMTP id
 a640c23a62f3a-a6c717dbf08mr261559266b.34.1717688220973; Thu, 06 Jun 2024
 08:37:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240606144608.97817-2-jean-philippe@linaro.org>
In-Reply-To: <20240606144608.97817-2-jean-philippe@linaro.org>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Thu, 6 Jun 2024 18:36:24 +0300
Message-ID: <CAHp75VeUo=2kq7R1t8Bv9rWrkv0b20oMv1mPtJBM69rg+S3LRg@mail.gmail.com>
Subject: Re: [PATCH] mm/util: Swap kmemdup_array() arguments
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: thierry.reding@gmail.com, jonathanh@nvidia.com, kees@kernel.org, 
	andy@kernel.org, akpm@linux-foundation.org, linux-tegra@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 6, 2024 at 5:47=E2=80=AFPM Jean-Philippe Brucker
<jean-philippe@linaro.org> wrote:
>
> GCC 14.1 complains about the argument usage of kmemdup_array():
>
>   drivers/soc/tegra/fuse/fuse-tegra.c:130:65: error: 'kmemdup_array' size=
s specified with 'sizeof' in the earlier argument and not in the later argu=
ment [-Werror=3Dcalloc-transposed-args]
>     130 |         fuse->lookups =3D kmemdup_array(fuse->soc->lookups, siz=
eof(*fuse->lookups),
>         |                                                                =
 ^
>   drivers/soc/tegra/fuse/fuse-tegra.c:130:65: note: earlier argument shou=
ld specify number of elements, later size of each element
>
> The annotation introduced by commit 7d78a7773355 ("string: Add
> additional __realloc_size() annotations for "dup" helpers") lets the
> compiler think that kmemdup_array() follows the same format as calloc(),
> with the number of elements preceding the size of one element. So we
> could simply swap the arguments to __realloc_size() to get rid of that
> warning, but it seems cleaner to instead have kmemdup_array() follow the
> same format as krealloc_array(), memdup_array_user(), calloc() etc.

LGTM, it seems we don't have many users (yet), this looks like a
comprehensive change.
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

--=20
With Best Regards,
Andy Shevchenko
