Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97C99220F27;
	Thu,  8 May 2025 21:12:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746738732; cv=none; b=uJ1CIanRs4MhGbIgY3DGXQZ8h+Gxn86B6DWj3kGd0NzHXN5neitrmON6PL/utwpqEDqd693hxdi0A79Uw+u1EHmqPWFCrALMDBRaSGSBPHB0yR1GBHBhoFTsaVl6qToli3DPKb4QUSFDOy1Gfk0AbUhAzcGsPRZR3OwLJYfiokw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746738732; c=relaxed/simple;
	bh=Y03yt2F9GY2M/JUkLlGaAKVHFQnD51SLZfOToXgxJnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RHYJAuFlTEaNWzIB9Daj4t+1VTceN+HJjp7H8JQ8vPsd+rk0SbDQOYSswhJfG2TjhLwx+KEQDHtPMW4jTAQoZL9aGNvHTvYqfRD7ovATziBi4JbQ4MLfLqqNixHAUGI1/6xiABVY+keBCbuZuW+H93K9He9XyUrqIUicbBw4qnk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aHoUfE6L; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aHoUfE6L"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a1b8e8b2b2so420684f8f.2;
        Thu, 08 May 2025 14:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746738729; x=1747343529; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=QXsssHBev89zw2MSQtYyLJLZXpMvVaD0rH2BER+YTvg=;
        b=aHoUfE6LupP2d0uD+ml8AwG+68L7HQfyfQhMRwWGUCsrtplJ5MjqTZpitw/kjrOd06
         2dxQqz9ECFUzwLDipCSfhK5H96egCm1tFkAUvGA6PT3RHjf9DLajtgK6koUoXJdyw+4u
         /mvba6NDoqsm8BOybO0XAAVL9RlMHatp29oHFEuzwY7Xz4ijz3HCo2fByhgAyxHPPEvY
         5Y/LRRJHi6r3dKRXFuIrM4Gq9Tt1uFAXK9S4vfscfZOm/hZ1nwSMwVv4cyOw5qydNzna
         WR6Hw/nr/q3Rlgy6p/8ZDdwXInQI12jsbpMr47eQqy9by1MQ7cBO+/xXntqAKjRVxVUx
         YBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746738729; x=1747343529;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXsssHBev89zw2MSQtYyLJLZXpMvVaD0rH2BER+YTvg=;
        b=QDjVX64piS0TusS/5yx7Xz17dNo/50XhttGZFdN0jvhOl8PiJbiQe9ywYV70xWGTGH
         yfUsmQILvuLHw8nsbmU6z7RrNe55677Grc9nFkyHdZ3g5VHoWWZ8BMOuB8aGNAH68CmG
         qsrEw9jwZrUb/r9skmoM9kciBPCImlBaQSWfB8BGc5F8A7ISXOiwahh6Nk2Z9vOHHToO
         fBZXgVNSa4E8S8TWy3TJX6aIb8zix/Ot/K19ooc7szL4fy8Ki6QY4rPN+HYsC/X6eNPs
         G9OU6DkS+/jQVSicFWnEuJmGow4GuUpVRWqOlsfjU+IBgTcolYg79eVlEpbvw//5pWiP
         AlcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlOI00Qt+SAobaLF31a4zoqOZ0YIydfJQy6rphdrYbHhoH1JiI7H3PBV40E4y3ti6TbvBQO/9R8oGgWwCq@vger.kernel.org, AJvYcCW46Q5cCR8q1E8zQ96BVjGT4IygV9N8kL4DL3hxt+7jK2LDafqtHLKoqdNS86eDsf2Epz1S6ULohHXivuc=@vger.kernel.org, AJvYcCXNX7S3vjJGa9rjfJiM5s1pjEN6RWVoT7wKFdyxMlKR1RztWg8XRDJMeMbyufHpwSUz60mkvxdUMCRy@vger.kernel.org
X-Gm-Message-State: AOJu0YxGyY6mlbYlfitOb6MUFfpH9H+ou3bvPIiuBubuedhfzf62XeOk
	fJU5zkEwpzMByz0JXmCIilbyOrWOVgwM6nByzEh7jPad6Mp+/Iri
X-Gm-Gg: ASbGncvNDCNCop7Pqu7wz6+KtSn/ygcKkV+6dq5PjAPdC37riVEOrkI07jccRmt7lNK
	W4rgSY/4Meoc5GXmuTE3DDKnUpCDG40+tRU4OPF3Hv/has35fwxSZcsoQFbEcMIwkxWb6iVhf/5
	f6+QC8UbZKIXzRzOLAmV5pYBbwN0sa4e+uX2JZ08topBJt41VTxYHhYjtYXZ2NYzD/PA4FuWSIe
	XAtFdCRQZsmQMj3Oyt1IU5aJLyN7zYQBht4O8wRrZ8673nDADg4zOESdHgCAcAMdlzLKW0B8hzC
	/13xXAADLvWSK5eG8nK7gCeYDcFublzjTXilFfXkP8HQU8YMdySVODLtr9raeZ7QSmux/qstA6i
	ZDgihNLGMbxj5d9Rp+jh9e3DaE2efNXG5PCmlng==
X-Google-Smtp-Source: AGHT+IGZ5UZCBT/ZXTKQLLgWmt7g7eoK6pATm3TNtHyvZRGoQoXHyipRR92qmmPDaUzhPRVC5Y4YTw==
X-Received: by 2002:a05:6000:4287:b0:3a0:b635:ea40 with SMTP id ffacd0b85a97d-3a1f64a3e3dmr845022f8f.55.1746738728771;
        Thu, 08 May 2025 14:12:08 -0700 (PDT)
Received: from orome (p200300e41f281b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f2fe6sm1072304f8f.58.2025.05.08.14.12.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 14:12:07 -0700 (PDT)
Date: Thu, 8 May 2025 23:12:06 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: webgeek1234@gmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Tomasz Maciej Nowak <tmn505@gmail.com>, 
	Thierry Reding <treding@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Add uartd serial alias for Jetson TX1
 module
Message-ID: <dof7iez7sbm6jrhcmdx7hgm53tynxjaeoyfkcp4zxrxxwpikp6@2jl3ahueit5i>
References: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="z35vkohc537tb7zj"
Content-Disposition: inline
In-Reply-To: <20250420-tx1-bt-v1-1-153cba105a4e@gmail.com>


--z35vkohc537tb7zj
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Add uartd serial alias for Jetson TX1
 module
MIME-Version: 1.0

On Sun, Apr 20, 2025 at 09:35:37AM -0500, Aaron Kling via B4 Relay wrote:
> From: Aaron Kling <webgeek1234@gmail.com>
>=20
> If a serial-tegra interface does not have an alias, the driver fails to
> probe with an error:
> serial-tegra 70006300.serial: failed to get alias id, errno -19
> This prevents the bluetooth device from being accessible.
>=20
> Fixes: 6eba6471bbb7 ("arm64: tegra: Wire up Bluetooth on Jetson TX1 modul=
e")
> Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> ---
>  arch/arm64/boot/dts/nvidia/tegra210-p2180.dtsi | 1 +
>  1 file changed, 1 insertion(+)

Huh... seems a bit over the top to fail in the absence of an alias. Oh
well.

Applied, thanks.

Thierry

--z35vkohc537tb7zj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmgdHiUACgkQ3SOs138+
s6FDHQ//VIwAzjJvLpKrl7Fj+/NVymjjBruYnOchUVcYO5ZPcjiTQ9YuD7EF66UO
eR6Olqe50xL7Fv9GsdTbPz6HUMhAjV82YhcohH21qjaAWcyFfsbOP20M8nT8I+JC
/7CKVok/mYSgmCgZWa237ML6ThbmBc44kU8aAIk/SYlmkoMtx/rPY21unJc9TAhe
7fi8JX9EDR32IFha+xEb3DyQAP8mcraoPhQfkwkB1wNtMlFPKFcAVKBnLifOEHIu
cc7SKr77e9/JmhGNMIs8UJ5i3pbmh1WAJQu43UVqGKtnhU2GkWPDaIpROGhXIanJ
n4x2XHK+iBQ+FoNK3zb5dxd5WqiWkzuzusX4N0v957bGVKj1rEwRW8blk7Y+7LwR
WAQlmMnwu//RKNSUGRxc5YPRxemEAKVFMqEnJ8r9T2UKL5e+Vphba9V+lcPgd+um
YJzR8lFTPwWOjrKWRy87KZVZy2uhMW68CsqQ7QEuIUixBQfGdTQuR9zT0juq1PFg
il0mVNnNmrUIM9YVN1gVVFWEMmVhyf0yZssPLhgCfRhXSUFlbAiv1Z9Zh8pd9FQR
+pREttXHUKRyziUSog02w/j5yroyFLOPvQaE5iG+ogaXlzCguQOXIRvuFpvdYdkD
+dH4An2TN2yJEd66+iMoMmZgHUWYrcgliRvslWF1TAbcx7z6hQY=
=+bXS
-----END PGP SIGNATURE-----

--z35vkohc537tb7zj--
