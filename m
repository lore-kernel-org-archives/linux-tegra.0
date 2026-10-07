Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552BC480DC8
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791369319; cv=none; b=HitaXY6L+hiWnxofFlWCGKBbeZo2K/lOoNOTJUuoQVURSzJMvB88RNam2VLF4SICTzrkZTVLiiW0rqFFL21Bdqh5Z6H9UoZIBNSmD5tMSJRn1f7qoPVS2aHa988FsJAB7XC+3Vwt9Jwm98ddR2oY4u9bVm2f/H9GFz9WDbj//fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791369319; c=relaxed/simple;
	bh=SY5hGdUMKL+vkSXVUWU2fDNC7CaN6u1zVKrHh6L2mnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P+icBi48IpeOWChkZpo2cyubb2VerwzIMkomuvPhT4yp62FlAA4I2MsMGQ276iMxstB0jBagpFO5gDwJFI3IsRLn51ESdZ1p8DA6T+NHF3YsAb9XyZn+/1hJtlI197MfaxPb/HlZ17JQhXZxqp4o8Ao18uxI8yP86+kRggQYNZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q+h3/kHO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q+h3/kHO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8A0A1F0089E
	for <linux-tegra@vger.kernel.org>; Wed,  7 Oct 2026 10:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791369283;
	bh=CKJYdpepEC9t31kyI39+84ULuvVRvlRzZRyf9xALOgY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Q+h3/kHOpmfQKBgqA5TX+/Ok5rxmI+QEIR4P4pJ4bCEIJicElOcQwUwQJGlO1i1Ws
	 toe8W0Q7A3JHfcGH8fqtnzXFqUB/1i4McSlq3MuZLGivslaqO+ieiGnBlAY31yQXVv
	 5ScPA56qIub5t3VlJNbvKolntByfWJ0DjDFj9zQ1B6qPEdXBqm6ZCInkRyt4030pSK
	 G2eljQB1I9TvJflB9PGeSMPnPpS0kvpJx8qql3+Xlsnv6xzf65OSGa6SKNlAf910P6
	 4YVQr1SVc9UbCsIWZAwY1aPikyRqzz7FLtsgRxwTd2GWkdLMMQDldaXD8JmOZHXf/G
	 IDyopUwYTQfhA==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3a980c01033so29375981fa.3
        for <linux-tegra@vger.kernel.org>; Wed, 07 Oct 2026 03:34:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBzzpsDHFLGlEYD7hfVsnhGUuQx/sumtxPl1oVpPape50dQlqRP+MIg8WvSrp9n3LQchZKaoUVuFc5slGQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKc1RoiyBFlrOPPJq2Px0LSH1L4YzKjgZEu8ucNwOTiK9Q3wzpA
	Cpz9UDtD5nm9a85bKJ1WDnENtIqx2oRKhIzm+FuvolymHGii6jfKMQYxUhG8SrXdKjWU4u6SDfc
	vc0uoQJyszmDg8WQ5wpub80z719rqoX4=
X-Received: by 2002:a05:6512:b25:b0:5b6:1a7c:59cb with SMTP id
 2adb3069b0e04-5bcd0716b5cmr656877e87.37.1791369282589; Wed, 07 Oct 2026
 03:34:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261003083200.459705-1-yaojiale02@163.com> <20261003083200.459705-4-yaojiale02@163.com>
In-Reply-To: <20261003083200.459705-4-yaojiale02@163.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 7 Oct 2026 12:34:27 +0200
X-Gmail-Original-Message-ID: <CAD++jLkHvS9Bxwsi5fwgKewVOFTDxe-dEN2oB0uc9bWvLCw=4Q@mail.gmail.com>
X-Gm-Features: AclHuK97HZbcKllT-8LBoNn74qfc91fEI-mtBXOUmMCOtocPhnWFRZmTtX-YKnk
Message-ID: <CAD++jLkHvS9Bxwsi5fwgKewVOFTDxe-dEN2oB0uc9bWvLCw=4Q@mail.gmail.com>
Subject: Re: [PATCH v2 3/4] pinctrl: tegra: xusb: free maps on DT map failure
To: Jiale Yao <yaojiale02@163.com>
Cc: Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, linux-gpio@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 3, 2026 at 10:32=E2=80=AFAM Jiale Yao <yaojiale02@163.com> wrot=
e:

> tegra_xusb_padctl_parse_subnode() can append mappings before a later
> child or configuration operation fails.  The top-level callback currently
> returns the error while retaining all mappings allocated for earlier
> children.
>
> Free the accumulated map on failure.  The caller ignores the output
> parameters when the mapping callback returns an error, so they do not nee=
d
> to be reset after freeing the map.
>
> Signed-off-by: Jiale Yao <yaojiale02@163.com>

Patch applied.

Yours,
Linus Walleij
