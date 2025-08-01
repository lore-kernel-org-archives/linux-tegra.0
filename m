Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669A61F4181;
	Fri,  1 Aug 2025 09:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754041405; cv=none; b=rvCrZmmmI156kUX2wImxT+z3ZH5jy/nBBSJB5MXybWMNI5kv/F29J6Vw8GlfbmpCiGPEd3LIdplBNTih64z14jqz1H9NuOclTJre0etLzP0NQXxAT/eh/z7XDA8+h8LrvHB0WscrVE/AChQX7KZkNQNnH3uHyqwzOb71kwMnicM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754041405; c=relaxed/simple;
	bh=mJ8Hvnk4bHeO+UxjdRrwPIaFgk3wVaaTVuH40nR4x3M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gDb+RjKmTO2vjmUDQoAntzyoymBsC4q861i22p/ne3ukeSXsb0X5A2hWcu5JEOgbKc/ykr6x47zDImNLF6NTACKh5rlsHVOOGKD7Cn7wOV3rcyVxmytdv2CSF93bVS02DaZwD71yPQXcRQCQ0VvlRzGc/nGqQzElbSQMasEe65k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U3fKqclD; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U3fKqclD"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-451d41e1ad1so12498875e9.1;
        Fri, 01 Aug 2025 02:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754041401; x=1754646201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oarCBeRV5gl9zqE6oOVkYyngyOh8tuOMEbnlamR23TU=;
        b=U3fKqclDGECdklFgnfQZmI2zH7cHmKlGpBnQDutaa7SqvyC3GwWlKHYgurst3Sr6/C
         cnH+OIRtQhAEJfRHCv0ES3C/skzDEsljwnV0G5OU4DqsyESHD6wm3BQgYbXWBqsFWWXH
         PUiRwpKYjU+DpIlzOZE8sFprqUcwNmNgsDOpK9SDghTJD6aUx0WaCvaQZNS+woNGH9av
         bO/HWkNTyaj0D4ykZvrxrn8qYPQAh05PtmfvYzab0/rzbv7Rx/pkGQIseRnpYN6ZHo9/
         vZbWI4ZtHpTHJK965aViJMV2u0uVxovazNMuO3qM37Al+R+s/BybLRf3pzf6yNnKO6z4
         Pu4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754041401; x=1754646201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oarCBeRV5gl9zqE6oOVkYyngyOh8tuOMEbnlamR23TU=;
        b=WN3y8MsQLD+ZH21++Q2J8ZtezorFVnT48vXkkg74eRRXzD9r4/w/NfQ7lnGK5TyswG
         zj2M7vmzT2tqHYsRMOnDa7zZ7VNmGagjg/fRyAyQPWVtSqgygnq5c1vFy8NXW7GKNKlO
         yqlG9EB5PDAVPdYVcqO42EvfhRn6rQFYdmcZCtg+YM8jo+akjQ/nyQGpFKSMGbQ22Z3c
         V8aYDTz47/JrxgqYwLVLy0VREZn81AzvIEInKGTP92NoZ6SYpWdzxNVAs11/LVORnFS+
         82SrvSy7fSDK0cyy3D61h4k/Tg+06R2F78utqYw6ReB8zf6x/HN5sWA6EMKW5AIzW8ql
         HEXA==
X-Forwarded-Encrypted: i=1; AJvYcCU+ppzYmbIZRLmSkKAnOAY5zFXknuCLiYUULJnefVeMVuniNj1YL1f3zLERT2A7HnxUuDYCo3d5UPwm@vger.kernel.org, AJvYcCUV5GQUFUngcKy3xuqFESJZ5jB8wDCNLJnaMO7w9NZcX3seDpXeVa7MB/65h6T8qF2oxH4dqJjGBeyHvTo=@vger.kernel.org, AJvYcCWuSMRnuPsZMzoqVuIWaZUmNuw3QKMDef6LjdWfD1+WGZVwPA/KyE2CAqFrxyaJQCe0+H70t0QLtRNiga9r@vger.kernel.org
X-Gm-Message-State: AOJu0YwbVxHsBEoZoMQUjBrk8Rcw5RqtJfzhLyhChiurrpxnBbp9ko+y
	nxkeTZ/sEi4Iastgdl/MqA6aXTDmZbLUhBo9Ux6BWGph1TK7oywoQvwR
X-Gm-Gg: ASbGncu2IPGXIC2NYDOOc+JxFxjNrGjSMagtq8NuzYhRDTIHhUImGnr/4vmpsuSUqJN
	yHJoyRJg2ifyrJLV0fyEw9WKFDtiffoJZDHEpWGCQnpw6CpVPB8YdYhPUwWvuPf/E9wzzeixCuC
	rjeUUswKwnBhdX1m+U6k4EZt5v7+7ljF0L9shp1KS6VlNxoYRMa4vY+xshJ9jU9EGynbDFgB+4d
	A6byCVKVi/p1qGt2WSkG5ejzVbpNcJ84maCsw3qLsK+SqFr8rn9dvs633JBE2OsbiZguevZiHGq
	IDeWg8PM+Y9R4hhXDZYrrvdCxEgDNIIyCvEosLHOQjM27id6vrdPCDu+zUkFxn8StSPcq0NCJDN
	LITtPnzVzW+MtiOjIPQGWp9fKusMEe84GRk/x1nDCORIi5Hdwwm/NZo/DXRuQs6jm+ZvOFoUnly
	9A6wqOQu7l
X-Google-Smtp-Source: AGHT+IHBPme5mGf99q7gF3GggdYV86Zid0WwASZIstU24ynraWO28AyF6W2LeJuweaxo6Xgyvx0PqA==
X-Received: by 2002:a05:600c:4e03:b0:445:1984:2479 with SMTP id 5b1f17b1804b1-45892b93d6dmr92676205e9.5.1754041400358;
        Fri, 01 Aug 2025 02:43:20 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-458a7dd8cdesm35241885e9.19.2025.08.01.02.43.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Aug 2025 02:43:19 -0700 (PDT)
Date: Fri, 1 Aug 2025 11:43:17 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
Message-ID: <xmirimw2guubgrf6umt4qiknpyjaepkrx4oggcmaffoyd5sli2@kzewnjv3bkjf>
References: <20250513-tx2nx-role-switch-v1-1-d92ea1870ea5@gmail.com>
 <CALHNRZ8H66g98ThQKZJAT2UohVNtt6OS=rKd5wtcT1YwBLURqA@mail.gmail.com>
 <CALHNRZ84+KGwioU=7ZOL=O39cR_VSRJBaV42MsA4fymXNJC6+g@mail.gmail.com>
 <CALHNRZ9zfjV-ZttJd_ydgEaWk7XB+3YPfKGuYXLBL9qA8Exv0g@mail.gmail.com>
 <CALHNRZ-HTFz38xZFsbpG6C3r_xDQTLNOZWPX21TzNPaLyxf6Xw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5uexxrkexjg5dk3h"
Content-Disposition: inline
In-Reply-To: <CALHNRZ-HTFz38xZFsbpG6C3r_xDQTLNOZWPX21TzNPaLyxf6Xw@mail.gmail.com>


--5uexxrkexjg5dk3h
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Remove otg id gpio from Jetson TX2 NX
MIME-Version: 1.0

On Thu, Jul 31, 2025 at 04:36:17PM -0500, Aaron Kling wrote:
> On Mon, Jul 14, 2025 at 12:35=E2=80=AFAM Aaron Kling <webgeek1234@gmail.c=
om> wrote:
> >
> > On Mon, Jun 30, 2025 at 2:27=E2=80=AFPM Aaron Kling <webgeek1234@gmail.=
com> wrote:
> > >
> > > On Wed, May 28, 2025 at 12:42=E2=80=AFPM Aaron Kling <webgeek1234@gma=
il.com> wrote:
> > > >
> > > > On Tue, May 13, 2025 at 4:10=E2=80=AFPM Aaron Kling via B4 Relay
> > > > <devnull+webgeek1234.gmail.com@kernel.org> wrote:
> > > > >
> > > > > From: Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > > The p3509 carrier board does not connect the id gpio. Prior to th=
is, the
> > > > > gpio role switch driver could not detect the mode of the otg port.
> > > > >
> > > > > Signed-off-by: Aaron Kling <webgeek1234@gmail.com>
> > > > > ---
> > > > >  arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts | =
1 -
> > > > >  1 file changed, 1 deletion(-)
> > > > >
> > > > > diff --git a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636=
-0001.dts b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.dts
> > > > > index 26f71651933d1d8ef32bbd1645cac1820bd2e104..81f204e456409df35=
5bbcb691ef99b0d0c9d504e 100644
> > > > > --- a/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.d=
ts
> > > > > +++ b/arch/arm64/boot/dts/nvidia/tegra186-p3509-0000+p3636-0001.d=
ts
> > > > > @@ -669,7 +669,6 @@ connector {
> > > > >                                         vbus-gpios =3D <&gpio
> > > > >                                                       TEGRA186_MA=
IN_GPIO(L, 4)
> > > > >                                                       GPIO_ACTIVE=
_LOW>;
> > > > > -                                       id-gpios =3D <&pmic 0 GPI=
O_ACTIVE_HIGH>;
> > > > >                                 };
> > > > >                         };
> > > > >
> > > > >
> > > > > ---
> > > > > base-commit: 405e6c37c89ef0df2bfc7a988820a3df22dacb1b
> > > > > change-id: 20250513-tx2nx-role-switch-37ec55d25189
> > > > >
> > > > > Best regards,
> > > > > --
> > > > > Aaron Kling <webgeek1234@gmail.com>
> > > > >
> > > > >
> > > >
> > > > Friendly reminder about this patch.
> > >
> > > Re-reminder about this patch.
> >
> > Yet another reminder about this patch. It's been over two months
> > without a response and many other patches have been pulled in the
> > meantime.
>=20
> Reminder yet again about this patch. It's now been two and a half
> months without even an acknowledgement from the maintainers.
>=20
> This one is getting annoying. What does it take to get a response from
> the tegra subsystem maintainers? Does time have to be pre-allocated by
> the company to look at patches that aren't from @nvidia.com's? Are
> there certain times during a development cycle? When responses happen,
> it seems like there's a lot of activity. But then everything goes
> silent again for months. I've not seen any pattern to it so far and
> it's becoming extremely frustrating.

Just people being busy. Nothing more, nothing less. I'll pick this up
once the merge window closes.

Thanks,
Thierry

--5uexxrkexjg5dk3h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmiMjDUACgkQ3SOs138+
s6G4SQ//Sser1xJLkvXbZe94ayUrgxe2yBXPtHMGillOMbe821ZnqiMEHKEDTKep
QgBwe9HSqJSLbxuqbQ/15UlQuvJuLhdTfp4rjWp07b3sgTxoI8L5csBvHlp/G4Bk
oCL7atR9/aKhHdajyu8BmVMksXQ1COjnsb3rwkTps448du32GtRVY7qSLbXvsu1m
5SQH0hqL4bWXEC4dWTdlHEL82TdmxXr79fOrSwUpZFWAmzZH1GSUA1XM6ddtJFjV
U5GeOOdPuE2vv//aoULZIzHqVbw3WcRn64+lPyFqAQ9M+u90CbSiysRoRHGnXQ1g
hhyeAatghl0OIjRPYJR/ZLnaoB4MvKaujEaaVBiYjZ3UszbjnMpH8l+rkKlGWuKg
iEMkzx3XbsWtpP5l0rpwbrxYSnwFS9T5+X02q5p6R1HRvnnUeDVlyroF3jYFiFZI
a3+RcDTpLAZwqYMiBsfZdcUzI3V2f4RzloWff41h/KUcxtT3PRyNIFO8tVdtI7Ci
yf4hoo8IH+93IPq68qU+KppIeD9apJk1/GPAeg9N3inpbX2Mvx/BwK4wKI0Qjctq
486MFW3j+R5M5unP8R4RGqwuWwouOPp/h4d9GSW0meaj10gsHuJ+9Mfs5n6PtNlN
fNBW3aHC9Z4oOzNyfbVOlblQOJ3T7cZhOIJrPEq7tAOYHoA7jD8=
=QdGg
-----END PGP SIGNATURE-----

--5uexxrkexjg5dk3h--
