Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1C13386444;
	Mon, 20 Apr 2026 10:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776682233; cv=none; b=VJwhKi+rPILbeXb/gdFQK8yHfrzpAHAr2N+vPI6N77Dw+d7Ojk6DuxFFTzbkTBK9rGvglkt+x60ukLGTPKFEVWtQogwp89melqP8iIpH/T53+4KSxYXKJEYbaSn/yA3uVMVXruiyyRs1wIiUOBY3+50XB3G3w8SATo/ukwhvqAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776682233; c=relaxed/simple;
	bh=jHlM2ldkZRwOuqPhazsLD5xKTkzgpVL2k/iZBsSe15w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=B4iZ5thcQcFOfDFU6NaCY5jNwmCI4haGa4qlCt7NELl/dwsEi72HDzbIkQtFDP8B9+pZY5kJQzkLSaebZ5UeOqDh8SEgZkVNoYUtuClW9fjjyJiHBQl5E05KHVa4x9JRhpbheoaig0yBL9dNr7QURZaSilLkxguDbyK4OLqdDkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZtQd5k4P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZtQd5k4P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 153A2C19425;
	Mon, 20 Apr 2026 10:50:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776682233;
	bh=jHlM2ldkZRwOuqPhazsLD5xKTkzgpVL2k/iZBsSe15w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZtQd5k4PtSoLFyQv77HQt72Z5AiRDA2eZdJQpyZfpZqgXwsaXY8fHiTJMpdHrQZzm
	 RZXqYl1Z0vqXg1gTH2fwAan1hQCIMp4zmPBFkHNjQEDbu8f3rjMSrfupdI0cFKJ8+i
	 IMf8nUrDREQSw2QbtijZuw9WuDy5+tiigjLmX/8Tt/Vy15tupOvYx5KvaDWVvltzMC
	 tJiSEO+eYFTk5FcyLSy3hHC/g+xrbeXoT6M2nkAG7Mwyw+OsIbzJ85T/nJHoRww0Co
	 UJzxS0XmNaC3sb7GRlb0sIhzPDqnjxlCIh0N8C/O6RwFZsWZ2M/xJtlThD/djqbAiT
	 jJJsCHRfFbMOg==
Date: Mon, 20 Apr 2026 11:50:26 +0100
From: Mark Brown <broonie@kernel.org>
To: Piyush Patle <piyushpatle228@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sheetal <sheetal@nvidia.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	linux-sound@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 0/2] ASoC: tegra210: simplify ADX/AMX byte map get/put
 logic
Message-ID: <6d22e9b7-1df4-4b4a-9d10-51646eb45b86@sirena.org.uk>
References: <20260410200530.171323-1-piyushpatle228@gmail.com>
 <CAMB+xkYZZprxmBMWnypYc3kfVa8ZN+WWrTOT9TpZqcQGOAyjVg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RC0DX7+5cb+ebmcQ"
Content-Disposition: inline
In-Reply-To: <CAMB+xkYZZprxmBMWnypYc3kfVa8ZN+WWrTOT9TpZqcQGOAyjVg@mail.gmail.com>
X-Cookie: Sales tax applies.


--RC0DX7+5cb+ebmcQ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 18, 2026 at 07:06:36PM +0530, Piyush Patle wrote:
> On Sat, Apr 11, 2026 at 1:35=E2=80=AFAM Piyush Patle <piyushpatle228@gmai=
l.com> wrote:

> Just a gentle ping on this patch series.

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--RC0DX7+5cb+ebmcQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnmBPEACgkQJNaLcl1U
h9DC7wf8Dyia6semrP8ELZnosk6Ki7uMGS+IbL1u9LO4F+GwVZf+2WsQchGWxhPu
Y5QRww3aOCdeuLR0jABIIs4T355fxp74vz+7k/MCN1UphbxYilXgmqMZHehsvwDF
B1cqBlnXok/kIv0IZr7JoaeCNciU7UXU5d+rnuVQ2E21RBjUkOzVA3rImuyFB4hP
D2S9aLCiyLYyTwOTnOxMhg1w8Zduz7EQsNwDSZ9tVNXlxopK8ebrZ2jpSTybrzX3
GJ+yWvnf9XRfF+mlGUb85qd7rPk6Cttg5QpgFGH2+jUm6I8sgBiTQBrgWrV3PG3y
HYGbzZcSq75laq54gBN/2icRkQ/Nxw==
=qITe
-----END PGP SIGNATURE-----

--RC0DX7+5cb+ebmcQ--
