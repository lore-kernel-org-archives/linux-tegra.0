Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793124344;
	b=S416UMlg/L6XUMqbPJTgLTanxWFTFkfM8mOe2X/gTxJvM+tJIrFXXNkx2xfV83GJmbgV
	 tEL0OEzBfQJzwd5zKLjiB+iGYmgYQtEzLcoHWuYFvB+bPHR6xEWXqpyFO29lAwFzonbg7
	 NUhaSxueGRPXjHbAM95UJgoC6u/U7VzU/+T/PukjsNcY2EOQPNNSha/81AIIR72OMkLII
	 Fo8hhRsNlVtjzJo6SENlM7b526CgC9Z7ZKUapCX6P/Fdnd+Qt49+AxYc3QmJlhYmv/47c
	 1t2yg6d9sA/3xQt9GYnI8Z1ljec5l1tlDUJKS+ZeHiplD+CfSK0XgdiwOs+Ngrtn+Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793124344;
	h=Received:DKIM-Signature:Received:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=cR4mhPcTCbIo0PvJ8zhoiiElFTkUZR7jbcuH0AIhq6U=;
	b=0CV8QYdYJxwQJ1PcfKMX1uJK4c0xPqq0DDssxiwf5rTklkaHjFG6Ec2T3SqIG0LKmG/M
	 wUe7MddSKZRNwB2XVsEd6lURKe39s8t90bNUn2pt0fv7xHlbkGyHbei2YAOFOA/7ADKMl
	 WPT4rX5JCcR5SIGUQ1EENSeJy/dH5MH0j8UI0v+WVihxzYWlNyBVwFqAv5b3UvUpF5OKP
	 p5rJwbNK/Lu8ZVCNMpltNHRcWOQjikeq9umhXeIVsTDA/yYcrEv01N13s8+p6AB+91t14
	 bvzWv90jdRYSxFZZiTVqv3BjCO5rtcc4JHE3Zwl/mLkotelrHshFjJ4IQf5XWLsx/Yw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTPwukDR;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC4B606A31D;
	Tue, 27 Oct 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WTPwukDR
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 593C11F01828;
	Tue, 27 Oct 2026 18:05:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793124343;
	bh=cR4mhPcTCbIo0PvJ8zhoiiElFTkUZR7jbcuH0AIhq6U=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WTPwukDRCqH/STPdEMf1OlV2ebnsZLB3xNDj4r9Qrcl9s0MLFnJ6FXZqOe6NLvS8t
	 DQuBfg7dnI9ulNLmC8y4ErBtLlcgATNv9rtU+X6sANMT8w2v4795B9oAY1keCKFpxi
	 K1Q5KLMyKpVYM1sXGyjeZhnzBWvTAGrt3mokcfdqtzEK37VcZ7pDUsBD27c4jmfo1j
	 sgL2PnLefZwelFgL2S1+DfBhZvt82ahMr7CiZuwlerb0n01PbwEyaCz1zvcXV8vzE0
	 1mwQr/s5RYZCNKH3Crki6rdbJer1+cAhWiq7mKbYS/FE60Tiqq78AJHDeL/wbIH7t6
	 TBe8a5pDQ9cXA==
Received: from traversing.sirena.org.uk (localhost [IPv6:::1])
	by traversing.sirena.org.uk (Postfix) with ESMTP id 7B79A1FB1FC0;
	Tue, 27 Oct 2026 18:05:40 +0000 (GMT)
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v1 1/7] ASoC: dt-bindings: maxim,max98088: Document
 #sound-dai-cells property
From: Mark Brown <broonie@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Mikko Perttunen <mperttunen@nvidia.com>, 
 Abdulrasaq Lawani <abdulrasaqolawani@gmail.com>, 
 Leon Romanovsky <leon@kernel.org>, 
 Animesh Agarwal <animeshagarwal28@gmail.com>, patches@opensource.cirrus.com, 
 linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org
In-Reply-To: <20261027120019.93611-2-clamor95@gmail.com>
References: <20261027120019.93611-1-clamor95@gmail.com>
 <20261027120019.93611-2-clamor95@gmail.com>
Date: Tue, 27 Oct 2026 18:05:39 +0000
Message-Id: <179312433904.199157.11834547028241710753.b4-review@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=216; i=broonie@kernel.org;
 h=from:subject:message-id; bh=cgf6gWhMNRLy/LqNI7zRf1pToXBmhlC0fhgtvjnMKwM=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLIePP+yn6PNeE/cqunCtvtubF1/aaP346rHaVsT7jXta
 rXKFRTa2FHKwiDGxSArpsgSl8X9sr7k9Rq+gwvbYOawMoEMYeDiFICJTF7I8D81R7JYUexAtl3O
 DSYd5Z577VL2q9XP5Ni9ObIwWOrD7a8M/4wUK0QZThlOrk54F/rvltkd9o2ian4GCVK9oXO9m2+
 t4wIA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

> The Maxim MAX98088 codec provides a single DAI cell.

The device has HiFi and Aux DAIs...

> +  '#sound-dai-cells':
> +    const: 1

This makes sense for the device.

-- 
Mark Brown <broonie@kernel.org>
