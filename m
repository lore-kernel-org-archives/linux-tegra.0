Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D64502FFF93
	for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 18:33:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765391584; cv=none; b=K16l/Q+xPTXWvdy4bjTg4JNZVoAPjLu4T1gT/1OH/umVKF3KtXnAPmgBTLnTK0knB2498ChswQVLMZGoBgPsHCLw9wTAsNDEdbMpIctWgH5yyRf0SXgEZf7eay3cHPkj7tzaKDqUxYmcMvmlqWWJv8Ao0pCpiZRoNPEv06hGCRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765391584; c=relaxed/simple;
	bh=XCYunP1MFaxEZGn5zsjzuD3N4V4sc+8T88BNtQaa6W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SjDRiztlXDQCuiTPWs0kn3nbvI5j/LQU0faMKT4jVlIm/hiVDwaqJaLvgTEqvKFYneefZZ6w1++bl3ENgMe72aMzquhiU1MGAXJtd8XBz2lj4wY0e8nJbSAvAOb2Yew80Q4xUkxe/9OpfL7Gh+NzenY2QPUxUbBxqy2WuFWx05g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CzjPXtjb; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CzjPXtjb"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-595910c9178so41122e87.1
        for <linux-tegra@vger.kernel.org>; Wed, 10 Dec 2025 10:33:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765391581; x=1765996381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XCYunP1MFaxEZGn5zsjzuD3N4V4sc+8T88BNtQaa6W8=;
        b=CzjPXtjbRY4jZze3ur0cYZ03hdF0wPKWjCjCZqEQfmiNeJJXQajvLjLBOjclTl+b4Q
         k4wyTREp852TwoaLdF1/mIINPUIgyH7//tSkmbIDnBdzz9vxgok7I5ofrgSdwOADT68y
         tsN+ZiWMgvv9HMtROAjeMU965HJv8gI+2OZEu7TYiJ+EKr+TSvofDiPDdCuDx4avKCXZ
         kKpLNBcwB6wKXVayDNxi5nnhkvET3NdTc0w987emL1TChal7ndRIpW5fi3JExmrPisjK
         pTb6vruTvBmDiEI5PShUGdfGsTzQVe9GbYslH2NwHRWUskggYfH4pnooIYVd80Gq3iuT
         Yo+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765391581; x=1765996381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XCYunP1MFaxEZGn5zsjzuD3N4V4sc+8T88BNtQaa6W8=;
        b=eckhEXilor7PhcMhsPlnT+JBHPIOnrKaX7hvI9SFkjX3vk3/C9PFGXob4Vm5W4yKWf
         segw/6jAMM37awDphUqYNg60ItnVGJ4xH6EnN6GtiroNzvKEfSRsAWVK4KL40mB3+g0s
         lrDeVTp5fCRassXiHvFIlu6FFM+QB60fdoE5eYGodwj3CV+QU7oJFoJX4hD13jogDoUy
         pJo465TFmQpU/WeVKmNFeCRWHNk6nE5VbbkYxkB0F6CzcZmduqgIQiEufuaFZ5qxJOu9
         zYwAJe4okQzOdTK0g9YX0blo/TLzqTlhAPYgLdUnm0mxsI6YbMXNWKPC64CgxT7UYYcj
         WAYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUV7xG49jkMPfs46CE1z/+gnFGCFVJ0aecYJVqQPQ2MYSNRV5B+i2UY53HRQGm+8wdlPDM5RY0mB6+3Sg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWf4A2qh3QOx95vczkttEz9RzQgnJJTJ2wx0aZ/SvIRdvXrBXy
	ylTl7qfPzIiw5Ehl/Gjfr568+3S5sMh6NG9LgLVOE8oEqjT8+nOQcyzHorUPFWW2rxrPyIMowa3
	3+fZCxobDo39ktxyYF+FPhQ+C1kGNnWo=
X-Gm-Gg: AY/fxX6AOiALweTR/JVLWplW3mcEgoE/S+Eeb6tbNNEVf+AUCicCnBFpZgIqsCsVIrf
	c5z6bSiWr+veMez8Xra9RacW0XdIf+9GEdsXM33sFdZaBemIRhp7wUrRDKU55SDjkLCzS/0OoHX
	SAnuvUZJIid4S/lsyF5+RMYn6UtiJPnKMk2Gzjs2lQxp8p18XwxK6F2MOD3+ojXhYhUZOcxbPZN
	zcX2UluA6KN7fo58cUToeQKy2+GQYVbJJIrRpdvgcYA/TyrVR1t/uJo77lIVeQmjKhMDrvRFKYG
	ukRXbA==
X-Google-Smtp-Source: AGHT+IGRzhuQbpaIiIx64rRvoMPeKJ0tQ5iWh5PoRl1Q9jUkP3/981+fYv9+vNw3dV5sUXQsiIuENZJ6gz0824ZfVmU=
X-Received: by 2002:a05:6512:b02:b0:594:253c:209f with SMTP id
 2adb3069b0e04-598ee53ec6dmr1455024e87.39.1765391580727; Wed, 10 Dec 2025
 10:33:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251027-tegra186-icc-p2-v4-0-e4e4f57e2103@gmail.com>
 <CALHNRZ8nCojreFCMXfbBBhWAMtmWN-04XtuW8fEsVD9bw+-AzA@mail.gmail.com>
 <CALHNRZ-CO5i9jeLkEG2cmHxcW1bcLhxcBSxjmL2euHfQy8yr-w@mail.gmail.com>
 <e6ce190e-6df7-4c36-abca-f09df3cc80e7@nvidia.com> <99ca4992-5736-417d-854e-379542549bee@kernel.org>
 <7f3dad08-cff5-40c2-8e7f-f6441a3d6b91@nvidia.com> <d5d23eb5-f43c-4e4b-9926-3fba6ffd3acf@nvidia.com>
 <CALHNRZ8vFJyfFXbxFehWA9TGkdrEUy9Wsm-DxEOT=tVbYTcU5Q@mail.gmail.com>
 <249bbe7e-e2da-4493-bdd5-8f4b17aff8fe@nvidia.com> <CALHNRZ8uPaKqSpFWkmYZn==Xw=rxh95Xm0_6LPN1HDj20zofqw@mail.gmail.com>
 <d16803e5-7b6d-4472-b50c-aa324cf52736@nvidia.com> <CALHNRZ83Q2Ha8VYoWAnqoCZQ=Fd9rtVRVLwRFxAY68ePQ29GHw@mail.gmail.com>
 <29cf2c16-3a0e-42c5-a083-16f77ae5d09a@nvidia.com> <CALHNRZ9KAv-hL6+6Uiaz2O2odm1rqMnjNxNVPsbCOdqX15KTuw@mail.gmail.com>
 <856447ae-4338-471d-a71f-a34aed749ac7@nvidia.com> <CALHNRZ9y0n6JNfeDUQgZoECkxo+We0_G8TP0H4advcSqrX86kg@mail.gmail.com>
 <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
In-Reply-To: <f906f85f-b110-4328-b177-02fcdf7ffe53@nvidia.com>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 10 Dec 2025 12:32:48 -0600
X-Gm-Features: AQt7F2pVjeNsup3vHu6UK02azziNs5j464FN4HX7BMVbonnjEkrnrV-F0sqKxT4
Message-ID: <CALHNRZ8go4ATHgJ4SE=7pkAMgRP_0tj5z4pDXjxicV9o7F13Ng@mail.gmail.com>
Subject: Re: [PATCH v4 3/5] memory: tegra186-emc: Support non-bpmp icc scaling
To: Jon Hunter <jonathanh@nvidia.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 10, 2025 at 9:04=E2=80=AFAM Jon Hunter <jonathanh@nvidia.com> w=
rote:
>
>
> On 10/12/2025 05:06, Aaron Kling wrote:
>
> ...
>
> > Let me try to iterate the potential issues I've seen stated here. If
> > I'm missing anything, please fill in the blanks.
> >
> > 1) If this change is applied without the related dt change and the
> > pcie drvier is loaded, the emc clock can become stuck at the lowest
> > rate. This is caused by the pcie driver providing icc data, but
> > nothing else is. So the very low requested bandwidth results in the
> > emc clock being set very low. I'm not sure there is a 'fix' for this,
> > beyond making sure the dt change is merged to ensure that the cpufreq
> > driver provides bandwidth info, causing the emc driver to select a
> > more reasonable emc clock rate. This is a similar situation to what's
> > currently blocking the tegra210 actmon series. I don't think there is
> > a way for the drivers to know if icc data is missing/wrong. The
> > scaling is doing exactly what it's told based on the icc routing given
> > in the dt.
>
> So this is the fundamental issue with this that must be fixed. We can't
> allow the PCIe driver to slow the system down. I think that Krzysztof
> suggested we need some way to determine if the necessary ICC clients are
> present/registered for ICC to work. Admittedly, I have no idea if there
> is a simple way to do this, but we need something like that.

I'm not sure I understand how checking clients would work. Is there a
mechanism for the emc driver to know if cpufreq is registered to icc
in a way that works with probe deferrals, but also allows for it to be
optional?

Alternatively if there is not, can we just accept the abi break and
have this and the dt change depend on each other? I know it's not
desirable or the first choice, but if the other option is to rewrite
part of the icc system, then perhaps it should be an option.

> > 2) Jon, you report that even with both this change and the related dt
> > change, that the issue is still not fixed. But then posted a log
> > showing that the emc rate is set to max. If the issue is that emc rate
> > is too low, then how can debugfs report that the rate is max? For
> > reference, everything scales as expected for me given this change plus
> > the dt change on both p2771 and p3636+p3509.
>
> To clarify, this broke the boot test on Tegra194 because the boot was
> too slow. However, this also broke the EMC test on Tegra186 because
> setting the frequency from the debugfs failed. So two different failures
> on two different devices. I am guessing the EMC test would also fail on
> Tegra194, but given that it does not boot, we did not get that far.

So you're saying that even with the dt changes, this change on
tegra194 still does not boot before the regression test framework
times out? If so, I need some more details about this. I have not seen
issues on p2972 or p3518. For example, if I boot to android recovery
where I set the cpufreq governor to performance, I see emc clock rate
set to 2133 MHz and 1600 MHz respectively. And boot time from kernel
start to pixels on display is 15 seconds, give or take a couple
seconds. This is using the boot stack from l4t r32.7.6.

> > 3) If icc is requesting enough bandwidth to set the emc clock to a
> > high value, then a user tries to set debugfs max_freq to a lower
> > value, this code will reject the change. I do not believe this is an
> > issue unique to this code. tegra20-emc, tegra30-emc, and tegra124-emc
> > all have this same flow. And so does my proposed change to
> > tegra210-emc-core in the actmon series. This is why I asked if
> > tegra124 ran this test, to see if the failure was unique. If this is
> > not a unique failure, then I'd argue that all instances need changed,
> > not just this one causing diverging results depending on the soc being
> > utilized. A lot of the work I'm doing is to try to bring unity and
> > feature parity to all the tegra socs I'm working on. I don't want to
> > cause even more divergence.
>
> Yes that is fair point, however, we need to detect this in the
> tegra-tests so that we know that this will not work. It would be nice if
> we could disable ICC from userspace and then run the test.

I am unaware of a way to disable icc from userspace. That would be
useful to me as well. And for the record, I'm not refusing to make
such a change. I would just want to have a series to change all the
others uploaded and merged concurrently. But I cannot test t20 or t30.
Only t124+.

> Bottom line here is that #1 is the problem that needs to be fixed.

Aaron
