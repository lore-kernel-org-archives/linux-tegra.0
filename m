Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D34ED34751B;
	Thu, 16 Jul 2026 21:54:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784238891; cv=none; b=V8mFpqm9nyeJXEH6jkvD9H2wQdP4/qAD/7rYb2GiHUveDYNwi5TOKLhGYR2THVMjdRUQbRBbTNfphjBAOhOJBlSw3sZr61d+8ymTVQSHv4MOWZwMiSL/QIpaetli1GLreyZr8pPQtJoAOuql2j6PEvutzjtMTY6KafQXdUXOqkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784238891; c=relaxed/simple;
	bh=bQhwgpkFvoHwoKG15iuWIJl9Q7IRN1hIxXfGDW9s59I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X2S3uIhzCuzBgCZ3pWL/kR6o+aeRpSMBbzHyzN1N5ME6DOBiDMGDoQgeRXMmlrlJRRBB0etnoogCkjvID7OGEDfsbJjh+lJF3pK+U0em1a4mmDrWko2cJS7amLT5lucfYHMxfqlnouJ3vryFVBVsprbUTYwToouNsDDssNqliaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SD4bcYWO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SD4bcYWO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8C891F000E9;
	Thu, 16 Jul 2026 21:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784238890;
	bh=GrGP8AYDpaDq+daEXU/uzfybpVfCtzSDDwKa6LYFS+A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=SD4bcYWOSTlTJkZz1LRC4+d1uIadN/faazOWl8ENCGNrpg3t1sxP3zk6bbku7y8OJ
	 IcKljKZ94Z6yvUIDYyFvmYUuR3f9dk8gFDWy+iryk8LsJNeL9Sz9/7g49Ow7/CZJgm
	 /7kZh4N/lXpkOx9TXL1gDQ9Agda7bo6F/GXNNPsO0BRNwfeGCYhWfQmK6GDmF8hmIK
	 mnZs0LdaVYH3KPsPa6eqV23eNaGpWl3H1lqObxIyiXF7zM5ta/RhuwEV1OqEnrrIEq
	 csrj2xlofECJOtmW1Gb9sgpfu6T4M/emTbJNC9n0JXv+sIOH8MhGtWZYauIxJamIrW
	 n1J8TSfp1K3qA==
From: Thierry Reding <thierry.reding@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Mikko Perttunen <mperttunen@nvidia.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-tegra@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpu: host1x: Fix email address
Date: Thu, 16 Jul 2026 23:54:46 +0200
Message-ID: <178423888122.996252.2546692267259518363.b4-ty@b4>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260701160655.725111-1-thierry.reding@kernel.org>
References: <20260701160655.725111-1-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

From: Thierry Reding <treding@nvidia.com>


On Wed, 01 Jul 2026 18:06:55 +0200, Thierry Reding wrote:
> These bindings had mixed up local and domain parts, the combination of
> which doesn't exist. Fix them up.

Applied, thanks!

[1/1] dt-bindings: gpu: host1x: Fix email address
      commit: d28b49f11f8cbb7d76382998c84c18f465b347a4

Best regards,
-- 
Thierry Reding <treding@nvidia.com>
