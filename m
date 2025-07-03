Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9C5293B7F;
	Thu,  3 Jul 2025 07:24:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751527451; cv=none; b=ZF75w5v/Y962tGlei8Y6wzhnO1gG8qeEo4dg497Np3QSvI3TSmmfjpbGahCTWsKFAZFgQReV7ULccYZIC+p9gYwGYBNZKTOhwh79mGuiSVN5FTcoOh3/DQsR9e2uPmdjfnSBbEQm+ve5w9FwjeWpu/bdg3rW9xyBFYXPAhBq2XQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751527451; c=relaxed/simple;
	bh=G4aYWKBF9bNTgqi027FSsHts9UeJhkjWvMWx9L27QR0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I15OPGsv9l8x7N4pP62V6RfTj7k6kNNRD6r2dcENSyPHiXe6No7K4FHzPA1YnU0mI+nLf4lEOyYu6DqZizby+2PqGhu8NEL3Vbv0zUS9F2kiiViCPNRMTnmqTAFyAQMil4+7vvlOWdmCPSSaDkKYPRyjzFlP19cDhmrtwyesZas=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D9lDM/RH; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D9lDM/RH"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453634d8609so54613545e9.3;
        Thu, 03 Jul 2025 00:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751527448; x=1752132248; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G4aYWKBF9bNTgqi027FSsHts9UeJhkjWvMWx9L27QR0=;
        b=D9lDM/RHWgZy/BuJPPOwSiEuRzIMzRiTLYGXE4EBkKe3ZRSSVRt1SFgOThdI4MPbDs
         iOnbCf5ZzJCVW4m0HaPLg9ft6ydU3Ab2O8RU4DO1+Bj7cVZcWyzpgf5CPeF94R7MgMs1
         0VnHti9/l7y9/mZZI8jwf92LZ+2+Jc4LeRIKpJEvWF2ZOLF2S17S9Yzk0BtgHXVnwiDz
         4GleImlj+/oQYEPSxQu7ClZ9T0I22825Sf1oKY+l6jeSHsmPoox7v3zRljACF8dg1jcF
         zuw8A5IpcQxLb0CRdnc+Ywadxe+OpT+YUtpXZP0NeP5+l3mdMciwCLbyDSrlSEWPnp+m
         k/ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751527448; x=1752132248;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G4aYWKBF9bNTgqi027FSsHts9UeJhkjWvMWx9L27QR0=;
        b=YRbO/eapH2eYqmu90iNk1+DFHqez6b6RX/S/nVNATEmJpYEh6VWkVkKpu73IlY/uA9
         lzh/fyqHaa7q9TDSa5mQWom+3dWuLObKjyzi7ELjRNb1YleLkAzKV17XHd25Y1GNFDO6
         VIInQB8sSTKjUz9i3/I81i6AmGBPcGXK2POW0iNeSTSSSHv+FbIoqrvkU8x9gfbhpdPJ
         neiOtomJvneNNyp3XkddmqO6jEqutr++ygCrIq7GXaeY+9LQG/NTsU0X6QGIm6teqfW4
         lZO4PDYHT7n7eXr9upxYth1MfZkklg6QlKi/lnwaGs+1rjyIbovnOlJP00XUSwWb4YZU
         ZmUQ==
X-Forwarded-Encrypted: i=1; AJvYcCVPNtFtrGafZiF7DBox4purKBA+KysWvlOT3RSdvFX3J+hzEey60BpZJO74lBKetw5ZelfejCSUceSJylU=@vger.kernel.org, AJvYcCWgC+GjrktwzwspVLzroZY8YDPO0/pBpoHEr+g8B+6zjcjIeakPszNm5DATCOdGEBsyC6+1dErGNpTeHvEHg5JK@vger.kernel.org, AJvYcCWrH3ncS4K6nuuAvlQ1DuxySb8WWR1wxyjYbYFFDeInW8r0AV/vc6KapOxLvzbQg6SzZSLZ+zXGjAQj@vger.kernel.org, AJvYcCXxnETIbHPni1AjlIPlGgYUMxdD0/iMPeV8teSnbMWygaRWGChj5v/UU7t+f80kwRURdZG2cDX7fY3BAN8j@vger.kernel.org
X-Gm-Message-State: AOJu0YxeB3oy3qF7zEUwLlm14+vsl8JPse1fZGDJcexTE7FPKvipFrAz
	ooHSe0kjUqYfpsVcoWlcw++pre6xcINY2dETjKDnG5TRbrTtjuOKBFtT
X-Gm-Gg: ASbGncssi07CQg9Qk7ZUc1/nH2wLek54VOsuazMPgIbLHsbUKrNWOGBKHCqedaobH05
	3KzELi+jFrszntfL272BYbBE1weL6mS0Led5dZPUYskWnH58LeTqAcrd81GFh16yEWEccJ1RorT
	51xoAULfTiWbCBYVp3BENzueTpHzqbnCupkUQCsz8AiW/0K0n4ldkf6uLd2gQefpsFkdyZ6ZDTw
	eDnvT8Hs8IGO0crp4urS8syaSKonGQqtq4P3AMUHtTWPtlt0Py5LiCuv81J12V015Dq351MTyiw
	p92cFm/1g5lQVmnKAitw5T1Eg/0WwTY5lJC3WnnCYW4ozdyXL1bq+O2uOvJf4AfB/zGmwAXNVQ9
	yeK2ovowGMpo2QJCJfw26BV/Mgi1Xff2/15zINggmzVi/Soqv
X-Google-Smtp-Source: AGHT+IG84fee0434ywGYKGFaIDizoAiTbmVyIEdlpi7un97G+ddJj5k9fCrnNFmeQ0DoqqG6gZ1vOg==
X-Received: by 2002:a05:600c:6383:b0:442:f482:c432 with SMTP id 5b1f17b1804b1-454ab3a92bdmr14299605e9.18.1751527447623;
        Thu, 03 Jul 2025 00:24:07 -0700 (PDT)
Received: from orome (p200300e41f4e9b00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f4e:9b00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9beb22asm18133725e9.36.2025.07.03.00.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 00:24:06 -0700 (PDT)
Date: Thu, 3 Jul 2025 09:24:04 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
Message-ID: <lvj5atllziwnfreau25fejckllzhgur3rgh5udpx6boz55lgu5@h6fpsnz4xmkg>
References: <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org>
 <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org>
 <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
 <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
 <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com>
 <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org>
 <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="zhooneufzlu6qd56"
Content-Disposition: inline
In-Reply-To: <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>


--zhooneufzlu6qd56
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
MIME-Version: 1.0

On Mon, Jun 30, 2025 at 01:48:28PM -0500, Aaron Kling wrote:
> On Thu, May 29, 2025 at 3:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.=
org> wrote:
> >
> > On 28/05/2025 19:35, Aaron Kling wrote:
> > >>>>
> > >>>> Friendly reminder to the Tegra maintainers about this question.
> > >>>>
> > >>> In lieu of a response from the Tegra subsystem maintainers, I can o=
nly
> > >>> hazard an assumption, Krzysztof. I presume the pstore carveout is
> > >>> bootloader controlled because various stages of the boot stack can
> > >>> dynamically allocate memory, and this became bootloader controlled =
to
> > >>> prevent any of those from overwriting pstore. I worry about hardcod=
ing
> > >>> an address in the kernel dt, then finding out later that there's an
> > >>> in-use configuration that overwrites or corrupts that section of ram
> > >>> during boot. What are your thoughts on this? And is there any way f=
or
> > >>> this patch to proceed?
> > >>
> > >> I haven't been able to find anything out about this yet. Generally i=
t's
> > >> difficult to get the bootloaders updated for these devices. Tegra194=
 and
> > >> Tegra234 may be new enough to make an update eventually go into a
> > >> release, but for Tegra186 and older, I honestly wouldn't hold my
> > >> breath.
> > >>
> > >> Thierry
> > >
> > > Krzysztof, based on this response, is there any way or form that the
> > > Tegra186 part of this could be submitted? I can drop the newer
> > > platforms from this patch if Thierry can get a response to his other
> > > reply about how the bootloader could conform.
> > >
> > I don't NAK it. Eventually it is up to platform maintainer if they
> > accept known DTC warnings.
> >
> > Best regards,
> > Krzysztof
>=20
> If the decision is up the the tegra maintainers, then Thierry, what's
> your thoughts now? What is in this patch should be compatible with
> existing l4t and android bootloaders. But it does add a few new dtb
> check lines.

I don't adding new DTC warnings, especially ones that we know up front
we can never get rid of. The memory one is a notable exception because
the system becomes unusable without it.

ramoops is not in that same category. While it's certainly nice to have,
I don't think it's critical enough to warrant that permanent exception.
Where possible I think we need to work to address issues souch as this
at the root and fix bootloaders to do the right thing.

For any cases where we can't fix the bootloaders, I think that's
something we have to live with. Having the support for this live in a
fork is a fair compromise, I think.

I know this is frustrating, and it's very painful for me personally
because I initially set out to redress a lot of these things and failed
to do so.

However I can't justify accepting endless amounts of quirks upstream,
all of which would set a bad precedent, just for the sake of things
being upstream.

Thierry

--zhooneufzlu6qd56
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmhmMBEACgkQ3SOs138+
s6H4ZRAAql2oMF67UcQRYR5ZlDKVTECjUTogz61E3D3VEqbR6Q3+Rjq10XzZOuwD
TJ3aow8VkSU/BbWlqZg5X7FgZW8yExrpYrrHqY+5sVHkgaxTBcWpaiNFuP6H38nN
5HkHTkQIwqGK63JzSdYE/yCdpICeNRuXturYF28MJk/kZvBV8kBYl87z0JM2VRDZ
SL5UrDNdSX9MjbnimJLRnp91skWb+p9mQS7HInD3xDhhh1xMgOjdmci/Ruet9Wac
u4Kvpybp1//Z8QMWS6VGvj20Ej9RQl2IABdDqfo1vAoDQZs+0fGvj8SRJ5VOMZxM
ntpuSRYt1sLLjPHO1MWJXrSWVvdoIRJyxozvxk4TBRzcMZRz8G44iJB86TkNGs9b
Z8eIv5v/t6S3gT2JKBvDFUcnIWBXYbxBpxHkk6xrhOk2TWcGnSEN56KOrS25XxSS
+ryaQWdtIgib73eoMjtgAeMhzl6UgBICePwfPofMIDWeit1LXRBlGaBZ1KRzyS8S
z4obZsQbALvk6Pz1qjMkos0GlaHBLMIZcnICsJ1FObkG8oWSHiIwl6lQuDJ1tDcM
bSxfazATD2BPSxZJfc7S1i7JJFI8KzEDST5BpUW7W7ZxV7gnMm96f/pT3mlnjUK3
pYaBGfihVy+z/0iVtRX6B1tPKPpXZErBlK2vC29PcBmT4pJ2+vQ=
=+ves
-----END PGP SIGNATURE-----

--zhooneufzlu6qd56--
