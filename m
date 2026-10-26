Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793053773;
	b=gO2E/Pb33+GhJufLM2SGThFaqZTsLcb8737gvAA9gMLu35lQ6vSBvZkq5NTf7BWXNbh7
	 XvGFKlXJRMyY3UeB2IPpJLFdVD9WvC5McssB0NfSqTQH4I8o+DZ1kjy+0dwnb/Rc7QAli
	 3GQhEAfGdKgxYBlK6cFzunua7r7/J1YUyhlDhDt6JUTGcH902uyQqu+/ZcTSLsyt++TY8
	 wURPkYk+NXzEXMy9/rQs0U3yw1OLv/el+6iwORqlK7W0Gttuh758yUt+8HKGLiZn/p1eU
	 GSyybn5aTrW9gBHVxKhWsHcj4kh/xfUpluwUZnpSIRYBxTGD0rpAS8jUVtHAr1JSRwA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793053773;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=Bd153BmFE4vrv8hyd3HUfY6Tx0RBBo6jQusd9ILj/DY=;
	b=EKEaYAXe2VBFDTsr1gvUs3r3CSIqhpYrPFdz1ekMJ0SURS276LRSKlD2sckTZ7qmznc9
	 h8YYGZSiok8c1voG1OEPNz2BTUmLaBD4wTebh8Sb797SnP9gbyHaUJVRWLpLx8BSvsE6y
	 J/OlEHbjd9YpQUMXiSoe+YVTBOOucIvKyZYRfwfWuRG62nIfAVdFygsdyjdl5FYXED2Sf
	 GjhUoaSe7lr2ZAYLzky6GgscfUykSUN/pQInFp5LsTjPXn2TpjI/85n0SX9TKehsehP2s
	 p/GEXiHTLtSnFpHSXJ16Z2lrbK4m+9QdvybPA2wguxgUmdYUN2uiNWXJgcOgXwgWSFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7Pq+51E;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA071606A31A;
	Mon, 26 Oct 2026 22:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G7Pq+51E
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178481F01825;
	Mon, 26 Oct 2026 22:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793053772;
	bh=Bd153BmFE4vrv8hyd3HUfY6Tx0RBBo6jQusd9ILj/DY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G7Pq+51EMEwL4bNiIzY6Y5wznYXU4PM4SUeo72LZPy7mWMmg0G013vGvUccC4/RUs
	 3+lPpFa+/qzmVPIc0kNecmXicrLEk10RK7tOPa3uZP7ZJ36CXrDuTrXmFTJZ4e1N9m
	 S0RO5a5r6UcZJ5Y1S9i59ZfkV/SQI8AWPxMafEETEYKVJ68MvLF3QSZP97Mwd79kLK
	 bsDBlwGa8Xq7lUQVpegH//StMaHyQZuxP22GZkKbKbbHXs6cgH1+hIMJKwuNf5P2vF
	 hOJ/5ZMH9WIdYZkHiwKY/5Yms87SIJl8QJnX+6E96V0Lb1/raC7BqeVq0JjA161g63
	 YA9WzmUmlHCRw==
Date: Mon, 26 Oct 2026 17:29:28 -0500
From: Rob Herring <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Thierry Reding <thierry.reding@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Mikko Perttunen <mperttunen@nvidia.com>,
	Jordan Viknar <jordanviknar@gmail.com>, linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: usb: Move Tegra-specific Chipidea
 USB properties into a dedicated schema
Message-ID: <20261026222928.GA15139-robh@kernel.org>
References: <20261004165204.205660-1-clamor95@gmail.com>
 <20261004165204.205660-2-clamor95@gmail.com>
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Post: <mailto:linux-tegra@vger.kernel.org>
List-Help: <mailto:linux-tegra+help@vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-tegra+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261004165204.205660-2-clamor95@gmail.com>

On Sun, Oct 04, 2026 at 07:52:03PM +0300, Svyatoslav Ryhel wrote:
> Move all Tegra-specific Chipidea devices and their properties into a
> dedicated schema file, by analogy with i.MX.

I don't really see the point given it is only 2 deprecated properties. 
Maybe those can be removed? Depends if they are deprecated and still 
used or deprecated and removed from .dts files years ago.

Rob
