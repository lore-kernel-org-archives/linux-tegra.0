Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EF01430CD3;
	Mon,  5 Oct 2026 10:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791195649; cv=none; b=c9Dh8Osz2Qbpy7X6H57WrgkURiSpNVdKuUpapuZHEL329HChwcxHDZ5muv+ZpkVC5CGGqohnhIWlEf9OOjzu6lkNe7FY9NS2zyJ5CKnraKmYm+YUyW1t2I6jHK7nLav9Br+PiSOmlL8f033huxxzIJdMh3oVN5v5SSGNt5ALHDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791195649; c=relaxed/simple;
	bh=qVtp/RPynweqG6TENuVHeCX3sd8zZEtrBOcBuUUgsVo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=aexJvN1NPIxlxoNUc/uhib7H/bZxTrjvo0kTIu5PMPYthUvNq9/oa4VxCdfX1xgVvz72t1E7UZsc0qUjbhzSCsX3K8zg4kvJNIkGF1cxVWuXddIA6LQEzeT5Kd8864I121+L5Z93ldOhADbdxz3YI1RfkH8hftfSJxZ8yFI+eMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jMsiRSio; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jMsiRSio"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E3571F00893;
	Mon,  5 Oct 2026 10:20:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791195648;
	bh=Rb0VYPbJkOx1WDjx5OjWPu/39PyXY8+/uBeKMQTxRkM=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=jMsiRSioiu7zK/pzkKgEMleObWMHpP9/u4h1vIuvq1WLCIWlYHJrD4XUWVOHGzz1e
	 8aBJFS3EzKl35QGYgTToI5WJknOZYCyyk8FuBmFvQhHe29KrWD0tI5GDuOg2/Ogt36
	 I8TfpYF77Ng64LZ1J5mN44AvNW1Hll6juD3XenNH0YcKxte9H7i8ugSNyu5kZRoh/A
	 Iui/gbExtFNS2x8wjn2drAfFkaNnbnGCLDGO8MwMPCJpLTSY11X3LPB+SMWLAjJ7D6
	 Bn5PKtakTcM6MQPIQicUWJ3eK3KXzvxttn1grd0VMlTCz1VKfmvL1Zj1SrJkF0O0LZ
	 WESPvvqAV/DxA==
From: Vinod Koul <vkoul@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@kernel.org>, 
 Jonathan Hunter <jonathanh@nvidia.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kartik Rajput <kkartik@nvidia.com>
Cc: Thierry Reding <treding@nvidia.com>, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
References: <20260909-tegra264-mphy-v1-0-ce61a80dc065@nvidia.com>
Subject: Re: [PATCH 0/2] Add M-PHY support for NVIDIA Tegra264
Message-Id: <179119564503.316652.18424670686928632323.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 12:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Wed, 09 Sep 2026 15:13:57 +0530, Kartik Rajput wrote:
> Add MIPI M-PHY support for NVIDIA Tegra264 SoCs. The M-PHY is a hardware
> block with two lanes, l0 and l1, used by the Tegra264 UFS host
> controller.
> 
> 

Applied, thanks!

[1/2] dt-bindings: phy: Add nvidia,tegra264-mphy
      commit: 6f61db971065919bd6ca2d62fdc4be158857c403
[2/2] phy: tegra: Add Tegra264 MPHY driver
      commit: 256cb243f4c21b5ba845885df9d1e79ce29eb706

Best regards,
-- 
~Vinod


