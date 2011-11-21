From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [PATCH v1] dts: tegra-ventana: use proper root instead of
 /dev/ram
Date: Mon, 21 Nov 2011 08:56:46 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF174F08C0B8@HQMAIL01.nvidia.com>
References: <1321338087-3662-1-git-send-email-vwadekar@nvidia.com>
 <74CDBE0F657A3D45AFBB94109FB122FF1740805E1B@HQMAIL01.nvidia.com>
 <20111121004930.GA17338@quad.lixom.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111121004930.GA17338-O5ziIzlqnXUVNXGz7ipsyg@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>
Cc: Varun Wadekar <vwadekar-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org" <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, "linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org" <linux-arm-kernel-IAPFreCvJWM7uuMidbF8XUB+6BGkLq7r@public.gmane.org>, "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Olof Johansson wrote at Sunday, November 20, 2011 5:50 PM:
> On Tue, Nov 15, 2011 at 11:16:51AM -0800, Stephen Warren wrote:
> > Varun Wadekar wrote at Monday, November 14, 2011 11:21 PM:
> > > From: Pritesh Raithatha <praithatha-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
> > >
> > > The root file system on ventana resides on /dev/mmcblk0p1.
...
> Actually, removing the default root path is probably a better idea, since it
> will vary from installation to installation and doesn't make sense to hard
> code.
...
> So, I would rather see a patch removing the root= argument alltogether.

OK, I'll whip up a patch for that along with a few other minor DTS fixes.

-- 
nvpublic
