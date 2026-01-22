Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3E9826F2A8
	for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 17:55:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104557; cv=pass; b=oXBhTAqmNBvy1Y7hMedj99zhipw38vrOjtOTCN1amrBo5JKtRaS50NC6ACmRraW0TZImltXEEvmF6wR7nKV0VmvQTHyoB65WwVfgbwMdQwSRnXpf09oCvjfVIfrqEPlpowHGd0ojYz1VRJygiLafduciV+OV1DnuaNFaqdW2VG8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104557; c=relaxed/simple;
	bh=FmV0uGjFfXxqFYJ/WYbeQV+bbM6CHfDFB4+n8D/HfDw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MJoZUW9j1kWh5ywEnSyMtOzKwV7w0pGt6u1wFRQSBbtSrBMN4MpvKKlauSd2AUC586O1s7ufaoL3DGGBAdjOS6qOdZcsoDoWX8WHQnMDJHZeEfKG6oJVFzldHM5wmUHkgR6hwpdo3/il0BHBF1US+sScJ58obcw27n0wusraU/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=auIjfNni; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="auIjfNni"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7cfd819ae5eso387476a34.1
        for <linux-tegra@vger.kernel.org>; Thu, 22 Jan 2026 09:55:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769104545; cv=none;
        d=google.com; s=arc-20240605;
        b=EQV64Xpmux7swKpg4Dg0MfMonwK4J9HHpS2NiKPElo+s8fBQZzVsVRBQ2TO+P1Iyjn
         wL2z5F9VahjlCSMzVGq5FhHOS3mEgjP/+AZQaa78QrKZ3YGbOtr/3MhvqyJTF15bc3ZU
         yYBL7Ox2GKV86Z+RZetj/s0MKNTNScmOdKkUJ/kb83ybz7ALoCx81q+K8/riDrM+TAKc
         oTn3KTQmP75N59HwYO69eomEja+bG8AyQ2hV2d1UZs6vJpifcsR2FRWlZFhanXk7MvbY
         FDfXKtvikSw8aXzdg18xW/oklfhh7iehiClC+i54+E/WKMM6eVinsOTfz7zovJvIXbM6
         gtOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FmV0uGjFfXxqFYJ/WYbeQV+bbM6CHfDFB4+n8D/HfDw=;
        fh=q868wH+Hyfmbr9LBs3VAYlonMml/tv1Vqj4Kp72Dqtc=;
        b=LxSav2lctxGMpmbSpMOyejuWnXIIa9PITiYiypztyFLsRRgcy0AsMdgaA8P0KiudPq
         qO/2zkxt86b3Ob5LNqJOKCgH/o0ar7SkdoS30teLEU5HRzN32ZOTAE6bLd7XFFV24sya
         mL/4WkI5UzHYY5aoyegSkdSQdXNHFRLrtWqK5K+TcEm+WxIPNkiN8B6XbivKwaBNZdcQ
         r5BoCCGWvdLTOpVA9gccuVDKFxA+2pJ4aEDDsySQqWO/v+NhZDrOBDsy9xjwfP3Xw7nH
         vL8MuPaajqx15mmlLmaT3HH3INbbcwf6OvA1erxTNo7Crorv8XoqYLc770PKCtgbowuI
         OXmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769104545; x=1769709345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FmV0uGjFfXxqFYJ/WYbeQV+bbM6CHfDFB4+n8D/HfDw=;
        b=auIjfNni8dpNge+vnYs7capM+RkL2cicf8FU64syED73jsZj8NrzHvx+Uee6T4eIt0
         KuyBh3Fj85qBT30oCpN4laZhRv4ae+hm+ZwACc5WLeBLptToyrZgNo0DNXODD1WCCXqF
         SXjTkitbuC4MImjKagR+KemmxXBL0zupMtA1rBBS6tZEgVnUlCzVALnUFySDKHpa3GJE
         G/TEDEyUgCz7W5zB3PFeof8Ghyf+x4ehrzWjs7Xxv2xSrIbOjWlXkGdhlKbwvyuCnFG7
         mNAxAnP3Myq3x1uq40ytouf0G4SZisBrP3PsBA3HGJK0Wa+VlvcQTAgWvpoltPn7hNyd
         MkYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769104545; x=1769709345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FmV0uGjFfXxqFYJ/WYbeQV+bbM6CHfDFB4+n8D/HfDw=;
        b=AzLK6gK5jkxvK070TWitI59RzZwSXRywKsCgZ7ef8orspdpD86ak/RSOR82zPau5Wa
         +4bmZf6wBV2oEER2i4KWN1g1cZMeIPgj7rHhXKTu3XtFqjTJxq3YxnpXYuO0sgsXVpI/
         fZMu0photMPxUotrvnmi6caI2twqvxXKOlcbBFSyOicrMYXxcwTZBrYg8bw0u050fPBg
         kOk5juAwHCHcNRzMrbZqMR9o9YLPZoER9uwU3KP9dvFOkvTzyT5TVqMAIzjmKRmffHLe
         bL3Ulqr4DRAU+gwSPCmKHmlFmBTn+YsUjg8xDH/WMdApKBqTCDSJSVOVrhq32q8LGAHN
         cQ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXL1P3ohJWJOcQp/AQlkdPXrOZR22KRxyvxYeky2p2MaWEEIPB3rqzF1ZBojgCQ+lC2JNvZGO4obNhQow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx03e1ldEAWlHgmHtR0a03HFXE5gWDEVVBP2rYkNvb5rjbjzdUO
	uPKllcrAaNezRky4ukbMdcBOp/tWsfn2pNYaffMq7kX0bc5fySIlYNaLlFKEjKBx6YSEJNjL5ch
	FAzF6nChjippGN/TdBiRft5JkQCkqRgw=
X-Gm-Gg: AZuq6aJFMjbLHV0wBO4Ha8nKfQBjLFwQmLBBATO1AUDhChwIQpCU5KYqORTjHSlE0TR
	bGDZsOMqO2oT7rAlnlL3GMDnKRn30poJqU5CL20yV8EnS7ZzcJdO8qplzIS7A2SoptVufB7U+fD
	Ok7eiEjWS4257SJs8dkRtgXKl5u2rCHel2qL/+u0g5s6qliO6VUoHoBqkY4hFbAQBGTdL+8dLfW
	wSyCMXfKHYAg76UTjBiGKksWMkd490f54mIUd+sL09AmA5cOolZqI1X7SIZREFiqDo/UI8wF/DV
	O6vQ3xl3uxVtWH2Z5GjFYyAVlFo8dPvPoUlV/6KBj0H6ohtVjtfNBqvIhWjHlCg=
X-Received: by 2002:a05:6830:d8d:b0:7cf:cef0:be05 with SMTP id
 46e09a7af769-7d15a5ce0camr262476a34.5.1769104544757; Thu, 22 Jan 2026
 09:55:44 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260113162843.12712-1-hanguidong02@gmail.com>
 <7ae38e31-ef31-43ad-9106-7c76ea0e8596@sirena.org.uk> <CGME20260120152328eucas1p1024a7488ae10b8b7f2fcb74baee24c75@eucas1p1.samsung.com>
 <ef37ed64-24ad-4b82-bc6c-d3bc72aaf232@samsung.com> <e32b0819-2c29-4c83-83d5-e28dc4b2b01f@nvidia.com>
 <DFULF717AOGG.GY8B9ET26KND@kernel.org> <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
In-Reply-To: <f10007af-3629-4769-b89c-bbf4aa013bf3@nvidia.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Fri, 23 Jan 2026 01:55:33 +0800
X-Gm-Features: AZwV_Qjttv6lHnekYfXo25oG0uVWostMPWhj7wfX3h5q4pZY_X83k44kq3bm2H4
Message-ID: <CALbr=LaE=nS30uMmm_spywEHPYgC_w9qb9L1wFvwBe=PDae1Mw@mail.gmail.com>
Subject: Re: [PATCH v5] driver core: enforce device_lock for driver_match_device()
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Mark Brown <broonie@kernel.org>, gregkh@linuxfoundation.org, rafael@kernel.org, 
	linux-kernel@vger.kernel.org, baijiaju1990@gmail.com, 
	Qiu-ji Chen <chenqiuji666@gmail.com>, Aishwarya.TCV@arm.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 1:28=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
> Hi Danilo,
>
> On 21/01/2026 21:42, Danilo Krummrich wrote:
> > On Wed Jan 21, 2026 at 9:00 PM CET, Jon Hunter wrote:
> >> It is odd because it only appears to impact the Tegra194 Jetson Xavier
> >> NX board (tegra194-p3509-0000+p3668-0000.dts).
> >>
> >> It appears to boot enough so the test can SSH into the device, but the
> >> kernel log does not show the us getting to the console prompt. It also
> >> appears that a lot of drivers are not bound as expected. I would need =
to
> >> check if those are all modules or not.
> >
> > The other reports were fixed by [1], but the issue in arm-smmu-qcom sho=
uldn't be
> > related in this case.
> >
> > I quickyl checked all drivers with "tegra194" in their compatible strin=
g, but
> > didn't see anything odd.
> >
> > Can you please try to enable CONFIG_LOCKDEP, CONFIG_PROVE_LOCKING,
> > CONFIG_DEBUG_MUTEXES and see if you get a lockdep splat using the follo=
wing
> > diff?
> >
> > (You will see a lockdep warning in faux_bus_init(), it's harmless and c=
an be
> > ignored.)
>
> Thanks. I do the lockdep warning in faux_bus_init() but that's the only
> one. I have verified that all these CONFIGs are correctly enabled in the
> build. The device boots fine with the below diff, but I am guessing that
> that is expected?
>
> Any other thoughts?

Can you please try applying the following commit?

https://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
/commit/?h=3Ddriver-core-linus&id=3Ded1ac3c977dd6b119405fa36dd41f7151bd5b4d=
e

Robin Murphy confirmed that the qcom specific issue might actually
impact other hardware platforms (provided ARM_SMMU_QCOM/ARCH_QCOM is
enabled), as the implementation init code is still executed:

https://lore.kernel.org/driver-core/d2ddbb72-30a8-44da-b761-876b2d37567e@ar=
m.com/

So, this patch might fix the issue on Tegra as well.

Thanks.
