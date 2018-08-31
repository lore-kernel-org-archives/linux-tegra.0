From: =?UTF-8?Q?Andreas_F=c3=a4rber?= <afaerber@suse.de>
Subject: Re: [PATCH v2 26/34] dt-bindings: add broadcom (formerly plx
 technology) vendor prefix
Date: Fri, 31 Aug 2018 20:01:01 +0200
Message-ID: <ed2ffc72-68d6-476a-d589-6738fcbf1d7c@suse.de>
References: <20180831163817.23970-1-marcel@ziswiler.com>
 <20180831163817.23970-27-marcel@ziswiler.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20180831163817.23970-27-marcel@ziswiler.com>
Content-Language: en-US
Sender: linux-kernel-owner@vger.kernel.org
To: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Rob Herring <robh+dt@kernel.org>, Johan Hovold <johan@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

Am 31.08.2018 um 18:38 schrieb Marcel Ziswiler:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> PLX Technology meanwhile got bought by Broadcom Corporation but the
> vendor prefix plx is still used in 8 current device trees. This silences
> the following checkpatch.pl warning:
> 
> WARNING: DT compatible string vendor "plx" appears un-documented
>  -- check ./Documentation/devicetree/bindings/vendor-prefixes.txt
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Sounds sensible,

Reviewed-by: Andreas Färber <afaerber@suse.de>

You may want to tweak the subject though, it is slightly confusing as
Broadcom already has a vendor prefix.

Cheers,
Andreas

-- 
SUSE Linux GmbH, Maxfeldstr. 5, 90409 Nürnberg, Germany
GF: Felix Imendörffer, Jane Smithard, Graham Norton
HRB 21284 (AG Nürnberg)
