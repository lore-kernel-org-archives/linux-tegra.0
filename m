Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C492C340A46
	for <linux-tegra@vger.kernel.org>; Wed, 15 Apr 2026 05:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776232158; cv=pass; b=Fu+NbV85U4QtEPdw54xvk0w74whwHZEtXL7zgP8yHi0D5SFsH95o3PVqnSBLx7r6GGNYMUFM04VCIX5bbS7+tM1VB3QrbRrgRD9cOzN1JuK02Vw8Bo4EWygbYZsegHBNRq4a1vd01mIcB8y0Ubbxtv9DfzrNubOfIwvHoXPajW8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776232158; c=relaxed/simple;
	bh=0Ko4VIiZxkI/O2taJ+3DwN8b1cZwadpXOzMv+Q9JyHg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyVDDDzvdY9v/lhu9l+T24dv8THORGRTsYHhOy/+uHHoMIL8jT7SeeDGytUvQ5U0e6JTbofKWsAUsfNv83ueSN4u4lnG4LHyCVgBit5AVD5tUuZqOrwDTvlVffywCeu1KgJFfQTwUgq9rmNVrMxyzhdZPwz6H8jCjo9yc7KSnTs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=RuhvW9lz; arc=pass smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RuhvW9lz"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-89fc349b5ceso99259566d6.3
        for <linux-tegra@vger.kernel.org>; Tue, 14 Apr 2026 22:49:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776232156; cv=none;
        d=google.com; s=arc-20240605;
        b=iFokrpz5qr8tpPx+PUjun0VP6+S6Vn7Ti95Y7hoGlG+JpIkv2N1gy87blrTKdNAp0x
         K161dCxPe925kRS1pOqlbaw8jGQOYAUQnNakO9WkVodh+odhiYv8pqK5rJnJQVIIyhYt
         K9JznhVa6PD9ljwYXOdWaV9C4lGdMgHiPzl6o399KCll9kILSBr2q6X6jdz+Am+nCL++
         oju62ED/kcHalPCpSx62TYMq65dPKnfjAGoMkBbWLKb3N0YXGzzvgsKDLZAsB5b8Reel
         Xx/o0R0fe/VeZsqiRok30vP5AJwf7iaNINaCV/XBdPzzGEb4qZdPPRB372YVJf4O8MLa
         Rq5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g7jC+e6yTEY26VnAI6j6zPGlJNJqrM6o2NkoHZehI4k=;
        fh=ME1lzptk9hZcvFfy1TdLmbZbIKvMcERSwzIPC2G+z/g=;
        b=QWHHvVsi3tFPKbdP6p43KGZDwh+nO6bkErAUJYIEYY9diKI8H0FcnmJkrAZ51+UgS5
         a5kBwpRiORu+XVRs4/tB7X5nHV/sZGUN2Kj+qb4SrXjVXUvjOo/L/ZK/NavKocD/elby
         F1gz/geVcZdBqsLYMHz5aev99j94405y9x75k+bSkBJUjMO4lKSsdKwNDwk3V/o92dxs
         dON5E0tCEieW92+QGHeHBPtFn7AOcn6yq2rMWxzxhbSbMUUA2eqdv7MySdhe5R3FaChb
         BTBcVB6YQB/y7rlpUMzCcguOASpT8Verkp0flLRcj5vJMEBrBxhLtMlI/+eE/Uxz/SHc
         dmww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1776232156; x=1776836956; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g7jC+e6yTEY26VnAI6j6zPGlJNJqrM6o2NkoHZehI4k=;
        b=RuhvW9lzGi8NVZMQeDUAv0UwK0MZ2CHqskH8gB1dDso8n+Qza5GJSBt2aYbTCjP1LR
         rYyOYVAAjiWF6Vqfe81TYEkvNyuFajW7LkviqvSQyuWF1Hkb/1664pVjx3nLXu55egkY
         /cAlqlRhhozmBnRhHiHKUcJol+1mgIjgk7rWzTN50MYw9NT+J1xzbERTThuhJyVn24Nm
         mc+ZW0cK8i7UtRdcPNVx7U07ncVsdkIIoBuwHjhgOXPnBsllocrG4XellS11hrxjDFBx
         5gIPvU7RoaAKFIufsyxXZ1p+fNwKAY3dkkzZB9sKHiF56tiOdctEPL46WBR/Z9x265+b
         AaBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776232156; x=1776836956;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g7jC+e6yTEY26VnAI6j6zPGlJNJqrM6o2NkoHZehI4k=;
        b=SQmns49ryP7PseEbQf2L57/J1XlBf7dFl8th/K4bcvUNerxdmuVwXiXzhzOFFxFB/f
         DVab3RG0xS8niPczGT8u8pOOabRjdu3Ei5smWcdh6eHKKo8JW9gbi/8HmALC6hst5QEU
         iFNuoXbRfQknW7jIrDLE+Tls6VIkFrTFfupAhe/aRx5e3tBInxwcWgBqVz7YGqZz1Rxf
         cwEeDWXpdEsvsRodehCnr4dwgJuB8kLGuJWPlVd25KBMOsxgCwl6mUNfX4lnBOg6tb9M
         MUA9mAcM9+sgt6VfAlOcUbn6INHLUkjfb6hQWzxdHfR/5KAc3Kl82GaleXbxcD1w26Mh
         1+Dw==
X-Forwarded-Encrypted: i=1; AFNElJ8QtePbwTn/oi1V56LfdT6FNA9L45vxVwWBh87srXfXbrco2wQ5FgKZBjQ8geJ7YICc/EGW2RQIm8QfgQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfuwloky9qEC0FWeKYNgiFHL3i3x4eiiCO6K1u/QrsnDQ13S9D
	hUmNRhHBnIYVy7MVAoyA42systmUKdKJfMihfklmzbtSbD3YcDh+YAXV0743x8VIHxu6y7Sl5Be
	wI6bI6ZTyIZj6wuS8JU1obKMUPxTxR9bZdqpJe0QL
X-Gm-Gg: AeBDieuAfwgYTtoNzYufGNMwH9NL0BFaXcT32CisRi0X8D1p4kAXOocxmT7P3zNQBc4
	HxgFBa0JV1IDbx4fjb+hEWq6ckr+PdS3VqNnxIgMDs/so7BCeIug57Apt0i2b9/MxuVh+2VYGPu
	QCGXpRMt0DFfDfSsgbtn9fnyFgTL9Xy0SAxmJ5unsIYRzR2x7aMTUSpkHuoO9KupU/bKSCGk1HF
	zPTw9gtG29RAlvFsi+634JtK0LejFM8hkuuPGKHe1fD33amXPHUlvCAnPr3wN2hM45U3pelVt8j
	WNtfaA/w4Bc8+BvgZN606fbJb8l2P90R54Mx3hp3bMC2fFOjoH+lpaHDiOHTq0I2RXeiVtc=
X-Received: by 2002:ad4:5bc7:0:b0:8ac:ae56:b493 with SMTP id
 6a1803df08f44-8acae56b656mr198973546d6.40.1776232155593; Tue, 14 Apr 2026
 22:49:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260413155819.042779211@linuxfoundation.org> <39e878af-7418-4538-9e1f-8b62de3d1e3f@nvidia.com>
 <ad30ns8QQDzk0h72@duo.ucw.cz>
In-Reply-To: <ad30ns8QQDzk0h72@duo.ucw.cz>
From: Ben Copeland <ben.copeland@linaro.org>
Date: Wed, 15 Apr 2026 06:49:04 +0100
X-Gm-Features: AQROBzBEqY4mG6hUOd2h2ReML6KwVLMY91sTJvZDNC4GxKeXzWsyi3AnMxmOomg
Message-ID: <CAL0q8a65x5mK2K+X8bY3sPrG8JMhbN7uDMje7JJNvvmzaR_SiQ@mail.gmail.com>
Subject: Re: [PATCH 5.10 000/491] 5.10.253-rc1 review
To: Pavel Machek <pavel@nabladev.com>
Cc: Jon Hunter <jonathanh@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	stable@vger.kernel.org, patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
	torvalds@linux-foundation.org, akpm@linux-foundation.org, linux@roeck-us.net, 
	shuah@kernel.org, patches@kernelci.org, lkft-triage@lists.linaro.org, 
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	sr@sladewatkins.com, 
	"linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Apr 2026 at 09:03, Pavel Machek <pavel@nabladev.com> wrote:
>
> On Mon 2026-04-13 19:52:08, Jon Hunter wrote:
> > Hi Greg,
> >
> > On 13/04/2026 16:54, Greg Kroah-Hartman wrote:
> > > This is the start of the stable review cycle for the 5.10.253 release=
.
> > > There are 491 patches in this series, all will be posted as a respons=
e
> > > to this one.  If anyone has any issues with these being applied, plea=
se
> > > let me know.
> > >
> > > Responses should be made by Wed, 15 Apr 2026 15:57:08 +0000.
> > > Anything received after that time might be too late.
> > >
> > > The whole patch series can be found in one patch at:
> > >     https://www.kernel.org/pub/linux/kernel/v5.x/stable-review/patch-=
5.10.253-rc1.gz
> > > or in the git tree and branch at:
> > >     git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.10.y
> > > and the diffstat can be found below.
> > >
> > > thanks,
> > >
> > > greg k-h
> > >
> > > -------------
> > > Pseudo-Shortlog of commits:
> >
> > ...
> > > Uwe Kleine-K=C3=B6nig <u.kleine-koenig@pengutronix.de>
> > >      bus: omap-ocp2scp: Convert to platform remove callback returning=
 void
> >
> >
> > I am seeing the following build error due to the above change on ARM pl=
atforms ...
> >
> > drivers/bus/omap-ocp2scp.c:95:10: error: 'struct platform_driver' has n=
o member named 'remove_new'; did you mean 'remove'?
> >    95 |         .remove_new     =3D omap_ocp2scp_remove,
> >       |          ^~~~~~~~~~
> >       |          remove
> > drivers/bus/omap-ocp2scp.c:95:27: error: initialization of 'int (*)(str=
uct platform_device *)' from incompatible pointer type 'void (*)(struct pla=
tform_device *)' [-Werror=3Dincompatible-pointer-types]
> >    95 |         .remove_new     =3D omap_ocp2scp_remove,
> >       |                           ^~~~~~~~~~~~~~~~~~~
> >
>
> We see that one, too:
>
> https://gitlab.com/cip-project/cip-testing/linux-stable-rc-ci/-/jobs/1390=
1155305
> https://gitlab.com/cip-project/cip-testing/linux-stable-rc-ci/-/pipelines=
/2450043152
>
> Best regards,

This was also observed on KernelCI:

https://dashboard.kernelci.org/tree/stable-rc/linux-5.10.y/0abb5988a311f0e6=
17615aa4b08c90b3ade85c25?df%7Ca%7Carm=3Dtrue

The two issues:

https://dashboard.kernelci.org/issue/maestro%3A67d434ff5d6b71886d45efe758ca=
00ff45cb969a?iv=3D1
https://dashboard.kernelci.org/issue/maestro%3Ac970827f049cfd67124148e3c19a=
be1d4aa8347a?iv=3D1

Regards

Ben

>                                                                          =
       Pavel
