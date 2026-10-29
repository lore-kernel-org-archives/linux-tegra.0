Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793264181;
	b=x/EzvIbACKpgYRlUqrb3Yc979npXqDRHBJXQn3Ey/TuXTEtdPILNrRAHak+3BQqdt4h6
	 /gHhkE3V14AHjiJW2U1o13c0xFW+qm5uocm7xSHrcUGjAE3JbpH7Zyyk+wUqW4mfc1sqt
	 8ND5K07MSBWVX/QYzhpgkgkwjygy0H6bvYHh4UAWs5m8qII4Xq9PvTlhgXjo0OtfztqqI
	 Ks/KvS1St5UrVdF3rGr5ykWK9QuUGha14+eYMzOIXT95eNQ0U9D4kRawUVFlechigGm8t
	 SFV3562/DEZ3DcV6wL40jQZ9JFwjZ/EEKg6zooa/huosC+i4HtuJew0r1tovWOoUXCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793264181;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=w2ejjs8yPr92ZrvNYymKKkYuQ+rkl46NwmLcEyqDyfk=;
	b=SzFWm7AxBj7xrDRa2RJw9ryCPd2VXsC/pLwiDStnlC6/CwM5deMG545R4Kh4Ry+NxzVw
	 +2qre1MNvESY+9bUwx39EKbjmXmDEFuMQgB8rtwCzkdETl8bc1WCvt0FIfpSiy+wF1k5K
	 ZPqYJ9oHWoS1Din04z++3CKT/Bi8yXUS0SxEWYqLvyOj8tAD0xO03UX8eOSnJnIqGA/nV
	 g4nBYCNhzzw/GxVDq7mSjk0pSRDLHGI1ptSFo87QE5XjTMJs9xc65UQokRzXTl5erNU0u
	 NhxZlEvLjDTAfg41uxLMRyUrxwLeNXbNV08u59DKdqqZU7U0LdEcN3UhmoyrbwWQkFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeD9y7VH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD4E606A31F;
	Thu, 29 Oct 2026 08:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GeD9y7VH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 071E51F031E3;
	Thu, 29 Oct 2026 08:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793264180;
	bh=w2ejjs8yPr92ZrvNYymKKkYuQ+rkl46NwmLcEyqDyfk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GeD9y7VH5jlfMmzuNwtDReyyRM2rZgNdsVqEc/rD9u0dACcCW5SkbF8nH5Z3yF7b5
	 iOsHR+wkduWqup8i4kHnYK/5BkGxxg1ouij4c73FCUCeIiIiRxKCVN06EOtkPT+hfp
	 WsV4WEqz6YkbuXtpARB2DkgyXRmP6ocpYCl9f3I52BCJIT10AwhdW4m7/PMeeDEPZn
	 kqvHVqFCLSlZLqwRREgVAlydq5Fodr+UebMOrPq+iw+JqB55hYr2yqc7EC2kS2/3gO
	 hMXbMgrQMRFObqDcb+eH+C3gWprwAtGv9sRA2d6JvJKh8OEHEC9mx30iL6d6Bbj4pE
	 RXZF6IVghsKFA==
Date: Thu, 29 Oct 2026 09:56:17 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Johnny Liu <johnliu@nvidia.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Prashant Gaikwad <pgaikwad@nvidia.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Douglas Anderson <dianders@chromium.org>, Aniruddha Rao <anrao@nvidia.com>, devicetree@vger.kernel.org, 
	linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v2 1/4] dt-bindings: firmware: tegra186-bpmp: Add
 Tegra238 BPMP
Message-ID: <20261029-spiritual-imported-kagu-c3473b@quoll>
References: <20261028155000.1205739-1-johnliu@nvidia.com>
 <20261028155000.1205739-2-johnliu@nvidia.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261028155000.1205739-2-johnliu@nvidia.com>

On Wed, Oct 28, 2026 at 03:49:57PM +0000, Johnny Liu wrote:
> The Tegra238 SoC is fully compatible with the Tegra186 BPMP.
> 
> Add the clock IDs exposed by the BPMP firmware on Tegra238.
> 
> Signed-off-by: Johnny Liu <johnliu@nvidia.com>

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

