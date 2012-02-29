From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 1/2] ARM: Add Kconfig option to use mkimage -T
 kernel_noload
Date: Wed, 29 Feb 2012 08:58:49 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF17BDDF206A@HQMAIL01.nvidia.com>
References: <1330473804-23348-1-git-send-email-swarren@nvidia.com>
 <20120229122942.GF3318@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20120229122942.GF3318-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Russell King <linux-lFZ/pmaqli7XmaaqVzeoHQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, Nicolas Pitre <nico-vtqb6HGKxmzR7s880joybQ@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jean-Christophe PLAGNIOL-VILLARD wrote at Wednesday, February 29, 2012 5:30 AM:
> On 17:03 Tue 28 Feb     , Stephen Warren wrote:
> > uImage files typically encode a single absolute load and entry address.
> > This is inconvenient when attempting to share that uImage across multiple
> > SoCs with different physical RAM addresses. Recent versions of mkimage
> > implement a "kernel_noload" image type which encodes no absolute load
> > address, and a relative entry address. This works well for uImage-wrapped
> > ARM zImages, since they are relocatable.
> >
> > This is enabled by commit b9b50e89d317c58becd0e2d7fac2e21e3a81dd0a
> > "image: Implement IH_TYPE_KERNEL_NOLOAD" in U-Boot.
> >
> > Signed-off-by: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > ---
> > I assume I should put this into the ARM patch tracker if it's OK?
>
> Again a new option for uImage no why not just boot the zImage
> 
> in this case the uImage is useless

U-Boot doesn't support zImage at present.

A patch was posted to support it at least for ARM, but needed a little
work before it could be committed.

-- 
nvpublic
