Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B8E49551D;
	Wed, 23 Sep 2026 15:19:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790176745; cv=none; b=WT4/IEXCnxVVMK1L3vqghyLJmjCv8ZA+JrjmFYFYBV0/ZvkEx9m+GaUI8H/okcYJruhkzpvzqrufkqFlymKRwzJZRjQLe5SBBdLNStH9vzt/gTQge0N/5mq6fNPu7ukcGMAoP2XgjCOhTZT75aM7e1rkI1r748sRL6HB+yutF2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790176745; c=relaxed/simple;
	bh=PKx41dZ0+EbMSj1CGMXu5FUR2IPWf+QeNIdPCevnSTs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=VHgR04hnxyJCDc3IgVOkIDbWg8iwi4b7MatGv3ak4hDm2nBVpObG4au0mpDP1ERt1zYG29vAQtlW05NECPhwlJTeCEFYS7B8l6xOuiPZmIouyc4L6bLOQOfETD6Un/2vsk3YYaaq0W2aFrFjDAr0FLNhgCJ5S2fpU78yIFNBjsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MXLjPFTU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MXLjPFTU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 388881F000FF;
	Wed, 23 Sep 2026 15:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790176744;
	bh=6CepSRCAbKIjXTMP6C8ytWdH906y7T3tD7VVl/5d7Y0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=MXLjPFTUK7B8QalXpCasymY/1E7W0+Tk5SrpUduuDzDte8u4sELX3BKE41I5n1NNt
	 HUQ632XGt+B7Kt6fhVWaD73om33kEsKcENi+vgdmofupI15Sw8HbRBwlBkMh5cM9vh
	 3pLXm9qlzZ2/rf3C+EsQkwXW6Dep33iDOdq8bkR4NuObU3D2a/LU0/hoaTFS9/3Xr2
	 TCtWQzgHcjECnxIn6e5n+q1/+ApgHrJQU6qc25JZWcOYQ9Zv7K6ezR+wVB+d17PbQj
	 vXm0QcHztauWGxbVgyipESxOoQEgS+DPSCmGotwXxZjCCf7AQxUAXwe1Zqm7YcXwdH
	 WO/UYFmYo5hog==
From: Lee Jones <lee@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@avionic-design.de>, 
 Lee Jones <lee@kernel.org>, Shree Ramamoorthy <s-ramamoorthy@ti.com>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>, 
 Svyatoslav Ryhel <clamor95@gmail.com>, 
 Laxman Dewangan <ldewangan@nvidia.com>, 
 Bhargav Joshi <j.bhargav.u@gmail.com>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 goledhruva@gmail.com, m-chawdhry@ti.com, daniel.baluta@gmail.com, 
 simona.toaca@nxp.com, mfd@lists.linux.dev, 
 Thierry Reding <treding@nvidia.com>, linux-tegra@vger.kernel.org
In-Reply-To: <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
References: <20260919-ti-tps6586x-v3-1-63dd240f4684@gmail.com>
Subject: Re: (subset) [PATCH v3 1/4] dt-bindings: mfd: ti,tps65910: Add
 wakeup-source and GPIO hogs
Message-Id: <179017673997.4161889.6046857782031846355.b4-ty@b4>
Date: Wed, 23 Sep 2026 16:18:59 +0100
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev-ad80c

On Sat, 19 Sep 2026 02:31:22 +0530, Bhargav Joshi wrote:
> Device tree validation throws warnings for the TPS65911 PMIC on Tegra
> boards because wakeup-source and GPIO hog nodes are not documented in
> the schema, even though the hardware supports them.
> 
> Add wakeup-source property and allow child nodes that match the "-hog"
> pattern.
> 
> [...]

Applied, thanks!

[1/4] dt-bindings: mfd: ti,tps65910: Add wakeup-source and GPIO hogs
      commit: 6d39f6cc5ae3a84bccc9acf11ef71e7219c3d35e

--
Lee Jones [李琼斯]

