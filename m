Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D0F23F40A;
	Wed,  9 Jul 2025 20:39:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752093553; cv=none; b=fPtPNnTxqqxI5HtYXNb1qv+/jW0b/Ir293NFN7eOPptN3ricdNQeZEfJWEY+iuyJLnNBtBpNuCsqZNip3zQaLJyZX5HZ2yf43ZfA1ZeFeD/N4Gttcqr97Jvfqex6BRW/KP/TBJOrh7aCu/rPHlExqzfbjud7vOJoV5XuwgpBQuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752093553; c=relaxed/simple;
	bh=ieKlXhe8oEtDXZpavR3ahmGdUp+tvg3kg/Izn5Of7pg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kHW4dXPFsb8iRexkYm1q3USM7XYZuunqAoQmX9XrB+HiqL0Sm64DX3lrOBezXoFZeZYSOf2+gO5U2BBczC+fB/kCgiiFDYtnuqGq095ZDt3ickSVRcqTbGvQM4mdicdic1n6ARSRBeJ/uOYW+WBTNBmhXcoY7p9PUDr1A7yRTyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ewwjHI0S; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ewwjHI0S"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a575a988f9so262068f8f.0;
        Wed, 09 Jul 2025 13:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752093551; x=1752698351; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=LsZpIkCRwWE/FKnHg1vz7ABb7C/paVv3QEw2cKWyROc=;
        b=ewwjHI0S7mXSaMUyJpUqkFRgFuH5mZn3EzSJy0wtG5Cf76qjt+8A6W7LqQwV8QrwHi
         wBgTEmq054Z1e2g7KLE18f7GXeqIHN3hKkvg1k962ByFrHUxUSdTqVrs1jIrrCI6G5bE
         qjsSRCLmzyZBRdsMjBBdTwvF8Am7QQtDYnzQo8205JiW5JcoiTyqE2L0PmHKOWEVgluz
         FRFZFUOAz7dRUJi1GNt+8qlOv/vR9X87bT8GEMOGeCyMRGnC3iMHPy4xwWA5SePEd6ss
         u7prP0VgPnUBt//smm7b2qhjVc7/GNHY0O+wlPOr/GPy0IBnlUHtPRkVGHHd4toSU0Ag
         iRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752093551; x=1752698351;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LsZpIkCRwWE/FKnHg1vz7ABb7C/paVv3QEw2cKWyROc=;
        b=ufLlKO5ayLwS4xHdf37/cXSbLIiiVms7JGveuuJD43uXDV7a3KPkTFBie0brCvUd+H
         ZiPf62YdutvmklQXvz4C0svuvJX6G/DSA5QxHByFKYc+TphjExExlZhPD10lE8sn3T17
         3Ac24nKZb1i4yQg0RyQf51Jv9WM4A5gTHjms+jnUDD1RC4ykEQSLyhMX3lLaGyTx/VlR
         GDwOC8OzTVyBDI7TjjscqdaSoTxzw42tuXEIxtULna/Yg/vL1sDcKyWaexP4ztVEhCI4
         hmiE2rbFANQqizgg06C/mCBRMZ1fBldiCIeS3Nqw+2SIFodS67FOmsheAOJjOFoRzmPh
         xSHA==
X-Forwarded-Encrypted: i=1; AJvYcCUsrFrpVtwri1rQAFWHla3bPnYoT9JeGpovq9XLafBGCLymKVdqxr3HJMyUbIDMaJErZ017ZHNweV/U@vger.kernel.org, AJvYcCVOrJbXIzLon06K0lFNd/R0/LnMPrdsbjRo+kh4KqacsQz+72jMyBWoLsIYqOVqeK8ky8lkLC1xP9zlDFs=@vger.kernel.org, AJvYcCXqqtK1lddgPPEffjSbhMjONxteN+ECAFVqQdF7fnDpPV5Ecncl7T33K2vLUqfjGLmPmEzo1E0Cnrx862t2@vger.kernel.org
X-Gm-Message-State: AOJu0Yzy5bCE7IXhGqTTDtPlFvsaWZFXFByxT33b8CapMZcZwhbno66G
	EptTlXrRDy1k3nQ7NCssx+KAk+snD0gS1O3pc/WU1qtlCsSy7qKvbum9
X-Gm-Gg: ASbGncvi/h+9F9y4Hm1IQvh5oqBUWquYH1GCHZk5chmvEu45N6r5eUrIaAlapJ6f3Ph
	VaZ9nZ7kxmow2Q6rgZ/ns6qGvBNiaVPxWf8nzHIqZx6Bzm7gpiHtkGT9BiCzbaLGFrRP9vbfYan
	X2yskrE9ZmoUfXy6R0XErtZIeEkJoa6j5vSWyIzcpQsBcaUPYbUKmLe7PWyCSmzS9twf9Sd3TxX
	He8ZoBKySjoOuqIlNS0Xcwzuc9KKLC0N4X6fehq1ygQ0xYl8brgRNC1R6AJgrHeBX1Jghk+z4ej
	NwBQZgcTvotwTdlck4kJgeNhkkU6Lw7M+zq+W21Rm50m6c7I7CxLlCRiCRzNOQ+FcBY7LsAstYx
	2sn3TH9Hb5RTWSzLuFlPMcgwELXpz0aMjInmLkhKrx5SIc0n7
X-Google-Smtp-Source: AGHT+IH+GZXcZBfZnUdMw5w3GvbFnDMARYvK2oxipIHOdjJAqJ+6kH7i2+3NatSGclfatBwYKMwapg==
X-Received: by 2002:adf:b612:0:b0:3a5:39be:c926 with SMTP id ffacd0b85a97d-3b5e78b9450mr1077051f8f.32.1752093550545;
        Wed, 09 Jul 2025 13:39:10 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b47225b5cdsm16669091f8f.85.2025.07.09.13.39.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Jul 2025 13:39:09 -0700 (PDT)
Date: Wed, 9 Jul 2025 22:39:07 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] dt-bindings: memory: tegra: Add Tegra264 stream IDs
Message-ID: <vwnfnc3bsvjx6pumnlktqll3x2eqgirszekogpia4mbsbkjdvv@suswbo3udfvj>
References: <20250708105245.1516143-1-thierry.reding@gmail.com>
 <20250708105245.1516143-4-thierry.reding@gmail.com>
 <34bec0c6-6539-415f-b18b-b0c70c1b93b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yegrs77m5cquiew4"
Content-Disposition: inline
In-Reply-To: <34bec0c6-6539-415f-b18b-b0c70c1b93b8@kernel.org>


--yegrs77m5cquiew4
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/4] dt-bindings: memory: tegra: Add Tegra264 stream IDs
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 08:21:53PM +0200, Krzysztof Kozlowski wrote:
> On 08/07/2025 12:52, Thierry Reding wrote:
> > From: Thierry Reding <treding@nvidia.com>
> >=20
> > Add the stream IDs for various hardware blocks found on Tegra264. These
> > are allocated as blocks of 256 IDs and each block can be subdivided for
> > additional fine-grained isolation if needed.
> >=20
> > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > ---
> >  include/dt-bindings/memory/nvidia,tegra264.h | 50 ++++++++++++++++++++
>=20
> Please squash it (you can take authorship and add co-developed), but
> adding given bindings and bindings header for new device is one patch.
> Not three.

Will do.

Thanks,
Thierry

--yegrs77m5cquiew4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhu02sACgkQ3SOs138+
s6GbUw/7B/xXGPwCa+LIy/6i30Eb06BGCL7zvPCYMecvkOUTiyr6H+nP0gIXpEjX
9hh4JxfznleKFXkFp7vBATmrCy3S+f4fi+/9QROwfS8GV1J0IlFVBKTk7HsqgWp8
cps/J1/C686kQNGNx2uBzNkteVc4KZJ1hN4MzTJt24bKS4KaPJEIQz6jvcvoVhFs
khsJf/siOeulRucKeokaUbCO9tVDH+JQNxUleh3fUv9XLX+IZbLhBPieswDvbyAd
a35Eupfgo06OLpM8zQlbItRUeF0BT+qcDVMnEK8ZPFm114VB8eIo5yI2mz9Grs96
1nzRYb/Le2RCYRDrnMeZx3bkvdYCV/y43Z2yw5r4uu8gxDYa0h91+Z+dHucMhi8X
ZI8Qags8Uk084fp6pLXNAbE9ZUvY0G4EySxgUR5cggZTfSxNPwnb7ajl0qb/3zGS
T8f5UhFn2ap3xCnWkG4/TOUfrgf+eLuLqhK6iToLL8s+/KPInEe2lET/xo7hT9E0
BXFNh61qHLJP3foBWha7qmaESu+H85FNP5ETmnZi/rCo3Y9ITn/1K6JFA2toP7sK
AajntvkXdQryciNrEeSfHU9BBxNDjt12sTcryAUPieZ8y9mcJGn8KJk0yQKF7rfX
oiG7P0MRJ4+CFJsgqb/Rmsrxe6e/E8aIok08vrW7pT2IgJCzjwY=
=9Uub
-----END PGP SIGNATURE-----

--yegrs77m5cquiew4--
