Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73FBE26771B
	for <linux-tegra@vger.kernel.org>; Mon,  5 May 2025 16:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746463708; cv=none; b=Uo9sf0cQxB620oWdYKDbTOl1VDIsHfS2drOe2Z0nTv6VDW6VaECG0HOuRJowJE9MLelbEOc2k6FrYndtRD9cUj2304mCHT6M5C+t6Sj8AOwS1piiAeqK7qtiI8nPfsOEj41LNh3AYdzWBRCJW59dkofmEnchREomanwqqURv45o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746463708; c=relaxed/simple;
	bh=d/w1uLpQ2W4vbRq5UhqvNe4JuFB6ZDEyYHk1OIfpEqY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MtjpaNjdeyMVc8JXw5Uzcdtc7GoVhhSF1E7CUqiJLPGVS3adPSGvP/O6TROfgeeOP1WYLBGrgWvzMgGJ81frzkhQ3Pj5SHhIEeQWp2zITc1CEdSdQcK0zSf4ppwX8oUSHiObwG1hKUt5rob+v0vZhg65589OQGnyXOSoXgtlxEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NUJEhyGQ; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NUJEhyGQ"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736c1138ae5so4711189b3a.3
        for <linux-tegra@vger.kernel.org>; Mon, 05 May 2025 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746463706; x=1747068506; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=jydswAFnXteQh1UU3QGXjNU3hWHc6hixoWxuLW3YU+Y=;
        b=NUJEhyGQBBoePJ8nFckLgad904tYAh3yKDPsPTjUVd7f+2IG/RTgFLpWf01/Lu2sSk
         OvC5dDjpFceIvjDNgSA31UgRinUaTWl74wdX/Ig/KvvYnADX0jdruzMKVDSFvCjt0e90
         UNv4LGj4zzL+glt3gycV/6xZm8uckjhkNc/+jP1vDbzNnQpgwnH8VTXOfweT/RjFqxFq
         9iCy6IwDcRJbMOQOzRgySHr7GpseVsvcJWfQhB8wkbam3RNEVqQRX+CuYb1fZGdSDC2S
         ZMGraRdSW7WvX4AJfETAY1Q5E2vErRqZZnPILThE29oSZJ0bt1C1SLpnLI5e510qQkIx
         VYGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746463706; x=1747068506;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jydswAFnXteQh1UU3QGXjNU3hWHc6hixoWxuLW3YU+Y=;
        b=wiHP37xoxzmSZuUSdjtVu6c7Bv5GhtvFm40DgdexJt1cLcHlt+EO8VqKknOR/pXfSY
         6UJHrNTl61Zo9wTpSX3kiwJBe2b6r+x/2gTzoj9CsUIAFcrIvYjZw52o4d8jnwofLOn3
         kKdVbzo++4Cjlb5sO+D5YLfaDonNY550puM2DreLiB9T3WjiOp+TuzTAy5MOxBN2woM8
         v0OCM/4Nl3FKT1RBcz3C57UnrG1/zu+Oaa/nRPO8rYAXwFg5ijw4N0JOzkGO+mj1fM2d
         QJSM/AuHjy9vB2eUrfjKJd+DfNLb1WpnEQHVPUF2ym3jEs05QjoieVhcziTxQsth44Sl
         c2pw==
X-Forwarded-Encrypted: i=1; AJvYcCUZPsA+hH8+OhH6QVmHDFdqURvSYsw0Ik3k+/gWKvoHUvnO/VX2hQ1XAvkz52cUpMNYtaau55XDpqHjGA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxSAlg2fQRkfCL+cPQV2U5jJeKn/bAyycmhzm5Zz2cGtwK1rBFz
	y5MRB5ZJzPazb9PSupBX+xuDZ+3xRuCzgLrC8ntiwI2cgCMDSYZQdt9UbAW7tw==
X-Gm-Gg: ASbGncuACSRiNVB76MK0rvLG5GLNMg6zCIhm2R/L+0H6BjLWzkqYdHpcg8udrLj0WYY
	/W1W8yIf/Id/G/65KBZanCwqDEyE2GMzdE2YQN7+C7fGEsbyHXdoSeVvDmFDrVPlj1NXShQ3e+1
	K9G2HJux+tJ2fzoNc+yM9150rSD3SURhk7PbCTY9jbZnohkoZiYhQ7ze7GJUK1DkV24WYnga7i6
	Qp2b7ndf9L/hq3qONE6D7Ou8EQRUxnyVY9W9lKTzuJOc1TO25OoTmBDt/A1blkipymjgnA7zDLw
	UCau8ou8Dot88586AUUvlSG92f6lLXKrjAIJTIoVqExF3irstfk=
X-Google-Smtp-Source: AGHT+IF0IGm6fDHGPK66O6bg5JTvgXJJb1FD4//3SnxAo7KjM8JdSqs+9ux0Ap+T+I2E+83jN9O/IA==
X-Received: by 2002:a05:6a00:4408:b0:736:3d7c:236c with SMTP id d2e1a72fcca58-7406f0d5d84mr11288854b3a.14.1746463706657;
        Mon, 05 May 2025 09:48:26 -0700 (PDT)
Received: from thinkpad ([120.60.48.235])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-740590616ffsm7268130b3a.140.2025.05.05.09.48.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:48:26 -0700 (PDT)
Date: Mon, 5 May 2025 22:18:19 +0530
From: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To: Aaron Kling <webgeek1234@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kw@linux.com>, 
	Rob Herring <robh@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, linux-tegra@vger.kernel.org, 
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v4 4/4] PCI: tegra: Drop unused remove callback
Message-ID: <gxbuvopbhum3v622gf4olzfspgihxt3dm4z3rsj4gquaabt2c4@peemxrxshjuu>
References: <20250505-pci-tegra-module-v4-0-088b552c4b1a@gmail.com>
 <20250505-pci-tegra-module-v4-4-088b552c4b1a@gmail.com>
 <idddypjxxtiie3tllfk47krcydlno4lnhbkik4wakekcyu7c2d@iurtu6bjzeey>
 <CALHNRZ88VaS6zmmnkQg_WrBVPjMT4e2uPUPEQUj8ARL1TieZPg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALHNRZ88VaS6zmmnkQg_WrBVPjMT4e2uPUPEQUj8ARL1TieZPg@mail.gmail.com>

On Mon, May 05, 2025 at 11:43:26AM -0500, Aaron Kling wrote:
> On Mon, May 5, 2025 at 11:32 AM Manivannan Sadhasivam
> <manivannan.sadhasivam@linaro.org> wrote:
> >
> > On Mon, May 05, 2025 at 09:59:01AM -0500, Aaron Kling via B4 Relay wrote:
> > > From: Aaron Kling <webgeek1234@gmail.com>
> > >
> > > Debugfs cleanup is moved to a new shutdown callback to ensure the
> > > debugfs nodes are properly cleaned up on shutdown and reboot.
> > >
> >
> > Both are separate changes. You should remove the .remove() callback in the
> > previous patch itself and add .shutdown() callback in this patch.
> >
> > And the shutdown callback should quiesce the device by putting it in L2/L3 state
> > and turn off the supplies. It is not intended to perform resource cleanup.
> 
> Then where would resource cleanup go?
> 

.remove(), but it is not useful here since the driver is not getting removed.

- Mani

-- 
மணிவண்ணன் சதாசிவம்
