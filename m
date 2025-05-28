Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com [209.85.167.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 355E12750FA;
	Wed, 28 May 2025 17:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454092; cv=none; b=PccS5BCmycAkOU/AxZeZx7z7956/3FWXgeaiBVFpjwwoLupa/ITsgJBjY6TAdXehufYajkbK6FR5AhVWb4hiW/iRdlQPd+alU4gFozmRe5boptQos4WzdN4rsD/XPWyTRpzCl74dzcLeP0HdOJOEwAkpSb+7AMplRN78cKlWNzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454092; c=relaxed/simple;
	bh=hS73FPpRS7UBhsgsxHm6xLQp2o/6nNTRK7WKsBx1J2U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iWYIpbqfy3GygnxVBMiHdMjHusLP9JD5CTnDw2X/SZR5WDgH2tBhOrwXjm4gxPSJFOECKzglLHiyztUHQV19Fhl0zFJPsMOgtM5uhS26qFVa7MoLXD5pfMGxsqz8ld/KcUJLzhz+MQ1XIfQe4NQoabqNP7xb7DfF+sRNuGd5Ick=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9RNNWpL; arc=none smtp.client-ip=209.85.167.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9RNNWpL"
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-553233211d3so4512136e87.2;
        Wed, 28 May 2025 10:41:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748454089; x=1749058889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hS73FPpRS7UBhsgsxHm6xLQp2o/6nNTRK7WKsBx1J2U=;
        b=L9RNNWpL0iJd8AFFPa/qibFmsK8SBt3j9U91hUn7/kocoSADfEzHMN4Hmp1we9DYz7
         mWkV0OSqlkDq36fAdXS5Dwx+PzNhQcOdRDLc3SwHrd/ND2KjR0n8mN6yd2FimWggNsZs
         x2hioU+/N4A8U5OWvMv/BaOZcV0M+S9Kv3TJyfts01Tqyp/c1+O57hkIDsrBUzkN4p2H
         mQ3IqyNXu1AkE4hy3Njh1Ee6oC7gijSuXasACEDGXXUvKCitNi52qjjWqKPUCQyAa4/4
         Di2mGpMX+xNJo+O+DdlM7tGCaI5QQNDcPQ0ZIhfwl7tVzRQiPwHFQ2k+yZrSg0Vcuw7e
         BPgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454089; x=1749058889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hS73FPpRS7UBhsgsxHm6xLQp2o/6nNTRK7WKsBx1J2U=;
        b=ZFIu82dnGHKeL1r3Cj+kStwWWp4hvQ83qOrkOXW0DaQJ/D5DrmQ52Bx0ntIQTS/f0b
         DGNxEGYwDkmHufGgcVJpVNKB+4pVWnMGcSqUSYqbE+itnkK/NDGFesrSSujPsaTyhx7K
         wokKIdKk029arBySPcJIyio6ymWg+fqFwXxJH3wVHnRNZB1gIq9gK0cu04qqqwSvA4i+
         Uq32EfFjIjaBMAgO1HKm8kIW6kfhuKfxsuURdVMTrbljhfijp8OKTzRzzISMfZkV5P3x
         2xk+ciAB6oQmAA1It6soucfoTQXb+V5TeJA7YhpkWsje40ku3faXjsTxAAzIia6Mdnkk
         PHrg==
X-Forwarded-Encrypted: i=1; AJvYcCUw6hqsUv+OvWAB0gdbQri1ACMqCTaGKQvZDP7IhJVWY8gdt4PFEzPIQnKgaGKTOIzfVBbUQzSpvXwJs5A1@vger.kernel.org, AJvYcCVfNy2yCy24oCfHRO7pj/QZPdzYMfs0V0iEc7W0d0TXsZO2osNhYN4+UwDoWm0w/8MpcQYu+SoA3YM7@vger.kernel.org, AJvYcCXB9V8tgmfSBTaDg8kBp/mFRZjYPSUKb5KZavu3p0EyZ694KJ4+oiMQpKRaRTAzcuQBPMkQJx2GBpFWAYI=@vger.kernel.org
X-Gm-Message-State: AOJu0YztC2MZb5Lf0iVrnLSOZsQIBa56C4L3jRAs3gPBzDzelgbrV+CX
	Rmh+XwehI8tmMnygUlaBmrds59Zb/LIsSkHqHU7KW4lpORqfERZEoRk+tBWWH7tUjWEI6b2/Sn2
	+u2q6M4TvuvylQp481Yz18gtDkDmzO5mjXD6xT+8=
X-Gm-Gg: ASbGncsUjTIYAmO/iKmE92mva66oIArn9uF/vcnExZOntgInmYJ/UGzJhA/7dPRO5GU
	wOm5Cfw8Dc4V76Z469NwHthQA1Z0p+DYSEC1CaO19yuhLltVFJbWlTCnqS1I+abtDLtjU2o8ukd
	9NYJgMQfSmgsVmwUmV617B8fIcCq7Yx85Y
X-Google-Smtp-Source: AGHT+IEdvzETSNew0wJrJHYQDd2+wio+9tt88mErF+EAbjKyOwY/dFQ5t09SILXWe+7BWnCiLxt8sViAdTga5RteNIw=
X-Received: by 2002:a05:6512:104a:b0:553:2f25:3b46 with SMTP id
 2adb3069b0e04-5532f253ba3mr1276388e87.57.1748454089060; Wed, 28 May 2025
 10:41:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250508-tegra210-emc-dt-v2-0-d33dc20a1123@gmail.com>
 <qhhv27thjnbz7rtcfja767bpxjvwa6iivc2bphar7t2wobuzb7@aspkmrgp2ihy>
 <CALHNRZ-q7W9CfeD4ipmwFVqHm7oGfTgJpwNoVhfbSXFPDxF91Q@mail.gmail.com>
 <eba00bd5-fa1a-4cad-bb41-b395011235e1@kernel.org> <CALHNRZ_WPUM8wKSLcyyZm4jc9onBYiP3oLd=39k4=hoqLzHhrA@mail.gmail.com>
 <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy>
In-Reply-To: <ckimvttxjgx44xhfql3nov3qbf35y73nbu3p4m63nqbi22vh37@6p2ji7he5toy>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Wed, 28 May 2025 12:41:17 -0500
X-Gm-Features: AX0GCFuKyPpA45aXd7UQq3W1QhIua69hUEcYfsKQ6H_qYs6KBSfgt3aO4OTvd1Y
Message-ID: <CALHNRZ-r_U+ByS0FWxamv9ozzjBWdkqAh2wJOt3s3cMsX6K_kQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] memory: tegra210-emc: Support Device Tree EMC Tables
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, Rob Herring <robh@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-tegra@vger.kernel.org, devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 7:48=E2=80=AFAM Thierry Reding <thierry.reding@gmail=
.com> wrote:
>
> On Thu, May 08, 2025 at 07:27:52AM -0500, Aaron Kling wrote:
> [...]
> > The devices I'm talking about are not yet end of life, so it is
> > physically possible for them to get a bootloader update to conform to
> > the existing mainline model. But I'm just one guy trying to do 3rd
> > party support for these devices, I can't affect what Nvidia does with
> > the signed bootloader on these devices. I'd love to be able to swap
> > out an open source bootloader on these, but the secure boot setup
> > prevents that.
>
> I've reached out to our Android team internally to see if there's
> anything we can realistically do about this.
>
> Thierry

Thierry, has there been any feedback about this?

Sincerely,
Aaron
