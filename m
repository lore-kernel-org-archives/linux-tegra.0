Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7BA5407595
	for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 08:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778834403; cv=pass; b=U3fW8hwut9HAb0Kh09H5IcHG1/gFX91Npael8RZJKOuH8mi8a4HWJsRQRoVY7CP4yzN9jas2iwpQFAbcYKhI+p2Q4Hx4B4W5XE1RV34+HCMoKfe6Ltqf5aMf56z256VWynli8lkh4HV51Hz1gnPyZWqiQ9QpoEsj2VpWP2eEelY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778834403; c=relaxed/simple;
	bh=1lcRrzpWt3IYTyxqjcwZ50t5ZeMwNrUNQTJrko/WnXY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PqdBn6sqVDFVBrt91OaUlij8cX5tkTswO+sTIigGdHRsbkpVDjs0ZHJLJL3za9IEDyriIBakM61q3jquOYNpJMyNE9xuguFIw7Oq1NpXwgbGnSga7kaHmcJNC3XD+FQpbPrUXgmSeKow4B+xxMDK4Vaz3uO6yGTUpEksIQPnE8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=is7nxtqS; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="is7nxtqS"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-2ee990e8597so15189388eec.1
        for <linux-tegra@vger.kernel.org>; Fri, 15 May 2026 01:40:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778834401; cv=none;
        d=google.com; s=arc-20240605;
        b=eaX/1d38c5uxQKEfpgXKpIdNEc2yPDu8nkjD8cDFeBeCaRZ0NpWd2KJWZYbNfWBCBP
         n1RVmj3kppTm7Luk8gVpY+otkMD9R5zrI+XufjyYnq4Cmg0gXeyZN4J8THYyOFFqbWV+
         L62Xso68Ep2ZZ7zE4Qmlyzj4t5Ltrhheyv3NeYMp9LJbgOw5aYQPdTSOFV3cTkR7KVMH
         znuluWXTwS3Fyl4Gh6dPoWp0YLVV15tTsmWUkdQfl7WpsQxwN2XtZhR7q6AOMq0889cC
         Kt68QHVRY9ftIFFHWI0kVFFc4JyLlNvPkylxXskUKhFbP68j0OnR0k4KOAeP5CzDMhIb
         W1vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        fh=vP9AL+lbKq9KGM6/dNaBI4/Z+OQBICYG3+Cu2C3QbZA=;
        b=hLbBDLLQl53uOnhJOde3XMAO2/t+HCSXx+5626NXRz7xoTGavDgjmZmdhpMMZ7PyHM
         y51BwTxLKhfpXpcJXsX0wHe4tbRNKA1F8M29w7O/O0zNh7SE3y+80vQw5L7kwZuah7O9
         ucXpB5b4UUDaf14hjXKwoZwoXgn8imskgHdZCYXaXFl+9qvJQ9P9gQ8dKC5aIVcyIBW7
         20ELrOZ/YOQPYPxjrJ05xC2aQErPcnlGfOnwRlNSJjeRYWY2XyiAQW0cMUrUqUzEuFmL
         oypojMy6TCoxum/VoAjY8vBfnOZNSy1zmFe4+y7J7e5E+rscbaCL9YFaWwM6KReMYSUP
         VsWA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778834401; x=1779439201; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=is7nxtqSJzzSE1pIDEQia6X3GSzhFzuBSbS/XUZb/kHd9ERKtuHxKogbrcbJ5GUkNb
         27AYr1G27EkQ/WlQHWkPcWk2sgv7RHeoHkgM+jgiesZPmndMf74tJLUystiYEsPOZzKD
         qrwZhTSICUW9/gXkg6p1bOgYxNGHV92nIorQQcCQWMBs1/nZhbrAiTrh2aNY+vM1rw6G
         h8t0tOp3nMEY5qcXy1+28v2lA+/X2h4SOFTWUc0ML8oTxj5RFr4AOr6hkQDAXy9a4xgo
         B2GTvjziYm5MskgdWfnkp8O3gC+dXWdS72lkrkG0+s+MeyOr1XEWdqzofVqak63doJda
         qAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778834401; x=1779439201;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V9o04x0HaWnrCGllcDop+2XHXFTs0K8A0nGkD2mPC7Y=;
        b=dKJtw3KUZhUp4DIsRmVfQvP2/mNy90quEdZUPQdiV7BPZOfVqlJ/ypBk+NAFeF+JM6
         C+DuVja7HA78xjA7e5LdiWSADrkTNKy2ZaZyyoX4HMA2t6MyK/DpgfOfqaEXKGo/sTWg
         EeFMJPRJZycPEARle1OX9HVTBNBPmfh/9+OXFOxACFLaJhPEaCJLUJMkF4OF2ZjTTcmT
         hAjM8D0dfOjeTBxrXJ/cqgL891tFqtl2ZYuy70ivFSysWkfpFHZvpIJybLs1WKAv/iJR
         Afuot43+8UchmN5naVoLG+TXXG0aiqCXRIC+OgnYWsgzxyJn9AFT32AKefbep72vZPoH
         OV6g==
X-Forwarded-Encrypted: i=1; AFNElJ9CRKa2mJqFDsBasyLkJQ+GePzYcGoI22Y7R+L6n2ELRG0m2B0G9rhidhpl2ivp5eUA2k3yW+SkjFuWFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwGO2qXvGVWJclAPIb/eOtldz5n9J/ejKD/iE9c/Ip+CwdieFDL
	spFXrdLSSez+HHFSXHg8sMb15Vig8OAHHxdCxVnzo5GdDOfv1h1TKhpQ7QZzWK9LgZk0pamndfn
	tH33av77IR7lOtqsR81q3shjsQe3Fkyg=
X-Gm-Gg: Acq92OEA5orotzQJ+ORbVzz1LO91/xvnq9DTEiAiHKEDmANmFW1i36tkWz5Q11foe8r
	1luObTdOfa0QwsRi2LxZ4hMXANYqWUDOUL8P6pTgZNHq5ppPkvEUe1UwmhnwpOSdso+vH+s+RYE
	JHv2fs88Vv9z3He3sURAMtrH2HHBaiKMQForYL/ihtELGmPtWyWtO/X7QfrkclHJGi4w7foggSq
	7AEjjWfMrzrA3L0QPvnehXxlD7ZGZtbz82Xg2/+/O4A4czisiydCfv8Vm1FsXqhiewzToq57xY+
	Yj+rrljeopOntIlFTlY=
X-Received: by 2002:a05:7300:a504:b0:2e5:8ec2:82c9 with SMTP id
 5a478bee46e88-303986a15f3mr1535796eec.26.1778834400799; Fri, 15 May 2026
 01:40:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260511135703.62470-1-clamor95@gmail.com> <20260511135703.62470-4-clamor95@gmail.com>
 <20260515-precious-ginger-lori-d1fde7@quoll>
In-Reply-To: <20260515-precious-ginger-lori-d1fde7@quoll>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Fri, 15 May 2026 11:39:49 +0300
X-Gm-Features: AVHnY4LhmWA2BwD0V1_j_6xstdiR56JxjkYZue9zoJ3Q1jLukX8MObrLmKvfP2I
Message-ID: <CAPVz0n3mvBLracMWGNuJ8kKUvAVZ+JRTJVkZGyq5MkuSobd8NQ@mail.gmail.com>
Subject: Re: [PATCH v1 3/6] dt-bindings: net: Document Infineon/Intel XMM6260 modem
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, 
	netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org, 
	linux-tegra@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 15 =D1=82=D1=80=D0=B0=D0=B2. 2026=E2=80=AF=D1=80. =D0=BE 11:1=
8 Krzysztof Kozlowski <krzk@kernel.org> =D0=BF=D0=B8=D1=88=D0=B5:
>
> On Mon, May 11, 2026 at 04:56:58PM +0300, Svyatoslav Ryhel wrote:
> > +  ap-wake-gpios:
> > +    description: GPIO connected to the EINT3 pin
> > +    maxItems: 1
> > +
> > +  cp-wake-gpios:
> > +    description: GPIO connected to the EINT2 pin
> > +    maxItems: 1
> > +
> > +  phys:
> > +    maxItems: 1
> > +
> > +  vbat-supply:
> > +    description: Supply connected to the VBAT lines.
>
> This should be rather name of the pin on this device, not the provider
> name. VBAT suggests the latter. Please double check.
>

There is no documentation on this device from Infineon, I have used
schematics of the P895 where this modem is used. According to it power
supply is connected to pin with name VBAT (and yes, I am not mixing it
up since supplies have different names)

> Rest looks fine, with respect to Sashiko comment on description:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
>
> Best regards,
> Krzysztof
>
