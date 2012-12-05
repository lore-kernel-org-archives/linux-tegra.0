From: Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [RFC v2 6/8] gpu: drm: tegra: Remove redundant host1x
Date: Wed, 5 Dec 2012 13:03:14 +0100
Message-ID: <CAKMK7uGPf=TEW8DL-K1KYPhMZALTZhFsSb2DBxDVgFct1kUjSA@mail.gmail.com>
References: <1353935954-13763-1-git-send-email-tbergstrom@nvidia.com>
	<1353935954-13763-7-git-send-email-tbergstrom@nvidia.com>
	<20121205083335.GA20984@avionic-0098.adnet.avionic-design.de>
	<50BF1DAA.8030805@nvidia.com>
	<20121205111332.GA25676@avionic-0098.adnet.avionic-design.de>
	<50BF345A.8050201@nvidia.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <50BF345A.8050201@nvidia.com>
Sender: linux-kernel-owner@vger.kernel.org
To: =?ISO-8859-1?Q?Terje_Bergstr=F6m?= <tbergstrom@nvidia.com>
Cc: Thierry Reding <thierry.reding@avionic-design.de>, "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, Arto Merilainen <amerilainen@nvidia.com>
List-Id: linux-tegra@vger.kernel.org

On Wed, Dec 5, 2012 at 12:47 PM, Terje Bergstr=F6m <tbergstrom@nvidia.c=
om> wrote:
> You're right in that binding to a sub-device is not a nice way. DRM
> framework just needs a "struct device" to bind to. exynos seems to so=
lve
> this by introducing a virtual device and bind to that. I'm not sure i=
f
> this is the best way, but worth considering?

Note that I'm not too happy about the fact that drm wants a struct
device to register a drm device. This all made a lot of sense back in
the days when drm drivers this this fancy shadow attaching to allow
drm to use a driver for rendering cooperatively with a fbdev driver.
Today there's not much reason for that anymore imo, and I'd welcome
patches to allow drivers to simply register a drm device (and remove
all the newer registration functions for usb/platform/whatever
drivers, moving the device handling into drivers). Note that it's a
bit work, since not-really-required abstraction (which was useful back
when the drm drivers have been shared with *BSD, but pointless now)
like the drm irq support needs to be moved away to a pci-dev legacy
thing only - it doesn't really buy a kms driver anything above&beyond
calling request_irq() itself.

So feel free to burn this down, I'll be happy to carry wood to the
pyre in the from of reviews (not much time for more right now ...).

Cheers, Daniel
--=20
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
