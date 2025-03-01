Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3BC1E2614;
	Sat,  1 Mar 2025 16:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740847354; cv=none; b=YUqqmoe+xbTOj0QMJIEmyx1rfM1SdrN0uUnAQVYek02uC8DTzLZbZYt1WV03KH9u+4qbkRG2nU23GRWQfmqcU+LqgFyDQ6VbB7FBD5oF5L1taqdh79SAePtyx1Wyrc8Kf0BHzxreEzvBpretTbTdjZPpZ4uoE28vpjJ0iHMnc9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740847354; c=relaxed/simple;
	bh=bg4rGdS+Pk2ZlzGTI8M3rWsGBaLC6JNIi8ZvSfcHbJ8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aESYDPAfhuH8ZIcGC48mC0tkL41EWZinoQKczZdN8moqEb1Q0oCl0IHKn2qOrwCRDeVn1jKCjjVeFaMraj33sfgHhzmvLhZYDH9OoQKeQXUNfJHsMuETVzwHNz/FqjAbPmPgDmhNF9FBPqpqnQJhNcO7sUGjCUJZFkHR8G1PVtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx9H4HYk; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx9H4HYk"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2bc659753d0so1789002fac.3;
        Sat, 01 Mar 2025 08:42:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740847352; x=1741452152; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvSbGq+tRdDXuElF4oLDchI5DGqP2DY/hgfTWPl/doU=;
        b=Fx9H4HYkjHQ1/XWjaAEj22Jnc6CpxF2yrxTHllJx11P9YlpZP5BWpJwqUM0pp4pTi4
         CP+Y/9xyCHVlDJBqk3EVZxjQPbE7cyfkcatk3h2DmdCeIjsI9nLCzxoe2rwda5RkmwgK
         KDgoudYACAXpFAEpsNe/2UZy0e1JDFVFXvxzfKjhThXiS94ZfX7j1r8VGcs0eNB83XWA
         4k3fNF9ejUn85rvSu3ria1wrImrknoW5lq3O9z0nafaBboL4XnpenV3ya+NO0XxCs95Z
         JPTOnXsICjLI9qXtXZb3qs9+xAfDBai8q3hGPvU1QuPqM6M67UA/4pt/JPK9uQuPD5Tv
         l/cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740847352; x=1741452152;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvSbGq+tRdDXuElF4oLDchI5DGqP2DY/hgfTWPl/doU=;
        b=UJby+hBr3thpeABs9iG0Z1HZ0FDr1xkwWoE32/x9VSYohhhwF46A4pmwnt1vvTVT6/
         rxcD3/LcAl/XzyL/9O9zKHlKi1kGmM8b3O3X8sk0P1jPEsuqSLAtp9AqQxnZQ1hZc0IB
         jeZrIIkBnQ9gn3wnJ6yns9JaHqsZh+65Y3Pa5y3igO78MFh5hNXThcnpYLsUZ35ONQEZ
         +bg6Q/bGZxmwyks7Uw8eOICXDsrbt/hlDA0GJgsflSm6wZEHkl4f1i18WO6gzlzIZJSY
         EafcXR1xhcKThlih0Xek4A5wNiC9lKNIkePOelACKSTAlcxdgcH5t4bBrBeX4lMU3Kck
         /KgQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3F6F+NWNIQA5NJTsNZzChjD0zlsK4NUmPQRDFw/Kd/+D8CkqMrLyJFZ++HAKMDUJDmUxudxDaLq23Vi8=@vger.kernel.org, AJvYcCXTgTWIFP1XD+teQ0oVNysi5C/PypDUNq16/Gn4o21vHy+7mIeQJIyZ8pXSPU3C6rtb4vBwfpietaxNt2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRmJdj3XnDvV1AvnRvvsjQzNGk3sIAhm9/AagYQZMEl3RzjbYa
	7EIurDWthbNM0CC/pnVhCyPphXyW81qAmqAgPcTRdqP/Y1VkDraIhjkl8z46S1Cb8lpDMtgqZpT
	/UxFTDnmj/+ZVxBR+FEQ1Q2vjGZU=
X-Gm-Gg: ASbGncuZsnuio8k6MB8yKUCk7qToofAboUiijAIabejnxRnlqaLIX3mpjwGRSEPr7dG
	GZegDCE0ev7xSI1AdpkBhZFmdcZOpXhDl5x/pQlGriCHxQfyXtBSxKAM0R7rCLJp4BmPA9NjMHP
	QY6ZNf5Wd3yWPzdmc1x07SSghhwCw=
X-Google-Smtp-Source: AGHT+IFE9gf6LDQPRKhvxtM2nNrrnaI3YAlYCGncwLkz4lgZwj7MxELFZhURqIRcTN9P5fip4nTbf4j4ED3/ja6OVRQ=
X-Received: by 2002:a05:6870:de13:b0:29f:b7f1:d844 with SMTP id
 586e51a60fabf-2c1782c4dfcmr5091882fac.2.1740847352336; Sat, 01 Mar 2025
 08:42:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250123124632.9061-1-kkartik@nvidia.com> <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
In-Reply-To: <hgvxugls732nt5yfoqygvxn52x73ioh4qpbbmu6swwmafsrmm7@w2gcbjinmujj>
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 1 Mar 2025 10:42:21 -0600
X-Gm-Features: AQ5f1Jo__GYQdAFfUZc_Rodo0fOA0pssJDVvWGcnqwxrOzuo1UKQ1PjZkQoMrkQ
Message-ID: <CABb+yY1Dygm=v-2aRc_uwKoEC6EFX1njo8E1dzHqTQqfLnUniA@mail.gmail.com>
Subject: Re: [PATCH] mailbox: tegra-hsp: Define dimensioning masks in soc data
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, jonathanh@nvidia.com, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 4:35=E2=80=AFAM Thierry Reding <thierry.reding@gmai=
l.com> wrote:
>
> On Thu, Jan 23, 2025 at 06:16:32PM +0530, Kartik Rajput wrote:
> > Tegra264 has updated HSP_INT_DIMENSIONING register as follows:
> >       * nSI is now BIT17:BIT21.
> >       * nDB is now BIT12:BIT16.
> >
> > Currently, we are using a static macro HSP_nINT_MASK to get the values
> > from HSP_INT_DIMENSIONING register. This results in wrong values for nS=
I
> > for HSP instances that supports 16 shared interrupts.
> >
> > Define dimensioning masks in soc data and use them to parse nSI, nDB,
> > nAS, nSS & nSM values.
> >
> > Fixes: 602dbbacc3ef ("mailbox: tegra: add support for Tegra264")
> > Cc: stable@vger.kernel.org
> >
> > Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
>
> Maybe remove the blank line between the Cc: and S-o-b: tags. Also, "soc"
> -> "SoC" in the subject and commit message. With that:
>
> Acked-by: Thierry Reding <treding@nvidia.com>

Fixed myself and picked with the acks.
thanks
