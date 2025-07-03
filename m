Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E8F32E9EDC;
	Thu,  3 Jul 2025 14:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552384; cv=none; b=dSeLQ8X6+ovHP7nDrxmpLEGKluCedyq23QLHJCgmP9l81BrWhnXrBArbIgKwIDQ8rYZRmM0x1NjMxFn4BeefpXUNMeXECJ5Y/WMhAZx5XH4FKblQnexz8kLGIyW30Ty2EiZju7UbisKCwzbp4PI/xG1GAsTvLjlELJGGXIGhl7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552384; c=relaxed/simple;
	bh=gYu4VpJOq4GDLVfJXtMhc6azm8H7uwl+XVGt27fUatU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bel9onQ3dnzWY0irSJv7OQVviY06F/UCtSf3o/70rNIDc0AXrwKpt9o3oeYeF+hHXUUsCn+RxTIljmVK6S8Y7OusmJDqdL27lP/oTFQ0mcGzqhNWqZer7e9Gkz7nkK8kRKdzmpyBUcn86HjwKISwvVgv+QPT+xSfd96ewwKiobk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UMs5fDl0; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UMs5fDl0"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a588da60dfso3573746f8f.1;
        Thu, 03 Jul 2025 07:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751552380; x=1752157180; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe7AMi6piMq8RFDUj089cjDwF69NDAcy1zea886cQsM=;
        b=UMs5fDl0Ki3INUyOVzcVdh1AQCjhHS3Lt1y4P/HhqO6QufjQ5imtCT1ShvksetkY+G
         xf+Ik10VkF/sOP9CYRtRJ9bfTWvu8OsbwYeVYUUDi0FXXmGFHDGhmXuOzpI0nIZjwZH8
         Wp/AKKox9m+bz3sesuedJXXWeL0D+USruY1C0d33X37aTz5aBCS7OCsLQxVuuR5dQ/QU
         5h6dnb5D2eTiIolk+/T/YXneDA2HOj0EsXK+q7jU1LguKDX6jsdVUFpwIbnZ1O1CyuVK
         riQPNppEBMxsdIN2RgD461dKM4w1GZOD6A8JdC1L7zamiew0QORgyXmyHoTu3J4BGhwy
         i3dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552380; x=1752157180;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qe7AMi6piMq8RFDUj089cjDwF69NDAcy1zea886cQsM=;
        b=o1cT5d5D0lr6vrSEjRDYmWYugT/s3V4bHfrIvpLzwF7qIzFrnzMo8fE4ik2bgiYCyq
         kaEbQ0WLosL5xjd6s1cWEE+cY16eOToi2+Z8ls04GqN5s0BJf6uUP4MxQbhi9uTGJ44J
         /iClvYX5OB7pCka06M7sAvjtfUnBZN+za7zJkbzbAP0dI4FYqsVbthUDbIq2HlktPKha
         O69Z20VZrEABrBYVzLMcrGdJQnqzjUqVX7FJVIFYpFKuMuyYgf9mtkfMXy02VkWQET8c
         lXIBWbHxoDBe2beP7OY/XzhAkQ8TiKCNiD92CU0jDZ72TSKrb18HrKrT7ET/pQIU/Wx5
         G5nA==
X-Forwarded-Encrypted: i=1; AJvYcCUAViAS0Dak8pOTO9Y1h3z56KeLynWxsTfiXvS5piZ5DprW/HtAPXr9ellzYP2OQDhGUyOyrPdYxUy3I3o=@vger.kernel.org, AJvYcCWM4jQcR/B6+xlyPej+HFthpUSlP58B3hoF+r3QpDqA5Na4TZErLWphWoK3WTtKIg7N9W5iUDSXgFa2zBA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+c7wnx/VoZ4muXlDPaiFgUWn7mOuuVTiWGmnBSTmK+LBlxZMo
	xZSeDG0q6NrURPB51YQ4dFW8tkQR0w1FTXD1FqhKxeAzmvcMvuZ5wTvu
X-Gm-Gg: ASbGncvebLBIq46AzjSzd6mUeVk5wdskawu8ZwQLv7ECwQ8+gB9Wq65KsHJdV6sz74L
	MHim15ssevGzvFijXrXhNbYJ4L7KfwZYSqZjZa1YUZYfwucTUjANU1p0yJGubM5hWkxqgf+3JLv
	M72Um7JAOyrGwxpCOXxi20RDUIvfr/GMClgUFjobSsEpweAhE6bFIi6uALunL79ZIoHa6tO94Km
	zWBM/mycWUAyxcl2G0obE72U3tjh4wZgEoPUCN4iUDvKLD74N1O2l2Hzt5hF6z8JDZnyYe/VMiB
	xItf3zZ8MtNY0QNb9ICDeXP/OyOMoS3BHYRDMA+S2nnSipZAbKqyXQP4c2KQcMfLZj/CiOj2dte
	eHPndjGvYaarYO7UtZvXyTEZZ5QwThnw9GL+S2QIuEkaXsdyF
X-Google-Smtp-Source: AGHT+IEgJSIXYG12pcI2z5FtRmk0fhkIAl4253umh9Ys9Sg5U4L1ieZyEQpgB/o4UcPoNNyjp+hspg==
X-Received: by 2002:adf:9cce:0:b0:3a4:f936:7882 with SMTP id ffacd0b85a97d-3b32ebd722emr2175758f8f.55.1751552379601;
        Thu, 03 Jul 2025 07:19:39 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997b598sm28000125e9.10.2025.07.03.07.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 07:19:38 -0700 (PDT)
Date: Thu, 3 Jul 2025 16:19:36 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Kartik Rajput <kkartik@nvidia.com>, daniel.lezcano@linaro.org, 
	tglx@linutronix.de, linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
Message-ID: <fkepbr45smdcoyv3nbb3jvywmxqvh2f3htgamuya2lup3kll3u@4frpef756mpu>
References: <20250630110135.201930-1-kkartik@nvidia.com>
 <3wesm6syeqmjdzyyj2mjp4sjfwl7ebeahqxwcvub6gwvoifuh4@43tunmtjsq4h>
 <a0d7a8c6-af60-4f70-9d60-a87e0701bc91@nvidia.com>
 <k2t3dkh3acoenhxtsd3ekvpnwl5yir6qaun52h5prdfwcx5lsb@h3ieoj7jfu6t>
 <79974980-7218-4fa6-b5c2-f3936ecd1fce@nvidia.com>
 <q7fi2hpswm2tsowrtbanlnidxnyq3fyb2xxr6gcowxv6sglhop@nsvwlol4dac3>
 <2b6f9898-9c46-4397-a440-102e21309488@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ncn62jr5q4a2otwk"
Content-Disposition: inline
In-Reply-To: <2b6f9898-9c46-4397-a440-102e21309488@nvidia.com>


--ncn62jr5q4a2otwk
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] clocksource: timer-tegra186: Enable WDT at probe
MIME-Version: 1.0

On Thu, Jul 03, 2025 at 03:11:57PM +0100, Jon Hunter wrote:
>=20
> On 03/07/2025 14:36, Thierry Reding wrote:
>=20
> ...
>=20
> > I clearly can't read code today. Seems generally fine, then, but I'm
> > actually really enthused now about using a second watchdog for kernel
> > petting. Since we don't use any of the other two watchdogs, is there
> > any reason why we can't cleanly separate both use-cases? It would let
> > us avoid some of these special cases that are not intuitive to
> > understand.
>=20
> The only reason would be if for some reason the other are all allocated f=
or
> other uses outside of the kernel. We are currently only using the one for
> the kernel so that it would mean updating all the device trees for all
> platforms to support this too.
>=20
> I was also thinking about how do we identify/select if a watchdog is pet =
by
> the kernel or userspace? I was thinking that the presence of the 'interru=
pt'
> property in device-tree could be used; if present the kernel pets and if =
not
> assume userspace pets. However, the 'interrupt' property is currently mar=
ked
> as required and not optional.

The other two instances are part of the TKE block, too. It should be as
simple as doing something like this:

	tegra->wdt_kernel =3D tegra186_wdt_create(tegra, 1);

and using that instead of tegra->wdt.

Thierry

--ncn62jr5q4a2otwk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmkXgACgkQ3SOs138+
s6HDsA/+Nh4062GOx8mEGPJbsYpzoh0mbWYeo17eXhbIYiEiC9AvC5+jItaygQa0
3Bi4ledPuvYYI1YxKNwKPNAsaKaTkxrBYBg+zhCgTEdYyP/7iy0di8XFWRepSF5a
oAt4Af1SaiVcviyqxfJ2bAPtXRT/RwBze8bOpWvr2wNncdr8gN2cGd6/e5APt8jX
+SyQcBFy9HOkye3EyRVOcBTsKNcCer3g7vG9wbuRfFcQO25AQMtSZc6txNjKxU7J
Jz4IwEDlnYfyeQ3OogFwZLzwiAF/DTD7rALJLGWgBCJQ8yylyvLMIzGKBMyQrva7
gackMB23L7cF9BDOF6xKteyqdxHwPUTVJhNu+DenMGPPYaHngBap4pZ0OYSUbz3j
2dgNDtCsl7ZIjyQ9bf10QLhAePM8HiFLRaBwiZrqD5XXIkNa4yInXs2a0fKiM7fw
kUP3hBZfNUYvmYEdfHHatBhKFGk+afLfRe9wzY0BrF4TXB63ZfsADwJXSSlwhysr
KhBAISX+b+h5QR0oDmr6ScD2T9xjtEIJ62CpXD71eiPMuHKvLzUyOuWC7OP7S7yc
2VJqG7Wel2ou82kIpWOOpanpL+Pp3hmBzxszeo6QPVaoQn5Rt7ZXjAwWgTmpq9tG
5VtWB530Ybm7UhreKfsgZTg/PJuqAJk8QdmSnSkVniPYwUGLRko=
=Hh8X
-----END PGP SIGNATURE-----

--ncn62jr5q4a2otwk--
