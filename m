Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793084095;
	b=yBITAoftIui1rGaFGmhD55zLA3lXa4oNJOV76Ink6aB/ZwZnQc+deiAUwALzOT263rkb
	 s7m3RwTuVaehT0gkbHf7aW1Yi0eS1HnNqb6c+QjNE7Y0gs/zPOSh2I+2QQKH118J/wJUt
	 XgtQj+cr5aVw/ocI5yXafqFUbizpvlLk2YeurrlH7uY8XHEtHhZvNGXQupvxmiNgIeWin
	 Qj7bRVdtlZjyBaWzZLSTZC7AsvjP77zDUX9IKHQgxJ/bTPHBjTJuGcwHAidieoSTvhja7
	 JupNfQpJoX4w9oTxv22H0uf07nCICl5MW3lvMX/zZHb+rmwrX6KSaeIdBQypJNMxcjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793084095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
	b=wqUKEoogOFX/glO2DHuei9lTJdNKgslDtyYoWc7lZXXklUGPmZEPsE/4qtKDL+h/UNnX
	 umwt2SSh84PhnISD8gFqY7/BpZeT24tr2qAOtXJdCHl2TUQpEceqoEXikOyFIHp4hNSAq
	 GfOvj85LDdhY7x5g2Bq3Ccq9C6aVXRr6cfuvsU+4oXjyuBGsfc4ZE4CQS0FdpyUVmV+Cw
	 aL+ko4eQa06MddJ5CKnBgs7DN4HMLxcLtj2d11R8g+FJ03e+T5CBkL4FlaNDN1l3akffr
	 g77dlnzMUfKRIyVNZfAF8MnNoFopIt1AEHe13vFOnfFtyPxd3Jv8AK3KFQo+ydbToKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DAA5606A31E
	for <linux-tegra@vger.kernel.org>; Tue, 27 Oct 2026 06:54:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DAA5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Rbm2u1OD
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1b07c3c5fso33029905e9.1
        for <linux-tegra@vger.kernel.org>; Mon, 26 Oct 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793084094; x=1793688894; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=Rbm2u1ODARNBL1tpPkHcrJM/nHYPU7J8ag3G/Z7wD9ZUxWbcU8zU2GfDy84PQZqBxI
         olGNMC0m9AmkJQMUoBagRXCjfUWnRf72LOO6b8ZKHnif1ixuAo87CkfIcCF2+c6oDo5N
         Zl90Q0Y0wquDTGNCkQp7AsQhS8KWjiVBICgCGQoFmHqGDy//4y8okmwwXdrNLN3LRqUn
         XiNDojM4jhEPtC8xX8wW9xNGR7AXZDCLKqCLWasUszZSmZgmWpmE2DYt/pIL21A0gmmU
         hDfGOgrCWfkynb4anQleTR8DpQW2ISV5cbX4aiTSdtuXDutGLv4CwG/UtbOyuEuXkiPd
         FiVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793084094; x=1793688894;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oEXr1K3EZeJQI84eHYprlnMC5Rarw55WE3zGp6jDEkE=;
        b=qL41lgg5dzMOqENLG6XJP+AvdESqk0q7LlW9zOgOkbckdCdJ6nwLeW5BZSqHpWkPsa
         b+aEngA/pSgXokYDgXzD0xovENLCmDk1T1nZgEUh35/IZOcqTCZZ6jfbQNZ/9Zh4L+yY
         mvMkZyJ7XmbymrQ+Lh14C7eQ5FNemS5H0AQboA4KVJzMesbxHRjLcj0k/qsZ6FJ0vF9b
         fmmC3FAwt6qt7/55sWP3vLhCvfIv4WISTArLbJG8fkcZuUSn1akU00I8b842IRYSdnZ/
         V6eCsrOCIJu21aPU8c+rfjr93eFQflD7zoVYmJMTWQ4Jxyn4EqzS/bRy52nWSu6R5wCP
         B9Yg==
X-Forwarded-Encrypted: i=1; AKwUvByiI/xU9JYtV44N4vziyC6lFuh35bsRNEX2D0O9byP2DNlG/JVTbfeWnAro4nWiAI3CvOpvt588ngkFYw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKT+PA3T0w8NMCyNBqxoIF1QFauw8XzOdmqDhUsEsDZJCwmxLlG
	t/0XNccmy2ewbIHCGZPUkjX24PcoLD+yLfjX/Njbo8cg5fLOQxWO/PY4gmnadlMzj8A=
X-Gm-Gg: AYBFou3KdRQDWA7CnsquHVfisUYoIVsiLOQB3x30SSo0bMBLn05uPyn+us6duU0Y7EI
	E2bj2tpCkWOtA8GXU1wwlhdOcfnirN8NzOS0pRaBDjr5927hJ6qF3khXN8l1WAKMU2ZD0kF8RnT
	JW4tx85l70YpT5L/c8nSnbZCDuu4mHK6Nzx+xu+2G2atNJof1vaau7LvpomquTTIwFMs5vdx1lm
	fLOkfpT+jvg+lZa/snEurtaXjbVGTqBctkAXuY3lEUNcBNU3ZYmZfzdlsXUjYQbzTRFH6iZHo0Q
	8bXwrQZacH0FenWkJ5DvWUxu6OBUHz0rVbpAnLvmASdoVTgcq4ElywlrCSKQFKSIuTKDNKE7c4H
	IfnkTDSyiVBpK0MkA+cHP/QYgdgnBf/s82L1jk5ELIRjwLysQ8NZiu2w5am831bzc246WL+JWMC
	mXiNrb8DIwrGHIPpUdN5UveqEyFouDtUvFhox4CrnjFNnAYaxfbMDVqicwf5NpKKdtpupqF8l9V
	ZMxQdPMJ9tKLN9LsXt4fqzKtT+2CLAa/PjI5TzML64e3mpfnryS8uyaZ2YoeeH+8AgXcXxxM4wg
	/XsHNZFQR2JRSMeJvBxqREqn3x60TxhfAoCZqOVmQ4MH6xlIR0ksoPtSIf7rs1bYdigLORjM8q6
	k9qkC323F5//rw21bWw29KYXU6fBCvUdkxEMJdflk28/M2JDJy4wLv9U+bBvkAn0xTmPL3ZKeD4
	Tmcqcv
X-Received: by 2002:a05:600c:46c3:b0:4a2:fd2:9855 with SMTP id 5b1f17b1804b1-4a35acbd173mr173946805e9.13.1793084093615;
        Mon, 26 Oct 2026 23:54:53 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-b2ac-9b01-6900-1f92-d182-4435.310.pool.telefonica.de. [2a02:3100:b2ac:9b01:6900:1f92:d182:4435])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a4cb7bece3sm189318425e9.10.2026.10.26.23.54.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 26 Oct 2026 23:54:52 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Mikko Perttunen <mperttunen@nvidia.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Aaron Kling <webgeek1234@gmail.com>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH 0/2] Fix NVDEC boot on Tegra210
Date: Tue, 27 Oct 2026 07:54:46 +0100
Message-Id: <20261027065446.97098-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
References: <20261015-b4-t210-pd_nvdec-nesting-v1-0-39a36b622eac@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, Oct 15, 2026 at 06:58:01PM +0900, Mikko Perttunen wrote:
> On Tegra210, parts of the NVDEC hardware unit are in the NVJPG power
> domain. According to the TRM, the NVJPG power domains must always be
> ungated while the NVDEC power domain is ungated. Model the dependency in
> device tree.
>
> The first PMC patch updates the PMC driver to handle cases where a PMC
> power domain depends on another PMC power domain (other than the core
> domain). The second device tree patch adds the dependency in the device
> tree.

Tested on Jetson Nano (Tegra210, 7000e400.pmc and 54480000.nvdec with
nvidia/tegra210/nvdec.bin) on v7.3-rc2 (5b0764a53235):

- Unpatched: pm_genpd_summary lists nvdec as a top-level domain while
  nvjpg stays off-0. Writing "on" to
  /sys/bus/platform/devices/54480000.nvdec/power/control immediately
  resets the board into TegraBoot.
- With both patches applied: pm_genpd_summary registers nvdec as a child
  subdomain of nvjpg. Writing "on" to 54480000.nvdec/power/control
  powers on both nvjpg and nvdec, boots the Falcon firmware, and puts
  54480000.nvdec into runtime_status=active. Writing "auto" powers both
  nvdec and nvjpg back to off-0.

Tested-by: Karl Mehltretter <kmehltretter@gmail.com>

Thanks,
Karl
