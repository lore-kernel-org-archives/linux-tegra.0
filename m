Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5183D367297;
	Mon, 28 Sep 2026 19:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790623726; cv=none; b=iorEF1YXS4bepXkxGJcM3cyeO9AMRGxO1zwg9195+Br9yNKFLQQgIp3a7Z2A+CCbuTgYaFyPJ2hWTdtmZeobJ4DmzXZCp/VE3oXAWesVeplhB93F1Pj1Dslg3sQVA8WQMs6Kj6lOJYzUPOOMllNqwwFmyTLYspaa2D6ZQ67kJb8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790623726; c=relaxed/simple;
	bh=ZDJNExJRM9O6+KpmYCYXxYVEAy0CTZChUW37EUGTtGM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pK0Dl+c6qk7yeO4pIQSjDJRTJ3wCON6+qLuRJ7OzROv0U7t4qS9Ynu7yvLKa+TtBSMAkdkkKyQlnQ0W3unOuVIS7Tb44+qUNWgxFMuEBfJOD0vvSigh8eDf/iImpoNygeksKknxBXitrMri2AbOaZMSrbdKdn1N+t07tD2TignU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FV1vBIsy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FV1vBIsy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F39C1F000FF;
	Mon, 28 Sep 2026 19:28:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790623724;
	bh=cJHzxKXVtIY3P2yIJggYlartU1XE0ipq+eGOK0t1wt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FV1vBIsy+SJMPxhCKAU3fAvonyUNNwCFv27Vmyk/SuURYrycGycfXXiana4254/1E
	 18ekcOUMpDcFVSI6uHiDLIGH6ewct+bqrjzOLXHajDpk0FM4hRyc5YP36qT9z5c5G6
	 AQTP8XhFgWc/fu9vMHuyl/wYjEc1CFHp60HYtmEk914pJD8xS4Y7CayARzmQ42gTfK
	 EQaii28pFUn5lRFDdlCGzb0GrrAxASWFHYl+VHZl70eJPM2zSCgBFD4SW+9+JuohSG
	 YV+bpPHCDU2zlgP6SYgiKtdtXiBJM5xJ19u9OLh9EaM0DZRjFMa+wU0mLXpnR/Ry0E
	 6TClnNMxJzzVA==
Date: Mon, 28 Sep 2026 14:28:43 -0500
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	linux-rockchip@lists.infradead.org,
	Martin Kepplinger <martin.kepplinger@puri.sm>,
	Svyatoslav Ryhel <clamor95@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thierry Reding <thierry.reding@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Matthias Fend <matthias.fend@emfend.at>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux@ew.tq-group.com, Geert Uytterhoeven <geert+renesas@glider.be>,
	Tommaso Merciai <tomm.merciai@gmail.com>,
	Quentin Schulz <quentin.schulz@theobroma-systems.com>,
	imx@lists.linux.dev, Michael Riesch <michael.riesch@collabora.com>,
	devicetree@vger.kernel.org,
	Sylvain Petinot <sylvain.petinot@foss.st.com>,
	Jonathan Hunter <jonathanh@nvidia.com>, linux-media@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Richard Acayan <mailingradian@gmail.com>,
	linux-tegra@vger.kernel.org,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Benjamin Mugnier <benjamin.mugnier@foss.st.com>,
	linux-arm-msm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo@jmondi.org>,
	linux-arm-kernel@lists.infradead.org,
	Konrad Dybcio <konradybcio@kernel.org>,
	linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>,
	Frank Li <Frank.Li@nxp.com>, Heiko Stuebner <heiko@sntech.de>,
	Daniel Scally <dan.scally@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Jimmy Su <jimmy.su@intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Mikhail Rudenko <mike.rudenko@gmail.com>
Subject: Re: [PATCH v6 6/6] dt-bindings: media: i2c: himax,hm1246: Use
 video-interface-devices
Message-ID: <179062371908.398635.9659405053425999054.robh@kernel.org>
References: <20260918-kbingham-orientation-v6-0-5e8b1f01be29@ideasonboard.com>
 <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-tegra@vger.kernel.org
List-Id: <linux-tegra.vger.kernel.org>
List-Subscribe: <mailto:linux-tegra+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-tegra+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918-kbingham-orientation-v6-6-5e8b1f01be29@ideasonboard.com>


On Fri, 18 Sep 2026 11:44:18 +0100, Kieran Bingham wrote:
> From: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> The orientation property for video interface devices now has definitions
> to prevent hardcoded integer values for the enum options.
> 
> Update the example binding documentation.
> 
> Signed-off-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> ---
> v6:
>  - Actually use the correct orientation!
> ---
>  Documentation/devicetree/bindings/media/i2c/himax,hm1246.yaml | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring (Arm) <robh@kernel.org>

