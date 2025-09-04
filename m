Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278BD277CA4;
	Thu,  4 Sep 2025 12:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756987626; cv=none; b=WJfetJdVH1ISS3uava1NrJZXymdhScZtYJZP4u5GoQaIFTEuM7s0iLAZT+qIMdlbGHLu0NDJHYdJyKU4sMXfUbABczWQqxbagRvdjTkrKl1NqvUto0QgcDVKwqooXodDh8WoXLtukKW9UdT9xDHwfjUQbOQ3j/Ptf8nYUXuGWzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756987626; c=relaxed/simple;
	bh=2IaZrodBHzAYTfaiQbPmHvspCNf3DSKkqnw6CJ260QM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=teo2dIY8diOfI49vPjkz6csRZtBDtqzHNjg44uJjBoYGhcAqhM2M6TMXCQdnbza2qckBrCOjhXYxpBUUVKpE+420ExCFOmCjb6V4U+c0H3zDgszxN1R53UBG/TvRwGqY/CItOD8fZjEvYz4TP4goLdy2Tf8tPLqbVFagFvQNZtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bP4RbSBr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bP4RbSBr"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3ce4ed7a73fso593101f8f.1;
        Thu, 04 Sep 2025 05:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756987622; x=1757592422; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PLld95qjRcnXUupD3eIzFa+wkQsC9TBTtZNr9c2tK1s=;
        b=bP4RbSBrK484fZdi0taKaO4HvbfBLWYZ6BzdIrK/QepCpOgwULrP1s5C11bCnXyl9d
         GwHW451UgCneYvXRlyLxVpwlLYAagu56SsooPuXRz+C70NME0MkBqXxmKXG4VpyUED/p
         SYSh5mUuQNmKl3BWo68L0rdz5l7CYoSyBC/AKWJaVPvWQvn51pIf86tuwL4UcC2CAfES
         hDrojP4BE84wAZRlI8KfzoTAJNsHY5WNiToTlbkrbP7twckdc6NRGBmmsEPObvpntMM0
         aBknXIcjrs5FNnLhrODcA+ObSHDFj45Jiq2GCqJ3cvfzSEPjkun/Z1zx0f0Kw7XTUJ4p
         CNdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756987622; x=1757592422;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PLld95qjRcnXUupD3eIzFa+wkQsC9TBTtZNr9c2tK1s=;
        b=pBgaSdlAKfHxg6QSxrR5sIcu4mcuvuCfvCVzrvR+H6nmFJu7A/kC84100vabunTuRr
         5yT8t5clT/xozSXhWhF0hfVXMJX9yeFsMAPD3vm7GboNmiKgdbqa+dhU7/GSMNoVNBzE
         UDEcxHsxi9zRFPRSHIoukPVni+eqK2zcjV/jOTgJJ51JmDDI9WZ3KnY6qob2bWJEpLPi
         KuctzeoVMg044Uh0zwUxONDzaKNjHZNhZnARomEG6UEMg2o6VV93drTcXTWOaPKjx0S4
         CuE78HxRdhd/EbofuWrFQkiUoERuuF1XbCnAovrC8jSqzsWjWO9wircrVPVlfWCPXUZY
         DcXA==
X-Forwarded-Encrypted: i=1; AJvYcCVknwqtUGwqVM72SgWb3wlMrKVus+jTXl9lXQASQr+D4m+IwMP2pQPcFsZRguKlb3Agbz2fdI/VwEjG@vger.kernel.org, AJvYcCXEvcctOHMcy6H+mAUjvby4RtHzbnfobEU0eJOGcbFt7X7sG4rLlQ/4yp1LW5I5DbKh5TvDsmHiRBthyLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3otkcEtG2RGOgAXp3Bh6SvGxAcczskXPv3aabx7X7pUI9LozX
	ON2mUvB7WgGaD2IguJJhaVJOTaaLfGAxKzlL3TRh7uL2Z3wCk3YJPU5A
X-Gm-Gg: ASbGnct/0dmlLEy2pNiKhKqdndmaHJpiljN1KLsodF73Bh0AkDsMXem0TK5wd3pgydB
	SJ622PN9LaxNT+3sMtKpiV0JRSgbt91DmlTQ6t59vFoiFtf8AJIOqaU9G1H8YurzEMAEQELWFqO
	f2Nf+J+Fy8NaMxsEs89bUNAAYY2RvML8F7TEK2bX2QRJzmQdcqK8dcuvPndsNlfEGQgLBmgzC/d
	0gqP2T4++FoKj8POro3Q4lLbQNJsipqprVynuV02rSpWTKMr0pKkKpLbmqWkyR0oNJ88Ys7wCIF
	EBPd69hN5kVw7wHzg86j83l3zz/idfrG4AgbAIpBTTdPzxz4obfdau48+y8XMAmUr6XIL4j+t3Z
	KU86xye4mlgWOotprhsV/RpBN0GmbomUjg7QDro7kuug8iOSMdDk97Y1jEGcS37QgmmsOUXVkKP
	cJTfUeB7d/
X-Google-Smtp-Source: AGHT+IG59eYhocU/Hh7asCkInZg6kFlAG3r0FLBdaakyF5gvjtdvhWnDUh6z/r89PFN/6r5wlaCujQ==
X-Received: by 2002:adf:a406:0:b0:3e1:7964:2c17 with SMTP id ffacd0b85a97d-3e17964361cmr922214f8f.62.1756987622170;
        Thu, 04 Sep 2025 05:07:02 -0700 (PDT)
Received: from orome (p200300e41f1c4d00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f1c:4d00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3df4fd372c1sm5436504f8f.29.2025.09.04.05.07.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Sep 2025 05:07:00 -0700 (PDT)
Date: Thu, 4 Sep 2025 14:06:58 +0200
From: Thierry Reding <thierry.reding@gmail.com>
To: Frank van der Linden <fvdl@google.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@redhat.com>, 
	Mike Rapoport <rppt@kernel.org>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
Message-ID: <zmsn3bdqj2eclrm3xehnp27u57orqiq74ki2qn6aahpiamp4sn@wgalbnbpzmr4>
References: <20250902154630.4032984-1-thierry.reding@gmail.com>
 <20250902154630.4032984-4-thierry.reding@gmail.com>
 <CAPTztWa7kcx8bBEJEKvnjcD4v1-eDLVxMd9C10XiBQi4CDLfHg@mail.gmail.com>
 <v7zrmrhvemyymq6qamz6wbgzr4cijfe4n76ivwyadmltadlot7@3csy442wfasf>
 <CAPTztWZJqzbR7Y6jE6NM1qQOumYz-ckzSfGDfUcsgMVU7SBb0Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dxmjpjrjb5ukagg6"
Content-Disposition: inline
In-Reply-To: <CAPTztWZJqzbR7Y6jE6NM1qQOumYz-ckzSfGDfUcsgMVU7SBb0Q@mail.gmail.com>


--dxmjpjrjb5ukagg6
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 3/9] mm/cma: Allow dynamically creating CMA areas
MIME-Version: 1.0

On Wed, Sep 03, 2025 at 09:41:18AM -0700, Frank van der Linden wrote:
> On Wed, Sep 3, 2025 at 9:05=E2=80=AFAM Thierry Reding <thierry.reding@gma=
il.com> wrote:
> >
> > On Tue, Sep 02, 2025 at 10:27:01AM -0700, Frank van der Linden wrote:
> > > On Tue, Sep 2, 2025 at 8:46=E2=80=AFAM Thierry Reding <thierry.reding=
@gmail.com> wrote:
> > > >
> > > > From: Thierry Reding <treding@nvidia.com>
> > > >
> > > > There is no technical reason why there should be a limited number o=
f CMA
> > > > regions, so extract some code into helpers and use them to create e=
xtra
> > > > functions (cma_create() and cma_free()) that allow creating and fre=
eing,
> > > > respectively, CMA regions dynamically at runtime.
> > > >
> > > > Note that these dynamically created CMA areas are treated specially=
 and
> > > > do not contribute to the number of total CMA pages so that this cou=
nt
> > > > still only applies to the fixed number of CMA areas.
> > > >
> > > > Signed-off-by: Thierry Reding <treding@nvidia.com>
> > > > ---
> > > >  include/linux/cma.h | 16 ++++++++
> > > >  mm/cma.c            | 89 ++++++++++++++++++++++++++++++++++-------=
----
> > > >  2 files changed, 83 insertions(+), 22 deletions(-)
> > [...]
> > > I agree that supporting dynamic CMA areas would be good. However, by
> > > doing it like this, these CMA areas are invisible to the rest of the
> > > system. E.g. cma_for_each_area() does not know about them. It seems a
> > > bit inconsistent that there will now be some areas that are globally
> > > known, and some that are not.
> >
> > That was kind of the point of this experiment. When I started on this I
> > ran into the case where I was running out of predefined CMA areas and as
> > I went looking for ways on how to fix this, I realized that there's not
> > much reason to keep a global list of these areas. And even less reason
> > to limit the number of CMA areas to this predefined list. Very little
> > code outside of the core CMA code even uses this.
> >
> > There's one instance of cma_for_each_area() that I don't grok. There's
> > another early MMU fixup for CMA areas in 32-bit ARM that. Other than
> > that there's a few places where the total CMA page count is shown for
> > informational purposes and I don't know how useful that really is
> > because totalcma_pages doesn't really track how many pages are used for
> > CMA, but pages that could potentially be used for CMA.
> >
> > And that's about it.
> >
> > It seems like there are cases where we might really need to globally
> > know about some of these areas, specifically ones that are allocated
> > very early during boot and then used for very specific purposes.
> >
> > However, it seems to me like CMA is more universally useful than just
> > for these cases and I don't see the usefulness of tracking these more
> > generic uses.
> >
> > > I am being somewhat selfish here, as I have some WIP code that needs
> > > the global list :-) But I think the inconsistency is a more general
> > > point than just what I want (and the s390 code does use
> > > cma_for_each_area()). Maybe you could keep maintaining a global
> > > structure containing all areas?
> >
> > If it's really useful to be able to access all CMA areas, then we could
> > easily just add them all to a global linked list upon activation (we may
> > still want/need to keep the predefined list around for all those early
> > allocation cases). That way we'd get the best of both worlds.
> >
> > > What do you think are the chances of running out of the global count
> > > of areas?
> >
> > Well, I did run out of CMA areas during the early VPR testing because I
> > was initially testing with 16 areas and a different allocation scheme
> > that turned out to cause too many resizes in common cases.
> >
> > However, given that the default is 8 on normal systems (20 on NUMA) and
> > is configurable, it means that even with restricting this to 4 for VPR
> > doesn't always guarantee that all 4 are available. Again, yes, we could
> > keep bumping that number, but why not turn this into something a bit
> > more robust where nobody has to know or care about how many there are?
> >
> > > Also, you say that "these are treated specially and do not contribute
> > > to the number of total CMA pages". But, if I'm reading this right, you
> > > do call cma_activate_area(), which will do
> > > init_cma_reserved_pageblock() for each pageblock in it. Which adjusts
> > > the CMA counters for the zone they are in. But your change does not
> > > adjust totalcma_pages for dynamically created areas. That seems
> > > inconsistent, too.
> >
> > I was referring to just totalcma_pages that isn't impacted by these
> > dynamically allocated regions. This is, again, because I don't see why
> > that information would be useful. It's a fairly easy change to update
> > that value, so if people prefer that, I can add that.
> >
> > I don't see an immediate connection between totalcma_pages and
> > init_cma_reserved_pageblock(). I thought the latter was primarily useful
> > for making sure that the CMA pages can be migrated, which is still
> > critical for this use-case.
>=20
> My comment was about statistics, they would be inconsistent after your
> change. E.g. currently, totalcma_pages is equal to the sum of CMA
> pages in each zone. But that would no longer be true, and applications
> / administrators looking at those statistics might see the
> inconsistency (between meminfo and vmstat) and wonder what's going on.
> It seems best to keep those numbers in sync.
>=20
> In general, I think it's fine to support dynamic allocation, and I
> agree with your arguments that it doesn't seem right to set the number
> of CMA areas via a config option. I would just like there to be a
> canonical way to find all CMA areas.

Okay, so judging by your and David's feedback, it sounds like I should
add a bit of code to track dynamically allocated areas within a global
list, along with the existing predefined regions and keep totalcma_pages
updated so that the global view is consistent.

I'll look into that. Thanks for the feedback.

Thierry

--dxmjpjrjb5ukagg6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmi5gOIACgkQ3SOs138+
s6HoXw//XNrWJmAMVCgR+fCzlx0zoU4zdXoaxEp6EQWJKYjG//X6xi10kqOs2jVR
uu5knOytKBYAZxrbGlElM3YDTUvN62voCXi2dgvDZ53e0xVNnz+JbhGvA4FRpqU4
57ax3pJqEz4nWK7WnYrovlUSwMEPyzXb8KiRydUchOAr/QQfaCQKP1+HUgjsNsi0
0JgzT2LrmkZJvzpYS1gK7Kyb7hnGh620lWwILWeiB8Y9XvtuktdxcuTqvt3hp3TF
d8WHkQgF591iqMllbP1UFBd4zh852n3wuS/NutP4F2xH87BvkL+Az3uo4oAkqRW5
ihpe1fdjufRrSa8j4he62obtU3HQUFzXH+1nktOYrN+NGtqvRm6FJGjbg9MgAN+J
NeEn2yAIbCOT7Xhv/tAPSlB86nJVG3mmbWkfzVQhMdkeQrrTOkE7WHVH8YsDKF0x
fEnOR+NpJ5NAe74DupV116N6YvFBd7Za9uHVPW4Xue+vqShxRl0H3/mIpmZg0JHf
La8GRnYptVZoHP7YncT7rIFLmvBwf98uE+jUpHPrYbnrvBoXzECCg9higjZ/6faY
X+rx5NUc6BRVTVncIvdiKwTR/g/F/9fFBAlDx3ie4MEJgtL6yvEIuCyw58N3X/uu
UZmj3uvPk4sZILsIZO7+65qLprdN/o+T1UBAL8aWUo7bSNflcKw=
=jDv8
-----END PGP SIGNATURE-----

--dxmjpjrjb5ukagg6--
