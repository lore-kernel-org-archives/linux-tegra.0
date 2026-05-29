Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59A3E3E0C4C
	for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 14:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780066693; cv=pass; b=YIFwmOtnq3UZ6UfQwjAQYdKhVhhuE8Le6FuOt9mahOMg5rlujrmKqv4QkbItaBuRvCmWaNeljR5GnwW8M5ssC2s6lDkIlCF7D8rmMiNxGANIMojEo0MBG0Qu1JcOXR8a9StW4BpOZmZnH2l8fuuM+jdxoTXGVf80YP7jLCW7Udw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780066693; c=relaxed/simple;
	bh=fQfj+gPmvgEK0Au1fq8tS1UqLUrdEtewMemM1nyumCU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tH5DlRwDRvt7ZzDjBKyAqY52+JXQZvxobV+g34ujyvdeXZQCwIN62+U+DGHybWWqaEjgyT/yreqXXvI8VNwMjXYk2iMIWW/9IAPoS/PUlnLerny2v3oFeOd1fT/M9DiQiGP36QRR9h9hJKXIJmAZXQZZoKkCtLxyXuGU9dgA2Fo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CyWOGUdF; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CyWOGUdF"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1353c2f35cfso7303255c88.1
        for <linux-tegra@vger.kernel.org>; Fri, 29 May 2026 07:58:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780066691; cv=none;
        d=google.com; s=arc-20240605;
        b=UQOMhIww8eUpFWemsFRWXn+lFveA+sdEaXgcMGC0zO8thsC/sDJYtIUei6l9M60vTM
         uVFqs2ELrA0fGGhyVGfwbPQQKETXyFNknk2Zl6RYNUZpprHCrqpF7KCioRJpZW/hym1M
         H7MfXEAQBIbMrfEkdhilR8PaU1LDm0mJCT4pCP9g4igRsXcBi7bvxoGZZudKmNXkuxeS
         6sxLs16vj+2gL+I6PwXxe1yjvI/Hy6uzms6Am7rThMp6NfG2787ybpZtvbZ0jAI+TZam
         dIrcd82JpeYWqofcBP25JXLgLxJ3QiMtQbFmzxLKZ4dACrxc9YY6yq+ta8XQc6LoDVST
         w0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        fh=euno+2j9dKDUMuUS8+35LhuVSMVHEhA2NwLtHMwIDDc=;
        b=XWCXP+j18f7yJc8Lj/D+ofHrf7jtEYvqogyK6fLmFJGVHdDBy8ynHeoqF0pJt2xJAu
         ConQioBjhehro9mb70WcciS2p0kiz3nrx92KhUm+Zg8SVrSQl8kLz2olqinCXvHBJEMh
         iJ2jdrAfStFpR9CtfCEr39j1hH4HsrVCWkDlIkRRRYdNLKlYBzz1wI61lIYhzSxBy/g8
         f0OFTgOGwAmTIcAbxjYOyxSbpCnbQU+MjyBght+qlKih/nxDPcYxFBG031cFyxOwvHqP
         CW6EgrrwqfSGppqzVzmKDmFrOYNENga36l3zrmYZKjPZCKRwzGxD+gSWZCPPXCHQK4a3
         TTGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780066691; x=1780671491; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=CyWOGUdFOn3NrSgpnO5y1zSbbaZfyqNAaxOZW4bX0ecjvX3v4VcoYZkF0IbeMy6elY
         Iqhg40OsDJj+hgkdC8EKY8Y6vP6CK8ddUAREUAyYxCHZge2CYIyd0WWwvUL5D8mmZGdQ
         oWQiOxJIVnUZbKIf3jmgMh8rvYOOIs458YOj8RAQsIgpLCxP5MW3p7GZs+KE+Yyda8h0
         2B5FeG55U7zCz3kmLiTxWuyE1bYjK4WZSRuuj/6+ijuSR50u/WfKLwNddAoUbejBKExi
         I8Rrj0DbemTU8tcIZj//H/XNMQRLCw4V+yhMHZFMrb7PIKPq+0ZH3KPVGdNMp1I0/FG9
         IxWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780066691; x=1780671491;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D0M/NZDH6fcDnv+eyc8PV40uOX6pNFdyudXQwoi/OMA=;
        b=DSgt45KtsbpHsqifkCRZ/e76vKBTYoVPJgwa9Zv364mrZNyxVfCIrshLvkDjREq+DR
         7/vocxFZoTfQf9D2mWnfeKuIEK54wITNWerbQf9ZwCqkwBo5edpVr/m12LZaumphPtmA
         QyKiUiB2mgqt9ZUiumvvcoYMat35su67BQufbvd2mpHuESTCjR3RQNHN2AbDzRP5ql6m
         zIx1/yzH5V93J9p4pNMd7bfCl8DtlKnuap4/lMHhtJsNTTVur3xsggx29Zs61OGOxFPV
         quItYLSMTij0Lhd7dK2JagFKfuzm8PeaptpFZDjsAVb3zVziKqkSewU1rMCk+mu2pZYV
         wS/Q==
X-Forwarded-Encrypted: i=1; AFNElJ9jX8ssDmbEfnRctJJRh7+BWYxMS4bDOOdBkq+p6QMxNiQ0wBrKrzfdRnvlcF2jOb97K0/M+9bZr6VrXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7nrh4qJcUHMnDipqLRP04kh3de71tpvcmf3NYp9LqQJTFNXB
	nJFxcDx7uS95P0eBqW1zOTPqQQV4SQmhnCForMAq3itKvtZEg4VWhqVv/CXpVrdp2w3AO+AInDJ
	R/aoDYKK/mCL9OvV/3w6CPdNO6liRryo=
X-Gm-Gg: Acq92OGNVqgNIEhfHSb/K8EuTiTaTOGF/P/jt33jzH3z8ApveIJ9hS8xVPFF68gzmTh
	FWRc3MgL0IIZhkRHNe6FAfGUgA99fdAaXDbF6zSdDbjgNKZe4MoTDxqwE/oIiRKmYhVlrj1+mMV
	KhMluKdBYOD1j5LXfhjAIu6L+ET3tPXTd/7VW0CZESyg+kqCl8UtOs6/h0RAmZn3+eJt8MHOSEA
	Rf4b86REAxBin5FBpOdkizYJadsHKJfetoJ8z2MB50UCDTe3gUimgDifWliSCEc2eEBbo4Rhbv1
	XZo4nDH9NFhrX8+lkI0=
X-Received: by 2002:a05:7022:49f:b0:136:e42d:2c20 with SMTP id
 a92af1059eb24-137d3f0d89cmr13506c88.16.1780066691402; Fri, 29 May 2026
 07:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260523083013.46372-1-clamor95@gmail.com>
In-Reply-To: <20260523083013.46372-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 29 May 2026 17:57:57 +0300
X-Gm-Features: AVHnY4K-1vYeiXFYk-AlYEtzVzIQXE43sf_M9vxLcJuCUs6YujSLvUbhSvlV1gE
Message-ID: <CAPVz0n3hYU86yGeNS9WqHHPqn6JOPGrTqtSz=afs-SyDgeiKvA@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] usb: chipidea: tegra: Add external control option
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Peter Chen <peter.chen@kernel.org>, Svyatoslav Ryhel <clamor95@gmail.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Peng Fan <peng.fan@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D1=81=D0=B1, 23 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:3=
0 Svyatoslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Patchset adjusts the Tegra-specific portion of the Chipidea USB controlle=
r
> to allow for the disabling of automatic PHY and USB controller
> registration. This is achieved by adding the nvidia,external-control
> property/flag. It does not affect any existing configurations, but it
> allows the USB line to be registered or deregistered by an external
> device =E2=80=94 in this case, the modem.
>
> Since Tegra USB PHY holds clock gating for controller PHY cannot be
> handled by code Chipidea mechanism.
>
> This patchset is a part of larger series aiming to bring XMM6260 modem
> support for Tegra devices:
> https://lore.kernel.org/lkml/20260511135703.62470-1-clamor95@gmail.com/
>
> ---
> Changes in v2:
> - separated Tegra USB into its own schema
> - tegra_usb structure moved into tegra_usb_phy.h
> ---
>
> Svyatoslav Ryhel (4):
>   dt-bindings: usb: Move Tegra-specific Chipidea USB properties into a
>     dedicated schema
>   dt-bindings: usb: chipidea,usb2-tegra: Document
>     nvidia,external-control property
>   usb: chipidea: tegra: Avoid controller/PHY init if bus is externally
>     controlled
>   usb: chipidea: tegra: Expose tegra_usb structure
>
>  .../bindings/usb/chipidea,usb2-tegra.yaml     | 95 +++++++++++++++++++
>  .../devicetree/bindings/usb/ci-hdrc-usb2.yaml | 22 -----
>  drivers/usb/chipidea/ci_hdrc_tegra.c          | 43 ++++-----
>  include/linux/usb/tegra_usb_phy.h             | 15 +++
>  4 files changed, 131 insertions(+), 44 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/usb/chipidea,usb2-t=
egra.yaml
>
> --
> 2.51.0
>

Hello there! There will be no v3. Sorry for disturbing LKML with 15
year old obsolete tech. My mistake.
