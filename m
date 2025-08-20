Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15FB24C07A;
	Wed, 20 Aug 2025 17:42:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755711749; cv=none; b=ofIm8lW5eXGRdk/05ARkN83N1m0vW4kFQPz9ffMwQuVHSIreJi84yWHNBlZXk4ALB0D8aRVxRq/ZJtqFvV4+OxzPBBVbDDR/HAhGKBB64/GdAXj8BlL4bZ8fLwu2iSRr7qOfv/NP1N1YxUYqUojluigbkNyp/3MsbhsVVzX/EtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755711749; c=relaxed/simple;
	bh=BpyZSNPclWCDw8loR6cMw4dgVD4yK6msateOdC3Yq94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=hKLDS2b/ze8wCxv1/Alrg6TMdnarGtch/OJR7UwlJB+vRYE+OUuzuJDJX1df1H6bnngSN05J9iVWwRnhex6+cWZ2AChM1o2sV6v0WkBQ9tf4Uu/y1/S+lBuR07Zzwn5VkUqvNz0+rV7Mn4cO8/cSYv65eg3cdwbuHilPNDzFIQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EEOryb/L; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EEOryb/L"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E558C113CF;
	Wed, 20 Aug 2025 17:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755711749;
	bh=BpyZSNPclWCDw8loR6cMw4dgVD4yK6msateOdC3Yq94=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EEOryb/L7vh6EyXLiVznpA3g7/1euyvXAW0swlHX4e6anJsAxcjfEwFKYuMWubFqc
	 nsmh5e+LuoDnkbpDDP5BXu88vktxL8zVNF8LwbQN0wo2CFKbHrh++foUm+1wE+Eq2j
	 3H9/xCpYS8V/8VDNop6ThCzoIW71S+2oS/9f6G18+fhHN7VFV0MQx5bNgTyxeFOOxe
	 jq97rZ9RIpEvmOVNjeRrdJ80RRBteMlPCRbNeDk0a1qKpvPiHKfuodDAijdvVgPreb
	 TddvE+A9wiCtgJOQjAilg0GLdvqsqhg+uy4FC1tksP+ev9AjOGHbQRDoZyVUxwZtEI
	 uwcUB7QSXxPXg==
From: Vinod Koul <vkoul@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 "Rob Herring (Arm)" <robh@kernel.org>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20250812203308.727731-1-robh@kernel.org>
References: <20250812203308.727731-1-robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: dma: nvidia,tegra20-apbdma: Add
 undocumented compatibles and "clock-names"
Message-Id: <175571174577.87738.12389249102794801028.b4-ty@kernel.org>
Date: Wed, 20 Aug 2025 23:12:25 +0530
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 12 Aug 2025 15:33:07 -0500, Rob Herring (Arm) wrote:
> Add the undocumented NVIDIA APBDMA compatibles and "clock-names" which
> are already in use. There doesn't appear to be any per compatible
> differences.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dma: nvidia,tegra20-apbdma: Add undocumented compatibles and "clock-names"
      commit: 7a430af7d135be5042f14987bce16f6b40a3f694

Best regards,
-- 
~Vinod


