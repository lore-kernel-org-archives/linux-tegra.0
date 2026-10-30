Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793372232;
	b=ehGfkPrEIrUptM/PNNKLZwICJo/hpXRLquHGMj9wzOHTmIJVDGvC62UG5Wc2ZL+I3JFF
	 pbeMuFDi+XK5w7+nF/UCMN5FcTsMiiw3mwst+HZ3K03ZI3qD5qmSIOwd44JdgGpzGm4Q+
	 7eNAY8UPVArL4nhTdPILY2SpuZy2yTa5uTYRbUkwVJOHh2a73EZJKLZyHmuXfWpbZUH52
	 vO5J8lQertE0FtjVsBzgOaC1ZnnQ1A2011FTj067r9WxbCWGWlKdNV03w8LweAET7kfDo
	 rHCE71AHT9f17NN38GZgreZq7dlGvOl7CTizmuCOTdI2CrdPZpo88MCK7pit0vNgwXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793372232;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=oZAfy60l+Rgflxb2Ebtv8T/k77COyYvfSl/+STzmeoc=;
	b=lbA1qpw/bl93jhO3Q4ZQO6vOuR/9s9J0dR+1iPBGte0Pcdimc/WH2a0u7JpKN04iXTMf
	 yH/3eCgO847eZyzKJGTL6DINCpZ9jTOhHTBYyg5gNr3+2wLFpBrBBajL4YJ9dcyGcAtv8
	 R/SlJzythJmgoKdUI0PVmvlkR/SrZKNqgh80Veb0vnxffEmiBrWqoGrYF2qS8CPvSmBBu
	 wea1nehStf2RGwg0zJpgiV0/dET/wjCQduFxhS8tCFT3ZwRUsoe6fl/YORUyUYWZlCXxg
	 f25+5jJLlcnPDohqc0Gyg5o4JYQja/QB1DRZ44YFVXci2OaoOUq5UUhqWfTje9mL46A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WuiTphtj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FB2606A31A;
	Fri, 30 Oct 2026 14:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WuiTphtj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0C441F00A17;
	Fri, 30 Oct 2026 14:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793372231;
	bh=oZAfy60l+Rgflxb2Ebtv8T/k77COyYvfSl/+STzmeoc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=WuiTphtjQK1rsMnSlh+BXJTotZXfzjSOXv0nvKE9jsgSaXV/+Jy+5Dd2azXagxsnh
	 ZuAhujdDvv0VczBNoWGbuAFGzAWj7+w+yYWdjcsfketHKYL5XFiQKmgWpVHMEB7S5t
	 ouzPGuANDN2uK2b9kMq9XVFOvFaEUqT+u53nzwjabX1hFhW9fRqpYnVKrvT5ncQSB/
	 Oz/KZz/rMVV9XUkX6B5ad8XorLTL3VcuGNLIEKaSUaqRBHA/M4BqsJPlKZ45TokBYJ
	 gQ1NttkYxDq/mzGpCYNfSoMjx594NyMHqZKAnYxhQCu8/X2Aft1Z/UzlqnAEmpFBCy
	 +KDNw7ofgoQmA==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: thierry.reding@kernel.org, jonathanh@nvidia.com, 
 Myeonghun Pak <mhun512@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-tegra@vger.kernel.org, 
 ae878000@gmail.com
In-Reply-To: <20261015002852.2159841-1-mhun512@gmail.com>
References: <20261015002852.2159841-1-mhun512@gmail.com>
Subject: Re: [PATCH v2] memory: tegra: Shut down Tegra210 EMC timers before
 teardown
Message-Id: <179337222944.267249.5652264355527849192.b4-ty@b4>
Date: Fri, 30 Oct 2026 15:57:09 +0100
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
X-Mailer: b4 0.16.0


On Wed, 14 Oct 2026 20:28:52 -0400, Myeonghun Pak wrote:
> The training and refresh timers can outlive the EMC state on removal
> or probe failure after clock attachment, causing use-after-free.
> 
> Shut down both timers before detaching the clock provider and releasing
> the timing tables to wait for callbacks and prevent rearming. Initialize
> them before clock attachment, since set_rate() can start training.
> 
> [...]

Applied, thanks!

[1/1] memory: tegra: Shut down Tegra210 EMC timers before teardown
      https://git.kernel.org/krzk/linux-mem-ctrl/c/394c350a34b77f1bb065b675d356ab55b6462ed8

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

