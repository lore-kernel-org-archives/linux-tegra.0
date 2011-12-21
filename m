From: Stephen Warren <swarren-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>
Subject: RE: [RFC 4/7] arm: tegra: Fix PWM clock programming
Date: Wed, 21 Dec 2011 08:44:17 -0800
Message-ID: <74CDBE0F657A3D45AFBB94109FB122FF176BE92FE3@HQMAIL01.nvidia.com>
References: <1324377138-32129-1-git-send-email-thierry.reding@avionic-design.de>
 <1324377138-32129-5-git-send-email-thierry.reding@avionic-design.de>
 <74CDBE0F657A3D45AFBB94109FB122FF176BE92E7E@HQMAIL01.nvidia.com>
 <20111221091227.GE542@avionic-0098.mockup.avionic-design.de>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>
In-Reply-To: <20111221091227.GE542-RM9K5IK7kjIQXX3q8xo1gnVAuStQJXxyR5q1nwbD4aMs9pC9oP6+/A@public.gmane.org>
Content-Language: en-US
Sender: linux-tegra-owner-u79uwXL29TY76Z2rM5mHXA@public.gmane.org
To: Thierry Reding <thierry.reding-RM9K5IK7kjKj5M59NBduVrNAH6kLmebB@public.gmane.org>
Cc: "devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org" <devicetree-discuss-uLR06cmDAlY/bJ5BZ2RsiQ@public.gmane.org>, Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>, Bill Huang <bilhuang-DDmLM1+adcrQT0dZR+AlfA@public.gmane.org>, "linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org" <linux-tegra-u79uwXL29TY76Z2rM5mHXA@public.gmane.org>, Sascha Hauer <s.hauer-bIcnvbaLZ9MEGnE8C9+IrQ@public.gmane.org>, Arnd Bergmann <arnd-r2nGTMty4D4@public.gmane.org>, Matthias Kaehlcke <matthias-RprLehDfhQ3k1uMJSBkQmQ@public.gmane.org>, Kurt Van Dijck <kurt.van.dijck-/BeEPy95v10@public.gmane.org>, Rob Herring <rob.herring-bsGFqQB8/DxBDgjK7y7TUQ@public.gmane.org>, Grant Likely <grant.likely-s3s/WqlpOiPyB63q8FvJNQ@public.gmane.org>, Colin Cross <ccross-z5hGa2qSFaRBDgjK7y7TUQ@public.gmane.org>, Olof Johansson <olof-nZhT3qVonbNeoWH0uzbU5w@public.gmane.org>, Richard Purdie <rpurdie-Fm38FmjxZ/leoWH0uzbU5w@public.gmane.org>
List-Id: linux-tegra@vger.kernel.org

Thierry Reding wrote at Wednesday, December 21, 2011 2:12 AM:
> * Stephen Warren wrote:
> > Thierry Reding wrote at Tuesday, December 20, 2011 3:32 AM:
> > > From: Simon Que <sque-F7+t8E8rja9g9hUCZPvPmw@public.gmane.org>
> > >
> > > PWM clock source registers in Tegra 2 have different clock source selection bit
...
> > > Also, adjusts for the frequency divider being offset by 1.
> >
> > That last line applies to the original patch in the ChromeOS tree, but
> > not to the patch you posted (the edit to arch/arm/mach-tegra/pwm.c that
> > was in the original patch isn't part of this patch).
> 
> Right, I've adjusted the commit message to take that into account. I assume
> the commit now also requires my Signed-off-by because I actually modified the
> patch? This would be true even in the previous version because I had to make
> some small adjustments.

All patches you send need you S-o-b line. This is true whether you
modified the patch or not.

When modifying a patch someone else wrote, it's typical to include some
notes on what you changed, e.g.:

Signed-off-by: Original author <...>
[swarren: Fixed checkpatch warnings]
Signed-off-by: You <...>

Or perhaps for larger changes that don't inline between the S-o-b very
well, put it above all the S-o-b.

-- 
nvpbulic
