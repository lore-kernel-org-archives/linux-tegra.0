From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH 5/5] arm/dt: tegra: Fix SDHCI nodes to match board files
Date: Tue, 22 Nov 2011 08:12:39 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C3AF@HQMAIL01.nvidia.com>
References: <1321911851-10091-1-git-send-email-swarren@nvidia.com>
 <1321911851-10091-5-git-send-email-swarren@nvidia.com>
 <20111122083802.GK21480@game.jcrosoft.org>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111122083802.GK21480-RQcB7r2h9QmfDR2tN2SG5Ni2O/JbrIOy@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Jean-Christophe PLAGNIOL-VILLARD <plagnioj-sclMFOaUSTBWk0Htik3J/w@public.gmane.org>
Cc: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Peter De Schrijver <pdeschrijver-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, Marc Dietrich <marvin24-Mmb7MZpHnFY@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Jean-Christophe PLAGNIOL-VILLARD wrote at Tuesday, November 22, 2011 1:38 AM:
> On 14:44 Mon 21 Nov     , Stephen Warren wrote:
> > Mark any SDHCI controllers that aren't registered by the board files as
> > disabled in the device-tree files.
> >
> > In practice, these controllers:
> >
> > * Have nothing hooked up to them at all, or
> > * For ports intended for SDIO usage, the drivers for anything that might
> >   be attached are not in the device-tree yet. If/when drivers appear, the
> >   SD/MMC port can be re-enabled.
> >
> > The only possible exception is TrimSlice's mico SD slot, but that wasn't
> > enabled in the board files before anyway, and doesn't work when all the
> > SDHCI controllers are enabled anyway.
> it will be better to invert the logic
> 
> just enable what you are supposed too

It used to be that way when the files were first added, but they got
switched around this way to match standard practice.

-- 
nvpublic
