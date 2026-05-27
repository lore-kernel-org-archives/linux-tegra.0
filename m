Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E99C15C14F;
	Wed, 27 May 2026 14:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779893566; cv=none; b=I8Qs7v1nfixF9+/Vx7zj06xprVlyeEYCyQ5D1p8UY1NnnhrzqgtOItWtVCvy3fUOtPge/YJNv2tXPSsbeuWxOBEwuFidzS1itRKDXnSCDwhp6bp6IL2qyK/GeLg6WGDwZxquhnAmK2rQwhvVi5RkvUIht192J3iCp/85k2FUja0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779893566; c=relaxed/simple;
	bh=rtPvwG+3fqUaMtOFIQdLaUBsXIAC/LKVB6/JUSUbv3Q=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=kCjWxiQeMFYlwJz6KEHNndPoNJ0tob4D36D1GUWmbYRuJ5rTfhZ1Rr6EJZg+BujT33Oev2+3w1NtQQG9PptNrdYEZGelXGXLAs8lYyib4ujaU687+5ypMZI0Cg/OpOGiKX3jXi0ltKoX4o8g3ccNrxp+fKlm+fMSYjM+IFEw2aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NwnH5VWc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NwnH5VWc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFCAC1F000E9;
	Wed, 27 May 2026 14:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779893565;
	bh=+t/0qagdb5R8yEIz4yhU//H49+ALK22ZyYomfGIvc/o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=NwnH5VWcRm24TTVZFTnEEr5PhrLkIKE/gVp0kUaPb6eXhGweV9MY6qd70jZKrjEMu
	 v8n3iyiN7pGHBRH+GIg2lQmow4pGNYyOgaJcUkT/ksh/NonFSvvvDwM71fsTFLdIfz
	 +JxbnGScnPTXvVMQ+zG3U8LagJ4V5HBE7s3Pw3nq2on0ivLuC/w+0bSGCpAtNkGIsC
	 jQ0CJPg4scf8bVbx6n+c3ceE2rg1fugUbXhx2nf4vKId+k2cjFDsKcwscrQo33nVDC
	 G4dNS/KWrZ0TxoPpRWs7z3fPrhdbShbgoVMaNbjY1wxxjjBetFSPdGNnMVMIlNByPY
	 GWUjS4ZUhbHww==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: treding@nvidia.com, jonathanh@nvidia.com, robh@kernel.org, 
 conor+dt@kernel.org, linux-kernel@vger.kernel.org, 
 linux-tegra@vger.kernel.org, devicetree@vger.kernel.org, 
 Sumit Gupta <sumitg@nvidia.com>
Cc: bbasu@nvidia.com
In-Reply-To: <20260518124306.2071481-1-sumitg@nvidia.com>
References: <20260518124306.2071481-1-sumitg@nvidia.com>
Subject: Re: [PATCH v2 0/3] memory: tegra264: Add full set of MC clients
Message-Id: <177989356257.30733.13162342811130693491.b4-ty@b4>
Date: Wed, 27 May 2026 16:52:42 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15.2


On Mon, 18 May 2026 18:13:03 +0530, Sumit Gupta wrote:
> Extend the Tegra264 MC dt-bindings header and tegra264_mc_clients[]
> table to cover the full set of memory clients exposed by the SoC.

Applied, thanks!

[1/3] memory: tegra264: Skip clients without bpmp_id or type
      https://git.kernel.org/krzk/linux-mem-ctrl/c/c3ce114d81e39cd83f7bf9c5c46020bb7695b017
[2/3] dt-bindings: memory: tegra264: Add full set of MC client IDs
      https://git.kernel.org/krzk/linux-mem-ctrl/c/16868fd4b7ecf241b74123e1bb23fd08d05a2e09
[3/3] memory: tegra264: Add full set of MC clients
      https://git.kernel.org/krzk/linux-mem-ctrl/c/d530ed059dac445dc5b81d564adf1952b5c4adba

Best regards,
-- 
Krzysztof Kozlowski <krzk@kernel.org>

