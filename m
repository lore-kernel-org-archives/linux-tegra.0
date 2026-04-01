Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC7F0372B4B
	for <linux-tegra@vger.kernel.org>; Wed,  1 Apr 2026 10:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775038028; cv=pass; b=FHQIZOKRxEyXx0xLi40RLz+mxaj6ZLotzqCiT0cgp9ys5v2dPD231uuUqqSIMw5O5qJaJi5jaTsWy18NWd7aTjMH98hIk1t+ORh9NfvEE/wXd1o6GFdvthrpcFZfZjV5O8IBSYq8H3Xk4hlVP7yoRQYnLxBaILDbJrP7tb0rEU8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775038028; c=relaxed/simple;
	bh=GuAGy0BwVa+KlDpElYaX1b2UqkrYg6svMWho463ATIc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gKxF8nRdiYY/1QfDMirU12r623vjToavY3yVvnCsjtiUrwsN6Dz6DNZ6MzS+L02zFAMljp6IBQ515vTCqretWRJFB9T1cfYbVmjxeD7DgQK074tJoAacu3rAHKVOY74aEBlFUbRzsXihJ+NghOWNA4Lu257xab/xLz3AGTOv6L8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FkvFSCsD; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FkvFSCsD"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2c87871133dso1656864eec.0
        for <linux-tegra@vger.kernel.org>; Wed, 01 Apr 2026 03:07:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775038023; cv=none;
        d=google.com; s=arc-20240605;
        b=Y721sJpkUunldNqzFUNzSHI8+YjoTR/CyhvvW+HrnXD34v9oqkwumSJUYef0gVdhpl
         5H2pPwO9a9WHRikFn9EAD1rrIDLcK+34K/6d7U7VHNohtk8T6dBWx1YwLOLZDK4hCmuN
         VRDu5jmlMoHRwefmOBmc8LTpRWC/3lsYMe8qjGyGOoYS5SniOhetSPxo+UvQkTC7rPZu
         z5ewZyyi6kbeLnaY2xqeQdGN2El2X8cKFSHOYEDWE86HOvoHVPD4UIrpEpyu7B37qIWV
         /6efVXh3o8SG7hYjhN7Ij8rRMQ19AtkhiCt2Un3RIpqEHJ6J1Wip6ntDZ6H3a52dD4i2
         7i9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=sgo3rYYgI3Q6g7deAMcHP7eT6JeZriCPTcT7GLi0w/Y=;
        fh=A/MhH7D94x7l7yLLw+Bof3KT4R1XJhfUB0uQwsT1ofM=;
        b=KG4/wocrsCKj7gJtm1GOH9BADzXuxTB7O4YrQaZr0eKamdr0J4Sn9sl4+ouRiLqfbR
         Qoqr/5Pry2TfxF2BYrV2LSXsL+4966t01AvFj6fjUe+zgrA1N8uOhlULf4h2/chDVz4z
         v4CjxwNXx2Fj016mGYpivlF1sqIHMfbVRiegaFcPbEV3RdMAPFHa62lFHQ70ecc47hAU
         P1B6UGkowuAzPhXnPJpODiPfy/XB3+W0L4MQkk2j9L6gq14ewCiGjwoCLWM+5etCocNE
         Hs2Zv+oG/MnKvbY1gXStw51GyesU79Yo3foP4/bsomKmXfOLSAcmBRbR2RRSxXIBVVz7
         Is1g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775038023; x=1775642823; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=sgo3rYYgI3Q6g7deAMcHP7eT6JeZriCPTcT7GLi0w/Y=;
        b=FkvFSCsDVLG/4KiDX2JcOIlm97nJtxRD2LPmociOXz/PqHkPr60xdyeKN0kC6hTRwN
         rYoeCkJcazRdF6bmalQKhKvznzhkSc/Ek2+ZiXTg8ciR4LT9pSCh4H+RV7kRRyzuWrHa
         zdWWCNAKz8en+VWn+LlsJ2CbjrYucA4Q0bqaO0AyfPdriWpiGYMZVVGOK5KqhoV0pQbS
         gxexKhayRsP717qgGUBmaePIRs+E2hbGZqs4/WzqQ+WLO0QAghyU5wv0wJpxlQRdRkFC
         4qbxmuUF8c6/Ni9w/jFG2LoZ6edjlsoNiboqdfqlReODxaYcplTNVUkUI65/ZuDvXdsX
         U78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775038023; x=1775642823;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sgo3rYYgI3Q6g7deAMcHP7eT6JeZriCPTcT7GLi0w/Y=;
        b=irulLDmk1El698wsiBM6SYS3cH1OTgpVTiVgdDcfPgo1HmXlB/FnIz/6G86lgI1c8g
         RQTvWnB8m1tUP0QQJEXUPGMZrwPy1H8urfYasxSiIFEK38axZ4FxSzGcDLquc6rgdZjL
         k8rszRv9rJSG2G7fYHPf1FLNcAboqmCiCxqtQAgJBGhPH+zHeryi0TtDYmeW9Rolj4tS
         O0l6SxjzRTKmvCXfk4RzWymupL1YflTvA+aPPeIUzCKFTymrRNdmp/vep1GUQihNmn77
         DbKvoqD/AYaygjcFFeqFEL6qPMXOdYhP7Ueohyjt9f4vWX4W6HfWwVcT2rvjfcd3X/qZ
         zvAA==
X-Forwarded-Encrypted: i=1; AJvYcCV8zTj+18dUqktakc748j5JnRFEMJCPI83/tcRxOSMq5cSIniF28SLMPh6BZ3/83/TarM9WheeQUMxqMA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwiOjrGDXoEghwPkUety1gklyic56lCtw06efe8Cf+r7/h8mGGf
	qO9mFWiSK9YSxJwtxhl5h794eamRUuYm13Kimr8U5vU6Oygzzoo5MQ7WK7Wod4y5R4t/xEbrnZA
	mZX8rZ1ON1zlPSRprp5Z89tehoS1k838=
X-Gm-Gg: ATEYQzxNWPEaZcjEbE3qjP8m1VaBZibxxT2eSfpEmjxHWOq7enhaplKAtHkJj6ttlov
	cdxwxSh4G62taf4pQQdawNs4ZNg/LchRXAmKWUR8ZA/SOx6wQIevxTsk488xJq5zkOxEoMa/Fga
	VRVDHYOIA0i0nxODDON4D1RtWOwwSa7+PsMaz2REM6vXSzI661e/Shx015l1l1hzTZ7OWNI5zXJ
	sk5dGRsf6X0eifr904W+hEZ98a5W6M+XMBk6vOJIgwFVc6a6sDXz06uRuflZn8xxfNEKzvr8u7+
	OkBlZJF/5vEw9L7Fh1hcqgHF1OutiiFSg61jT2/+hRL1Z/UsALtjSq3J2AdBqQ1uSxG5NpdDQ41
	6XrRogs2KDrPcFQTXy+seRzo6Aa9EKM8g7eopEGyY9g0Zxg048+Ly7TLpZwZH3joSNuxLNKpZUY
	7XDj+e1fiPIIEW1I0e6hw=
X-Received: by 2002:a05:7301:4591:b0:2c8:8e74:4eca with SMTP id
 5a478bee46e88-2c9320c06d4mr1454568eec.19.1775038022452; Wed, 01 Apr 2026
 03:07:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331161758.909578033@linuxfoundation.org> <aa4dcd03-8c65-47c0-9c0d-9fc3d3b69a1b@drhqmail202.nvidia.com>
In-Reply-To: <aa4dcd03-8c65-47c0-9c0d-9fc3d3b69a1b@drhqmail202.nvidia.com>
From: Luna Jernberg <droidbittin@gmail.com>
Date: Wed, 1 Apr 2026 12:06:49 +0200
X-Gm-Features: AQROBzBovxZAlwV3ssxnPNvdOJXfETlbAjvvU5Zlw19y2SgZgm7CgvUGd1JeuNU
Message-ID: <CADo9pHhKnfU2s8oPvM+odjxk5FK4YifBgLxPAjAekOQU9j4Avg@mail.gmail.com>
Subject: Re: [PATCH 6.19 000/342] 6.19.11-rc1 review
To: Jon Hunter <jonathanh@nvidia.com>, Luna Jernberg <droidbittin@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, patches@lists.linux.dev, 
	linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, 
	akpm@linux-foundation.org, linux@roeck-us.net, shuah@kernel.org, 
	patches@kernelci.org, lkft-triage@lists.linaro.org, pavel@nabladev.com, 
	f.fainelli@gmail.com, sudipm.mukherjee@gmail.com, rwarsow@gmx.de, 
	conor@kernel.org, hargar@microsoft.com, broonie@kernel.org, achill@achill.org, 
	sr@sladewatkins.com, linux-tegra@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Tested-by: Luna Jernberg <droidbittin@gmail.com>

AMD Ryzen 5 5600 6-Core Processor:
https://www.inet.se/produkt/5304697/amd-ryzen-5-5600-3-5-ghz-35mb on a
https://www.gigabyte.com/Motherboard/B550-AORUS-ELITE-V2-rev-12
https://www.inet.se/produkt/1903406/gigabyte-b550-aorus-elite-v2
motherboard :)

running Arch Linux with the testing repos enabled:
https://archlinux.org/ https://archboot.com/
https://wiki.archlinux.org/title/Arch_Testing_Team

Den ons 1 apr. 2026 kl 11:25 skrev Jon Hunter <jonathanh@nvidia.com>:
>
> On Tue, 31 Mar 2026 18:17:13 +0200, Greg Kroah-Hartman wrote:
> > This is the start of the stable review cycle for the 6.19.11 release.
> > There are 342 patches in this series, all will be posted as a response
> > to this one.  If anyone has any issues with these being applied, please
> > let me know.
> >
> > Responses should be made by Thu, 02 Apr 2026 16:16:56 +0000.
> > Anything received after that time might be too late.
> >
> > The whole patch series can be found in one patch at:
> >       https://www.kernel.org/pub/linux/kernel/v6.x/stable-review/patch-6.19.11-rc1.gz
> > or in the git tree and branch at:
> >       git://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable-rc.git linux-6.19.y
> > and the diffstat can be found below.
> >
> > thanks,
> >
> > greg k-h
>
> All tests passing for Tegra ...
>
> Test results for stable-v6.19:
>     11 builds:  11 pass, 0 fail
>     28 boots:   28 pass, 0 fail
>     133 tests:  133 pass, 0 fail
>
> Linux version:  6.19.11-rc1-g411f8a553ae8
> Boards tested:  tegra124-jetson-tk1, tegra186-p2771-0000,
>                 tegra186-p3509-0000+p3636-0001, tegra194-p2972-0000,
>                 tegra194-p3509-0000+p3668-0000, tegra20-ventana,
>                 tegra210-p2371-2180, tegra210-p3450-0000,
>                 tegra234-p3737-0000+p3701-0000,
>                 tegra234-p3768-0000+p3767-0005, tegra30-cardhu-a04
>
> Tested-by: Jon Hunter <jonathanh@nvidia.com>
>
> Jon
>
