Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794495046;
	b=wVEmY8nfAhy8UOr5GYJUC6XdXT4hf06Oanf7GjRs34Y+xSnxS1zw8/MIuEz2CDarAN0U
	 N4mEZDnpyyFzuBv7uQtSDq0jwuoBkJGtdiLhc6Zqdil4YhT+ezoyC1vbAymEwy22GH1zQ
	 b1WSBZEHzY+dd1jGo84le7B+zuOcPuwc87503R3KjMX5NcmoZjOlEhG8f7bmdRVgBsIj/
	 XdZcgyasVEgFk49U5wiyvVioMtQZN+e3j99OKGuh+EOSkUz9M8KqD85RuQxbSWqVHU73X
	 SE7G0pvbNSqTtQDQy15BM9jc+pugkmIx/YLYGzpJcNNSekVrTUgJlEEiMHB66T8lixg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794495046;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=+cMDfRvwpaIiiZo1tUtI8th8dMoUjuYu3wH8fOvzimQ=;
	b=dshK3y/yfIm1mFuZXH2+0vwVZeetXNcV2bHcledmQALixmCHDZqNZGJ9OCRcqTOugYPn
	 jw+63oMRKIVjaiJVxZCfUU45yAg9MvVXZkywx15T9ST9qYOOSJdqK1n2PV417/FO2Uuo4
	 P9R+m+Varff2q8OZ61nWtgv+jfT14lQEYTPitOvFDPrLcXpqFko5RZfW2iw1RhlwbSXbK
	 JU9B1OR35HAhMFshAHVXrtOw1WuO8nDdfrUKKBQ9F2JirzX02HzJ/WPJ4anptUYi2pqEo
	 rKDvCZWANSTIQ7XG6+FC0XdhbqSHXn1yhXpZ7UO0hc82U7aPL+HYHD05yp4ficdqOwQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzO5G4QD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69B5D606A327;
	Thu, 12 Nov 2026 14:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jzO5G4QD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 384791F00A05;
	Thu, 12 Nov 2026 14:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794495046;
	bh=+cMDfRvwpaIiiZo1tUtI8th8dMoUjuYu3wH8fOvzimQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jzO5G4QDGB2RI84UqOcZTs4g/n5yhGVvdFCJy5JEoa79aXYCHZiqixABTMWwW1A7G
	 EJ+iFy+6qvweF69YeZArLfw59NXFQdAZbIlFM+5GPWErd7h361sVkEajUKT8LtNELn
	 qaVyKJxsop/L53qofLJ9aJ48S2QZeqwSjbjebjb2YyA1eswz/MOnUv37co+Q8sSsox
	 QBosRhIIFiV9Q6bHDR5xkU8H6rmErgcvkp6wV/fVP83S2bzfXTpDUpGZWEy/pHMrXo
	 Wwg9kTVxB6AMbqK2uMpNEXyMaXJHeZOAYArWFbEJHT8H68zMPoHJFRm4Sl8j1D5GxR
	 4vZEsdwpOo2cg==
From: Sasha Levin <sashal@kernel.org>
To: Kartik Rajput <kkartik@nvidia.com>
Cc: Kees Cook <kees@kernel.org>,
	Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Jon Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-tegra@vger.kernel.org
Subject: Re: [PATCH v2 RESEND] pstore/zone: Emit registration message as a single pr_info()
Date: Thu, 12 Nov 2026 09:50:43 -0500
Message-ID: <20261112145043.1507232-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260710094404.995355-1-kkartik@nvidia.com>
References: <20260710094404.995355-1-kkartik@nvidia.com>
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

Two comments below, but not worth a respin for these.

On Fri, Jul 10, 2026 at 03:14:04PM +0530, Kartik Rajput wrote:
>@@ -1301,6 +1302,10 @@ int register_pstore_zone(struct pstore_zone_info *info)
> {
> 	int err = -EINVAL;
> 	struct psz_context *cxt = &pstore_zone_cxt;
>+	char buf[256];

The line can't get longer than about 50 characters, so 256 bytes of stack is a
lot.

>+	struct seq_buf s;
>+
>+	seq_buf_init(&s, buf, sizeof(buf));

DECLARE_SEQ_BUF(s, 64) would replace the buffer, the struct and this call with
one line.

Reviewed-by: Sasha Levin <sashal@kernel.org>

-- 
Thanks,
Sasha
