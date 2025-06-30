Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67838EADC;
	Mon, 30 Jun 2025 18:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751309325; cv=none; b=LScV4a3z82EWpHNOfTdy2izfHjnGJEDmsKivREjXTADqlA3FH+ntlCFbqAkaFtyUeiOK6g6ABzUwZM5POKFTZwvg8uLx25JgncMb9dAngrabv+TeYCJnL02chAAjfRtsWvUaoPvFYlZkKic+l+sF86hx7OHqbcqJPB+e7AWx1Rw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751309325; c=relaxed/simple;
	bh=ToP/U84M4tPmiRzistciKSynhFiA4hrBw/o/degwK7g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nFAYccJFSy42t5dyvmUmsA9ioyFAvsEsaTpa1usFa1OW7E2/HIEYYnVaKHG4IJ5t14lT4RfroUi6AKnjQQpcO/TMhNO01Za4hmmtbg91y+7Iu+x56eIitkyYAi6+k4r1U/7MWLFsZBQRR6iH+OFOK6JUpM95p4ylou5DvqRHg6g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MddXT27O; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MddXT27O"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-32b435ef653so38842021fa.2;
        Mon, 30 Jun 2025 11:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751309321; x=1751914121; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ToP/U84M4tPmiRzistciKSynhFiA4hrBw/o/degwK7g=;
        b=MddXT27OmOnOx3DzTeZ9km8XvVELU7NjXfcFMnYyQ0ZqgHwJPLOobohPd94QJH/Oqs
         S2lUrpHL9up/QSTN8DkTbhdq0h4TRRuLpdvbYrT7ZldV1mdX7KLRu7cjjvw0tzpy9PSf
         aM7ZZ3mxvsD/pvvdx8y53blMKbIhIJziVB2i7ScxPILJSnvbFE/the66OYY+5pSKWydj
         TMSt2X7CggwdDOvC0DZcWgkgnR3dNCqOpHcHeLNoAlBRZILHFF8mUuzIks57+qJdTu2T
         yoAO/P1O8D97BHAX9qMEnHCYEdptO0drpBoynhwsdIpbq5YdiaSZ22CLrM3lo7elg0BY
         diLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751309321; x=1751914121;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ToP/U84M4tPmiRzistciKSynhFiA4hrBw/o/degwK7g=;
        b=jYaX6AirjhfQaOvX6J7rWAUXnPnWq+KIpH9DL3+tgV5YkCc/O7YmsSHtd/ToIBK+CE
         1zfokxjF1LEmkkp5yQvINZbJGjkWjemYNM+dqp97doPiFt9WgBgKxA29kPhPEOw+/A2u
         nC3iMf25ugB+f8TqgR53n4Icl78qxHn3iQ4+YdW09fwP5G6Sn2fOk1O8oGMDRE8KAU/V
         BLe8MOAis3m7XgUYYS/vwSVbBov90l4FpKW0iHijQDWlu0i96kpo3LxvPAuiEQchPSWc
         ycJ9v5gYGKQYRd+DV5Fu3CJTMvVwOjDuIA5OWEcnowx9RvTYpqGRHI7qsE+qH2oYAf8h
         JUZg==
X-Forwarded-Encrypted: i=1; AJvYcCV/jKK35EhkcgBc906e3dsOcC1TjyV+/lQgAMUxHVAI5U4ykmLBllA95FJt7Ek65RAsO/IBqhSK9R9H@vger.kernel.org, AJvYcCV7IzGYgxw5zi03Vvy125oo6YhVfzkcHVgW4aHVrQLaQOb9dyNIdIK5TA/O7iJ/tiET0TOeFaHmgA25sqM=@vger.kernel.org, AJvYcCVUD/EIrwZ1zBk4VDlljVOBC6MrpFfDGiuNpI09TgTiuvjKItW+gNeZv7TDDxaJD7WHICezA83P5J1nZ6sQ@vger.kernel.org, AJvYcCXA0K06nZKOuRl9gq//v9bW4dy2A3RiWxDyS3a4FCLIoprbsxt305tAdUk/hUL7mSQcCEtxdVD6wK8X83BVnvzB@vger.kernel.org
X-Gm-Message-State: AOJu0YxzXMRiOoeK0BKHVEc5deBRcq2FdE9/Q1V78mzst++aVJTLslem
	jfi07wAQDGJlo/RJBSOE2ZZ25H9CZ14qLlAIFIt5RnniXoR2yRuewpefwu37fQy7C9HC3LaXsuC
	FzfViG5YkucLxH2zOdJqz+ZWerUxfNdU=
X-Gm-Gg: ASbGncupUsR4Lzqi/o3rB/Nh/PaCUN732rDDWx7E+s7uzU+sxGiQFf26S7/tgGM1oeY
	cD7XOcuHcETJ3YLPextgH+d9FAuRmszB316+Sinv0kucR/yeoC+ge++Onx6KfydYbIatN3RL5SU
	93DsduCfdexFykYVdpNSVKCAQEA752Yy6RMOtvkrs8b2s=
X-Google-Smtp-Source: AGHT+IGeczsPvpUHNYJkahdVQPDCiIYak081g4bCvssLiGVVTSMkiKZQZaiM5vZREuWyJm8R1otb6xq3m1Et/b/nWD0=
X-Received: by 2002:a05:6512:696:b0:553:acf9:c430 with SMTP id
 2adb3069b0e04-5550b80f9e4mr5130309e87.17.1751309321208; Mon, 30 Jun 2025
 11:48:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250406-tegra-pstore-v1-1-bf5b57f12293@gmail.com>
 <6920a557-9181-4c9c-98f4-a9be4e796a13@kernel.org> <CALHNRZ--to8B3zhg6zV90siL0x78BAjhS04DgfLwmnXEiOMe3g@mail.gmail.com>
 <83d17d6e-41c2-4729-94e6-5ccf480c766d@kernel.org> <CALHNRZ8+vnXrx7xw=qjpB34MX32hW_m7k+=CdePJpErBPPzv-g@mail.gmail.com>
 <53c943dc-5ea6-456b-a289-08212fc01d5d@kernel.org> <CALHNRZ8+X61YzQ_gYRkuAZrz2XFiZK36GDgk=801+384y2KnOQ@mail.gmail.com>
 <CALHNRZ-YZg3cKzRBMGaxRpejFMLSpOOz-FPQEaQVXFpFao40WA@mail.gmail.com>
 <CALHNRZ-jxC5PXqiG4tNShybaU9gZjTz4YT+VXgfQFNQ-Ox7crg@mail.gmail.com>
 <yczvbwanjadyfife3hnp2khxkgs77pokypqkxotlldjskshskt@xckrkfucg6xx>
 <CALHNRZ--ZUxqrXHEnizXC8ddHC5LFA10oH+CgQmOcTt+cJ1CWw@mail.gmail.com> <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org>
In-Reply-To: <6abdc70c-0def-4cf1-b1f4-ea9bdde4fcb5@kernel.org>
From: Aaron Kling <webgeek1234@gmail.com>
Date: Mon, 30 Jun 2025 13:48:28 -0500
X-Gm-Features: Ac12FXz9GaCxpRqa1IGTzU_rAgEzeMuIknqtBHmq_kTFz8jp4l8ltGiUCm8-kSo
Message-ID: <CALHNRZ8=ikQe4L6h9VHpTGm+OFU0iZA_OV6LUP6jDUySBv4+Lg@mail.gmail.com>
Subject: Re: [PATCH] arm64: tegra: Enable ramoops on Tegra210 and newer
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 3:53=E2=80=AFAM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On 28/05/2025 19:35, Aaron Kling wrote:
> >>>>
> >>>> Friendly reminder to the Tegra maintainers about this question.
> >>>>
> >>> In lieu of a response from the Tegra subsystem maintainers, I can onl=
y
> >>> hazard an assumption, Krzysztof. I presume the pstore carveout is
> >>> bootloader controlled because various stages of the boot stack can
> >>> dynamically allocate memory, and this became bootloader controlled to
> >>> prevent any of those from overwriting pstore. I worry about hardcodin=
g
> >>> an address in the kernel dt, then finding out later that there's an
> >>> in-use configuration that overwrites or corrupts that section of ram
> >>> during boot. What are your thoughts on this? And is there any way for
> >>> this patch to proceed?
> >>
> >> I haven't been able to find anything out about this yet. Generally it'=
s
> >> difficult to get the bootloaders updated for these devices. Tegra194 a=
nd
> >> Tegra234 may be new enough to make an update eventually go into a
> >> release, but for Tegra186 and older, I honestly wouldn't hold my
> >> breath.
> >>
> >> Thierry
> >
> > Krzysztof, based on this response, is there any way or form that the
> > Tegra186 part of this could be submitted? I can drop the newer
> > platforms from this patch if Thierry can get a response to his other
> > reply about how the bootloader could conform.
> >
> I don't NAK it. Eventually it is up to platform maintainer if they
> accept known DTC warnings.
>
> Best regards,
> Krzysztof

If the decision is up the the tegra maintainers, then Thierry, what's
your thoughts now? What is in this patch should be compatible with
existing l4t and android bootloaders. But it does add a few new dtb
check lines.

Aaron
