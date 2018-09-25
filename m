From: Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 26/34] dt-bindings: add broadcom (formerly plx
 technology) vendor prefix
Date: Tue, 25 Sep 2018 13:24:59 -0500
Message-ID: <20180925182459.GA21710@bogus>
References: <20180831163817.23970-1-marcel@ziswiler.com>
 <20180831163817.23970-27-marcel@ziswiler.com>
 <ed2ffc72-68d6-476a-d589-6738fcbf1d7c@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ed2ffc72-68d6-476a-d589-6738fcbf1d7c@suse.de>
Sender: linux-kernel-owner@vger.kernel.org
To: Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>
Cc: Marcel Ziswiler <marcel@ziswiler.com>, devicetree@vger.kernel.org, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, Marcel Ziswiler <marcel.ziswiler@toradex.com>, Thierry Reding <treding@nvidia.com>, David Lechner <david@lechnology.com>, Johan Hovold <johan@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Mark Rutland <mark.rutland@arm.com>
List-Id: linux-tegra@vger.kernel.org

On Fri, Aug 31, 2018 at 08:01:01PM +0200, Andreas Färber wrote:
> Am 31.08.2018 um 18:38 schrieb Marcel Ziswiler:
> > From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> > 
> > PLX Technology meanwhile got bought by Broadcom Corporation but the
> > vendor prefix plx is still used in 8 current device trees. This silences
> > the following checkpatch.pl warning:
> > 
> > WARNING: DT compatible string vendor "plx" appears un-documented
> >  -- check ./Documentation/devicetree/bindings/vendor-prefixes.txt
> > 
> > Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> Sounds sensible,
> 
> Reviewed-by: Andreas Färber <afaerber@suse.de>
> 
> You may want to tweak the subject though, it is slightly confusing as
> Broadcom already has a vendor prefix.

Yes, please.

With that,

Acked-by: Rob Herring <robh@kernel.org>
