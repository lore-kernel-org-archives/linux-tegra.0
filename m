Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2DD83DB326
	for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789975735; cv=pass; b=oOvQUj/GvzxRYpPO2Z0r9ZaxRMbGD9KypX96vdowxYOAEek/zY3+4xf6IJG6hCPhatgsoKqDgh59sMm/VS08mN1XLklyYJrQbkenE5ZYJWD+XNEEqRn5KwddR59OGyA1mw9f+yGkdJK6rHSx2pDpdoFHztRxaSRQbV8YCVKdKI8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789975735; c=relaxed/simple;
	bh=lxo3rItzOI5E9MqNdGIwnwpWKqkISYML5yv6YHZcizc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UYC85qlnhaWC+Zgt//8l7CFeECfjk2vzVtJaats0B35NVJnjOfSNGvyOl4vtQpOyP8MmcdeRMWWsyGOq8rHLin+ejj/NNiw5w3Q6FAa8PQIfGJPUh+9i8rsJM8AKqcs6xjp/cULZ0gY9mk7UPk+A/lSI9+8/ycVoew1EuJw5qVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BPK8/FO4; arc=pass smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BPK8/FO4"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc1cea50dc1so1538718a12.0
        for <linux-tegra@vger.kernel.org>; Mon, 21 Sep 2026 00:28:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789975730; cv=none;
        d=google.com; s=arc-20260327;
        b=D2x5KMi6jIqGch5b1MAxOvRiLwkE8Twfk0/kpzcqmy+6nsyaj2+U0LHZG9pzL8c8Jj
         oK16I7BG1oAFkTZuNHM3qu1aRBn3YaTgtyh/9c/EIOK6i1ZSzsXGIIBZmfznpicIeJ+h
         Z0F7xsw3Q7V7YQAcTaq0WFH6yfcMJCdorN3ai7HnDI/iSGzjKVxVS21Ivg4vFbAC067X
         9e930jovVwe6EC8xXf4+kY/ud0TZH6ICN6WuhbGTtxciOJzdxYWqTTR7Qjum8eCZTn8J
         VPds7/DNDjefM8EP5j7DV+54I/oTv4ajdHaBxgKsn6clSXD0AvUPQFsNebyl/9U8hOhK
         bGvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        fh=3t/acnUaSaULu3+ejkliw0u6Syrj42EqDlDHVsXRpqI=;
        b=EzpVLjq2zyOYp+60s/xpnYvMp+T8vbTCvaBAwBVeyLi8mM0DBnqkP7SP1cYh45Fhsw
         VALiHzHF1zsyYazUf1zH4KFzHxYveqqtg37QWyRJx5dgXByUd/o9+9sycJ07sol9UTf8
         ducSIoq9FhdcB9W0wu+ojYlyea+8d57eGKOdCpCwEJq3Th7ODhL7zoyhuY1Iq8w3qVCT
         Itpg4btNe5DJKvaaZk79idFda/1veJBGq2/zDhSvlVB8IIcRM0wEnYJahRQcomNOTa09
         qN68lnOMu+OFIDYB4uIVcDBMau5O8JH8Hpoudz1ZYTQ2h9NI/+TTpqbgcBEjhTQFiW43
         IBgA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789975730; x=1790580530; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=BPK8/FO4MZk8LnmE3C0zsRMjRZqsdw9FI0zUn8r7RNGdnKb8QXCR0SKb6oDI7lAhVP
         m9qZlWhIUIonYT5m76UqY1uDUOLanucx1YBHwsRlm4XGCwief3ZJdpiTTKqo7TKhXNV4
         K2jsXoDnXpe7PSO//bYlC7kIframl4HaW69jsN+ZUy64hEPs+PRo7TIduLimrD9ZotFT
         o9UpH0mmaaJMZT2p06Yowyf9oOQkZHSbRbIPTCgJR+VT4NS89+xVr9ius11hEbIRgyp+
         zOvA3IbebjUViAfJxgkVzNd12W7Lp7a7i75bwlVfVS5BuI66X9kmYCA2civlJw6KE4st
         KR1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789975730; x=1790580530;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A6cNT/xOU7D+9cHzOo3kYyxs0BX7F75Svm7QKlu1XOQ=;
        b=ApsfrUaYd6UUJ8rfyG7D/mlnEMbBnMN+G2Igcr1tCIhPDvc3sLi39Uefc/S/7J7QYS
         wBkyDTta+MLpdTX5jhnzOZ0P0ieG7zWRLGQr+4ROTDWypVDjia9j9D6Nx9QMq0WpDsuX
         fB4gpFRnQWXch7taxVwOaoMlaypgr9gzkAjy9LdLOKBsm4k5Q7Wufiur4FfPFxLe3oBe
         1APDVnH+shcSwd7verN4MttkTEXCDdbQA5VpuayDtjOM4YX4hWtAMg6/bqLqo6lcdKTg
         0LjprtSRC6H387HuCT+Vxw6ZnaYUcePa2V97sd223P4EY5ZpzFIdylQTIUkTUrf0ULxt
         EF5w==
X-Forwarded-Encrypted: i=1; AKwUvBwtMDPnw158XpKwy/j3/2UyrjfiTqzfnPgdPw7Zs/QMb+84Rl8iLHjBnnH0rTltmhLy6TdqlXg0Ssf/Ag==@vger.kernel.org
X-Gm-Message-State: AFuF++nYYpnM/wDtn1hdiB+x9maQjXWiSuFmCTs6tN/z5Zm5s03iUMxY
	xat/v9/7ItYG/HIfGtM/+MUxd8ofMYcvmy98nMJALo5TV1gLuHN8trIRt+jtkmYaYuWCJLojHOL
	peh5QNnGsXCqQonnOS+HU1GGlaM+iCsg=
X-Gm-Gg: AYBFou1onjy84EE3lu2zE++WeC5ZYoY7szVwDzML/RpYmQ9etwac2N7FEz5YT34KSaW
	w4rzbpjK1/fsJOeUuxWHYtHIiAbUlmQrkE+YBkWCgIP63PaPuDqdDErsAv8oPxwjq7+kSooyCB5
	QSw5qye2LKm3C/PJuHp/DsVrQfo6lvIFD+HgcgXPlhYnWVxypKieETwczFPf657oAhlWGQ0UqGa
	YYgHzwFiwIjf/tgO8kr8sRZPpjbA82s/cU3nnQaoDZnHlHzie35zh7QOs39rgSa7nnYXngcmTOP
	RmQ3iA9XAI5kov+R95zFoO8Z0of24URj9J06VXvg4YomfP4w0BwulgT8OJgR5CG1APmPO+iEvJD
	d65w2p5toqV0q
X-Received: by 2002:a17:90b:4c4c:b0:39e:4c7f:7307 with SMTP id
 98e67ed59e1d1-39e5506f80fmr15344793a91.30.1789975730612; Mon, 21 Sep 2026
 00:28:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260731114106.169398-1-clamor95@gmail.com>
In-Reply-To: <20260731114106.169398-1-clamor95@gmail.com>
From: Svyatoslav Ryhel <clamor95@gmail.com>
Date: Mon, 21 Sep 2026 10:28:39 +0300
X-Gm-Features: AcwNN1WIubtOA2Pf-MJxcDjvG4Mtn46SZcjDO-qZ5S8wuOcCU4q_uN3xE35GGCo
Message-ID: <CAPVz0n0jQCLjBPbJcmJLgW7MAjS9pCZUpVv-aMFp768Dqewm_A@mail.gmail.com>
Subject: Re: [PATCH v3 00/10] ARM: tegra: tf701t: Add new features
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Mikko Perttunen <mperttunen@nvidia.com>, Svyatoslav Ryhel <clamor95@gmail.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

=D0=BF=D1=82, 31 =D0=BB=D0=B8=D0=BF. 2026=E2=80=AF=D1=80. =D0=BE 14:41 Svya=
toslav Ryhel <clamor95@gmail.com> =D0=BF=D0=B8=D1=88=D0=B5:
>
> Add new features recently merged like CPU DFLL, MC and EMC timins
> along with fixing some existing issues.
>
> ---
> Changes in v2:
> - removed vdd-cpu-supply from CPU node
> - fixed typo in thermal nodes
> - adjusted MMC flags
> - improvements of commit descriptions
>
> Changes in v3:
> - expanded commit description for BCM43341 related commit
> - added Mikko's reviewed by
> ---
>
> Svyatoslav Ryhel (10):
>   ARM: tegra: tf701t: Configure CPU DFLL clock node
>   ARM: tegra: tf701t: Add core-supply to PMC node
>   ARM: tegra: tf701t: Add MC and EMC timing nodes
>   ARM: tegra: tf701t: Remove pin_ prefix from PMIC pinmux
>   ARM: tegra: tf701t: Add thermal zones for nct1008 sensor
>   ARM: tegra: tf701t: Tune MMC devices
>   ARM: tegra: tf701t: Fix BCM43341 WiFi/BT chip configuration
>   ARM: tegra: tf701t: Complete power sensor node
>   ARM: tegra: tf701t: Configure UART-B line used for GPS
>   ARM: tegra: tf701t: Add chosen node
>
>  .../boot/dts/nvidia/tegra114-asus-tf701t.dts  | 885 +++++++++++++++++-
>  1 file changed, 848 insertions(+), 37 deletions(-)
>
> --
> 2.53.0
>

Hello Thierry!

May you please pick this series if you are fine with it? Thank you.

Best regards,
Svyatoslav R.
