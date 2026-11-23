Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795444185;
	b=iFeoPxEmeSfnw/P8VUW0S5LlSKyfA6P0ORFJ0vfhVPwmKz6ZKVplKCkV1YUPnxNRoNPZ
	 6Tz5ykSPrHfAujHorw9x27KKt0bheADzRi9rxgaSJtDdwZURiggfFwy8dUx1fVDifFbXs
	 WU5uWnnMabrUOlP9zghcv7GgKc1uR4GHPXISh8d+jBpUi21QGDyNrMKJRKIC2LONK+Lp+
	 Uuo6tI8J+JMzHrYULO07B4N+erIdrOYgFtpauvM8+xFnfWGo+ii7tevZScSaRqBt4gOWa
	 fAFD4mlZ7fI/tVmdEuOBeBCZOEzO0yhhx/Ji8sOSp9cee7YaxYY7c6NU/FTtuby9bPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795444185;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=ROrUqZkbzP8LgqCX7NGiVjaQailsYGWxDA+4EOEFZZs=;
	b=VlKUqRu13IdyGLzn2L6RRaeFyK0VT8PnnyTRT5jbr6y4DladxZhnLhF+nwIt+r77Fykn
	 6NQRielENW5/Ff28G/++ACoJdB0PvV3ECBx1ZJrtR5+nYsA645/lrADpXKobp4BludnHA
	 rbDeDOmwhe4O5maTv2m9PPjaSnift+w4z5IWCCeWgmG4ekqZYwIgT3BlaMa57JH75kIzr
	 llhgxL/sKL+knPpJfdhBa3hgi/JbERY5NoMFe1T25OQB59jARaSYJc5eLCAuRiVPv1SHG
	 MB8XrT403esNcYxf7tIoN24S5k/UAq4MSdkmFxF475Rw2PeszFEOCO01mw37ktdNkiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmXyQoyd;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5C90606A31E;
	Mon, 23 Nov 2026 14:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=JmXyQoyd
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 220D61F000C6;
	Mon, 23 Nov 2026 14:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795444185;
	bh=ROrUqZkbzP8LgqCX7NGiVjaQailsYGWxDA+4EOEFZZs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JmXyQoydVBoWpr4+5R4CZ4z+AoyWLrYpEEMxAQuw/pLunMtb/cKSldBwzfWKKHEnq
	 v75SVo09OWHsaqhmRDY3uFZq/IfdMc6dsdiC+bdDTF00CYKcVgim6qaDzJadMLwaNh
	 1lehl36nca+arCMfCsXN2lkml5UsOnihwHzd6jAOdL+3qqrKzixnYLKk5/gGeYxjOY
	 +MBIJwCyTBa6WJHmwut+DUUgxOZfpvVe0KsGBUK9phgQr/WFmi79q2nPSW1jC3vqOF
	 bKU08JQzM7PCqE1hWSCVNp37IiCSxHEWJDbtXA2yUY7UI29kNQvib/7SVFtL+R+Zvk
	 jdKaa6IdT62hA==
Date: Mon, 23 Nov 2026 08:29:43 -0600
From: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Svyatoslav Ryhel <clamor95@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Sowjanya Komatineni <skomatineni@nvidia.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Cong Nguyen <congnt264@gmail.com>,
	Faisal Mukhtar <mukhtarfaisal03@gmail.com>,
	Dan Carpenter <error27@gmail.com>,
	Hungyu Lin <dennylin0707@gmail.com>,
	Hao-Qun Huang <alvinhuang0603@gmail.com>,
	Yury Norov <ynorov@nvidia.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	linux-media@vger.kernel.org, linux-tegra@vger.kernel.org,
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Subject: Re: [PATCH v1 09/10] ARM: tegra: Remove fallback compatible from
 Tegra30 VI node
Message-ID: <20261123142943.GA2320531-robh@kernel.org>
References: <20261113161819.36847-1-clamor95@gmail.com>
 <20261113161819.36847-10-clamor95@gmail.com>
 <ceb7b479-080f-4210-a1f2-be3e273779e5@kernel.org>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ceb7b479-080f-4210-a1f2-be3e273779e5@kernel.org>

On Sat, Nov 14, 2026 at 10:22:36AM +0100, Krzysztof Kozlowski wrote:
> On 13/11/2026 17:18, Svyatoslav Ryhel wrote:
> > Tegra30 now has its own specific compatible string for the VI. Remove the
> > Tegra20 fallback, as it may interfere with the correct configuration of
> > the device.
> > 
> > Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> 
> 
> DTS cannot be combined in this patchset and must be split. Don't mix
> patches from independent subsystems when you send something explicitly
> targeting only one subsystem (staging, USB).
> See also: Documentation/devicetree/bindings/submitting-patches.rst

Except this is an ABI change and will introduce warnings if merged 
separately. So this and the binding change should be applied together. 
Haven't looked at the rest of the series...

Rob
