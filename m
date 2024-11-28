Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FDB113B7BC;
	Thu, 28 Nov 2024 10:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732789356; cv=none; b=emQ4W9usBnxCf3MeibJQMVXktzXZnf5p+plwO+eKYpx9THa4RoTsnO7U7Zy4wstP90vUypy8mvqLFdmsd+eXOj+cB7dki1t+QQTi7LyHa5mzlWHQyEDifEfZFZZmZ1IhufB8xa9Cck3S+IAb8/LFHQJrOLpuiXpXBKnxEV9sBnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732789356; c=relaxed/simple;
	bh=rM+W/r9fCVDAYM30UfVcCV/3Tgxqt7aRP7hQNLr6zUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lpoyLdF7Av+7C/T5U5yx8Oi1hM0imtWc41QehJUeMJTRhJJyu8iExvs1UXZRlAhawkR2nIeCLCPFpEh4vWRiwfu9ynmQixCJbUtPVwEXjRvvR1OfP1r8v6DImS7NYm5Z9+ffzHNjoSsDzHhbQMVKF8T9kvCTSJqcEKVYrDFWQXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1msiqzU; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1msiqzU"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-434a10588f3so3691265e9.1;
        Thu, 28 Nov 2024 02:22:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732789353; x=1733394153; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WktIVwcYtva/77VEprM0n+jM9gFJBJG1FR55DeL0i3E=;
        b=d1msiqzUyCSZZHX/C7VffSM9CZOVitAdcyiSKYCcX54LjO1nyO4guwSLVyDoH0zttw
         eHOjS15WDWN3xZ7Gy9Ma+OYgrbbnhg8MUoqROzQIM5b5K3zMSplQM73lkeN/p6J9yDu9
         zibyUm30/EYbyogwPD99yOyN+vWWamS2sIZ2ZJgzUOC74rhLwixfbmvLPMwZHFKqJTvk
         qCCyVWLytiA5q7JGRgY0Hnzw7ureV8BUjaFUwufZxdA6auuhF0DN9sGaxc7tHplznUqH
         w6cmSmnt74GHzMNYRg2gl9V8F7AAdXr5OwPKENCdoJRpqRT1TcjFRDl7/BAz3XanoKoq
         os0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732789353; x=1733394153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WktIVwcYtva/77VEprM0n+jM9gFJBJG1FR55DeL0i3E=;
        b=Z2Mxvn6r7sjEhPxr1VAwwarEhUwM07JpkOyI4JQdKLryAow7uCgR+1LSKtLHosHT1R
         FxuU6oPfaL5QEGPzISN8XEtbOt2+nTaJ4UXkFcIrJqO0Y55Izoeue5j64yYztZZjn/5N
         wFUrnr6cE0KfryUJTGbT+ox3vsoB6PcEFLjhcdeBhvvB2xYupTMuBcFJn/ZDvUsBoDu+
         JsH2ZRsPbU/QLKclih+qCG2N5FWG2uAUyX8k0dKx+8PXR8EbGCBazdFkRo4JTy7s3yuW
         1htpBM/blav9f9EJ1W58U+RAEVwimBJkZly/pUP58YKSaTwRqkmuAkc15CIc7r9f/Jxk
         pnXQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5h+kEEOEEPs9iz4WPcF8udO6hCwg2OsO2ow/Hxb2XcxJkTyxDikSHylqd364C9TH7LiNmDha/OQPkCzI=@vger.kernel.org, AJvYcCXoOeGk6j2DtECgibDaWGgAoSDRe25bcmqLeA3gPUJqO1m3S9c3qlrgQEy0FFxtLL6eZ4ovSETjwGZYRmM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpIvzDGL6UzNC2apPOLoBJd8COp1+4H/BxlEXbPOjiaDOC6Eet
	lOU5obK+mmHJXqDJpcewjI3vs+Z5EaC62FT76n/u9U34hZiE/wQlAwsKvQ==
X-Gm-Gg: ASbGncuqKIr9mtsaVTFEfqhcJj2alRAkgFUyZW9Tj1Ts6/C2BuhpRnU8Flh3vfttUs0
	Yv9mh08hsAh7tiUTBFUBxdgqLrNsQazPMrotXiVHXJ53BAVycOooXCOPIcAAK5Q8iLoAYUE329n
	o6X2h1X83JIJIAgD9ZJzb0O2ENlr4mH/jZz7qDfE93LXYCN4Fvkq4SiMrZpNjD4gQ6/4khRNx22
	l3KKjNf4MkLM0EfwatCsyx+C6fvtzOUe/mBAF5SIOzEBgliLyPFhvfhMPsDdvibQXHHsKJgdSM7
	dTzf6kQupD2Vdsq0vkCriXfvWmV0msFx9PaA
X-Google-Smtp-Source: AGHT+IFAVw0mZ2FXcVynKdgJ8vLzM8AQou1uG0b5nxDGGMyxL7xI+YmGC5tYXs+bd83uwE+en3eOCg==
X-Received: by 2002:a05:600c:1d03:b0:434:a367:2bd9 with SMTP id 5b1f17b1804b1-434a9dc501bmr67566465e9.14.1732789353278;
        Thu, 28 Nov 2024 02:22:33 -0800 (PST)
Received: from orome (p200300e41f281900f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f28:1900:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f70d91sm17261055e9.39.2024.11.28.02.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 02:22:32 -0800 (PST)
Date: Thu, 28 Nov 2024 11:22:31 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: jassisinghbrar@gmail.com, jonathanh@nvidia.com, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] mailbox: tegra-hsp: Clear mailbox before using message
Message-ID: <hofrxrz5qvxohlvxme4brhng6rrs7s6wwoqwnu3smjbbonhwh4@xajjliw474v6>
References: <20241128085930.52571-1-kkartik@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="euopke2p2jba35ow"
Content-Disposition: inline
In-Reply-To: <20241128085930.52571-1-kkartik@nvidia.com>


--euopke2p2jba35ow
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] mailbox: tegra-hsp: Clear mailbox before using message
MIME-Version: 1.0

On Thu, Nov 28, 2024 at 02:29:30PM +0530, Kartik Rajput wrote:
> From: Pekka Pessi <ppessi@nvidia.com>
>=20
> Some clients depend on mailbox being empty before processing the
> message. On RT kernel, the thread processing the message may be on
> different CPU or running with higher priority than the interrupt
> handler thread and they may act on the message before mailbox is
> emptied.
>=20
> Fixes: 8f585d14030d ("mailbox: tegra-hsp: Add tegra_hsp_sm_ops")
> Fixes: 74c20dd0f892 ("mailbox: tegra-hsp: Add 128-bit shared mailbox supp=
ort")
> Cc: stable@vger.kernel.org
> Signed-off-by: Pekka Pessi <ppessi@nvidia.com>
> Signed-off-by: Kartik Rajput <kkartik@nvidia.com>
> ---
> v1 -> v2:
> 	* Added "Fixes:" tag in the commit message.
> 	* Made similar change for 128-bit shared mailboxes.
> ---
>  drivers/mailbox/tegra-hsp.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)

Do we know what exactly "some clients" means? I know that TCU uses this
shared mailbox and sometimes it does go into a weird state where it can
loose characters, so I wonder if that's one case that would be fixed by
this.

Not strictly a requirement, but it would be good if we can give a good
description of a case where this helps.

Thierry

--euopke2p2jba35ow
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmdIRGcACgkQ3SOs138+
s6HscBAAgmS95TwfRv7d/Av7oNT+xiv4gh9VMqqIpp+xHobPVjDYWxfrnitMBTS6
Z00ws8zYCuAPw+DarFh3efy4EacZz7KSyWkfy4pnU/CLvpcsnDLG4K+eBjFzok1T
VPpBA6Ors67BXu3HJa4g+41rFEU0Ba7CwgWSFTfzgAb6shCpspkcaWdZF0ESDwGA
ZvpvLabSxmEw/blSNsNRNZNaaYV35yQ4lE8sshFNqlac8SM4euKvogQitZCPlc0K
T69nH+xmDWUggHRU9S9eLvHZRlpZJIFHF/tQGECaYXSXOtUFgcHtE+YhosCmE5SM
HKRUUzSW51CXp3HvVIxrs04JAMhhbqT7qdI+MoVbD3AMkBLhYw2SS8CWtrr8/6ND
ReXGFBoDeyf22P4R3+l4lLgK3rTJjdPRtbZv5C2mqN8MqzI5siOEp9qcTGrZBWh7
D6PuZH1lDgoPQPI262/JwJxlni78cPtYa7rpZHNwmbRecw67RSqffyF1VeKr7hdX
pe2ePq0hsAE2LpSXKskT9MrH3UwA8jEVEcWfDdRTY0i6rFMw5rBJyc6G4MVKrhkd
jT7uyV/ss8L6kJN5el+oPmbU+xv+DT76NUf37cFWJ+uJUEQN7Q6eG4tZdYLtm266
b3SqNUBRbunexRsaSfvIqBKbXkmrBstgnTMe7u8OsZNkyDb6YAs=
=KfZi
-----END PGP SIGNATURE-----

--euopke2p2jba35ow--
