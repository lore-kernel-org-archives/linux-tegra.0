Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 605631FBE9E;
	Mon,  6 Oct 2025 22:14:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759788868; cv=none; b=VXLOZ1WtytGUDMFZfzGRuTOdxABLfl3hUV+2UIgTYh+526laUCkU2eaNLIS6CL8V9vBJLUHR0BYUMgOq5XuLQbIBKRXyCo4kgZdOq4O7ROLmS94c1gahuX2INLEe/jFATV5skUB+l4fIa1LGi3F39jQWouJ13iYaQSWaeBn8tRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759788868; c=relaxed/simple;
	bh=AU+k/K3xMbR9LgDL/XNA560DPNBR4afmkhdDKAJ7ihY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nxgIHmxjVH2ul2MPWX/xsKTeTp023z67pLvNmtZW2x9Lg+c50PbZN3IdajqYLrptwul8hMjpXu0R7Hn5X8xA66msj2K5wRzO46aYOJ9fUR4I49jIl5fYUvfwaAvCrz7kVbDyKNujZPCxIL6xunjnjk7mVR4gU8JMmQN4d/Qdbz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pwWVmz4w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pwWVmz4w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6E35C4CEF5;
	Mon,  6 Oct 2025 22:14:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759788867;
	bh=AU+k/K3xMbR9LgDL/XNA560DPNBR4afmkhdDKAJ7ihY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pwWVmz4wmaS0pmnb99IVxxgp596uVaBe7cpSuGTbI4lqzdrZLwjLdtRau8PG/LAs1
	 Y/t4Pis908onQGf1VHJURvOhoD1a+yjcs3AjdAAstvBbk9keGmGTBrNjIIc/pW7HXz
	 8B/XdjBKY8Znfzc795TGfaQTi3YsIZtCqk5vmZKsmnEb2ZyqKY/TFne6nGv0Un4J30
	 FyL4tps1vtJt5KsCd3eFII44WuYkYo2QQT7XUbOVTIixlLx9JlZbgtjviu/MtMMwsi
	 +W8gatYWa0OkRtiinBHpTRt8ueYpeEQ9DQia7qxnwTJwCeHTzVYEMVdN0ICxhuOxkU
	 fj6R2d/vMmWbA==
Date: Mon, 6 Oct 2025 17:14:27 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-tegra@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	David Airlie <airlied@gmail.com>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	Douglas Anderson <dianders@chromium.org>,
	Jessica Zhang <quic_jesszhan@quicinc.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, Simona Vetter <simona@ffwll.ch>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH v1 6/8] dt-bindings: display: panel: document Samsung
 LTL106HL02 MIPI DSI panel
Message-ID: <175978886632.674313.2041606700442235816.robh@kernel.org>
References: <20250929142455.24883-1-clamor95@gmail.com>
 <20250929142455.24883-7-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250929142455.24883-7-clamor95@gmail.com>


On Mon, 29 Sep 2025 17:24:52 +0300, Svyatoslav Ryhel wrote:
> Samsung LTL106HL02 is a simple DSI which requires only a power supply and
> an optional reset gpio.
> 
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/display/panel/panel-simple-dsi.yaml     | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

