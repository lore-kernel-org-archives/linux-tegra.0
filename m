Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5235B498922;
	Thu, 10 Sep 2026 13:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789047122; cv=none; b=dSC2piLVoMQ0ewhxd/mfh8ec+Tphit6i8pLC0qW4v7zEos87pgKDTlh9olK++p6OVlIWtbedhbpPmTsiRv6i8pZy4kdWFjVlGw6Zpwfjj7sFs90vRbb1UM3MYo36hCXnDrc8qesc04JXV6F5QdMv5MSvnOf24Xl/CEBwiIvd2N0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789047122; c=relaxed/simple;
	bh=NRavYKMQUZLmfecX6DKlFNtycZ+Chz42tfmFszNynrk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=pkMiWBBAGXA9JI2F1xZ7tHXG6NZ+G6uWlRbZ39LfRfdNj54JOEBCJQnp2klNxYzD8xJO5fKul7i+hbzaSaGTzrdQ2ltM/Txg0qqRuTBYCYrVmMUU8uObo1vlLW+1+D5V0LVzSAbzoF5/UMI2wfvsBp1JLP9IbicnFiPpvi1tWN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=R4WttS6q; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="R4WttS6q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 561431F000FF;
	Thu, 10 Sep 2026 13:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789047120;
	bh=coMvVXK/TxKnMVFzn0IefsGaDxIVGH1isKpbAtxRNAs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=R4WttS6qblEzH2QiRFytSgiBzNU/kRp/i/IysLstNEPKsvvR+QhN5bDbNbMk/OWzX
	 Xx49wBFj9u2TR8Slh6VKRrdkTCkynKF27xecGdx4OhwJyvAqGKDY3LDw+YREESedRJ
	 W83OFa5iCHDCAkz+TNegddm8dnir++zmzsdAXFSJ07FLBLaX3um9Ibv+Fd9fggs502
	 SOAw4SJIuG3sxDhIuXr6XXTfYva6NDczIb206QeHmikA4LYVrMRFNqAWfS3yRhCq0i
	 lS4twW9SuaJV35F21kQ58oU6ly06NBIs7vGp/0h2zSQpSLxUj8jFDJHOYvvRxSQyCj
	 h4t1J/lSUielw==
From: Thierry Reding <thierry.reding@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thierry Reding <thierry.reding@kernel.org>
Cc: Charan Pedumuru <charan.pedumuru@gmail.com>,
	devicetree@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH 0/8] arm64: tegra: Clean up AHUB device tree nodes
Date: Thu, 10 Sep 2026 15:31:53 +0200
Message-ID: <178904710143.3571688.17875564695233750329.b4-ty@b4>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
References: <20260902-tegra-ahub-dt-cleanup-v1-0-028f3c5e72f6@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 02 Sep 2026 12:17:36 +0200, Thierry Reding wrote:
> This series was prompted by some discussion on this thread:
> 
>   https://lore.kernel.org/linux-tegra/20260705-nvidia-ahub-v3-1-bacb7e05bf68@gmail.com/
> 
> In a nutshell, yes, the AHUB can do with #address-cells = <1> and the
> corresponding #size-cells = <1> since all of the children are in a
> fairly small register region. I suspect the primary reason we stuck to
> the #address-cells = <2> was so that the ranges property wasn't
> required.
> 
> [...]

Applied, thanks!

[1/8] ARM: tegra: Clean up AHUB on Tegra124
      (no commit info)

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
