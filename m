Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 891EF3E835F;
	Thu, 28 May 2026 13:27:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779974863; cv=none; b=J0hIZKl+WI/MOjzKU3dJS8ifkmkaaq5CH7eP/OxA468qQNI1wiyJRVbnIAIIuj4W/4gMUgIf9MCeYhBnCvAnwlwaj5hE89/rUrsZAk/BZmJ+OGTKinekGWhUox8tprWvuQmLC3oOPpKgjYXFTlVzIF8TR3rbs+1r0jD7hFWCJcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779974863; c=relaxed/simple;
	bh=Hoxa6S0JL1EBIcv3RkajqPmVF/iJWN/KkAUGavAevKY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DS+KL2jR6lozzSnmK2s2hpsg4cVYtoY15kOgJNQwu5JBcYuBanKJIKFnx7u6ikiNII68rtMiCtuH4dIvsOkPaxiziIA3OPskOZ+ujKWkRWX5gqJgLaOAIBaBeaTL4A+4FueMCK6SaVga+Vh7Lh1YjwoymrtCndvNUD2E9Q0OkgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dJhLFdkW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dJhLFdkW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A15301F000E9;
	Thu, 28 May 2026 13:27:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779974862;
	bh=CaLB5YbrnY0a8s58Pi+fW+011HIvbyL/i1pM2BIB7io=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dJhLFdkWDABa0Vgcnd82C5Dky2G1Gjclv23A4MgyEBBA6rpk35TqJOHXmXVr6Bd7N
	 Z9zErq8OC9Kc5TiwiPyc2Qpl31KCgug4AxetEeuEltEV+o5044w1pwDRkrn3dSRqKq
	 iC7X/dCViB3VhPvIsrcnO1ZB+mmwDN5/tCoT+Tf45fGDeSmi0PymxZgTRj3zaH1inS
	 naKKgSKU8YiZf6Yv4t7m4oMoCJTIGwaxIjNnyz4QK0vlmE+eczwBtnqWwJutKRn5DD
	 3cldGGvwMvsDNcjGPSJdTjImprCzcggaiQe4UctSgCs02Mnd/EqIH5QQ1aUYQwKBAs
	 kqF81qf3fDotA==
Date: Thu, 28 May 2026 15:27:39 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Jacob McLemore <jmclemore.lkml@gmail.com>
Cc: tzimmermann@suse.de, Mikko Perttunen <mperttunen@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Jonathan Hunter <jonathanh@nvidia.com>, dri-devel@lists.freedesktop.org, linux-tegra@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/tegra: sor: Remove usage of drm_simple_encoder_init()
Message-ID: <ahhCnxgD99dovn7k@orome>
References: <20260523012824.81043-1-jmclemore.lkml@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4bzrbxr4qtkvnhq6"
Content-Disposition: inline
In-Reply-To: <20260523012824.81043-1-jmclemore.lkml@gmail.com>


--4bzrbxr4qtkvnhq6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] drm/tegra: sor: Remove usage of drm_simple_encoder_init()
MIME-Version: 1.0

On Fri, May 22, 2026 at 08:26:24PM -0500, Jacob McLemore wrote:
> Remove the deprecated trivial helper drm_simple_encoder_init(). Inline
> the call to drm_encoder_init and add instance of
> drm_encoder_funcs.
>=20
> Signed-off-by: Jacob McLemore <jmclemore.lkml@gmail.com>
> ---
> Saw this was a good first task in Documentation/gpu/todo.rst.
> This is my first patch, so apologies if I've set up anything wrong
> in either my email client or gitconfig and the patch ends up invalid.
> ---
>  drivers/gpu/drm/tegra/sor.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)

Applied, though I had to fix a few checkpatch warnings. Make sure to
always run that fix anything that it flags (though sometimes it can go a
bit overboard, so apply some common sense, too).

Thanks,
Thierry

--4bzrbxr4qtkvnhq6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmoYQssACgkQ3SOs138+
s6H3hg//YlaM6RIBRDZ0rf/d48OzMsSWcBKgJDqtdVrUcfyGkCV4mkrV9BS3oLmG
KQtv9Wj8Gy05hlwMm9k/C1atmvtrQnX4HJmtUAFLorzk2NxbDQg4keVbqyzuwGX4
rrEYaGS7SOgFQC7Ol8q/EYkAPYVKSiJzjROLqZGoaKneQtHzNXysIej7k/DwXGK9
frx3hlnen53gIdC91c2lTQot1AE75HtS9HXMunVazEVDJHj+VFiQU/tZjrLWLbQq
2tbZxJnzXhYaJu3Dw5cqtLUiz2FTuC2ikOd/v0SzU42mkGnkd/9vJ9gOxrcOpjy0
8i5M5c+NTcVdSglcPcKGrw/1XtIqeClMb5WxBOEziAZ+ufng7Hs/zQTyC8wWxkF1
Qb47TjEkjGZL0eaq4H49BwqgdTgkS+HCKs+pchKZk7I2KrLfoh7QuuGj0oDN++xu
oyUvOrBF3CSuFBjXeYTpPy2vidgZ8nkCfje3dy0nI2j+DaJ61rY4XkIbGvdh8+09
YWGBENV52m6B0ewNJZDMoolJSlz0pqvzOt8l4BCzxeL7GjpwAxHxwqUVB6UPdEGf
+Zf/yaPatSXHmFEqhQVeqv1VnGZfHmkT16LQfd2MSbEINphrR9SFUFEzb+vzdCsN
3SiX6rNhCKRdr5MbbhmqsYnGL1kM3qMVGqGrrFPjNKGWPiGV8QA=
=MyuU
-----END PGP SIGNATURE-----

--4bzrbxr4qtkvnhq6--
