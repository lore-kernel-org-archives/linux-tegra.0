Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2980D1F4168;
	Tue, 16 Sep 2025 01:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757985307; cv=none; b=pnjr1A/1EDAT6xExS2SqYIuZXmkb36R9b1NH3ZOWoWfES0UXU4lsh6fwe48grEJnFnCjNmViW9GZqN8JbxQ4Qe04Lbfwpy2YY28lW+PMujHPBHrHzybp7rlxmui9f/VU+s/JPaQxs2esUgwshVYtM1sYESPYGIyt9q7BElTyAmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757985307; c=relaxed/simple;
	bh=E68Sre490WI8uxNmRE3hPbmZjIlZQTc/1KeLljXClZ0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=oP7iF6INQncpxeKwr3CiM02hOcDB9HrrNS9+9pT9dLAAseWzMICZnQvTrTI6O2jJZGWuyLt7bzC17f7OhgYRqjXGPPCGsgN02I0W/QYjQejQT5AkNgma7BZ7Pist+90xxdl3Pn62MnkI+qzjsMcVgjeaGmMdwDe2G+snox1UGHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IIbD6+1l; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIbD6+1l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 977C2C4CEF1;
	Tue, 16 Sep 2025 01:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757985306;
	bh=E68Sre490WI8uxNmRE3hPbmZjIlZQTc/1KeLljXClZ0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=IIbD6+1lpkdTbpvbZFJ1w9/NWJYCD7YuhgGnx62OuEFrLEbmVGwQLDy8gIqWIWrqN
	 IlDuhkS/dpmWZINlJDLQyLg5GfncXlkKM8MGJYNYpDxUf8SDuVIKFWaWOhQUPs76iL
	 XtyGbZVPGOZO0D7sOgFr3kjlYwrL75lRp87U2dAXikW2LrYPccjYgB47oXFaS3OPP2
	 JYY6N6PN1qOw78p6qGGSqAmMeo14la9ORVyeHdZkrq9GmZoVaGRS3Z9sLSoOjY5Ntx
	 L2yc5D3mdv6mOf4kf/XRV/WxTaGm70F4dwvEzMFO/L9fabzr5X3winxjr9J2+E2+XO
	 9B0imVcQtzzKw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250914064006.90225-1-thierry.reding@gmail.com>
References: <20250914064006.90225-1-thierry.reding@gmail.com>
Subject: Re: [GIT PULL] clk: tegra: Changes for v6.18-rc1
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
To: Michael Turquette <mturquette@baylibre.com>, Thierry Reding <thierry.reding@gmail.com>
Date: Mon, 15 Sep 2025 18:14:59 -0700
Message-ID: <175798529968.4354.1111445579818917256@lazor>
User-Agent: alot/0.11

Quoting Thierry Reding (2025-09-13 23:40:04)
> Hi Mike, Stephen,
>=20
> The following changes since commit 04f27a0fda6b6be104531eeb95d07ef1b3a72a=
f8:
>=20
>   dt-bindings: arm: tegra: Add ASUS TF101G and SL101 (2025-09-11 18:28:57=
 +0200)
>=20
> are available in the Git repository at:
>=20
>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/for-=
6.18-clk
>=20
> for you to fetch changes up to 5aba939e80f439c1a67adb6d9cae23cc72db7ef9:
>=20
>   clk: tegra: dfll: Add CVB tables for Tegra114 (2025-09-14 08:23:28 +020=
0)
>=20
> This depends on the dt-bindings branch because of the DT header file
> that the driver includes.
>=20
> Thanks,
> Thierry
>=20
> ----------------------------------------------------------------

Thanks. Pulled into clk-next
