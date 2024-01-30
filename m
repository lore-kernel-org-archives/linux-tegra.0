Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89D77151CC4;
	Tue, 30 Jan 2024 17:56:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706637385; cv=none; b=WMjO1tiqRrjK1Zab7lqSv8zkbUiDikgwg+O4BqEe+8yxkVCT7jq2i+JcSUEG/GP6aYSMYC2XdhSMFBNzQj3E9320WGlh8rux4fod2Sm5lKICcu10PbNhthfsaMSkKD7YqIKfD7M2gwDpq6MReYImoImiciquhQD3jsD9BjGWlgM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706637385; c=relaxed/simple;
	bh=YkZMja9Z6X9okkikXUksM6RJCzIDja/nAH7+osrgnWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DaLJI0wD/2CsZwUKjy3hAZ2q6d49qDi8hTvKyfIhRdfXNt21ia6jlcZwxAVs/gKx6o/VF5CHSkteCwdJdLGw8EAB+87X2Hus++AUPvSDqEw5BA/Xoy7ad0eAcxIQN13q7buWlnSlnWuJnaFfv3Yy1ymrkQRk+dB2HsnU8XhlDQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S1a0JOED; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S1a0JOED"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AEE5AC433C7;
	Tue, 30 Jan 2024 17:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706637385;
	bh=YkZMja9Z6X9okkikXUksM6RJCzIDja/nAH7+osrgnWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S1a0JOEDlNPL1Gdm6tR+uVbgQf9nUAbU6uJzWOM2GpBBjbUfFYo6es41YFa6/aCsH
	 hfMIV/3ssaSNK7SZIqObk8ewTlvTbuWtq1POHskFyGN5QBL/W2M8JZ6G9zBy9oulQ5
	 6VrmWdoT7FQ7IpXHaEktzChGjIEDXZqUBZb3evTXSZRobFYwK4L4lXpwD/C4vGPbOb
	 csXGZC6L0AeV6DJ9ac08UU2+XNXX3F2/TBKbCal45Jw4lZo63wHJ2GQLZLmHyqC8Hk
	 0jmjRFd9MowY3IBQOg6LbAEn6xJKkDQqVu4Pb+yFDHGTJ2/zPNFUFOgUxaYM2o8y8a
	 5D9JTqolpmA4Q==
Date: Tue, 30 Jan 2024 11:56:22 -0600
From: Rob Herring <robh@kernel.org>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jon Hunter <jonathanh@nvidia.com>, Sameer Pujar <spujar@nvidia.com>,
	devicetree@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: Re: [PATCH 2/2] dt-bindings: sound: tegra: Correct clocks and resets
 for HDA
Message-ID: <20240130175622.GB2051939-robh@kernel.org>
References: <20240118142706.4179146-1-thierry.reding@gmail.com>
 <20240118142706.4179146-2-thierry.reding@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240118142706.4179146-2-thierry.reding@gmail.com>

On Thu, Jan 18, 2024 at 03:27:06PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>

Subject prefix is wrong. See patch 1 for correct prefix.

> 
> The HDA controller on Tegra194 and Tegra234 uses a slightly different
> set of clocks and resets, so describe those accurately in the bindings.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../bindings/sound/nvidia,tegra30-hda.yaml    | 95 +++++++++++++++++--
>  1 file changed, 85 insertions(+), 10 deletions(-)

Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>
