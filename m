Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8316838E5EE
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769084421; cv=none; b=gEU8Y2HNKHxUcJz5QVfu/dltqt1JaNTJzyAN8Q6x+Cb2oFMfTZhqHX3HuY2iLmyloB7Bw4NITGqDvnEdDbQGjayQW2m9ZAXNWb5vwkaqIMcE4GPz5rQA12XUby+GYqG+h0+v8GM7cs3qZ5QWDvs2h7/ql7CR0GfvhTB8U0RzFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769084421; c=relaxed/simple;
	bh=7zP5KoNIlilnzRQ0nDLi8KeFSGOQAqvQNCbb5Kh3OjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJq4ZRbkDA5gKe3uP1Eks+X0Six7fVTuuZKDijq6fjGVD2n8ENz/ldPCuGAdziz0tUnMpuI2AmB2U08FR4VtaXSjxaZcPU5VT7+dLHSTwLvhc94SYQ8MMMiy93+tGW6PFtf1gSBfi3lkTDjbne4HMeFFbisedMN6oF1YHuQZIKA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O7mwefci; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O7mwefci"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-430f2ee2f00so575395f8f.3
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 04:20:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769084417; x=1769689217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=O7mwefcim8ypvPrud+9/A9d6imQDwa1ejQPPasCgZTuBADrShSKSLMqz5P1Am4i3vD
         EUDp2g+hLHmck1uVluoSdDkvikaDg2cbp9EdNevVf05jOq2221R+WR4v5lx9A7iCvbHO
         8SPjbvZXrBlMbnW7MqgRv/ocCqgJDVAM0NYvP2uL7ICH3Akh/7jHKMQmKW5F5Kq1I+Ut
         JrLS0kqtgInVKXp3+75cq3P1PcPV8Fvm2ws5kH184ijiEYFrDm1HbQkx+VkrCv8bLv2j
         I7DKJY3rG6z1AE+ZX5+933ooZk8WI2dQgEd5J+sLUianuI71n4/tE/NZIH0vP8K0/7Tk
         IXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769084417; x=1769689217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MnONHadiHlGxqKbve/p4kfBxT1gNFOR6bKW+t+kxRsI=;
        b=L8cddWwC0z0kR/QnoPotZgu2WgF61hfvVqdehoiqHYxGuE2TYk8yVt7UOpYYsqW/0W
         rs3ghP+eQxsqOB5tEF9mEvS0ndF19WcnobtfZg/Mpsub3HwE/OuFkaxindIKPhBIK+On
         x/9ikx/swx8BSA1vUeV4nUBfKUX8DWzsBhiCXRNOcNNX0T8EU87wcnwVjmR/yCpihzM0
         6jdsCJNArWZvEl4Wov/ch0z5+c3FiTblOdY6IcKee4LDck6uHD30yYpxjddw5DQCeHsX
         xU9/ou0gfVdFBjL/C6K2w7XTLSL3NjGyPFpMKQ6dR79hfm/4wApDINlHd5t0lIW0Lnlk
         6OYQ==
X-Forwarded-Encrypted: i=1; AJvYcCXtZtHkmLkfJyBTU7OhIFXW6d5+J7xYFd5pp2b9ED/Y/QOy61m8QNC7jVtjtvxIBF6+XlEP6RmD77cBpw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOuNFtTZYQ9x9S9PfTfNXdJPXTBy/odSajxaar+FmQa80pCmWp
	yGlF1+juCAErdtYDJrLdj/jFLtXHsQ5m0PUR728HGzFzI+HU7w6vRrYw
X-Gm-Gg: AZuq6aKjmwHTmxtVUcKsw52/9qpYeOhpgrERaiQYlcCT4NSdoA9OGTnYwXfw1bLY2BN
	TaegjDJzDT03p+W4ZcE0vb4+X95F6W33hNj8JlmJk3Sp4ykqNV67g+yQ2Oi2b19sUnpyhpDN0bd
	FAIuS9aNpFd0EQbkZ48noqvAFRRsuN1+YjDcOUJQE9Ok+3xTDUm7FFc/6B3XuXeSJaf2UUpd0iT
	ZDORuCpNCyQMi/7EJh3gnJ+PCnF5yLxakAsBMJdL0Fi+9vExzRNqTfO/GBsYP/hlpQ3dcLMzICu
	LNpU8hDwwUeZuN6b0bdxKu/NobdMxiCAqIw52ra7i40wqP0DGGfTB9Evjz8cyZvctP6gzq2LCcb
	+fGa6FCUgzB4qagloPVbHOeBpGv/3n8/DRbgxUetdLejzp1KmrlQ6AqT2oYYO9co4kESxA6kt6X
	dIwiM17h1UOPHDDlruvv1xrhyyVCBn6z0np49xtFGdhkFYI3JNdMwVHJts3tCJhfZaBxaA/zUlu
	Q==
X-Received: by 2002:a05:6000:402a:b0:435:8d80:1b81 with SMTP id ffacd0b85a97d-4358ff4487emr14838984f8f.21.1769084416943;
        Thu, 22 Jan 2026 04:20:16 -0800 (PST)
Received: from orome (p200300e41f0ffa00f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f0f:fa00:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435ab458d85sm4603429f8f.26.2026.01.22.04.20.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 04:20:15 -0800 (PST)
Date: Thu, 22 Jan 2026 13:20:13 +0100
From: Thierry Reding <thierry.reding@gmail.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, arm@kernel.org, soc@kernel.org, 
	Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Geert Uytterhoeven <geert+renesas@glider.be>
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
Message-ID: <aXIVmW_mjb0AdDwe@orome>
References: <20260118080304.2646387-1-thierry.reding@gmail.com>
 <20260122-hidden-goat-of-excellence-a43b9f@quoll>
 <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wfu6iycbl7nspgf5"
Content-Disposition: inline
In-Reply-To: <CAMuHMdUZqJa3KEWZReA734=ZV98JTD=HPztkszEe6ARFWiuhww@mail.gmail.com>


--wfu6iycbl7nspgf5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/4] dt-bindings: Changes for v6.20-rc1
MIME-Version: 1.0

On Thu, Jan 22, 2026 at 12:02:04PM +0100, Geert Uytterhoeven wrote:
> Hi Krzysztof,
>=20
> On Thu, 22 Jan 2026 at 11:08, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > On Sun, Jan 18, 2026 at 09:03:00AM +0100, Thierry Reding wrote:
> > > The following changes since commit 8f0b4cce4481fb22653697cced8d0d0402=
7cb1e8:
> > >
> > >   Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)
> > >
> > > are available in the Git repository at:
> > >
> > >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/=
tegra-for-6.20-dt-bindings
> > >
> > > for you to fetch changes up to b2788f6320722d6059f849f35a77eb082608c6=
27:
> > >
> > >   ASoC: dt-bindings: realtek,rt5640: Document port node (2026-01-17 0=
1:58:18 +0100)
> > >
> > > Thanks,
> > > Thierry
> > >
> > > ----------------------------------------------------------------
> > > dt-bindings: Changes for v6.20-rc1
> > >
> > > This series updates various DT bindings for Tegra architecture,
> > > primarily focusing on schema validation fixes and new feature
> > > documentation for Tegra234 and Tegra264 SoCs. Key changes include
> > > correcting realtek,rt5640 audio codec bindings (adding missing ports,
> > > clocks, and jack-detect sources), converting Tegra20 NAND bindings to
> > > YAML, and updating memory, DMA, and IOMMU definitions for Tegra264
> > > (introducing CMDQV and DBB clock support). Additionally, it resolves
> > > legacy warnings for Tegra30/132 display and VI interfaces.
> >
> > Same comment as was for Geert, I am surprised to see DT bindings as
> > separate pull and I see drivers were alerady merged, so I will defer
> > entire Tegra pull to Arnd.
>=20
> The soc tree used to have a separate branch for dt-bindings.
> Hence several soc submaintainers still use that split for their PRs.

Yeah. I usually also only put things in the PR for ARM SoC that have no
related driver changes (fixups, conversions, ...) and therefore nobody
else feels responsible for picking up.

Thierry

--wfu6iycbl7nspgf5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmlyFf0ACgkQ3SOs138+
s6Gh5A/5AfOWWZlWQRR6QIPJvWj+TJAELr21m/e0TryGwrAkQJfn8/JzMy7CUVDM
D17V/AYBsq+jqwHbo1jqn8pnHL7ivzFYRBS4j31U93plbm0FowXbS4smlMWAPCbS
jW+PJ5pjoQ3LxSN8LgAAJJxvX8xuMy07prqt+Aj45ZDlVXJ3Ie7FoxwkzsMaK5AJ
6iHcVTYZFVr/kOUbwv9JzxuuRSgV8kFKrZfWyXpNJJN0EYbB3WJd3zz9cJ1jWgOg
JI4O4OvPHZavoRaRIGw6nqQhhIFGiO8HHn9rXppwtYbQ3pZBQkOt5uZBt+e8xfTB
H6Ix2BAdtziymhzCCQNhrUC1V+iBgtZDK2lMKGc5p+fxtNewrT3ilC8zfkyZU4jY
j1hxGXOCTcjYCwtBjxUhE8KlUxRhAYIXcGF9u40BWteZc1r1Ze2ZFAqwYNL0DxU6
cy65ffKqyb9CvUTU406+zydeSJoal7xQ1y9Kd2wn7oGUh8oCGJeLniD24mgKqjuk
XKLNPipq8aqDQ+6dVxI5uiV423FCxphIzx0hNlDt5+CS8feulUYgLVazJYJ3foeB
ezwk0RPmgbh3PTqL32oCGMvvjkK9gtjdjvt9LW4TkePpO62tN7rm3dkI6EofbyZK
7bHIrJGPrUA3QtUrWsU/SoqnM33HOhjDM62NU6BA3EJb6AWZr04=
=8zEd
-----END PGP SIGNATURE-----

--wfu6iycbl7nspgf5--
