Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA362BD5BF;
	Fri,  6 Mar 2026 00:23:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772756616; cv=none; b=iVoLveLomfMSx3xaV3E0hoCb7vVi0jbPDkmobHSX4fZoB0U0YztrU0DgWdEdNA8FhndLiyW2ysOOkqxNUlzh2OBKGNacx/3KhqN8pa6GnntMb0cHOEMaenm/IbMQKTeisczaatc4X5kf/y/X0bSuOzUMhJhlM0AbuWZZ+2EwzYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772756616; c=relaxed/simple;
	bh=gQaoy/sJMMEZ1wpHwU9/U4l0bXvFijwIBzLkzUfgFIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IPqtv4NqCd/ZIep6uhWBKqkJNYwxuxh7rLryLh15KI3LWzqrPxzsXN7kE92ANOjJUScGopRhYKNiQhALZyhcpNQ/nl3py2jweQEUMkE6HZSMVX1is/K2iGYPZyD5giL/Uv1Jzq8+mWHqcODXofAJ743VnDPkPadHhMIr9YQ9aO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ff6ypMIP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ff6ypMIP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17FB2C116C6;
	Fri,  6 Mar 2026 00:23:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772756616;
	bh=gQaoy/sJMMEZ1wpHwU9/U4l0bXvFijwIBzLkzUfgFIA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ff6ypMIP+z0gPlUvgMAAoYN2ukgwUZo1t86taCZ5VqMA3sQFzz9lCr3hzuK9sIk4K
	 TI9/LDD/3cgP4x35EmZEgWComAt6kYV211X4HKiTGI/1r6g7fPpk3UN2vwKiFnSJAt
	 Lc11rL4dzI/eupY78qpMPiiqDf2Pw43XbnrmTOKHts1A225zuD3Me+skmfF4k5YTh3
	 UoAiwK36/adWHld5iR9rrNxVzz1787zZPOzq1cETo/sSuTw/uIoKlQSufmOPSBEMnV
	 iqEpo3Ccd2FxjCyarB8u7ghG4Fwvr9RJBYA7HU6lJ/Hc05hWFrwtsWXh2CUjIgR6gV
	 9uJNEz4vy7Dwg==
Date: Thu, 5 Mar 2026 18:23:35 -0600
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Thierry Reding <thierry.reding@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-tegra@vger.kernel.org,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Jon Hunter <jonathanh@nvidia.com>
Subject: Re: [PATCH 06/10] dt-bindings: phy: tegra: Document Tegra210 USB PHY
Message-ID: <177275661477.847748.8396218192648671728.robh@kernel.org>
References: <20260223143305.3771383-1-thierry.reding@kernel.org>
 <20260223143305.3771383-7-thierry.reding@kernel.org>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223143305.3771383-7-thierry.reding@kernel.org>


On Mon, 23 Feb 2026 15:33:01 +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
> 
> Add a compatible string for the USB PHY found on Tegra210 SoCs.
> 
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  .../devicetree/bindings/phy/nvidia,tegra20-usb-phy.yaml          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

