Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55DF3DB9A
	for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 18:06:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708625175; cv=none; b=hl7LTAlh1CyIOw5JTzVA1ZG7MTtyU5f1hKfeHCzcM/dcrMQaMERvR5q10ysXAopkI1mmRd7e78+9OVpo7cVsceaqQylZkofCeq6z1FmXG/DxpoJZp1zN77i4FPAmFL04iQQOZc/wuU9uezs2DkNtT/NXWUGk5Y5iiwCf0MRYbzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708625175; c=relaxed/simple;
	bh=Z4Vhisi5WQ4eq2rw5llNXGikw31+3fiPmRp2FAs1+DI=;
	h=Content-Type:Mime-Version:Date:Message-Id:Subject:From:To:Cc:
	 References:In-Reply-To; b=n3EAK4eEacSZTotVJKaDWfuH3FPtQyM33Ruj3OtMZh6WYTWU3qR3En0FiM5A6PlIROLDwaloxg2zfxDNzVacgUfKVAPW7X/GLA1vVKWNq78HVINgfgVpYzK4/9WCbddiUxgxG6R0y60+bGjoN6eVQ4gv1peoGD+JzJaOqeupdaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VeF9bbKw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VeF9bbKw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-a3ddc13bbb3so193831066b.0
        for <linux-tegra@vger.kernel.org>; Thu, 22 Feb 2024 10:06:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708625172; x=1709229972; darn=vger.kernel.org;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=23sxARfoLLtuANI+8O5QcT09VvJkT8XI10hruzxREg8=;
        b=VeF9bbKwIvbfWKYB/ZjS4zDHV3JWtQmhfO2fMxZVJzCoO3ZUGp4+/h8yuvNY6Q+XS5
         l4EcbaJzD2h0iy0h82qOcHH0jYHEXNXTMKbPrU6Nx3bXngtFBnrh0SoSQXewAzd50nue
         Uo7CxnDDXxOUdErsilcXbgpaMVGMH1N3+AAmBOeo4sIYeMrIwy6GFYZBUz+Uj4YTeIRP
         Njdd9qp7BrtiQsJN5bBM7/NrBCBAa8ItHy1BetGg0D1cJPDkRu+3O/qwT+5BzIuwKtn7
         SCUzXM0/P9Io+l6wYYbfSQ22fzQSKc9j/j7jsbtdGCB34RIwMcA4OjGnuJa0GOAzPIkn
         rqxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708625172; x=1709229972;
        h=in-reply-to:references:cc:to:from:subject:message-id:date
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=23sxARfoLLtuANI+8O5QcT09VvJkT8XI10hruzxREg8=;
        b=hZFGnEngWbLX9VlFAoH2/C10MSBOsJBxVka55RDnVf/a9byc3P9o8BIFtChC2rilzE
         eJGwaYOK3E5ehjVM/fBeYaLtNp3DJXrzNzsoTb0qCSmptzZu0ksLciNiylflhUkRohtJ
         Udq9ztrxOeRC9jTXBLQ8Q8CaTEjVIHW5QELZ8rlfLV9G1QfxWSI3Rv6vDkL337qF5etr
         dPostfNoMGngZM6ADlv6mkmEt+HZeum37SaTdpP1FIb0PEZlTRpoMI1AygwOJB0c/1wV
         ao0gDwR7kQ9sHN7L8mWVwSxOhtxcwBncnkW8hUtg7XoBAwfX7XrUjcpExaz5o3zW4Af4
         cg/Q==
X-Forwarded-Encrypted: i=1; AJvYcCV3XWhqqSDg2Yuf4XDAKP7sAqdUknLyReyLvBNbipWQ5gufoCvdyxqY29aVIbiDjd5F6Ga2O4pbI+TK5Gmg+NYzwDKbXDOtywxPZNI=
X-Gm-Message-State: AOJu0YzydOg1746g26WGvBvc6FNFCAQmpjb3xxoZK8SiqtT8iuNOAiWt
	JUjah/8+d2kL6qYokcqDAiVliuI659CN2o7PPDZk7dxIcC2mx9QjsE7xLI2X
X-Google-Smtp-Source: AGHT+IFhsO8Xnm0fF5/bEORNP+Ggj3xPHQT+PkXGStvV3I38Lkij7k1+BJy0Y7PPxfc4TFdkTCGM+g==
X-Received: by 2002:a17:906:c40b:b0:a3e:6bd4:9ac3 with SMTP id u11-20020a170906c40b00b00a3e6bd49ac3mr3085190ejz.11.1708625172028;
        Thu, 22 Feb 2024 10:06:12 -0800 (PST)
Received: from localhost (p200300e41f2d4600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f2d:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id sn24-20020a170906629800b00a3e1939b23bsm5826313ejc.127.2024.02.22.10.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 Feb 2024 10:06:11 -0800 (PST)
Content-Type: multipart/signed;
 boundary=4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625;
 micalg=pgp-sha256; protocol="application/pgp-signature"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Date: Thu, 22 Feb 2024 19:06:11 +0100
Message-Id: <CZBT2NJ7IDA5.1OXUZ5JBIQE5C@gmail.com>
Subject: Re: [PATCH] gpu: host1x: Skip reset assert on Tegra186
From: "Thierry Reding" <thierry.reding@gmail.com>
To: "Mikko Perttunen" <cyndis@kapsi.fi>
Cc: "Mikko Perttunen" <mperttunen@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <linux-tegra@vger.kernel.org>
X-Mailer: aerc 0.16.0-1-0-g560d6168f0ed-dirty
References: <20240222010517.1573931-1-cyndis@kapsi.fi>
In-Reply-To: <20240222010517.1573931-1-cyndis@kapsi.fi>

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

On Thu Feb 22, 2024 at 2:05 AM CET, Mikko Perttunen wrote:
> From: Mikko Perttunen <mperttunen@nvidia.com>
>
> On Tegra186, secure world applications may need to access host1x
> during suspend/resume, and rely on the kernel to keep Host1x out
> of reset during the suspend cycle. As such, as a quirk,
> skip asserting Host1x's reset on Tegra186.
>
> We don't need to keep the clocks enabled, as BPMP ensures the clock
> stays on while Host1x is being used. On newer SoC's, the reset line
> is inaccessible, so there is no need for the quirk.
>
> Signed-off-by: Mikko Perttunen <mperttunen@nvidia.com>
> ---
>  drivers/gpu/host1x/dev.c | 15 +++++++++------
>  drivers/gpu/host1x/dev.h |  6 ++++++
>  2 files changed, 15 insertions(+), 6 deletions(-)

Applied to drm-misc-fixes, though I added the Fixes: tag that Jon
mentioned in reply to v1 of this as well as his Reviewed-by and
Tested-by as well, since this is pretty much the same patch except
for the comments.

Thanks,
Thierry

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmXXjRMACgkQ3SOs138+
s6EGhw//QO3oeEMLuSNhH/BAcFwzkvx66/9jQOm1ZXuVXQyXD7SPXWUkYmdD7MAD
jYGu2TSeBwmXERytQOdQPTCYGsADbVnrP91WwqmMtjcWExnkRO49NgSkxzoWRm7E
REtIWJ3QtS7SwnMgqlQcudFtKlNrAiTkpIgJQogfshQ2lIt6D0wkGh531ZMSKSjK
DPBbVC/D9MBUhq2kV40t9itXjdEXrITIbzTMKdCdOVqFVFoKApDtPTiwrxhye9YN
BqOgjs45Rt0qe0RmoflK4BNhn34MSbIreOUqyGHBbbJjMHBfmnYXPG82z8Omdeoe
e8hDdbTs3NGly0/lzWLaOXco92C6QdmfP+eab/ZUW3xtUjpuuN6cfM6HWKrzkzS8
RmOJFu3/JqXdlPvbDNH0jwibpytYXicMPumSx0kLeFpstSTBuaUb1gaPguBHOg40
VFvlSzApq3Qf+dWa+QEr9g2Qy07HYQVCn1/ggEOnWp7tCZdCRyWhY5tYeQSiiQdI
kuXfO/d8nBypShDOlFp9fUSJOPoOxxXS5kg2xH/N5ozKEj9JABpNW6n4XKAnw3H9
XIPrDeW+Y7XCcSRPEoGK1ZY5C63wOhZAQQj5dFRB80pZ3UYl4AROisrTr9CAUYWS
/09cBIDw8vYDWFSwTeDBqbIAT/M9DXTB8qOQG/nZH4Z5/8c1224=
=TH+C
-----END PGP SIGNATURE-----

--4a659079f1e590d675fd8e64a35f402ed1085394e8a76e8a2114007e0625--
